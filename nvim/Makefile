.PHONY: all deps tree-sitter

all: deps

deps: tree-sitter

tree-sitter:
	@if command -v tree-sitter >/dev/null 2>&1; then \
		echo "tree-sitter already installed: $$(tree-sitter --version)"; \
	elif command -v npm >/dev/null 2>&1; then \
		echo "Installing tree-sitter CLI via npm..."; \
		npm install -g tree-sitter-cli; \
	elif command -v cargo >/dev/null 2>&1; then \
		echo "Installing tree-sitter CLI via cargo..."; \
		cargo install tree-sitter-cli; \
	else \
		echo "Error: neither npm nor cargo found."; \
		echo "Install tree-sitter CLI manually: https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md"; \
		exit 1; \
	fi
