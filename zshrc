if [[ -z $TMUX ]]; then
  # Let's boot tmux before loading anything. Without this if/else, everything
  # loads in the "real", non-tmux terminal, slowing everything down by like
  # half.
  tmux
else
  # We're in tmux, GO GO GO

  BASE="$HOME/.dotfiles/zsh/"

  source $BASE'key_bindings.zsh'
  source $BASE'colors.zsh'
  source $BASE'editor.zsh'
  source $BASE'aliases.zsh'
  source $BASE'path.zsh'
  source $BASE'options.zsh'
  source $BASE'completion.zsh'
  source $BASE'vcs.zsh'
  source $BASE'prompt.zsh'

  ############################
  #         EXTRAS           #
  # (non-core functionality) #
  ############################

  source $BASE'homebrew.zsh'
  # source $BASE'python.zsh'
  source $BASE'git.zsh'
  source $BASE'ruby.zsh'
  source $BASE'rails.zsh'
  source $BASE'rvm.zsh'
  source $BASE'hitch.zsh'

  export PATH
  trim_path

  # [In]offensive short fortunes, where short means <= 140 chars
  fortune -a -s -n140

  # Houston, we have liftoff.
fi
