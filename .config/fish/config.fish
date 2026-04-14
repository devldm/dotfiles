# ---------------------------------------------------------------------------
# PATH
# ---------------------------------------------------------------------------

# Core
fish_add_path $HOME/.local/bin

# Go
fish_add_path /usr/local/go/bin
fish_add_path $HOME/go/bin

# Node (fnm)
fish_add_path $HOME/.local/share/fnm

# Deno
fish_add_path $HOME/.deno/bin

# Nvim appimage
fish_add_path /opt/nvim

# Arkade
fish_add_path $HOME/.arkade/bin

# Opencode
fish_add_path $HOME/.opencode/bin

# Rancher Desktop
fish_add_path $HOME/.rd/bin

fish_add_path $HOME/.config/emacs/bin

# Flatpak
fish_add_path /var/lib/flatpak/exports/bin
fish_add_path $HOME/.local/share/flatpak/exports/bin

# Homebrew
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# ---------------------------------------------------------------------------
# Environment
# ---------------------------------------------------------------------------

set -gx ANDROID_HOME $HOME/Android/Sdk
fish_add_path $ANDROID_HOME
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml
set -gx XDG_DATA_DIRS $XDG_DATA_DIRS $HOME/.local/share/flatpak/exports/share

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------

alias ls="eza --icons=always"
alias ll="eza -alh --icons=always"
alias tree="eza --tree --icons=always"
alias cat="bat"
alias v="nvim"
alias e="emacs -nw"
alias lg="lazygit"
alias ld="lazydocker"
alias k="kubectl"

# Navigation
alias cd="z"

# Package management
alias sdi="sudo dnf install"
alias sduu="sudo dnf update && sudo dnf upgrade"

# ---------------------------------------------------------------------------
# Integrations
# ---------------------------------------------------------------------------

# Starship prompt
starship init fish | source

# Zoxide (smart cd)
zoxide init fish | source

# fnm (Node version manager)
fnm env | source

# direnv
direnv hook fish | source

# mise
mise activate fish | source

# ---------------------------------------------------------------------------
# Tmux auto-attach (when opening a terminal outside tmux)
# ---------------------------------------------------------------------------

if status is-interactive
    if test -z "$TMUX" && string match -q -r 'foot|xterm-ghostty' $TERM
        tmux attach; or exec tmux new-session
    end
end
