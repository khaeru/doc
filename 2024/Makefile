include ../common.mk

# - Use LuaLaTeX for emoji package.
# - Provide shell-escape for the minted package.
LATEXMK_OPTS += -lualatex -shell-escape

all: 02-14_TIGER.pdf
	for f in $^; do \
	  cp $$f "$(OUT_DIR)2023-$$f" || echo "::warning file=$$(shell pwd)/$$f::Compile failed" \
	; done
