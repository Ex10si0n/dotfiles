DOTFILES_DIR := $(shell pwd)
CONFIG_TARGET := $(HOME)/.config

# Add entries here to manage more configs (e.g., tmux zsh)
CONFIG_APPS := nvim ghostty

.PHONY: all help install uninstall list

all: install ## Link all configs

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Stow configs into ~/.config/<app>
	@for app in $(CONFIG_APPS); do \
		mkdir -p $(CONFIG_TARGET)/$$app; \
		stow -v -R -d $(DOTFILES_DIR) -t $(CONFIG_TARGET)/$$app $$app; \
	done

uninstall: ## Unstow all configs
	@for app in $(CONFIG_APPS); do \
		stow -v -D -d $(DOTFILES_DIR) -t $(CONFIG_TARGET)/$$app $$app; \
	done

list: ## List symlinks managed by this repo
	@find $(CONFIG_TARGET) -maxdepth 3 -type l -ls | grep $(DOTFILES_DIR)
