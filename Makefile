DOTFILES_DIR := $(shell pwd)
CONFIG_TARGET := $(HOME)/.config
OS := $(shell uname)

# nvim and ghostty work on macOS and Linux
CONFIG_APPS := nvim ghostty

# keyd is Linux-only (kernel-level key remapping daemon)
KEYD_CONF_SRC := $(DOTFILES_DIR)/keyd/default.conf
KEYD_CONF_DST := /etc/keyd/default.conf

.PHONY: all help install uninstall list install-keyd uninstall-keyd install-zsh uninstall-zsh

all: install ## Link all configs

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Stow configs into ~/.config/<app> (keyd on Linux only)
	@for app in $(CONFIG_APPS); do \
		mkdir -p $(CONFIG_TARGET)/$$app; \
		stow -v -R -d $(DOTFILES_DIR) -t $(CONFIG_TARGET)/$$app $$app; \
	done
	@$(MAKE) install-zsh
ifeq ($(OS),Linux)
	@$(MAKE) install-keyd
endif

uninstall: ## Unstow all configs
	@for app in $(CONFIG_APPS); do \
		stow -v -D -d $(DOTFILES_DIR) -t $(CONFIG_TARGET)/$$app $$app; \
	done
	@$(MAKE) uninstall-zsh
ifeq ($(OS),Linux)
	@$(MAKE) uninstall-keyd
endif

install-keyd: ## (Linux only) Install keyd config to /etc/keyd/default.conf
	@echo "Installing keyd config to $(KEYD_CONF_DST) ..."
	@sudo mkdir -p /etc/keyd
	@sudo ln -sf $(KEYD_CONF_SRC) $(KEYD_CONF_DST)
	@echo "Reloading keyd ..."
	@sudo systemctl reload keyd 2>/dev/null || sudo systemctl restart keyd 2>/dev/null || true

uninstall-keyd: ## (Linux only) Remove keyd config symlink from /etc/keyd/default.conf
	@if [ -L $(KEYD_CONF_DST) ]; then \
		sudo rm -f $(KEYD_CONF_DST); \
		echo "Removed $(KEYD_CONF_DST)"; \
	fi

install-zsh: ## Stow zsh dotfiles into $HOME
	@for f in $(shell cd $(DOTFILES_DIR)/zsh && find . -type f | sed 's|^\./||'); do \
		target=$(HOME)/$$f; \
		if [ -e "$$target" ] && [ ! -L "$$target" ]; then \
			echo "Backing up $$target -> $$target.bak"; \
			mv "$$target" "$$target.bak"; \
		fi; \
	done
	@stow -v -R -d $(DOTFILES_DIR) -t $(HOME) zsh

uninstall-zsh: ## Unstow zsh dotfiles from $HOME
	@stow -v -D -d $(DOTFILES_DIR) -t $(HOME) zsh

list: ## List symlinks managed by this repo
	@find $(CONFIG_TARGET) -maxdepth 3 -type l -ls | grep $(DOTFILES_DIR)
