
mds := $(wildcard *.md)

all: $(mds)

%.html: %.md template.html template.css
	pandoc -f markdown --template template.html --css template.css --toc --toc-depth=2 $< -o $@
