<?php

namespace Database\Seeders;

use App\Models\AhliWaris;
use App\Models\Almarhum;
use App\Models\Blok;
use App\Models\Makam;
use App\Models\Tpu;
use App\Models\Uptd;
use Illuminate\Database\Seeder;

class UptdDataSeeder extends Seeder
{
    public function run(): void
    {
        $now = now();

        $specs = [
            'UPTD II Kota Bandung' => [
                'tpu' => ['kode_tpu' => 'PST', 'nama_tpu' => 'TPU Panyileukan', 'nama_jenazah' => 'Hj. Siti Rahayu', 'no_reg' => 'REG-2026-II-001', 'jk' => 'P'],
                'blok' => ['kode_blok' => 'A1', 'nama_blok' => 'Blok A1'],
            ],
            'UPTD Wilayah 1' => [
                'tpu' => ['kode_tpu' => 'CWL', 'nama_tpu' => 'TPU Ciwastra', 'nama_jenazah' => 'Muhammad Yusuf', 'no_reg' => 'REG-2026-W1-001', 'jk' => 'L'],
                'blok' => ['kode_blok' => 'B1', 'nama_blok' => 'Blok B1'],
            ],
        ];

        foreach ($specs as $namaUptd => $spec) {
            $uptd = Uptd::where('nama_uptd', $namaUptd)->first();
            if (! $uptd) {
                continue;
            }

            $tpu = Tpu::firstOrCreate(
                ['kode_tpu' => $spec['tpu']['kode_tpu']],
                [
                    'uptd_id' => $uptd->id,
                    'nama_tpu' => $spec['tpu']['nama_tpu'],
                    'status' => 'aktif',
                    'created_at' => $now,
                    'updated_at' => $now,
                ]
            );

            $blok = Blok::firstOrCreate(
                ['tpu_id' => $tpu->id, 'kode_blok' => $spec['blok']['kode_blok']],
                [
                    'nama_blok' => $spec['blok']['nama_blok'],
                    'status_ketersediaan' => 'Kosong (Tersedia)',
                    'created_at' => $now,
                    'updated_at' => $now,
                ]
            );

            // Beberapa makam kosong supaya data makam tidak kosong
            foreach (range(1, 4) as $n) {
                $kode = $spec['blok']['kode_blok'] . '-' . str_pad($n, 2, '0', STR_PAD_LEFT);
                Makam::firstOrCreate(
                    ['blok_id' => $blok->id, 'kode_makam' => $kode],
                    [
                        'nomor_makam' => str_pad($n, 3, '0', STR_PAD_LEFT),
                        'status' => 'kosong',
                        'status_petak' => 'Kosong (Tersedia)',
                        'created_at' => $now,
                        'updated_at' => $now,
                    ]
                );
            }

            // Satu almarhum + ahli waris contoh supaya data tidak kosong
            $makamTerisi = $blok->makams()->first();
            $almarhum = Almarhum::firstOrCreate(
                ['no_registrasi' => $spec['tpu']['no_reg']],
                [
                    'makam_id' => $makamTerisi->id,
                    'nama_lengkap' => $spec['tpu']['nama_jenazah'],
                    'bin_binti' => 'binti Alm. H. Abdullah',
                    'jenis_kelamin' => $spec['tpu']['jk'],
                    'agama' => 'Islam',
                    'tanggal_wafat' => $now->subMonths(2)->toDateString(),
                    'tanggal_dimakamkan' => $now->subMonths(2)->toDateString(),
                    'kelurahan' => 'Ciwastra',
                    'kecamatan' => 'Buahbatu',
                    'kota_kabupaten' => 'Kota Bandung',
                    'provinsi' => 'Jawa Barat',
                    'created_at' => $now,
                    'updated_at' => $now,
                ]
            );

            Makam::where('id', $makamTerisi->id)->update([
                'status' => 'terisi',
                'status_petak' => 'Terisi (Aktif)',
            ]);

            AhliWaris::firstOrCreate(
                ['almarhum_id' => $almarhum->id, 'nama_lengkap' => 'Deden Suparman'],
                ['hubungan' => 'Anak', 'no_telepon' => '0812-0000-0000', 'created_at' => $now, 'updated_at' => $now]
            );
        }

        $this->command->info('Data UPTD II Kota Bandung & UPTD Wilayah 1 berhasil diisi.');
    }
}