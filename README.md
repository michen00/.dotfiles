# dotfiles

My config files for consistency across computers

## dependencies

- git
- stow

## usage

1. Clone this repo
2. `cd` into repo and run `stow .`
   - This will create symlinks in your `$HOME` directory to all of the (non-ignored) files in this directory, respecting folder layouts
   - If any of these files exist in `$HOME`, `stow .` will fail. Use `stow . --adopt` to copy the versions in `$HOME` to this repo before symlinking, and then you can use `git` to resolve differences.
