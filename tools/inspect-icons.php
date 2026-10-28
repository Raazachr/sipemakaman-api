<?php
/**
 * 1) Deteksi ikon kembar (hash identik) - biasanya bug copy-paste.
 * 2) Render ASCII supaya bentuk ikon bisa diperiksa tanpa melihat gambar.
 */
$dir = 'D:/xampp/htdocs/sipemakaman-api/public/img/icons';
$files = glob($dir . '/*.png');
sort($files);

echo "=== 1) IKON KEMBAR (hash identik) ===\n";
$byHash = [];
foreach ($files as $f) {
    $h = md5_file($f);
    $byHash[$h][] = basename($f, '.png');
}
$kembar = 0;
foreach ($byHash as $h => $names) {
    if (count($names) > 1) {
        echo '  KEMBAR: ' . implode(' == ', $names) . PHP_EOL;
        $kembar++;
    }
}
if ($kembar === 0) { echo "  tidak ada ikon kembar" . PHP_EOL; }

// Hitung juga kemiripan berdasarkan jumlah piksel
echo PHP_EOL . "=== 2) PASANGAN DENGAN PIXEL COUNT SAMA PERSIS ===\n" . PHP_EOL;
$counts = [];
foreach ($files as $f) {
    $im = imagecreatefrompng($f);
    $n = 0;
    for ($y = 0; $y < 128; $y += 2) {
        for ($x = 0; $x < 128; $x += 2) {
            $a = (imagecolorat($im, $x, $y) >> 24) & 0x7F;
            if ($a < 120) { $n++; }
        }
    }
    imagedestroy($im);
    $counts[basename($f, '.png')] = $n;
}
$seen = [];
foreach ($counts as $name => $n) {
    foreach ($seen as $sName => $sN) {
        if ($sN === $n) { echo " JUMLAH SAMA: $sName == $name ($n)" . PHP_EOL; }
    }
    $seen[$name] = $n;
}

// ASCII preview
$preview = array_map(fn($f) => basename($f, '.png'), $files);
echo PHP_EOL . "=== 3) BENTUK IKON (ASCII, 32x16) ===" . PHP_EOL;
foreach ($preview as $name) {
    $f = "$dir/$name.png";
    if (!is_file($f)) { continue; }
    echo PHP_EOL . "--- $name ---" . PHP_EOL;
    $im = imagecreatefrompng($f);
    imagealphablending($im, false);
    imagesavealpha($im, true);
    for ($gy = 0; $gy < 16; $gy++) {
        $line = '';
        for ($gx = 0; $gx < 32; $gx++) {
            $acc = 0; $n = 0;
            for ($sy = 0; $sy < 8; $sy++) {          // 128 / 16 = 8 baris per sel
                for ($sx = 0; $sx < 4; $sx++) {      // 128 / 32 = 4 kolom per sel
                    $px = $gx * 4 + $sx;
                    $py = $gy * 8 + $sy;
                    $a = (imagecolorat($im, $px, $py) >> 24) & 0x7F;
                    $acc += (127 - $a); $n++;
                }
            }
            $cov = $acc / $n / 127;
            $line .= $cov > 0.75 ? '#' : ($cov > 0.45 ? '+' : ($cov > 0.15 ? '.' : ' '));
        }
        echo '  |' . $line . '|' . PHP_EOL;
    }
    imagedestroy($im);
}
