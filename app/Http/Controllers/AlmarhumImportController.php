<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\AhliWaris;
use App\Models\Almarhum;
use App\Models\Blok;
use App\Models\KoordinatMakam;
use App\Models\Makam;
use App\Models\SuperAdmin;
use App\Models\Tpu;
use App\Models\Uptd;
use App\Services\ActivityLogger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Shared\Date;

class AlmarhumImportController extends Controller
{
    public function template(Request $request)
    {
        $user = $request->user();

        if (! $this->allowsImport($user)) {
            return response()->json(['message' => 'Aksi ini hanya untuk Admin UPTD / Super Admin'], 403);
        }

        $path = storage_path('app/imports/template_almarhum.csv');

        if (! file_exists($path)) {
            return response()->json(['message' => 'Template belum tersedia'], 404);
        }

        return response()->download($path, 'template_almarhum.csv', [
            'Content-Type' => 'text/csv',
        ]);
    }

    public function store(Request $request)
    {
        // Kalau file lebih besar dari post_max_size di php.ini, PHP akan
        // mengosongkan $_FILES & $_POST TANPA lempar error apapun ke Laravel —
        // request "hilang" begitu saja. Deteksi dini biar pesan errornya jelas.
        $postMaxSize = $this->iniSizeToBytes(ini_get('post_max_size'));
        $contentLength = (int) $request->server('CONTENT_LENGTH', 0);
        if ($postMaxSize > 0 && $contentLength > $postMaxSize && ! $request->hasFile('file')) {
            return response()->json([
                'message' => 'File terlalu besar untuk konfigurasi server saat ini (post_max_size php.ini = '
                    .ini_get('post_max_size').'). Naikkan post_max_size & upload_max_filesize di php.ini, '
                    .'lalu restart web server.',
            ], 413);
        }

        $request->validate([
            'file' => ['required', 'file', 'extensions:xlsx,xls,csv', 'max:25600'],
        ]);

        $user = $request->user();

        if (! $this->allowsImport($user)) {
            return response()->json(['message' => 'Aksi ini hanya untuk Admin UPTD / Super Admin'], 403);
        }

        $tpuIds = $this->tpuIdsOf($user);

        $config = config('almarhum_import');

        if (! $config || ! isset($config['mapping'])) {
            return response()->json([
                'message' => 'Konfigurasi import (config/almarhum_import.php) belum termuat. '
                    .'Jalankan "php artisan config:clear" di server lalu coba lagi.',
            ], 500);
        }

        $mapping = $config['mapping'];

        try {
            $spreadsheet = IOFactory::load($request->file('file')->getRealPath());
        } catch (\Throwable $e) {
            return response()->json(['message' => 'File Excel tidak dapat dibaca: '.$e->getMessage()], 422);
        }

        $sheet = $spreadsheet->getActiveSheet();
        // Parameter ke-2=true -> hitung hasil formula (sel "='24-26'!B6" berubah
        // jadi nilai aslinya). Kalau tidak, yang tersimpan malah teks formulanya.
        $rows = $sheet->toArray(null, true, false, false);

        if (count($rows) < 2) {
            return response()->json(['message' => 'File kosong, minimal berisi header dan 1 baris data'], 422);
        }

        $result = [
            'total' => max(0, count($rows) - 1),
            'created' => 0,
            'updated' => 0,
            'skipped' => 0,
            'errors' => [],
        ];

        DB::beginTransaction();

        try {
            foreach ($rows as $rowIndex => $row) {
                if ($rowIndex === 0) {
                    continue; // baris header pertama
                }

                // Sebagian file template punya 2 baris header (judul + sub-judul
                // kolom, mis. baris ke-2 isinya cuma label "Blok", "Nomor Makam",
                // dst, bukan data asli). Deteksi & lewati baris seperti itu.
                if ($rowIndex === 1) {
                    $labelBlok = strtolower(trim((string) ($row[19] ?? '')));
                    $labelMakam = strtolower(trim((string) ($row[2] ?? '')));
                    $labelNama = strtolower(trim((string) ($row[3] ?? '')));
                    $headerLikeWords = ['blok', 'nama blok', 'kode blok', 'nomor makam', 'no makam', 'kode makam', 'nama', 'nama almarhum', 'nama lengkap'];
                    if (in_array($labelBlok, $headerLikeWords, true) || in_array($labelMakam, $headerLikeWords, true) || in_array($labelNama, $headerLikeWords, true)) {
                        continue; // ini header kedua, bukan data
                    }
                }

                $rowNo = $rowIndex + 1;
                $number = implode('', [$row[0] ?? '']);

                // Lewati baris kosong
                if (trim((string) ($row[1] ?? '')) === ''
                    && trim((string) ($row[3] ?? '')) === ''
                    && trim((string) ($row[17] ?? '')) === ''
                    && trim((string) $number) === '') {
                    continue;
                }

                // Cek kolom wajib
                $missing = [];
                foreach ($config['required_columns'] as $col) {
                    if (empty(trim((string) ($row[$col] ?? '')))) {
                        $missing[] = $col;
                    }
                }
                if (! empty($missing)) {
                    $result['skipped']++;
                    $result['errors'][] = "Baris {$rowNo}: kolom wajib kosong (indeks ".implode(',', $missing).')';
                    continue;
                }

                $namaLengkap = $this->clean($row[3] ?? null);
                if ($namaLengkap === '') {
                    $result['skipped']++;
                    $result['errors'][] = "Baris {$rowNo}: Nama Almarhum kosong";
                    continue;
                }

                // Pertahanan ekstra: kalau formula sel tidak bisa dihitung
                // (mis. referensi sheet hilang), hasilnya bisa beruba teks
                // formula "=...". Dekati itu sebagai data tidak valid.
                if (str_starts_with($namaLengkap, '=')
                    || str_starts_with($this->clean($row[1] ?? null), '=')
                    || str_starts_with($this->clean($row[5] ?? null), '=')) {
                    $result['skipped']++;
                    $result['errors'][] = "Baris {$rowNo}: sel berisi ekspresi formula Excel (=...), bukan nilai data";
                    continue;
                }

                try {
                    // Blok/Makam BOLEH kosong atau tak ketemu — almarhum tetap
                    // dibuat, hanya saja belum ditempatkan ke makam manapun
                    // (bisa ditempatkan belakangan lewat dashboard).
                    $blok = $this->resolveBlok($tpuIds, $row[19] ?? null);
                    $makam = $blok ? $this->resolveMakam($blok, $row[2] ?? null) : null;

                    $almarhumData = $this->buildAlmarhumData($mapping, $row, $makam?->id);
                    $lat = $this->toFloat($row[32] ?? null);
                    $lng = $this->toFloat($row[33] ?? null);
                    $catatan = $this->clean($row[34] ?? null);

                    $existing = null;
                    if (! empty($almarhumData['no_registrasi'])) {
                        $existing = Almarhum::query()
                            ->where('no_registrasi', $almarhumData['no_registrasi'])
                            ->first();
                    }

                    $isUpdate = false;

                    // Cek kepemilikan makam SEBELUM insert, agar pesan error jelas
                    // dan tidak melanggar unique constraint (1 makam = 1 almarhum).
                    if ($makam) {
                        $pemilikMakam = $makam->almarhum()->first();
                        if ($pemilikMakam && $pemilikMakam->id !== optional($existing)->id) {
                            throw new \Exception('Makam "'.$makam->kode_makam.'" sudah ditempati oleh '.$pemilikMakam->nama_lengkap);
                        }
                    }

                    $almarhum = DB::transaction(function () use ($existing, $almarhumData, $makam, $tpuIds, $lat, $lng, $catatan, $mapping, $row, &$isUpdate) {
                        $makamLamaId = null;

                        if ($existing && $this->canAccess($tpuIds, $existing)) {
                            $makamLamaId = $existing->makam_id;
                            $existing->update($almarhumData);
                            $almarhum = $existing;
                            $isUpdate = true;
                        } else {
                            $almarhum = Almarhum::create($almarhumData);
                        }

                        // Kalau pindah makam (atau almarhum lama tak bermakam),
                        // kosongkan makam lama supaya statusnya tetap konsisten.
                        if ($makamLamaId && $makam && $makamLamaId !== $makam->id) {
                            Makam::where('id', $makamLamaId)->update([
                                'status' => 'kosong',
                                'status_petak' => 'Kosong (Tersedia)',
                            ]);
                        }

                        if ($makam) {
                            Makam::where('id', $makam->id)->update([
                                'status' => 'terisi',
                                'status_petak' => 'Terisi (Aktif)',
                            ]);
                        }

                        if ($makam && $lat !== null && $lng !== null) {
                            KoordinatMakam::updateOrCreate(
                                ['makam_id' => $makam->id],
                                ['latitude' => $lat, 'longitude' => $lng]
                            );
                        }

                        if ($makam && $catatan !== '') {
                            Makam::where('id', $makam->id)->update(['keterangan' => $catatan]);
                        }

                        // Ahli waris (1 per baris excel)
                        $ahliData = $this->buildAhliWarisData($mapping, $row, $almarhum->id);
                        if (! empty($ahliData['nama_lengkap'])) {
                            AhliWaris::updateOrCreate(
                                ['almarhum_id' => $almarhum->id],
                                $ahliData
                            );
                        }

                        return $almarhum;
                    });

                    if ($isUpdate) {
                        $result['updated']++;
                    } else {
                        $result['created']++;
                    }
                } catch (\Throwable $e) {
                    $result['skipped']++;
                    $result['errors'][] = "Baris {$rowNo}: ".$e->getMessage();
                }
            }

            DB::commit();
        } catch (\Throwable $e) {
            DB::rollBack();

            return response()->json([
                'message' => 'Import gagal: '.$e->getMessage(),
                'result' => $result,
            ], 422);
        }

        ActivityLogger::log($user, 'import', 'Import Excel almarhum: '.$result['created'].' dibuat, '.$result['updated'].' diperbarui, '.$result['skipped'].' dilewati');

        return response()->json([
            'message' => 'Import selesai: '.$result['created'].' dibuat, '.$result['updated'].' diperbarui, '.$result['skipped'].' dilewati.',
            'result' => $result,
        ]);
    }

    private function resolveBlok(array $tpuIds, $value): ?Blok
    {
        $label = $this->clean($value);
        if ($label === '') {
            return null; // Blok kosong -> boleh, almarhum tetap dibuat tanpa makam
        }

        $lower = strtolower($label);
        $norm = $this->normalizeKey($label);

        if ($norm === '') {
            return null;
        }

        // Ambil semua blok dalam jangkauan lalu cocokkan bertahap:
        // 1) persis, 2) bentuk ternormalisasi (pjg spasi/-), 3) sebagian teks.
        return Blok::whereIn('tpu_id', $tpuIds)->get()->first(function ($b) use ($label, $lower, $norm) {
            $code = $this->normalizeKey($b->kode_blok);
            $name = $this->normalizeKey($b->nama_blok);

            return $b->kode_blok === $label
                || $b->nama_blok === $label
                || $code === $norm
                || $name === $norm
                || str_contains($code, $norm)
                || str_contains($name, $norm)
                || str_contains(strtolower($b->kode_blok), $lower)
                || str_contains(strtolower($b->nama_blok), $lower);
        }); // null kalau tak ketemu -> tetap lanjut tanpa makam, bukan error
    }

    private function resolveMakam(Blok $blok, $value): ?Makam
    {
        $label = $this->clean($value);
        if ($label === '') {
            return null; // Nomor makam kosong -> boleh, tanpa penempatan makam
        }

        $norm = $this->normalizeKey($label);
        if ($norm === '') {
            return null;
        }

        // 1) cocok persis dengan kode_makam / nomor_makam di blok tsb
        $makam = Makam::where('blok_id', $blok->id)
            ->where(function ($q) use ($label) {
                $q->where('kode_makam', $label)->orWhere('nomor_makam', $label);
            })
            ->first();

        if ($makam) {
            return $makam;
        }

        // 2) cocok bentuk ternormalisasi (mis. "BLK-A1-001" vs "MKM-A1-001" beda prefix saja)
        //    vs kode_makam / nomor_makam semua makam di blok
        foreach (Makam::where('blok_id', $blok->id)->get() as $m) {
            if ($this->normalizeKey($m->kode_makam) === $norm || $this->normalizeKey($m->nomor_makam) === $norm) {
                return $m;
            }
        }

        // 3) cocok nomor petak di ujung input (mis. "...-001" -> kode_makam MKM-A1-001)
        if (preg_match('/(\d+)\s*$/', $label, $mm)) {
            $petak = $mm[1];
            $byPetak = Makam::where('blok_id', $blok->id)
                ->where(function ($q) use ($petak) {
                    $q->where('kode_makam', 'like', '%-'.$petak)
                        ->orWhere('nomor_makam', $petak)
                        ->orWhere('nomor_makam', 'like', '%'.$petak);
                })
                ->first();

            if ($byPetak) {
                return $byPetak;
            }
        }

        // Makam belum ada di DB -> buat otomatis di blok tersebut
        $kode = $blok->kode_blok ? $blok->kode_blok.'-'.$label : $label;

        return Makam::create([
            'blok_id' => $blok->id,
            'kode_makam' => $kode,
            'nomor_makam' => $label,
            'status' => 'kosong',
            'status_petak' => 'Kosong (Tersedia)',
        ]);
    }

    private function normalizeKey($value): string
    {
        return preg_replace('/[^a-z0-9]/', '', strtolower($this->clean($value))) ?? '';
    }

    private function buildAlmarhumData(array $mapping, array $row, ?int $makamId): array
    {
        $data = ['makam_id' => $makamId];

        foreach ($mapping as $col => $rule) {
            if ($rule['table'] !== 'almarhums') {
                continue;
            }

            $value = $row[$col] ?? null;
            $cast = $rule['cast'] ?? 'string';

            switch ($cast) {
                case 'date':
                    $value = $this->toDate($value);
                    break;
                case 'enum':
                    $value = $this->toJenisKelamin($value);
                    break;
                default:
                    $value = $value === null ? null : trim((string) $value);
            }

            if ($value === '' || $value === null) {
                continue;
            }

            $data[$rule['column']] = $value;
        }

        return $data;
    }

    private function buildAhliWarisData(array $mapping, array $row, int $almarhumId): array
    {
        $data = ['almarhum_id' => $almarhumId, 'hubungan' => 'Ahli Waris'];

        foreach ($mapping as $col => $rule) {
            if ($rule['table'] !== 'ahli_waris') {
                continue;
            }

            $value = $row[$col] ?? null;
            $value = $value === null ? null : trim((string) $value);

            if ($value === '' || $value === null) {
                continue;
            }

            $data[$rule['column']] = $value;
        }

        return $data;
    }

    private function allowsImport($user): bool
    {
        return $user instanceof AdminTpu || $user instanceof Uptd || $user instanceof SuperAdmin;
    }

    private function tpuIdsOf($user): array
    {
        if ($user instanceof AdminTpu) {
            return $user->tpu_id ? [$user->tpu_id] : [];
        }

        // SuperAdmin & AdminUptd (semua akun): boleh import ke semua TPU
        return Tpu::pluck('id')->all();
    }

    private function canAccess(array $tpuIds, Almarhum $almarhum): bool
    {
        if (! $almarhum->makam_id) {
            return true;
        }

        $almarhum->loadMissing('makam.blok');

        return in_array($almarhum->makam->blok->tpu_id, $tpuIds);
    }

    private function toJenisKelamin($value): string
    {
        $v = strtolower($this->clean($value));

        if (in_array($v, ['l', 'laki-laki', 'laki laki', 'lk', 'male', 'pria'])) {
            return 'L';
        }
        if (in_array($v, ['p', 'perempuan', 'pr', 'female', 'wanita'])) {
            return 'P';
        }

        return $v === 'p' || $v === 'perempuan' || $v === 'pr' ? 'P' : 'L';
    }

    private function toDate($value): ?string
    {
        if ($value === null || $value === '') {
            return null;
        }

        if (is_numeric($value)) {
            // Serial date Excel
            try {
                $date = Date::excelToDateTimeObject((float) $value);

                return $date->format('Y-m-d');
            } catch (\Throwable $e) {
                return null;
            }
        }

        $value = trim((string) $value);

        try {
            return date('Y-m-d', strtotime($value));
        } catch (\Throwable $e) {
            return null;
        }
    }

    private function toFloat($value): ?float
    {
        if ($value === null || trim((string) $value) === '') {
            return null;
        }

        $value = str_replace(',', '.', trim((string) $value));

        if (! is_numeric($value)) {
            return null;
        }

        return (float) $value;
    }

    private function iniSizeToBytes(string $val): int
    {
        $val = trim($val);
        if ($val === '' || $val === '-1') {
            return 0; // tak terbatas
        }

        $unit = strtolower(substr($val, -1));
        $num = (float) $val;

        return (int) match ($unit) {
            'g' => $num * 1024 * 1024 * 1024,
            'm' => $num * 1024 * 1024,
            'k' => $num * 1024,
            default => $num,
        };
    }

    private function clean($value): string
    {
        return trim((string) ($value ?? ''));
    }
}