# Include the common settings
include ../common.mk

# Use XeLaTeX; provide shell-escape for the minted package
LATEXMK_OPTS += -xelatex

# State the target document; default rule in common.mk compiles this from
# main.tex.
all: main.pdf
	cp $< $(OUT_DIR)demo.pdf
