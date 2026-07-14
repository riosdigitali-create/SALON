# Descarga las fotos de la galeria (Unsplash, licencia gratuita) a .\img\
$dest = Join-Path $PSScriptRoot "img"
New-Item -ItemType Directory -Force -Path $dest | Out-Null
$fotos = @{
  "01-salon-interior.jpg" = "photo-1521590832167-7bcbfaa6381f"
  "02-corte-estilista.jpg"= "photo-1634449571010-02389ed0f9b0"
  "03-secado-peinado.jpg" = "photo-1580618672591-eb180b1a973f"
  "04-tocador.jpg"        = "photo-1626379501846-0df4067b8bb9"
  "05-equipo.jpg"         = "photo-1559599101-f09722fb4948"
  "06-styling.jpg"        = "photo-1560869713-7d0a29430803"
}
foreach ($f in $fotos.GetEnumerator()) {
  $url = "https://images.unsplash.com/$($f.Value)?auto=format&fit=crop&w=1600&q=80"
  Write-Host "Descargando $($f.Key)..."
  Invoke-WebRequest -Uri $url -OutFile (Join-Path $dest $f.Key)
}
Write-Host "Listo. Fotos en: $dest" -ForegroundColor Green
