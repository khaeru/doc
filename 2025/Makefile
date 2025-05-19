include ../common.mk

# Use LuaLaTeX for the "emoji" package
LATEXMK_OPTS += -lualatex -shell-escape

all: 03-24_EDITS.pdf 04-24_MESSAGE.pdf 05-19_MCM.pdf
	for f in $^; do \
	  cp $$f "$(OUT_DIR)2025-$$f" || echo "::warning file=$$(shell pwd)/$$f::Compile failed" \
	; done

# Manually invoke epstopdf, which does not appear to work locally/on GHA runners
logo%.pdf:
	epstopdf --outfile=./logo$*-eps-converted-to.pdf $$(kpsewhich logo$*.eps)

clean-latex:
	$(LATEXMK) -c
