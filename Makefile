# Путь до директории с proto файлами
PROTO_DIR=proto
PROTO_AUTH_FILE=$(PROTO_DIR)/auth/auth.proto
PROTO_SELLER_FILE=$(PROTO_DIR)/seller/seller.proto
PROTO_CUSTOMER_FILE=$(PROTO_DIR)/customer/customer.proto

# Путь до директории, куда будут генерироваться Go файлы
GEN_DIR=gen/go
GEN_SELLER_DIR=$(GEN_DIR)/seller
GEN_CUSTOMER_DIR=$(GEN_DIR)/customer

# Команда для очистки сгенерированных файлов
clean:
	rm -rf $(GEN_DIR)

# Команда для генерации Go файлов из proto
gen: clean
	mkdir -p $(GEN_DIR)
	mkdir -p $(GEN_SELLER_DIR)
	mkdir -p $(GEN_CUSTOMER_DIR)

	protoc -I=$(PROTO_DIR) $(PROTO_AUTH_FILE) \
		--go_out=$(GEN_DIR) --go_opt=paths=source_relative \
		--go-grpc_out=$(GEN_DIR) --go-grpc_opt=paths=source_relative

	protoc -I=$(PROTO_DIR) $(PROTO_SELLER_FILE) \
		--go_out=$(GEN_SELLER_DIR) --go_opt=paths=source_relative \
		--go-grpc_out=$(GEN_SELLER_DIR) --go-grpc_opt=paths=source_relative

	protoc -I=$(PROTO_DIR) $(PROTO_CUSTOMER_FILE) \
		--go_out=$(GEN_CUSTOMER_DIR) --go_opt=paths=source_relative \
		--go-grpc_out=$(GEN_CUSTOMER_DIR) --go-grpc_opt=paths=source_relative
