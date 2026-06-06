# Build del volume LaTeX
MAIN = main
PDF  = $(MAIN).pdf

.PHONY: all clean distclean

all: $(PDF)

$(PDF): $(MAIN).tex stile.sty bibliografia.bib $(wildcard capitoli/*.tex) \
        $(wildcard appendici/*.tex) glossario.tex
	latexmk -pdf -interaction=nonstopmode -halt-on-error $(MAIN).tex

clean:
	latexmk -c
	rm -f *.bbl *.run.xml

distclean: clean
	rm -f $(PDF)
