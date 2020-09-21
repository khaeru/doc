# Root path of the repo, with trailing slash
ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

# Add image and subdirectories to TEXINPUTS from environment
export TEXINPUTS := $(TEXINPUTS):$(ROOT)/image//:

# Options for latexmk. Use:
# -xelatex — e.g. for presentations using the metropolis theme.
# -shell-escape — e.g. for the minted package or others which run external
#                 programs during compilation.
LATEXMK_OPTS =

# Compile PDF from .tex using latexmk
# FORCE_LATEXMK is a phony target, always required, so that latexmk is always
# run; it (and not make) chooses whether to recompile the source file(s)
LATEXMK = latexmk -r $(ROOT)/latexmkrc $(LATEXMK_OPTS)
%.pdf: %.tex FORCE_LATEXMK
	$(LATEXMK) $< || cat $(addsuffix .log,$(basename $<))

# Compile PDF from ODT using LibreOffice
%.pdf: %.fodt
	soffice --headless --convert-to pdf --outdir $(dir $@) $<

# Compile PDF from SVG using Inkscape
%.pdf: %.svg
	inkscape $< --export-pdf=$@


.PHONY: FORCE_LATEXMK
