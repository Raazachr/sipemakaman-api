<?php
/**
 * Verifikasi ikon PNG: valid, latar transparan, dan TIDAK kosong
 * (ada piksel berwarna nyata) serta proporsinya masuk akal.
 */
$dir = 'D:/xampp/htdocs/sipemakaman-api/public/img/icons';
$files = glob($dir . '/*.png');
sort($files);

$fail = 0;
printf("%-18s %-11s %-8s %-9s %-9s %s\n", 'IKON', 'DIMENSI', 'ALPHA', 'PIKSEL WARNA', 'CAKUPAN', 'STATUS');
printf("%s\n", str_repeat('-', 78));

foreach ($files as $f) {
    $name = basename($f, '.png');
    $info = @getimagesize($f);
    if (!$info || $info[2] !== IMAGETYPE_PNG) {
        printf("%-18s %s\n", $name, 'GAGAL: bukan PNG valid');
        $fail++;
        continue;
    }
    [$w, $h] = $info;

    $im = imagecreatefrompng($f);
    if (!$im) { printf("%-18s %s\n", $name, 'GAGAL: tidak bisa dibaca'); $fail++; continue; }
    imagealphablending($im, false);
    imagesavealpha($im, true);

    $colored = 0;      // piksel tidak transparan
    $cornerOpacity = null;
    $colors = [];

    for ($y = 0; $y < $h; $y++) {
        for ($x = 0; $x < $w; $x++) {
            $rgb = imagecolorat($im, $x, $y);
            // PENTING: di GD, alpha 7-bit memakai 0 = opaque dan 127 = transparan.
            // Jadi opasitas = (127 - alpha) / 127, bukan 255 - alpha.
            $alpha7 = ($rgb >> 24) & 0x7F;
            $opacity = ($alpha7 >= 127) ? 0 : (int) round((127 - $alpha7) / 127 * 100);
            if ($opacity > 8) { $colored++; }
            if ($x === 0 && $y === 0) { $cornerOpacity = $opacity; }
            if ($opacity > 60) {
                $key = sprintf('%02x%02x%02x', ($rgb >> 16) & 0xFF, ($rgb >> 8) & 0xFF, $rgb & 0xFF);
                $colors[$key] = ($colors[$key] ?? 0) + 1;
            }
        }
    }
    imagedestroy($im);

    $total = $w * $h;
    $cover = round($colored / $total * 100, 1);
    $hasAlpha = $cornerOpacity !== null && $cornerOpacity <= 8;
    $warnaDominan = $colors ? array_key_first($colors) : '-';

    $status = [];
    if (!$hasAlpha)      { $status[] = 'LATAR TIDAK TRANSPARAN'; }
    if ($colored === 0)  { $status[] = 'IKON KOSONG'; }
    if ($cover < 1)      { $status[] = 'TERLALU KOSONG (' . $cover . '%)'; }
    if ($cover > 92)     { $status[] = 'TERLALU PENUH (' . $cover . '%)'; }
    if (!$status)        { $status[] = 'OK'; }
    else { $fail++; }

    printf(
        "%-18s %-11s %-8s %-11s %-9s %s\n",
        $name,
        "{$w}x{$h}",
        $hasAlpha ? 'ya' : 'TIDAK',
        number_format($colored, 0, ',', ''),
        $cover . '%',
        implode(', ', $status)
    );
}

printf("%s\n", str_repeat('-', 78));
printf("Total: %d ikon, %d bermasalah\n", count($files), $fail);
