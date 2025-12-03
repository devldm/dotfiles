# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/usr/local/go/bin
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export PATH=$PATH:$STARSHIP_CONFIG
export PATH="$HOME/.local/bin":$PATH
export ANDROID_HOME="$HOME/Android/Sdk/"
export PATH="$PATH:$ANDROID_HOME"

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# User configuration

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Alias
alias zshconfig="nvim ~/.zshrc"
alias lg="lazygit"
alias ls="exa"
alias ll="exa -alh"
alias tree="exa --tree"
alias cat="bat"
alias v="nvim"
alias nvc="nordvpn connect"
alias nvd="nordvpn disconnect"
alias cd="z"
alias sdi="sudo dnf install"
alias sduu="sudo dnf update && sudo dnf upgrade"

if [ -z "$TMUX" ] && [ "$TERM" = "xterm-ghostty" ]; then
  tmux attach || exec tmux new-session && exit;
fi

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"

# Shell integrations
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
# nvim app image
export PATH="$PATH:/opt/nvim/"
export PATH=$PATH:$(go env GOPATH)/bin
export XDG_DATA_DIRS=$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share

export PATH="$HOME/.local/bin:$PATH"

# add Flatpak apps to PATH
if [ -d "/var/lib/flatpak/exports/bin" ]; then
    PATH="/var/lib/flatpak/exports/bin:$PATH"
fi

if [ -d "$HOME/.local/share/flatpak/exports/bin" ]; then
     PATH="$HOME/.local/share/flatpak/exports/bin:$PATH"
fi

export PATH

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
