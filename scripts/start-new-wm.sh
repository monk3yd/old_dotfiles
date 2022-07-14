#!/bin/bash

# Update system and install crucial missing programs when installing new 'desktop'

# Update
sudo pacman -Syyu

# Basic
sudo pacman -S sxhkd picom rofi nitrogen alacritty neovim krusader flameshot gimp

# Audio & Video
sudo pacman -S pipewire pipewire-pulse pulsemixer kdenlive

# VM Manager
sudo pacman -S virtualbox vagrant
