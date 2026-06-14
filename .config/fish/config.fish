# ---------------------------------------------------------------------------
# PATH
# ---------------------------------------------------------------------------

# Core
fish_add_path $HOME/.local/bin

# Go
fish_add_path /usr/local/go/bin
fish_add_path $HOME/go/bin

# Deno
fish_add_path $HOME/.deno/bin

# Nvim appimage
fish_add_path /opt/nvim

# Opencode
fish_add_path $HOME/.opencode/bin

fish_add_path $HOME/.config/emacs/bin

# Flatpak
fish_add_path /var/lib/flatpak/exports/bin
fish_add_path $HOME/.local/share/flatpak/exports/bin

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------

alias ls="eza --color=auto --icons=auto --group-directories-first"
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

# ---------------------------------------------------------------------------
# Tmux auto-attach (when opening a terminal outside tmux)
# ---------------------------------------------------------------------------

if status is-interactive
    if test -z "$TMUX" && string match -q -r 'foot|xterm-ghostty' $TERM
        tmux attach; or exec tmux new-session
    end
end
