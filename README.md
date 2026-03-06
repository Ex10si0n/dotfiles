# Configurations

## 🛠 Config Philosophy: The Composable Workspace

This directory houses the configuration files that power my development environment. The setup is guided by a philosophy of modularity, speed, and context-awareness.

## 🎯 Core Principles

- **Neovim as a Surgical Tool**: Neovim is used for configuration modification, debugging, and rapid code edits. It is not a bloated IDE. It is kept lean to ensure near-instant startup times and high-performance text manipulation.

- **Tmux as the Environment Engine**: While Neovim handles the files, Tmux handles the workspace. I use Tmux for session management, window multiplexing, and creating a persistent "IDE-like" experience that survives shell restarts.

- **The Ergonomic Shell (Zsh + Fish Spirit)**: I use Zsh for its robust POSIX compliance and ecosystem, but I configure it to "embrace the fish"—incorporating ultra-responsive autosuggestions, syntax highlighting, and substring searching.

- **Starship for Universal Context**: Starship serves as the global prompt style. It provides a consistent, minimal, and fast visual state across any shell or environment, ensuring I always know my git branch, runtime versions, and command exit codes at a glance.
