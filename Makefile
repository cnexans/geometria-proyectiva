# Makefile para compilar el trabajo de Geometría Proyectiva
# Uso:
#   make          -> compila el PDF
#   make watch    -> recompila al guardar (latexmk -pvc)
#   make clean    -> borra archivos auxiliares
#   make clobber  -> borra auxiliares + PDF

TEX  := Trabajo_Geometria_Proyectiva_Unificado.tex
PDF  := $(TEX:.tex=.pdf)

# -pdf: salida PDF | -interaction: no parar en errores | -file-line-error: errores legibles
LATEXMK := latexmk -pdf -interaction=nonstopmode -file-line-error -halt-on-error

.PHONY: all watch clean clobber

all: $(PDF)

$(PDF): $(TEX) $(wildcard figuras/*)
	$(LATEXMK) $(TEX)

# Watch nativo de latexmk (alternativa al script watch.sh)
watch:
	$(LATEXMK) -pvc $(TEX)

clean:
	latexmk -c $(TEX)
	rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz

clobber: clean
	rm -f $(PDF)
