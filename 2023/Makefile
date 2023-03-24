include ../common.mk

# Use XeLaTeX; provide shell-escape for the minted package
LATEXMK_OPTS += -xelatex -shell-escape

all: 03-22_Openmod.pdf 03-27_CCG.pdf
	for f in $^; do \
	  cp $$f "$(OUT_DIR)2023-$$f" || echo "::warning file=$$(shell pwd)/$$f::Compile failed" \
	; done
