# Disable fish welcome message
set -g fish_greeting ""

# Homebrew environment (Apple Silicon)
if test -d /opt/homebrew
    /opt/homebrew/bin/brew shellenv | source
end

# Default Software
set -gx EDITOR nvim
set -gx VISUAL nvim

# Starship Prompt Config
set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"

# fzf Configuration
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git --exclude Library --exclude Documents . /Users/ex10si0n /Volumes/Code'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# Path Additions
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.lmstudio/bin

# OrbStack Integration
if test -f $HOME/.orbstack/shell/init2.fish
    source $HOME/.orbstack/shell/init2.fish 2>/dev/null; or true
end

# Node / NVM Integration
set -gx NVM_DIR "$HOME/.nvm"
if test -d "$NVM_DIR/versions/node"
    set -l latest_node (path sort -r $NVM_DIR/versions/node/* 2>/dev/null | head -n 1)
    if test -d "$latest_node/bin"
        fish_add_path "$latest_node/bin"
    end
end

# Interactive Session Configurations
if status is-interactive
    # General Aliases
    alias g="git"
    alias py="python3"
    alias vim="nvim"
    alias m="make"
    alias ls="eza"
    alias cd="z"

    # fzf Key Bindings
    if type -q fzf
        fzf --fish | source
    end

    # Vi Mode Configurations
    set -g fish_escape_delay_ms 200

    function fish_user_key_bindings
        # Default vi key bindings
        fish_vi_key_bindings
        # Map 'jk' in insert mode to switch to normal mode (like vi-cmd-mode in zsh)
        bind -M insert -m default jk backward-char force-repaint
        # Include fzf bindings if available
        if type -q fzf_key_bindings
            fzf_key_bindings
        end
    end

    set -g fish_key_bindings fish_user_key_bindings
    fish_user_key_bindings

    # Starship Prompt
    if type -q starship
        starship init fish | source
    end

    # Zoxide
    if type -q zoxide
        zoxide init fish | source
    end
end
