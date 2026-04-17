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
znap source zsh-users/zsh-syntax-highlighting
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

# fzf Key Bindings
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude Library --exclude Documents . /Users/ex10si0n /Volumes/Code'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Local bin for Starship
export PATH="$HOME/.local/bin:$PATH"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Node Versions Manager
# export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Starship
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ex10si0n/.lmstudio/bin"
# End of LM Studio CLI section


. "$HOME/.local/share/../bin/env"
