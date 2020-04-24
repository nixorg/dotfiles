# ZSH
export ZSH="/Users/nixorg/.oh-my-zsh"
ZSH_CUSTOM=$HOME/.zsh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

plugins=(
    git
    gitfast
    autojump
    fzf
    fasd
    autoenv
    ant
    zsh-autopair
    zsh-autosuggestions
    globalias
)

source $ZSH/oh-my-zsh.sh

# export
export EDITOR="nvim"
export LANG=en_US.UTF-8
export BAT_THEME="solarized"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'

# Bind keys
bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word
bindkey '[E' beginning-of-line
bindkey '[F' end-of-line

# aliases
alias vim='nvim'
alias v='f -e nvim'
alias l='clear && colorls -1 --sd'
alias c='clear'
alias ll='clear && colorls -a --sd'
alias ld='colorls -1 -d'
alias lf='colorls -1 -f --sd'

alias -g gs='git status'
alias -g gl='git log'

alias -g C='| wc -l'
alias -g G='| grep'
alias -g L='| less'
alias -g F='| zf'
alias -g Y='| pbcopy'
alias -g P='| pbpaste'
alias -g JSON='| python -m json.tool'
alias -g M='| m .'

alias j='fasd_cd -d'
# alias e="emacsclient -c -n"
alias e="open -a /Applications/Emacs.app"

# git aliases for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# vagrant alias
alias vup='vagrant up'
alias vs='vagrant suspend'
alias vd='vagrant destroy'
alias vssh='vagrant ssh'

alias release='mvn -DautoVersionSubmodules=true release:clean release:prepare'


# functions
function m() {
    local args="$@"
    marta $args
}

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi
