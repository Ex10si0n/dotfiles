# Configurations

## 🛠 Config Philosophy: The Composable Workspace

This repository houses the modular dotfiles and configuration files that power my macOS development environment. The setup is guided by a philosophy of speed, ergonomics, minimalism, and context-awareness.

## 🎯 Core Components & Principles

- **Ghostty as the Terminal Foundation**: [Ghostty](ghostty/config) serves as the primary terminal emulator, configured with native macOS tabs, clean Maple Mono typography, dark aesthetics (`#0c0c0e`), and `macos-option-as-alt` for terminal navigation.

- **Dual-Shell Workflow (Zsh & Fish)**:
  - **[Fish](fish/config.fish)**: An interactive, modern shell configured with Vi mode (`jk` escape binding), fzf keybindings, and fast toolchain integrations.
  - **[Zsh](zsh/.zshrc)**: A robust POSIX shell powered by `znap` for instant startup, featuring syntax highlighting, autosuggestions, autocomplete menu navigation, and cached `fzf` integration.

- **[Starship](starship/starship.toml) for Universal Context**: A unified, cross-shell prompt shared between Zsh and Fish. Features active shell environment indicators (`󰈺 fish`, `zsh`), git status, runtime toolchains, and custom LM Studio model monitoring.

- **[Neovim](nvim/) as a Surgical Editor**: Kept lean and fast for configuration edits, quick code reviews, and high-performance text manipulation without IDE bloat.

- **[Karabiner-Elements](karabiner/karabiner.json) for System-Wide Ergonomics**: Uses the "Alpine Vim" profile to bring seamless modal editing and ergonomics to macOS:
  - `CapsLock` mapped to `Ctrl` (held) with dual-role modifiers.
  - `Ctrl + H/J/K/L` for system-wide Vim directional navigation.
  - `Ctrl + W/B` for word-wise movement (exempted inside terminal emulators).
  - Quick input source switching and window management shortcuts.

## 📦 Installation & Management

Configurations are symlinked using [GNU Stow](https://www.gnu.org/software/stow/) via the provided [Makefile](Makefile):

```bash
# Stow all configurations
make install

# View all active symlinks
make list

# Unstow all configurations
make uninstall
```

