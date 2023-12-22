.PHONY: help
.DEFAULT_GOAL := help

.PHONY: run
run: ## run app
	@cargo run

.PHONY: fmt
fmt: ## format code
	@cargo fmt

.PHONY: bash
bash: ## attach to running container
	@docker exec -it --user=vscode rust_playground bash

help: ## show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
