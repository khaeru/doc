include ../common.mk

# Use LuaLaTeX for the "emoji" package
LATEXMK_OPTS += -lualatex -shell-escape

all: 02-14_TIGER.pdf 05-29_MCM.pdf 06-11.pdf 06-12.pdf 07-17_UN_ESCAP.pdf 07-23_IIASA.pdf 09-18_iTEM.pdf 09-18_iTEM-TDCI.pdf 09-20_TDCI.pdf 10-10_EDITS.pdf 12-08_DM.pdf
	for f in $^; do \
	  cp $$f "$(OUT_DIR)2024-$$f" || echo "::warning file=$$(shell pwd)/$$f::Compile failed" \
	; done

02-14_TIGER.pdf: logo-short_white.pdf logo_white.pdf

# Manually invoke epstopdf, which does not appear to work locally/on GHA runners
logo%.pdf:
	epstopdf --outfile=./logo$*-eps-converted-to.pdf $$(kpsewhich logo$*.eps)

clean-latex:
	$(LATEXMK) -c
