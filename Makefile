include common.mk

SUBDIRS = 0_demo \
	2020/09-10

all: subdirs

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: subdirs $(SUBDIRS)
