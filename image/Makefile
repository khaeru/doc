include ../common.mk

# PDF images to be generated from SVG; rule is in common.mk
IMAGES = data-stages.pdf

all: convert curl ignore

convert: $(IMAGES)

# Download files listed in images.bib
curl:
	bib --path . --database images.bib curl | curl -K -

# Generate .gitignore including images.bib and converted PDFs
ignore:
	bib --path . --database images.bib list --sort localfile | tee .gitignore
	echo "$(IMAGES)" | tr " " "\n" | tee -a .gitignore

.PHONY: convert curl ignore
