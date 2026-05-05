.PHONY: help dev dev-go dev-node dev-fe build build-go build-fe install install-node install-fe lint lint-go lint-node lint-fe format

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "  dev          Run all services concurrently"
	@echo "  dev-go       Run Go backend on :8080  (Swagger: http://localhost:8080/swagger)"
	@echo "  dev-node     Run Node backend on :3000 (Swagger: http://localhost:3000/swagger)"
	@echo "  dev-fe       Run React frontend on :5173"
	@echo ""
	@echo "  build        Build all"
	@echo "  build-go     Compile Go binary"
	@echo "  build-fe     Build React for production"
	@echo ""
	@echo "  install      Install all dependencies"
	@echo "  install-node Install node_be dependencies"
	@echo "  install-fe   Install react_fe dependencies"
	@echo ""
	@echo "  lint         Lint all"
	@echo "  lint-go      Run golangci-lint"
	@echo "  lint-node    Run ESLint on node_be"
	@echo "  lint-fe      Run ESLint on react_fe"
	@echo "  format       Prettier format all JS/JSON/MD files"

dev:
	@$(MAKE) dev-go & $(MAKE) dev-node & $(MAKE) dev-fe & wait

dev-go:
	cd go_be && go run main.go

dev-node:
	cd node_be && node index.js

dev-fe:
	cd react_fe && npm run dev

build: build-go build-fe

build-go:
	cd go_be && go build -o go_be .

build-fe:
	cd react_fe && npm run build

install: install-node install-fe
	npm install

install-node:
	cd node_be && npm install

install-fe:
	cd react_fe && npm install

lint: lint-go lint-node lint-fe

lint-go:
	cd go_be && golangci-lint run

lint-node:
	cd node_be && npm run lint

lint-fe:
	cd react_fe && npm run lint

format:
	npm run format
