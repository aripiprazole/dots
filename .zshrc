ZSH_THEME="robbyrussell"

ZSH_AUTOSUGGEST_STRATEGY=history
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#616161"

plugins=(git zsh-autosuggestions)

# User configuration
export ZSH="$HOME/.oh-my-zsh"

export LANG=en_US.UTF-8

export TERM='xterm'

export EDITOR='nvim'

# ASDF completion configuration
if [[ -f ${ASDF_DIR} ]] then
  fpath=(${ASDF_DIR}/completions $fpath)
fi

# ZSH Config
if [[ -f "$HOME/.config.zsh" ]]; then
  source "$HOME/.config.zsh"
fi

source $ZSH/oh-my-zsh.sh

source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# initialise completions with ZSH's compinit
autoload -Uz compinit

compinit
