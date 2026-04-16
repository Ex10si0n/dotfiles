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
alias ls="eza"
alias cd="z"

# Default Softwares
export EDITOR=nvim

# Local bin for starship
export PATH="$HOME/.local/bin:$PATH"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Node Versions Manager
# export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Starship
zle -N zle-keymap-select 2>/dev/null
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"
