DOTFILES_DIR := $(shell pwd)
CONFIG_TARGET := $(HOME)/.config

CONFIG_APPS := nvim ghostty

.PHONY: all help install uninstall list install-zsh uninstall-zsh install-starship uninstall-starship

all: install ## Link all configs

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Stow configs into ~/.config/<app>
	@for app in $(CONFIG_APPS); do \
		mkdir -p $(CONFIG_TARGET)/$$app; \
		stow -v -R -d $(DOTFILES_DIR) -t $(CONFIG_TARGET)/$$app $$app; \
	done
	@$(MAKE) install-zsh
	@$(MAKE) install-starship

uninstall: ## Unstow all configs
	@for app in $(CONFIG_APPS); do \
		stow -v -D -d $(DOTFILES_DIR) -t $(CONFIG_TARGET)/$$app $$app; \
	done
	@$(MAKE) uninstall-zsh
	@$(MAKE) uninstall-starship

install-starship: ## Stow starship.toml into ~/.config/starship
	@mkdir -p $(CONFIG_TARGET)/starship
	@stow -v -R -d $(DOTFILES_DIR) -t $(CONFIG_TARGET)/starship starship

uninstall-starship: ## Unstow starship.toml from ~/.config/starship
	@stow -v -D -d $(DOTFILES_DIR) -t $(CONFIG_TARGET)/starship starship

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
