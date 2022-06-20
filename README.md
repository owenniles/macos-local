# Local macOS home directory

Run the following in your user's home directory on a new Mac:
```bash
git init
git remote add origin git@github.com:owenniles/macos-local.git
git fetch
git checkout main
git submodule init
git submodule update
```
Follow the instructions for compiling `emacs-libvterm` [here](https://github.com/akermu/emacs-libvterm).
