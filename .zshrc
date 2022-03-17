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
. $HOME/.asdf/asdf.sh

if [[ -f ${ASDF_DIR} ]] then
  # Append completions to fpath
  fpath=(${ASDF_DIR}/completions $fpath)

  # Initialise completions with ZSH's compinit
  autoload -Uz compinit && compinit 
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

alias tmux="export TERM=\"screen-256color-bce\" && tmux"
alias emacs="emacs &"

# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  # export TERM="screen-256color-bce"
  # tmux attach -t default || tmux new -s default
# fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
