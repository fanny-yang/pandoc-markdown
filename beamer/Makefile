
lecmds := $(wildcard *.md)
mds_slides := $(patsubst lec%.md,lec%-slides.pdf, $(done_lecs))
mds_handouts := $(patsubst lec%.md,lec%-handout.pdf, $(done_lecs))


all: $(mds_handouts) $(mds_slides)


%-slides.pdf: %.md header_beamer.tex macros.sty bib.bib pan.lua
	pandoc -t beamer -H header_beamer.tex --lua-filter pan.lua --filter ../pandoc/all_pandoc_amsmath.py --filter pandoc-crossref --filter pandoc-citeproc $< -o $@
%-slides-hd.pdf: %.md header_beamer.tex macros.sty bib.bib pan.lua
	pandoc -t beamer -H header_beamer.tex --lua-filter pan.lua --filter ../pandoc/all_pandoc_amsmath.py --filter pandoc-crossref --filter pandoc-citeproc -V handout $< -o $@

%-handout.pdf: %-slides-hd.pdf
	pdfjam --nup 1x2 --frame true --quiet $< --outfile $@
