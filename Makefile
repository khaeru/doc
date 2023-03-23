# Include the common settings
include common.mk

# Subdirectories containing documents to compile
SUBDIRS = 0_demo \
	2020/09-10 \
	2021 \
	"2021/06-23\ ISSST"

# Default target: all subdirectories
all: subdirs

# Recurse by calling make in each subdirectory
subdirs: $(SUBDIRS)

$(SUBDIRS): $(OUT_DIR)
	$(MAKE) -C $@

# Create the output directory
$(OUT_DIR):
	mkdir -p $@

.PHONY: subdirs $(SUBDIRS)
