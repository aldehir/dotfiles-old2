if [[ -e "$HOME/.fzf" ]]; then
  # Set fzf installation directory path
  export FZF_BASE="$HOME/.fzf"

  if type -f ag 1>/dev/null; then
    # Set ag as the default source for fzf (so .gitignore is enforced)
    export FZF_DEFAULT_COMMAND='ag -g ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi

  plugins+=(fzf)
fi
