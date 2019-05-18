.PHONY: all

all: eg.pdf README.md eg.html clean

eg.pdf: eg.tex ref.bib
	xelatex eg.tex
	biber eg
	xelatex eg.tex
	xelatex eg.tex

README.md: eg.tex ref.bib
	pandoc -o README.md eg.tex

eg.html: eg.tex ref.bib
	pandoc -s -o eg.html eg.tex

.PHONY: clean fullClean

clean:
	rm -f eg.{aux,bbl,bcf,blg,log,run.xml,toc}

fullClean: clean
	rm -f eg.pdf
