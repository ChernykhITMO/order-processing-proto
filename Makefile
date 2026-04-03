GOPATH ?= $(shell go env GOPATH)
EASYP ?= $(or $(shell command -v easyp 2>/dev/null),$(GOPATH)/bin/easyp)
GEN_DIR := gen/go

.PHONY: proto proto-deps clean

proto: proto-deps
	rm -rf $(GEN_DIR)
	@mkdir -p $(GEN_DIR)
	$(EASYP) generate

proto-deps:
	$(EASYP) mod download

clean:
	rm -rf $(GEN_DIR)
