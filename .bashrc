#!/bin/bash

export EDITOR="emacsclient -s $HOME/.emacs.d/server"
export PATH="$HOME/.local/bin:$PATH"
export PS1="\w $ "

# https://opensource.apple.com/source/Git/Git-19/src/git/contrib/completion/git-completion.bash
source ~/.git-completion.sh

if [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
    . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
fi

if [[ "$INSIDE_EMACS" = 'vterm' ]] \
    && [[ -n ${EMACS_VTERM_PATH} ]] \
    && [[ -f ${EMACS_VTERM_PATH}/etc/emacs-vterm-bash.sh ]]; then
	source ${EMACS_VTERM_PATH}/etc/emacs-vterm-bash.sh
fi

eval "$($(brew --prefix)/bin/brew shellenv)"
