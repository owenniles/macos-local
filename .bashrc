# ~/.bashrc — interactive Bash configuration

# This file is also sourced by .bash_profile.  Avoid loading completions and
# version managers for non-interactive shells.
case $- in
  *i*) ;;
  *) return ;;
esac

# Homebrew is installed in a different location on Intel and Apple Silicon.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Locally installed tools.
export BUN_INSTALL="$HOME/.bun"
export PATH="$HOME/bin:$HOME/.local/bin:$BUN_INSTALL/bin:$PATH"

# Shell completion.
[[ -r "$HOME/.git-completion.sh" ]] && source "$HOME/.git-completion.sh"
if [[ -n ${HOMEBREW_PREFIX:-} && -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
  source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
fi

# Node Version Manager (and its completion, when available).
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# GVM (Go Version Manager)
if [ -x "$HOME/bin/gvm" ]; then
    eval "$(gvm env)"
fi
