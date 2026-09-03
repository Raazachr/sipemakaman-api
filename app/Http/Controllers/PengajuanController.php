<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\Almarhum;
use App\Models\Makam;
use App\Models\Pemohon;
use App\Models\Pengajuan;
use App\Models\SuperAdmin;
use App\Models\Tpu;
use App\Models\Uptd;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class PengajuanController extends Controller
{
    // ---- Dipakai semua role, otomatis difilter sesuai siapa yang login ----
    public function index(Request $request)
    {
        $query = Pengajuan::with(['pemohon', 'tpu', 'almarhum']);
        $user = $request->user();

        if ($user instanceof Pemohon) {
            $query->where('pemohon_id', $user->id);
        } elseif ($user instanceof AdminTpu) {
            $query->where('tpu_id', $user->tpu_id);
        } elseif ($user instanceof Uptd) {
            $query->whereHas('tpu', fn ($q) => $q->where('uptd_id', $user->id));
        }
        // SuperAdmin: tidak difilter, lihat semua

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $perPage = min((int) $request->input('per_page', 15), 100);

        return response()->json($query->latest('tanggal_pengajuan')->paginate($perPage));
    }

    public function show(Request $request, Pengajuan $pengajuan)
    {
        if (! $this->authorizeAccess($request->user(), $pengajuan)) {
            return response()->json(['message' => 'Anda tidak memiliki akses ke pengajuan ini'], 403);
        }

        return response()->json(
            $pengajuan->load(['pemohon', 'tpu', 'almarhum.ahliWaris', 'adminTpu'])
        );
    }

    // ---- Hanya Pemohon yang mengajukan ----
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'tpu_id' => ['required', 'exists:tpus,id'],
            'nama_lengkap' => ['required', 'string', 'max:255'],
            'nik' => ['nullable', 'string', 'max:20'],
            'bin_binti' => ['nullable', 'string', 'max:255'],
            'jenis_kelamin' => ['required', 'in:L,P'],
            'tanggal_lahir' => ['nullable', 'date'],
            'tanggal_wafat' => ['required', 'date'],
            'tanggal_dimakamkan' => ['nullable', 'date'],
            'agama' => ['nullable', 'string'],
            'alamat' => ['nullable', 'string'],
            'alamat_jalan' => ['nullable', 'string'],
            'kelurahan' => ['nullable', 'string'],
            'kecamatan' => ['nullable', 'string'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $tpu = Tpu::findOrFail($request->tpu_id);

        if ($tpu->status !== 'aktif') {
            return response()->json(['message' => 'TPU ini sedang tidak menerima pengajuan'], 403);
        }

        $data = $validator->validated();
        $pemohon = $request->user();

        $pengajuan = DB::transaction(function () use ($data, $tpu, $pemohon) {
            // Almarhum dibuat TANPA makam_id dulu — baru ditempatkan saat admin memverifikasi
            $almarhumData = collect($data)->except('tpu_id')->toArray();
            $almarhum = Almarhum::create($almarhumData);

            return Pengajuan::create([
                'kode_pengajuan' => $this->generateKodePengajuan(),
                'pemohon_id' => $pemohon->id,
                'tpu_id' => $tpu->id,
                'almarhum_id' => $almarhum->id,
                'status' => 'menunggu_verifikasi',
                'tanggal_pengajuan' => now(),
            ]);
        });

        return response()->json([
            'message' => 'Pengajuan berhasil dikirim, menunggu verifikasi Admin TPU',
            'data' => $pengajuan->load('almarhum', 'tpu'),
        ], 201);
    }

    // ---- Hanya Admin TPU (pemilik TPU terkait) atau Super Admin ----
    public function verifikasi(Request $request, Pengajuan $pengajuan)
    {
        $user = $request->user();

        if (! $this->authorizeVerifikasi($user, $pengajuan)) {
            return response()->json(['message' => 'Pengajuan ini bukan tanggung jawab Anda'], 403);
        }

        if ($pengajuan->status !== 'menunggu_verifikasi') {
            return response()->json(['message' => 'Pengajuan ini sudah pernah diverifikasi'], 422);
        }

        $validator = Validator::make($request->all(), [
            'status' => ['required', 'in:disetujui,ditolak'],
            'catatan_verifikasi' => ['nullable', 'string'],
            // wajib diisi kalau menyetujui, karena almarhum harus ditempatkan di suatu makam
            'makam_id' => ['required_if:status,disetujui', 'nullable', 'exists:makams,id'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $adminId = $user instanceof AdminTpu ? $user->id : null;

        if ($request->status === 'disetujui') {
            $makam = Makam::with('blok')->findOrFail($request->makam_id);

            if ($makam->blok->tpu_id !== $pengajuan->tpu_id) {
                return response()->json(['message' => 'Makam yang dipilih bukan di TPU tujuan pengajuan ini'], 422);
            }
            if ($makam->almarhum()->exists()) {
                return response()->json(['message' => 'Makam ini sudah ditempati almarhum lain'], 422);
            }

            DB::transaction(function () use ($pengajuan, $makam, $request, $adminId) {
                $pengajuan->update([
                    'status' => 'disetujui',
                    'catatan_verifikasi' => $request->catatan_verifikasi,
                    'tanggal_verifikasi' => now(),
                    'admin_tpu_id' => $adminId,
                ]);

                $pengajuan->almarhum()->update(['makam_id' => $makam->id]);

                $makam->update([
                    'status' => 'terisi',
                    'status_petak' => 'Terisi (Aktif)',
                ]);
            });
        } else {
            $pengajuan->update([
                'status' => 'ditolak',
                'catatan_verifikasi' => $request->catatan_verifikasi,
                'tanggal_verifikasi' => now(),
                'admin_tpu_id' => $adminId,
            ]);
        }

        return response()->json([
            'message' => 'Pengajuan berhasil ' . ($request->status === 'disetujui' ? 'disetujui' : 'ditolak'),
            'data' => $pengajuan->fresh()->load('almarhum.makam', 'tpu'),
        ]);
    }

    private function generateKodePengajuan(): string
    {
        do {
            $kode = 'PGJ-' . now()->format('Ymd') . '-' . strtoupper(Str::random(5));
        } while (Pengajuan::where('kode_pengajuan', $kode)->exists());

        return $kode;
    }

    private function authorizeAccess($user, Pengajuan $pengajuan): bool
    {
        if ($user instanceof Pemohon) {
            return $pengajuan->pemohon_id === $user->id;
        }
        if ($user instanceof AdminTpu) {
            return $pengajuan->tpu_id === $user->tpu_id;
        }
        if ($user instanceof Uptd) {
            return $pengajuan->tpu->uptd_id === $user->id;
        }

        return $user instanceof SuperAdmin;
    }

    private function authorizeVerifikasi($user, Pengajuan $pengajuan): bool
    {
        if ($user instanceof AdminTpu) {
            return $pengajuan->tpu_id === $user->tpu_id;
        }

        return $user instanceof SuperAdmin;
    }
}
