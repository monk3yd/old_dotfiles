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

# cp ~/.dotfiles/nvim/.vimrc ~/.dotfiles/nvim/init.vim

# --- Copy to NVIM directory ---

# .vimrc (Vim/Nvim compatibility)
rm -rf ~/.vimrc
ln -s ~/.dotfiles/nvim/.vimrc ~/.vimrc

# init.vim
# rm -rf ~/.config/nvim/init.vim
# ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# init.lua
rm -rf ~/.config/nvim/lua/init.lua
ln -s ~/.dotfiles/nvim/lua/init.lua ~/.config/nvim/lua/init.lua

