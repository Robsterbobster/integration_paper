INKSCAPE=inkscape
SECTIONS:=$(wildcard sections/*.tex)
SVG:=$(wildcard *.svg)

.PHONY: clean

%.pdf_tex: %.svg
	"$(INKSCAPE)" $< --export-type=pdf --export-latex --export-area-drawing

main.pdf: main.tex $(SECTIONS) bibliography.bib $(SVG:%.svg=%.pdf_tex)
	latexmk -pdf main.tex

clean:
	latexmk -c
