VERSION = $(shell jq -r .version < Train_Autoconfigure/info.json)
DISTFILE_NAME = Train_Autoconfigure-$(VERSION)
DISTFILE = $(DISTFILE_NAME).zip

.PHONY: all
all: $(DISTFILE)

$(DISTFILE): $(wildcard Train_Autoconfigure/*)
	rm -rf dist/$(DISTFILE_NAME)                     && \
	mkdir -p dist/$(DISTFILE_NAME)                   && \
	cd dist/                                         && \
	rsync -a ../Train_Autoconfigure $(DISTFILE_NAME) && \
	zip -r $(DISTFILE) $(DISTFILE_NAME)              && \
	mv -v $(DISTFILE) ..                             ;
