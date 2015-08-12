if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export EDITOR='vim'
export VISUAL='vim'

setopt EXTENDED_GLOB
setopt NO_CASE_GLOB
setopt NO_CLOBBER
setopt NO_FLOW_CONTROL
setopt NUMERIC_GLOB_SORT
setopt RM_STAR_WAIT

alias tmux='tmux -2'
alias fixtime='sudo hwclock --hctosys'


