include ../../common.mk

# Use XeLaTeX; provide shell-escape for the minted package
LATEXMK_OPTS += -xelatex -shell-escape

all: slides.pdf notes.pdf
	cp $< $(OUT_DIR)2021-06-23.pdf || echo "::warning file=$(shell pwd)::Compile failed"

notes.pdf: slides.tex
	$(LATEXMK) -jobname=notes $< || cat notes.log
