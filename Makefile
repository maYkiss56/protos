# Путь до директории с proto файлами
PROTO_DIR=proto
PROTO_FILE=$(PROTO_DIR)/auth/auth.proto

# Путь до директории, куда будут генерироваться Go файлы
GEN_DIR=gen/go

# Команда для очистки сгенерированных файлов
clean:
	rm -rf $(GEN_DIR)

# Команда для генерации Go файлов из proto
gen: clean
	mkdir -p $(GEN_DIR)
	protoc -I=$(PROTO_DIR) $(PROTO_FILE) \
		--go_out=$(GEN_DIR) --go_opt=paths=source_relative \
		--go-grpc_out=$(GEN_DIR) --go-grpc_opt=paths=source_relative