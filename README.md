# Geometría proyectiva: coordenadas homogéneas, dualidad y aplicaciones

Trabajo de investigación sobre geometría proyectiva, escrito en LaTeX.
Cubre coordenadas homogéneas, el principio de dualidad, homografías y sus
aplicaciones en perspectiva, visión por computadora y gráficos por
computadora.

## Documento

- **`Trabajo_Geometria_Proyectiva_Unificado.pdf`** — el documento final.
- **`Trabajo_Geometria_Proyectiva_Unificado.tex`** — el código fuente LaTeX.
- **`figuras/`** — imágenes usadas en el documento.

## Cómo compilar

Requiere una distribución de LaTeX (TeX Live / MacTeX) con `latexmk`.

```sh
make            # compila el PDF
make watch      # recompila automáticamente al guardar (latexmk -pvc)
make clean      # borra archivos auxiliares
make clobber    # borra auxiliares + PDF
```

Alternativamente, `./watch.sh` observa el `.tex` y la carpeta `figuras/`
con `fswatch` y recompila en cada cambio.

## Estructura

```
.
├── Trabajo_Geometria_Proyectiva_Unificado.tex   # fuente
├── Trabajo_Geometria_Proyectiva_Unificado.pdf   # documento
├── figuras/                                      # assets
├── Makefile                                       # build
├── watch.sh                                        # build en modo watch
└── README.md
```
