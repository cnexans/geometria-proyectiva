# Makefile para compilar el trabajo y la presentación de Geometría Proyectiva
# Uso:
#   make              -> compila AMBOS (trabajo + presentación)
#   make all          -> idem
#   make doc          -> compila solo el trabajo
#   make slides       -> compila solo la presentación
#   make watch        -> recompila el trabajo al guardar (latexmk -pvc)
#   make watch-slides -> recompila la presentación al guardar (latexmk -pvc)
#   make clean        -> borra archivos auxiliares de AMBOS
#   make clobber      -> borra auxiliares + AMBOS PDFs

DOC_TEX    := Trabajo_Geometria_Proyectiva_Unificado.tex
DOC_PDF    := $(DOC_TEX:.tex=.pdf)

SLIDES_TEX := Presentacion_Geometria_Proyectiva.tex
SLIDES_PDF := $(SLIDES_TEX:.tex=.pdf)

# Ambos documentos usan la carpeta figuras/ como dependencia.
FIGURAS := $(wildcard figuras/*)

# -pdf: salida PDF | -interaction: no parar en errores | -file-line-error: errores legibles
LATEXMK := latexmk -pdf -interaction=nonstopmode -file-line-error -halt-on-error

.PHONY: all doc slides watch watch-slides clean clobber

# Por defecto compila ambos documentos.
all: doc slides

doc: $(DOC_PDF)

slides: $(SLIDES_PDF)

$(DOC_PDF): $(DOC_TEX) $(FIGURAS)
	$(LATEXMK) $(DOC_TEX)

$(SLIDES_PDF): $(SLIDES_TEX) $(FIGURAS)
	$(LATEXMK) $(SLIDES_TEX)

# Watch nativo de latexmk (alternativa al script watch.sh).
# watch -> trabajo (retrocompatible con el uso histórico).
watch:
	$(LATEXMK) -pvc $(DOC_TEX)

# watch-slides -> presentación.
watch-slides:
	$(LATEXMK) -pvc $(SLIDES_TEX)

clean:
	latexmk -c $(DOC_TEX)
	latexmk -c $(SLIDES_TEX)
	rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz *.nav *.snm *.vrb

clobber: clean
	rm -f $(DOC_PDF) $(SLIDES_PDF)
