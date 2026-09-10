<?php

/*
|--------------------------------------------------------------------------
| Peta Kolom Excel (template_almarhum.csv) -> Kolom Database
|--------------------------------------------------------------------------
|
| Acuan untuk fitur "Upload Excel Almarhum". Setiap baris = data 1 almarhum
| yang sekaligus bisa berisi penempatan makam + koordinat + 1 ahli waris.
|
| KARENA ada header yang sama untuk Almarhum & Ahli Waris (mis. "Nama Jalan
| Almarhum", "No. Rumah", "RT", "Provinsi", dll), pemetaan dilakukan
| BERDASARKAN POSISI KOLOM (0 = kolom pertama = "NO"), bukan nama header.
| Ini memastikan kolom Ahli Waris tidak tertimpa kolom Almarhum.
|
| Format entri (indeks = posisi kolom di Excel, mulai 0):
|   'table'  => tabel tujuan
|   'column' => kolom database
|   'cast'   => cara mengolah: string | date | int | float | enum
|               | resolve_makam | resolve_blok
|   'require'=> (opsional) wajib diisi? default false
|
| Tabel tujuan: almarhums, makams, bloks, koordinat_makams, ahli_waris
|
| Catatan resolusi khusus (bukan mapping 1:1):
|   - 'Nomor Makam' (indeks 2)  -> dicari di makams.kode_makam / nomor_makam
|   - 'Blok'        (indeks 19) -> dicari di bloks.nama_blok / kode_blok
|   - 'Koordinat x/y' -> ditulis ke koordinat_makams (latitude/longitude)
|   - 'catatan lokasi makam' -> makams.keterangan
|   - 'Agama' (indeks 35, kolom terakhir) -> almarhums.agama
|   - 'NO' (indeks 0) -> nomor urut baris, TIDAK disimpan
*/

return [

    // Kolom yang WAJIB terisi di setiap baris supaya bisa disimpan.
    // Sengaja diminimalkan (cuma Nama) — kolom lain BOLEH kosong dan akan
    // disimpan apa adanya (null), sesuai permintaan: "masukkan saja meskipun
    // ada data yang kosong". Blok/Nomor Makam kosong pun tidak menggagalkan
    // baris — almarhum tetap dibuat, hanya saja belum ditempatkan ke makam.
    'required_columns' => [3], // Nama Almarhum

    // Pemetaan berdasarkan POSISI kolom (0 = "NO").
    'mapping' => [

        // (0) NO -> dilewati, tidak disimpan

        // ---------- ALMARHUM ----------
        1  => ['table' => 'almarhums', 'column' => 'no_registrasi',         'cast' => 'string'],
        2  => ['table' => 'makams',    'column' => 'kode_makam',            'cast' => 'resolve_makam'],
        3  => ['table' => 'almarhums', 'column' => 'nama_lengkap',          'cast' => 'string'],
        4  => ['table' => 'almarhums', 'column' => 'bin_binti',             'cast' => 'string'],
        5  => ['table' => 'almarhums', 'column' => 'nik',                   'cast' => 'string'],
        6  => ['table' => 'almarhums', 'column' => 'jenis_kelamin',         'cast' => 'enum'],
        7  => ['table' => 'almarhums', 'column' => 'alamat_jalan',          'cast' => 'string'],
        8  => ['table' => 'almarhums', 'column' => 'alamat',                'cast' => 'string'], // 'Detail Jalan'
        9  => ['table' => 'almarhums', 'column' => 'no_rumah',              'cast' => 'string'],
        10 => ['table' => 'almarhums', 'column' => 'rt',                    'cast' => 'string'],
        11 => ['table' => 'almarhums', 'column' => 'rw',                    'cast' => 'string'],
        12 => ['table' => 'almarhums', 'column' => 'provinsi',              'cast' => 'string'],
        13 => ['table' => 'almarhums', 'column' => 'kota_kabupaten',        'cast' => 'string'],
        14 => ['table' => 'almarhums', 'column' => 'kecamatan',             'cast' => 'string'],
        15 => ['table' => 'almarhums', 'column' => 'kelurahan',             'cast' => 'string'],
        16 => ['table' => 'almarhums', 'column' => 'tanggal_lahir',         'cast' => 'date'],
        17 => ['table' => 'almarhums', 'column' => 'tanggal_wafat',         'cast' => 'date'],
        18 => ['table' => 'almarhums', 'column' => 'tanggal_dimakamkan',    'cast' => 'date'],

        // (19) Blok -> resolusi blok untuk penempatan makam
        19 => ['table' => 'bloks', 'column' => 'nama_blok', 'cast' => 'resolve_blok'],

        // ---------- AHLI WARIS ----------
        20 => ['table' => 'ahli_waris', 'column' => 'nama_lengkap', 'cast' => 'string'],
        21 => ['table' => 'ahli_waris', 'column' => 'nik',          'cast' => 'string'],
        22 => ['table' => 'ahli_waris', 'column' => 'alamat_jalan', 'cast' => 'string'], // 'Nama Jalan Almarhum' (Ahli Waris)
        23 => ['table' => 'ahli_waris', 'column' => 'alamat',       'cast' => 'string'], // 'Detail Jalan' (Ahli Waris)
        24 => ['table' => 'ahli_waris', 'column' => 'no_rumah',     'cast' => 'string'],
        25 => ['table' => 'ahli_waris', 'column' => 'rt',           'cast' => 'string'],
        26 => ['table' => 'ahli_waris', 'column' => 'rw',           'cast' => 'string'],
        27 => ['table' => 'ahli_waris', 'column' => 'provinsi',     'cast' => 'string'],
        28 => ['table' => 'ahli_waris', 'column' => 'kota_kabupaten', 'cast' => 'string'],
        29 => ['table' => 'ahli_waris', 'column' => 'kecamatan',    'cast' => 'string'],
        30 => ['table' => 'ahli_waris', 'column' => 'kelurahan',    'cast' => 'string'],
        31 => ['table' => 'ahli_waris', 'column' => 'no_telepon',   'cast' => 'string'],

        // ---------- KOORDINAT & CATATAN MAKAM ----------
        32 => ['table' => 'koordinat_makams', 'column' => 'latitude',  'cast' => 'float'], // 'Koordinat x'
        33 => ['table' => 'koordinat_makams', 'column' => 'longitude', 'cast' => 'float'], // 'Koordinat y'
        34 => ['table' => 'makams', 'column' => 'keterangan', 'cast' => 'string'],         // 'catatan lokasi makam'
        35 => ['table' => 'almarhums', 'column' => 'agama', 'cast' => 'string'],           // 'Agama'
    ],

];
