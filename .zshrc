# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
PATH=~/local/bin:$PATH

## Default shell configuration
#
setopt transient_rprompt

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
# to end of it)
#
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data
setopt extended_history
function history-all { history -E 1 }

## Completion configuration
#
autoload -Uz compinit
compinit

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'
#typeset -ga chpwd_functions
#autoload -U chpwd_recent_dirs cdr
#chpwd_functions+=chpwd_recent_dirs
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ":chpwd:*" recent-dirs-max 500
zstyle ":chpwd:*" recent-dirs-default true
zstyle ":completion:*" recent-dirs-insert always

alias where="command -v"
# alias j="jobs -l"
alias tmux='env LD_LIBRARY_PATH=$HOME/opt/libevent/lib ~/local/bin/tmux'
alias tm="tmuxx"

case "${OSTYPE}" in
darwin*)
  alias ls="ls -G -w"
  if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
        alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
  fi
  ;;
linux*)
  alias ls="ls --color"
  ;;
freebsd*)
  alias ls="ls -G -w"
  ;;
esac

alias grep='grep --color'
alias rm='rm -i $@'
stty -ixon -ixoff

## terminal configuration
#
unset LSCOLORS
unset LS_COLORS
case "${TERM}" in
kterm*|xterm*|screen*)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

## load user .zshrc configuration file
#
# set prompt
[ -f ~/.dot/.zshrc_prompt ] && source ~/.dot/.zshrc_prompt
[ -f ~/.dot/.zshrc.mine ] && source ~/.dot/.zshrc.mine
[ -f ~/.pythonbrew/etc/bashrc ] && source ~/.pythonbrew/etc/bashrc
[ -f ~/maplecore/zaw/zaw.zsh ] && source ~/maplecore/zaw/zaw.zsh
zstyle ':filter-select' case-insensitive yes
bindkey '^r' zaw-cdr
export MAILCHECK=0
