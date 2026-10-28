$ErrorActionPreference = 'Stop'
$base = 'http://localhost/sipemakaman-api/public'
$files = Get-ChildItem "D:\xampp\htdocs\sipemakaman-api\public\img\icons\*.png" | Sort-Object Name
$fail = 0
foreach ($f in $files) {
    $url = "$base/img/icons/$($f.Name)"
    try {
        $r = Invoke-WebRequest -Uri $url -Method Get -UseBasicParsing -TimeoutSec 15
        $code = $r.StatusCode
        $type = $r.Headers['Content-Type']
        $len = $r.RawContentLength
    } catch {
        $code = 'ERR'; $type = $_.Exception.Message; $len = '-'
    }
    if ($code -ne 200 -or $type -notlike 'image/png*') { $fail++ }
    "{0,-20} {1,-4} {2,7}  {3}" -f $f.Name, $code, $len, $type
}
""
if ($fail -eq 0) { "SEMUA $($files.Count) ION 200 OK (image/png)" } else { "$fail file GAGAL" }
