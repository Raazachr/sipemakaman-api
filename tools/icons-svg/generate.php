<?php
/**
 * Generator SVG untuk ikon aplikasi SIPEMAKAMAN.
 * Sumber SVG disimpan di tools/icons-svg supaya masih bisa diedit,
 * lalu di-raster jadi PNG oleh tools/rasterize-icons.ps1 (headless Chrome)
 * ke public/img/icons/ yang dipakai saat runtime.
 */
$dir = __DIR__;
@mkdir($dir, 0775, true);

$c = [
    'blue'   => '#2563eb',
    'sky'    => '#0284c7',
    'sky2'   => '#0ea5e9',
    'indigo' => '#4f46e5',
    'emerald'=> '#059669',
    'amber'  => '#d97706',
    'red'    => '#dc2626',
    'slate'  => '#334155',
    'green'  => '#16a34a',
    'gray'   => '#475569',
];

/** Bungkus isi ikon jadi dokumen SVG 24x24. */
function svg(string $body, string $fill): string
{
    return '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="' . $fill . '">' . $body . '</svg>';
}

$icons = [];

// ---- MENU SIDEBAR ----

// Dashboard: grafik batang
$icons['dashboard'] = svg(
    '<rect x="2.5" y="12" width="4.6" height="8.5" rx="1.6"/>'
  . '<rect x="9.7" y="7" width="4.6" height="13.5" rx="1.6"/>'
  . '<rect x="16.9" y="3.5" width="4.6" height="17" rx="1.6"/>',
    $c['blue']
);

// Almarhum: nisan batu
$icons['almarhum'] = svg(
    '<path d="M12 1.8c-4.5 0-8.1 3.2-8.1 7.2v7.6c0 1 .8 1.8 1.8 1.8h12.6c1 0 1.8-.8 1.8-1.8V9c0-4-3.6-7.2-8.1-7.2z"/>'
  . '<rect x="3" y="19.6" width="18" height="2.6" rx="1.3"/>'
  . '<rect x="8.6" y="7.4" width="6.8" height="1.5" rx=".75" fill="#fff" opacity=".85"/>'
  . '<rect x="8.6" y="10.9" width="6.8" height="1.5" rx=".75" fill="#fff" opacity=".85"/>'
  . '<rect x="8.6" y="14.4" width="4.2" height="1.5" rx=".75" fill="#fff" opacity=".85"/>',
    $c['sky']
);

// Makam: petak makam 2x2
$icons['makam'] = svg(
    '<rect x="2.4" y="2.4" width="8.6" height="8.6" rx="2.2"/>'
  . '<rect x="13" y="2.4" width="8.6" height="8.6" rx="2.2" opacity=".55"/>'
  . '<rect x="2.4" y="13" width="8.6" height="8.6" rx="2.2" opacity=".55"/>'
  . '<rect x="13" y="13" width="8.6" height="8.6" rx="2.2" opacity=".28"/>',
    $c['gray']
);

// Ahli Waris: dua orang
$icons['ahliwaris'] = svg(
    '<circle cx="8.6" cy="7.4" r="3.9"/>'
  . '<path d="M1.9 20.6c0-3.7 3-6.7 6.7-6.7s6.7 3 6.7 6.7z"/>'
  . '<path d="M15.2 4.1a3.9 3.9 0 0 1 0 6.6c.9-.7 1.4-1.8 1.4-3.3s-.5-2.6-1.4-3.3z"/>'
  . '<path d="M17.2 13.9c3 .6 5 3.1 5 6.7h-4.6c0-2.6-1-5-2.6-6.5.7-.2 1.4-.3 2.2-.3z"/>',
    $c['indigo']
);

// Peta: penanda lokasi
$icons['peta'] = svg(
    '<path d="M12 1.9c-4.3 0-7.8 3.4-7.8 7.7 0 5.6 7.8 12.5 7.8 12.5s7.8-6.9 7.8-12.5c0-4.3-3.5-7.7-7.8-7.7z"/>'
  . '<circle cx="12" cy="9.5" r="2.9" fill="#fff" opacity=".92"/>',
    $c['emerald']
);

// Master: gedung
$icons['master'] = svg(
    '<path d="M11 1.9h2v2.4h-2z"/>'
  . '<path d="M12 4.3l9 3.4v1.6H3V7.7z"/>'
  . '<rect x="4.9" y="10.6" width="2.6" height="7.6" rx=".7"/>'
  . '<rect x="10.7" y="10.6" width="2.6" height="7.6" rx=".7"/>'
  . '<rect x="16.5" y="10.6" width="2.6" height="7.6" rx=".7"/>'
  . '<rect x="2.6" y="19.3" width="18.8" height="2.8" rx="1.2"/>',
    $c['slate']
);

// Log Aktivitas: daftar di papan
$icons['aktivitas'] = svg(
    '<path d="M8.4 2.2h7.2a1.6 1.6 0 0 1 1.6 1.6v.9h1.9A1.9 1.9 0 0 1 21 6.6v13.5a1.9 1.9 0 0 1-1.9 1.9H4.9A1.9 1.9 0 0 1 3 20.1V6.6a1.9 1.9 0 0 1 1.9-1.9h1.9v-.9a1.6 1.6 0 0 1 1.6-1.6z" opacity=".28"/>'
  . '<path d="M8.4 1.4h7.2a2.2 2.2 0 0 1 2.2 2.2v1.1H6.2V3.6a2.2 2.2 0 0 1 2.2-2.2z"/>'
  . '<rect x="6.4" y="8.6" width="11.2" height="1.7" rx=".85"/>'
  . '<rect x="6.4" y="12.4" width="11.2" height="1.7" rx=".85"/>'
  . '<rect x="6.4" y="16.2" width="7.4" height="1.7" rx=".85"/>',
    $c['amber']
);

// Permintaan Hapus / Hapus: sampah
$icons['hapus'] = svg(
    '<path d="M9.1 1.9h5.8a1.6 1.6 0 0 1 1.6 1.6v1.2h4.2a1.1 1.1 0 0 1 0 2.2H3.3a1.1 1.1 0 0 1 0-2.2h4.2V3.5a1.6 1.6 0 0 1 1.6-1.6z"/>'
  . '<path d="M4.9 8.2h14.2l-1 11.2a2.2 2.2 0 0 1-2.2 2H8.1a2.2 2.2 0 0 1-2.2-2z"/>'
  . '<rect x="9.4" y="11.2" width="1.9" height="6.6" rx=".95" fill="#fff" opacity=".85"/>'
  . '<rect x="12.7" y="11.2" width="1.9" height="6.6" rx=".95" fill="#fff" opacity=".85"/>',
    $c['red']
);

// ---- KARTU STATISTIK DASHBOARD ----

// Kapasitas Makam: lapisan (bertumpuk)
$icons['kapasitas'] = svg(
    '<path d="M12 1.6l10.3 5.1c.5.3.5 1 0 1.3L12 13.1 1.7 8c-.5-.3-.5-1 0-1.3z" opacity=".45"/>'
  . '<path d="M1.7 12.2c-.5.3-.5 1 0 1.3L12 18.7l10.3-5.2c.5-.3.5-1 0-1.3L12 7.1z"/>'
  . '<path d="M1.7 17.3c-.5.3-.5 1 0 1.3L12 23.7l10.3-5.1c.5-.3.5-1 0-1.3L12 12.2z" opacity=".7"/>',
    $c['blue']
);

// Makam Terisi: petak terisi + badge centang
$icons['makam-terisi'] = svg(
    '<path d="M10.4 1.9c-3.9 0-7 2.8-7 6.4v6.8c0 1 .8 1.8 1.8 1.8h10.4c1 0 1.8-.8 1.8-1.8V8.3c0-3.6-3.1-6.4-7-6.4z"/>'
  . '<rect x="6.2" y="7.3" width="5.4" height="1.5" rx=".75" fill="#fff" opacity=".85"/>'
  . '<rect x="6.2" y="10.6" width="5.4" height="1.5" rx=".75" fill="#fff" opacity=".85"/>'
  . '<rect x="6.2" y="13.9" width="3.4" height="1.5" rx=".75" fill="#fff" opacity=".85"/>'
  . '<rect x="1.6" y="18.5" width="15.4" height="2.4" rx="1.2"/>'
  . '<circle cx="17.3" cy="17.2" r="5.3" fill="#16a34a"/>'
  . '<path d="M14.3 17.2l1.5-1.5 1.2 1.2 3-3 1.5 1.5-4.5 4.5z" fill="#fff"/>',
    $c['sky2']
);

// Status Makam: kotak 2x2 (satu terisi = Petak)
$icons['status-makam'] = svg(
    '<rect x="2.4" y="2.4" width="8.6" height="8.6" rx="2.2"/>'
  . '<rect x="13" y="2.4" width="8.6" height="8.6" rx="2.2" opacity=".5"/>'
  . '<rect x="2.4" y="13" width="8.6" height="8.6" rx="2.2" opacity=".5"/>'
  . '<path d="M17.3 14.6l1.9 1.9 4-4.2 1.4 1.4-5.4 5.6-3.3-3.3z" fill="#fff" opacity=".95"/>'
  . '<rect x="13" y="13" width="8.6" height="8.6" rx="2.2" opacity=".32"/>',
    $c['amber']
);

// Total Almarhum: satu orang
$icons['total-almarhum'] = svg(
    '<circle cx="12" cy="7.2" r="4.4"/>'
  . '<path d="M3.9 21.4c0-4.3 3.6-7.7 8.1-7.7s8.1 3.4 8.1 7.7z"/>',
    $c['indigo']
);

// ---- TOMBOL AKSI ----

// Edit: pensil
$icons['edit'] = svg(
    '<path d="M16.9 2.6a2.3 2.3 0 0 1 3.3 0l1.2 1.2a2.3 2.3 0 0 1 0 3.3l-1.6 1.6-4.5-4.5z"/>'
  . '<path d="M14.2 5.3l4.5 4.5-9.4 9.4-5.6 1.1 1.1-5.6z"/>',
    $c['sky']
);

// Lihat: mata
$icons['lihat'] = svg(
    '<path d="M12 4.5c-5 0-9.1 3.2-10.9 7.5 1.8 4.3 5.9 7.5 10.9 7.5s9.1-3.2 10.9-7.5C21.1 7.7 17 4.5 12 4.5zm0 12a4.5 4.5 0 1 1 0-9 4.5 4.5 0 0 1 0 9z"/>'
  . '<circle cx="12" cy="12" r="2.4" opacity=".55"/>',
    $c['blue']
);

// Import: unduh ke wadah
$icons['import'] = svg(
    '<path d="M11.1 1.9h1.8v8.4l3-3 1.3 1.3-5.2 5.2-5.2-5.2 1.3-1.3 3 3z"/>'
  . '<path d="M3.6 15.4h1.9v3.2h13v-3.2h1.9v4.1a1.9 1.9 0 0 1-1.9 1.9H5.5a1.9 1.9 0 0 1-1.9-1.9z"/>',
    $c['sky']
);

// ---- IKON STATUS / UMUM ----

// Sukses: lingkaran centang
$icons['sukses'] = svg(
    '<path d="M12 1.5A10.5 10.5 0 1 0 12 22.5 10.5 10.5 0 0 0 12 1.5zm5.1 8.1l-6.4 6.4a1.4 1.4 0 0 1-2 0L5.4 12.7l1.9-1.9 2.5 2.5 5.4-5.4z"/>',
    $c['green']
);

// Peringatan: segitiga
$icons['peringatan'] = svg(
    '<path d="M12 1.9c.8 0 1.5.4 1.9 1.1l8.6 15c.8 1.4-.2 3.1-1.8 3.1H3.3c-1.6 0-2.6-1.7-1.8-3.1l8.6-15c.4-.7 1.1-1.1 1.9-1.1z"/>'
  . '<rect x="10.9" y="8.4" width="2.2" height="6.2" rx="1.1" fill="#fff"/>'
  . '<circle cx="12" cy="17.2" r="1.5" fill="#fff"/>',
    $c['amber']
);

// Larangan: lingkaran garis miring
$icons['larangan'] = svg(
    '<path d="M12 1.5A10.5 10.5 0 1 0 12 22.5 10.5 10.5 0 0 0 12 1.5zm0 2.6a7.9 7.9 0 0 1 5 1.8L6.3 16.6A7.9 7.9 0 0 1 12 4.1zm0 15.8a7.9 7.9 0 0 1-5-1.8L17.7 7.4a7.9 7.9 0 0 1-5.7 12.5z"/>',
    $c['red']
);

// Checklist: centang
$icons['cek'] = svg('<path d="M20.3 5.7a1.6 1.6 0 0 1 0 2.3l-9.6 9.6a1.6 1.6 0 0 1-2.3 0l-4.7-4.7 2.3-2.3 3.5 3.5 8.4-8.4a1.6 1.6 0 0 1 1.4 0z"/>', $c['green']);

// Tutup: silang
$icons['silang'] = svg('<path d="M5.3 1.5L12 8.2l6.7-6.7 4 4L16 12.2l6.7 6.7-4 4L12 16.2l-6.7 6.7-4-4L8 12.2 1.3 5.5z"/>', $c['gray']);

// Menu hamburger
$icons['menu'] = svg(
    '<rect x="2" y="4.6" width="20" height="2.4" rx="1.2"/>'
  . '<rect x="2" y="10.8" width="20" height="2.4" rx="1.2"/>'
  . '<rect x="2" y="17" width="20" height="2.4" rx="1.2"/>',
    $c['slate']
);

// Urutkan naik: segitiga ke atas + garis dasar
$icons['sort-asc'] = svg(
    '<path d="M12 2.2l8.4 11.6H3.6z"/>'
  . '<rect x="3" y="17.4" width="18" height="3.4" rx="1.7"/>',
    $c['gray']
);

// Urutkan turun: segitiga ke bawah + garis dasar
$icons['sort-desc'] = svg(
    '<rect x="3" y="3.2" width="18" height="3.4" rx="1.7"/>'
  . '<path d="M12 21.8L3.6 10.2h16.8z"/>',
    $c['gray']
);

// Halaman sebelumnya / berikutnya
$icons['prev'] = svg('<path d="M15.4 1.9L5.3 12l10.1 10.1 2.8-2.8L10.9 12l7.3-7.3z"/>', $c['gray']);
$icons['next'] = svg('<path d="M8.6 1.9L18.7 12 8.6 22.1 5.8 19.3 13.1 12 5.8 4.7z"/>', $c['gray']);

// Info: lingkaran dengan huruf i
$icons['info'] = svg(
    '<path d="M12 1.5A10.5 10.5 0 1 0 12 22.5 10.5 10.5 0 0 0 12 1.5z"/>'
  . '<circle cx="12" cy="7.3" r="1.8" fill="#fff"/>'
  . '<rect x="10.6" y="10.4" width="2.8" height="7.8" rx="1.4" fill="#fff"/>',
    $c['sky2']
);

foreach ($icons as $name => $content) {
    file_put_contents($dir . '/' . $name . '.svg', $content);
}

// Bikin satu halaman HTML berisi semua ikon supaya bisa di-screenshot sekali per ikon.
$cards = '';
foreach (array_keys($icons) as $n) {
    $cards .= '<div class="i" id="' . $n . '">' . file_get_contents($dir . '/' . $n . '.svg') . '</div>';
}
$html = '<!doctype html><html><head><meta charset="utf-8"><style>'
      . 'html,body{margin:0;padding:0;background:transparent}'
      . '.i{width:96px;height:96px;display:flex;align-items:center;justify-content:center;background:transparent}'
      . '.i svg{width:96px;height:96px;display:block}'
      . '</style></head><body>' . $cards . '</body></html>';
file_put_contents($dir . '/_preview.html', $html);

echo 'SVG dibuat: ' . count($icons) . ' ikon' . PHP_EOL;
echo 'Daftar: ' . implode(', ', array_keys($icons)) . PHP_EOL;
