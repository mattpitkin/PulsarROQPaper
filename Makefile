FIGFILES=$(wildcard figures/*.pdf)
EPSFILES=$(FIGFILES:.pdf=.eps)

.SUFFIXES: .pdf .eps

default: pdf

convert: $(EPSFILES)

.pdf.eps:
	@echo Converting $< to $@ using pdftops
	@pdftops -eps $< $@

pdf: main.tex main.bib
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main
