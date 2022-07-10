#!/bin/bash

# Install qtile config files & directories

rm -rf ~/.config/qtile

# Create required directories
mkdir -p ~/.config/qtile
mkdir -p ~/.config/qtile/archive
mkdir -p ~/.config/qtile/icons
mkdir -p ~/.config/qtile/icons/battery_icons_horiz
mkdir -p ~/.config/qtile/scripts
mkdir -p ~/.config/qtile/sxhkd
mkdir -p ~/.config/qtile/sxhkd_qtile
mkdir -p ~/.config/qtile/themes

# Find all config files and symlink them over to qtile config directories
for f in `find . -regex ".*\.py$\|.*\.theme$\|.*\.sh$\|.*\.conf$"`; do
    rm -rf ~/.config/qtile/${f}
    ln -s ~/.dotfiles/qtile/${f} ~/.config/qtile/${f}
    # echo "Symlink created for file: ${f}"
done
# rm ~/.config/qtile/sxhkd/sxhkdrc
# rm ~/.config/qtile/sxhkd_qtile/sxhkdrc
ln -s ~/.dotfiles/qtile/sxhkd/sxhkdrc ~/.config/qtile/sxhkd/sxhkdrc
ln -s ~/.dotfiles/qtile/sxhkd_qtile/sxhkdrc ~/.config/qtile/sxhkd_qtile/sxhkdrc
ln -s ~/.dotfiles/qtile/scripts/system-overview ~/.config/qtile/scripts/system-overview

