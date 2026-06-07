#!/usr/bin/env bash
# Observa el .tex y la carpeta figuras/, y recompila el PDF con `make` en cada cambio.
# Uso:  ./watch.sh
set -euo pipefail

cd "$(dirname "$0")"

TEX="Trabajo_Geometria_Proyectiva_Unificado.tex"

echo "[watch] Compilación inicial..."
make || echo "[watch] La compilación inicial falló; corregí y guardá para reintentar."

echo "[watch] Observando '$TEX' y 'figuras/'. Ctrl-C para salir."

# -o agrupa eventos en bloque; -l 1 espera 1s para evitar recompilar varias veces por guardado.
fswatch -o -l 1 "$TEX" figuras | while read -r _; do
  echo "[watch] Cambio detectado: recompilando..."
  if make; then
    echo "[watch] OK -> ${TEX%.tex}.pdf  ($(date +%H:%M:%S))"
  else
    echo "[watch] ERROR de compilación; revisá el .log."
  fi
done
