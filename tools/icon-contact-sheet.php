<?php
/**
 * Buat contact sheet PNG dari semua ikon supaya bisa dinilai visual sekaligus.
 * Output: %TEMP%/sipem-icons-sheet.png
 */
$dir  = 'public/img/icons';
$cols = 7;
$cell = 128;
$pad  = 8;
$labelH = 18;

$files = glob("$dir/*.png");
sort($files);
$rows = (int) ceil(count($files) / $cols);

$w = $cols * ($cell + $pad) + $pad;
$h = $rows * ($cell + $pad + $labelH) + $pad;

$sheet = imagecreatetruecolor($w, $h);
$bg    = imagecolorallocate($sheet, 255, 255, 255);
$line  = imagecolorallocate($sheet, 226, 232, 240);
$txt   = imagecolorallocate($sheet, 51, 65, 85);
imagefill($sheet, 0, 0, $bg);

foreach ($files as $i => $f) {
    $im = imagecreatefrompng($f);
    $col = $i % $cols;
    $row = intdiv($i, $cols);
    $x = $pad + $col * ($cell + $pad);
    $y = $pad + $row * ($cell + $pad + $labelH);

    imagerectangle($sheet, $x - 1, $y - 1, $x + $cell, $y + $cell, $line);
    imagecopy($sheet, $im, $x, $y, 0, 0, $cell, $cell);
    imagedestroy($im);

    $name = basename($f, '.png');
    imagestring($sheet, 2, $x + 2, $y + $cell + 4, $name, $txt);
}

$out = sys_get_temp_dir() . '/sipem-icons-sheet.png';
imagepng($sheet, $out);
imagedestroy($sheet);

printf("Contact sheet: %s (%dx%d, %d ikon)\n", $out, $w, $h, count($files));
