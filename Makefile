# Include the common settings
include common.mk

# Subdirectories containing documents to compile
SUBDIRS = 0_demo \
	2020/09-10 \
	2021

# Default target: all subdirectories
all: output-dir subdirs

# Create the output directory
output-dir:
	mkdir -p $(OUT_DIR)

# Recurse by calling make in each subdirectory
subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@


.PHONY: output-dir subdirs $(SUBDIRS)
