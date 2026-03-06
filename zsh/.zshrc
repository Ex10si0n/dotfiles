# Vim Mode Configurations
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey "^R" history-incremental-search-backward
bindkey "^?" backward-delete-char
export KEYTIMEOUT=20

# Plugin Manager
[[ -r ~/.zshplugins/znap/znap.zsh ]] || git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git ~/.zshplugins/znap
source ~/.zshplugins/znap/znap.zsh

# Plugins
znap source zdharma-continuum/fast-syntax-highlighting
znap source zsh-users/zsh-autosuggestions
znap source marlonrichert/zsh-autocomplete

# General Aliases
alias g="git"
alias py="python3"
alias vim="nvim"
alias m="make"

# Aliases for other OS
if uname -a | grep -q Ubuntu; then
    alias open="nautilus"
fi

# Default Softwares
export EDITOR=nvim

# Local bin for starship
export PATH="$HOME/.local/bin:$PATH"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Path for npm
export PATH="$(npm prefix -g)/bin:$PATH"

# Starship
zle -N zle-keymap-select 2>/dev/null
zle -D zle-keymap-select 2>/dev/null
eval "$(starship init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
