# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# download zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# aliases
alias grep='grep --color=auto'

alias ff='fastfetch -l small'

alias ls='eza --icons -F -H --git'
alias lsa='eza -alF --icons -F -H --git'

alias c='clear'
alias v='nvim'
alias sv='sudo nvim'

alias .='cd'
alias ..='cd ..'
alias pic='cd ~/Pictures/'
alias dl='cd ~/Downloads/'
alias dot='cd ~/.dotfiles/'
alias hdd='cd /mnt/HDD/'
alias repo='cd /mnt/HDD/Code/personal/github/'

alias gstat='git status'
alias gadd='git add'
alias grestore='git restore --staged'
alias gcom='git commit -m'
alias gpull='git pull'
alias gpullo='git pull origin'
alias gfetch='git fetch'
alias gfetcho='git fetch origin'
alias gpush='git push'
alias gpusho='git push origin'
alias gcheck='git checkout'
alias gmerge='git merge'
alias guser='git config user.name'
alias gemail='git config user.email'
alias guserg='git config --global user.name'
alias gemailg='git config --global user.email'

alias nixreb='sudo nixos-rebuild switch --flake .'
alias flakeup='nix flake update'
alias homereb='home-manager switch --flake .'
alias nixlist='nixos-rebuild list-generations'
alias nixgarbage='nix-collect-garbage'
alias homelist='home-manager generations'
alias homegarbage='home-manager remove-generations'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt notify
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# vim keybindings
bindkey -v
export KEYTIMEOUT=1
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
bindkey '^l' autosuggest-accept

# fix backspace bug when switching modes
bindkey '^?' backward-delete-char

# color scheme for eza
export LS_COLORS="$(vivid generate catppuccin-macchiato)"

zstyle :compinstall filename '/home/roed/.zshrc'

autoload -Uz compinit
compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
