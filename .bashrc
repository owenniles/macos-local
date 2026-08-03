# ~/.bashrc — interactive Bash configuration

# Homebrew on Apple Silicon.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Node Version Manager. Load this before the interactive-shell guard so Node
# is available to both interactive and non-interactive login shells.
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

# This file is also sourced by .bash_profile.  Avoid loading completions and
# other interactive-only tools for non-interactive shells.
case $- in
  *i*) ;;
  *) return ;;
esac

# Locally installed tools.
export BUN_INSTALL="$HOME/.bun"
export PATH="$HOME/bin:$HOME/.local/bin:$BUN_INSTALL/bin:$PATH"

# Shell completion.
[[ -r "$HOME/.git-completion.sh" ]] && source "$HOME/.git-completion.sh"
if [[ -n ${HOMEBREW_PREFIX:-} && -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
  source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
fi

# NVM shell completion.
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# GVM (Go Version Manager)
if [ -x "$HOME/bin/gvm" ]; then
    eval "$(gvm env)"
fi
