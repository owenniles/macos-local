#!/bin/bash

export EDITOR="emacsclient -s $HOME/.emacs.d/server"
export PATH="$HOME/.local/bin:$PATH"
export PS1="\w $ "

# https://opensource.apple.com/source/Git/Git-19/src/git/contrib/completion/git-completion.bash
source ~/.git-completion.sh

# The logic that sets HOMEBREW_PREFIX is modified from
# https://github.com/Homebrew/install/blob/805136bcfcbc40b95e476639fb2407773ab26445/install.sh#L125-L136
UNAME_MACHINE="$(/usr/bin/uname -m)"

if [ "$UNAME_MACHINE" = "arm64" ]; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi

if [ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]; then
    . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
fi

if [[ "$INSIDE_EMACS" = 'vterm' ]] \
    && [[ -n ${EMACS_VTERM_PATH} ]] \
    && [[ -f ${EMACS_VTERM_PATH}/etc/emacs-vterm-bash.sh ]]; then
	source ${EMACS_VTERM_PATH}/etc/emacs-vterm-bash.sh
fi

eval "$("$HOMEBREW_PREFIX"/bin/brew shellenv)"
