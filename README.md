# Geometría proyectiva: coordenadas homogéneas, dualidad y aplicaciones

Trabajo de investigación sobre geometría proyectiva, escrito en LaTeX.
Cubre coordenadas homogéneas, el principio de dualidad, homografías y sus
aplicaciones en perspectiva, visión por computadora y gráficos por
computadora. Incluye además una presentación Beamer del tema.

## Documentos

- **`Trabajo_Geometria_Proyectiva_Unificado.tex` / `.pdf`** — el documento final.
- **`Presentacion_Geometria_Proyectiva.tex` / `.pdf`** — la presentación Beamer.
- **`figuras/`** — imágenes usadas por ambos documentos.

## Cómo compilar

Requiere una distribución de LaTeX (TeX Live / MacTeX) con `latexmk`.

```sh
make                # compila AMBOS (trabajo + presentación)
make doc            # compila solo el trabajo
make slides         # compila solo la presentación
make watch          # recompila el trabajo al guardar (latexmk -pvc)
make watch-slides   # recompila la presentación al guardar (latexmk -pvc)
make clean          # borra archivos auxiliares de ambos
make clobber        # borra auxiliares + ambos PDFs
```

Alternativamente, `watch.sh` observa el `.tex` y la carpeta `figuras/` con
`fswatch` y recompila en cada cambio:

```sh
./watch.sh          # observa el trabajo (default)
./watch.sh doc      # idem, explícito
./watch.sh slides   # observa la presentación
```

## Estructura

```
.
├── Trabajo_Geometria_Proyectiva_Unificado.tex   # fuente del trabajo
├── Trabajo_Geometria_Proyectiva_Unificado.pdf   # documento
├── Presentacion_Geometria_Proyectiva.tex        # fuente de la presentación
├── Presentacion_Geometria_Proyectiva.pdf        # presentación (Beamer)
├── figuras/                                      # assets (compartidos)
├── Makefile                                       # build
├── watch.sh                                        # build en modo watch
└── README.md
```
