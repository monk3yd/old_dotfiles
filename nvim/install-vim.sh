#!/bin/bash

# Create necessary dirs for spliting .vimrc config file
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/lua

# Find all config files and symlink them over to nvim
for f in `find . -regex ".*\.vim$\|.*\.lua$"`; do
    rm -rf ~/.config/nvim/${f}
    ln -s ~/.dotfiles/nvim/${f} ~/.config/nvim/${f}
done

