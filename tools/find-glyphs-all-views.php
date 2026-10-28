<?php
/**
 * Cari karakter ikon (emoji / simbol) di semua file view, bukan hanya app.blade.php.
 */
$rx = '/[\x{2190}-\x{2BFF}\x{1F000}-\x{1FAFF}\x{FE0F}\x{2600}-\x{27BF}]/u';
$it = new RecursiveIteratorIterator(new RecursiveDirectoryIterator('resources/views'));
$total = 0;
foreach ($it as $f) {
    if (!$f->isFile() || $f->getExtension() !== 'php') {
        continue;
    }
    $path = str_replace('\\', '/', $f->getPathname());
    $lines = file($path, FILE_IGNORE_NEW_LINES);
    $hits = [];
    foreach ($lines as $i => $l) {
        if (preg_match($rx, $l)) {
            $hits[] = ($i + 1) . ': ' . trim($l);
        }
    }
    if ($hits) {
        $total += count($hits);
        echo "== $path (" . count($hits) . ") ==" . PHP_EOL;
        foreach ($hits as $h) {
            echo '  ' . $h . PHP_EOL;
        }
    }
}
echo $total === 0 ? "TIDAK ADA ikon emoji/simbol di resources/views\n" : "TOTAL: $total baris\n";
