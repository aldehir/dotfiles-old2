export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"

plugins=(vi-mode git tmux colored-man-pages fasd)

if [[ -e "$HOME/.nvm" ]]; then
  plugins+=(nvm)
fi
