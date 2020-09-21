include ../../common.mk

all: slides.pdf


# Required for the minted package
LATEXMK_OPTS = -shell-escape

# Use XeLaTeX
%.pdf: %.tex FORCE_LATEXMK
	$(XELATEXMK) $<
