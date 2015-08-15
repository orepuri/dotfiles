function zman() {
  PAGER="less -g -s '+/^ {7}"$1"'" man zshall
}

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

autoload -Uz compinit
compinit

bindkey -e

PROMPT="[%n@%m] %~ %# " 

setopt IGNORE_EOF
setopt NO_FLOW_CONTROL
setopt NO_BEEP

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# history
setopt SHARE_HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey '^o' history-beginning-search-back-end

# alias
alias excel="open -a 'Microsoft Excel'"

# utils
alias backuprm="find . \( -name '*#' -o -name '*~' \) -exec rm {} \;"
alias dos2unix="perl -pi -e 's/\r\n|\n|\r/\n/g'"
alias unix2dos="perl -pi -e 's/\n/\r\n/g'"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
