if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
set +m; source <(bash -lic 'declare -px'); set -m
set +m; source <(bash -lic 'declare -px'); set -m
set +m; source <(bash -lic 'declare -px'); set -m
set +m; source <(bash -lic 'declare -px'); set -m
set +m; source <(bash -lic 'declare -px'); set -m
set +m; source <(bash -lic 'declare -px'); set -m
set +m; source <(bash -lic 'declare -px'); set -m
set +m; source <(bash -lic 'declare -px'); set -m
set +m; source <(bash -lic 'declare -px'); set -m


# Changing "ls" to "exa"
alias ls='exa -al --group-directories-first' # my preferred listing
alias la='exa -a --group-directories-first'  # all files and dirs
alias ll='exa -l --group-directories-first'  # long format
alias lt='exa -aT --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'
set +m; source <(bash -lic 'declare -px'); set -m
set +m; source <(bash -lic 'declare -px'); set -m
