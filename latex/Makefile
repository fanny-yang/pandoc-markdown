texs := $(wildcard *.tex)
tex_pdfs := $(patsubst %.tex,%.pdf, $(texs))
mds := $(wildcard *.md)
mds_pdfs := $(patsubst lec%.md,lec%.pdf, $(lecmds))

all: $(mds)

%.pdf: %.md macros.sty bib.bib
	pandoc -f markdown -F ../pandoc/all_pandoc_amsmath.py -F pandoc-crossref --filter pandoc-citeproc  $< -o $@
