# Include the common settings
include common.mk

# Subdirectories containing documents to compile
SUBDIRS = 0_demo \
	2020/09-10

# Default target: all subdirectories
all: subdirs

# Recurse by calling make in each subdirectory
subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@


.PHONY: subdirs $(SUBDIRS)
