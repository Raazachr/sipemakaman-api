# Raster SVG -> PNG transparan memakai headless Chrome.
# Dipakai untuk membuat public/img/icons/*.png dari tools/icons-svg/*.svg
$ErrorActionPreference = 'Continue'

$root    = 'D:\xampp\htdocs\sipemakaman-api'
$svgDir  = Join-Path $root 'tools\icons-svg'
$pngDir  = Join-Path $root 'public\img\icons'
$chrome  = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$work    = 'C:\Users\Portgas D. Ace\AppData\Local\Temp\opencode\raster'

New-Item -ItemType Directory -Force -Path $pngDir | Out-Null
New-Item -ItemType Directory -Force -Path $work  | Out-Null

foreach ($svg in Get-ChildItem $svgDir -Filter *.svg) {
    $name = $svg.BaseName
    $htmlPath = Join-Path $work "$name.html"
    $pngPath  = Join-Path $pngDir "$name.png"

    $svgContent = [IO.File]::ReadAllText($svg.FullName)
    $html = @"
<!doctype html><html><head><meta charset="utf-8"><style>
html,body{margin:0;padding:0;background:transparent}
#b{width:128px;height:128px;display:flex;align-items:center;justify-content:center;background:transparent}
#b svg{width:128px;height:128px;display:block}
</style></head><body><div id="b">$svgContent</div></body></html>
"@
    [IO.File]::WriteAllText($htmlPath, $html, (New-Object Text.UTF8Encoding $false))

    # Chrome menulis pesan "N bytes written to file" ke stderr, jadi error
    # preference harus Continue supaya proses tidak terhenti.
    & $chrome --headless --disable-gpu --no-sandbox --hide-scrollbars `
        --default-background-color=00000000 `
        --force-device-scale-factor=1 `
        --window-size=128,128 `
        --screenshot="$pngPath" `
        "file:///$($htmlPath -replace '\\','/')" 2>&1 | Out-Null

    if (Test-Path $pngPath) {
        $kb = [math]::Round((Get-Item $pngPath).Length / 1KB, 1)
        Write-Output ("  OK  {0,-18} {1} KB" -f $name, $kb)
    } else {
        Write-Output ("  GAGAL {0}" -f $name)
    }
}

Write-Output ""
Write-Output ("Total PNG: {0}" -f (Get-ChildItem $pngDir -Filter *.png).Count)
