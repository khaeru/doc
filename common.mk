# contains trailing slash
ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

# Commands for LaTeX
export LATEXMK_OPTS =

# Using latexmk
export LATEXMK ?= latexmk -r $(ROOT)/latexmkrc $(LATEXMK_OPTS)

# XeLaTeX, e.g. for presentations using the metropolis theme
export XELATEXMK ?= $(LATEXMK) -xelatex

export TEXINPUTS := $(TEXINPUTS):$(ROOT)/image:

# Compile PDF from .fodt using LibreOffice
%.pdf: %.fodt
	soffice --headless --convert-to pdf --outdir $(dir $@) $<

# Compile PDF from SVG using Inkscape
%.pdf: %.svg
	inkscape $< --export-pdf=$@

# Default rule for LaTeX files
%.pdf: %.tex FORCE_LATEXMK
	$(LATEXMK) $< || cat $(addsuffix .log,$(basename $<))

.PHONY: FORCE_LATEXMK
