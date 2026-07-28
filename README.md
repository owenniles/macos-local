# macOS dotfiles

Minimal Bash configuration for this macOS account. This repository lives in
`$HOME` and tracks only `.bashrc`, `.bash_profile`, and `.git-completion.sh`.

## New Mac

Back up any existing shell files, then initialize the repository in your home
directory:

```bash
mkdir -p "$HOME/dotfiles-backup"
for file in .bashrc .bash_profile .git-completion.sh; do
  [[ -e "$HOME/$file" ]] && mv "$HOME/$file" "$HOME/dotfiles-backup/$file"
done

cd "$HOME"
git init
git remote add origin git@github.com:owenniles/macos-local.git
git fetch origin main
git checkout -b main --track origin/main
exec /bin/bash -l
```

The remote uses SSH; authorize an SSH key with GitHub first.

## External tooling

This configuration integrates with, but does not install or manage:

- [Homebrew](https://brew.sh/)
- [Bun](https://bun.sh/)
- [NVM](https://github.com/nvm-sh/nvm)
- [GVM](https://gvm.sh/)

## Update

```bash
cd "$HOME"
git pull --ff-only
exec /bin/bash -l
```
