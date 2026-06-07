#!/usr/bin/env bash
# Observa un .tex y la carpeta figuras/, y recompila con `make` en cada cambio.
# Uso:
#   ./watch.sh            -> observa el trabajo  (target `make doc`)   [default]
#   ./watch.sh doc        -> idem, explícito
#   ./watch.sh slides     -> observa la presentación (target `make slides`)
set -euo pipefail

cd "$(dirname "$0")"

# Selección de documento según el argumento (default: doc).
TARGET="${1:-doc}"
case "$TARGET" in
  doc)
    TEX="Trabajo_Geometria_Proyectiva_Unificado.tex"
    ;;
  slides)
    TEX="Presentacion_Geometria_Proyectiva.tex"
    ;;
  *)
    echo "[watch] Argumento inválido: '$TARGET'. Usá 'doc' (default) o 'slides'." >&2
    exit 1
    ;;
esac

echo "[watch] Compilación inicial ($TARGET)..."
make "$TARGET" || echo "[watch] La compilación inicial falló; corregí y guardá para reintentar."

echo "[watch] Observando '$TEX' y 'figuras/'. Ctrl-C para salir."

# -o agrupa eventos en bloque; -l 1 espera 1s para evitar recompilar varias veces por guardado.
fswatch -o -l 1 "$TEX" figuras | while read -r _; do
  echo "[watch] Cambio detectado: recompilando..."
  if make "$TARGET"; then
    echo "[watch] OK -> ${TEX%.tex}.pdf  ($(date +%H:%M:%S))"
  else
    echo "[watch] ERROR de compilación; revisá el .log."
  fi
done
