#!/bin/bash

export EDITOR="emacsclient -s $HOME/.emacs.d/server"
export PATH="$HOME/.local/bin:$PATH"
export PS1="\w $ "

if [ -r "/usr/local/etc/profile.d/bash_completion.sh" ]; then
    . "/usr/local/etc/profile.d/bash_completion.sh"
fi

if [[ "$INSIDE_EMACS" = 'vterm' ]] \
    && [[ -n ${EMACS_VTERM_PATH} ]] \
    && [[ -f ${EMACS_VTERM_PATH}/etc/emacs-vterm-bash.sh ]]; then
	source ${EMACS_VTERM_PATH}/etc/emacs-vterm-bash.sh
fi
