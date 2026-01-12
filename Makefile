PROTOC ?= protoc
PROTO_DIR := proto
GEN_DIR := gen/go
PROTO_FILE := $(PROTO_DIR)/opp/orders/v1/orders.proto

.PHONY: proto clean

proto:
	@mkdir -p $(GEN_DIR)
	$(PROTOC) -I $(PROTO_DIR) $(PROTO_FILE) \
		--go_out=$(GEN_DIR) --go_opt=paths=source_relative \
		--go-grpc_out=$(GEN_DIR) --go-grpc_opt=paths=source_relative

clean:
	rm -rf $(GEN_DIR)
