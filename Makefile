SERVICE ?= wallet
DB_URL  ?= postgres://payments:payments@localhost:5432/$(SERVICE)?sslmode=disable
MIGRATE := migrate -path db/$(SERVICE)/migrations -database "$(DB_URL)"

.PHONY: help migrate-up migrate-down migrate-version migrate-new

help:
	@echo "Available targets:"
	@echo "  migrate-up       Apply migrations"
	@echo "  migrate-down     Roll back one migration"
	@echo "  migrate-version  Show migration version"
	@echo "  migrate-new      Create a new migration (name=...)"

migrate-up:
	@$(MIGRATE) up

migrate-down:
	@$(MIGRATE) down 1

migrate-version:
	@$(MIGRATE) version

migrate-new:
	@test -n "$(name)" || (echo "usage: make migrate-new name=add_something" && exit 1)
	migrate create -ext sql -dir db/$(SERVICE)/migrations -seq $(name)
