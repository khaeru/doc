include common.mk

SUBDIRS = 0_demo

all: subdirs

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: subdirs $(SUBDIRS)
