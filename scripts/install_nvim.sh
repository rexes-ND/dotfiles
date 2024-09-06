#!/bin/bash

INSTALL_DIR="$HOME/.local/bin/"

echo "Downloading Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

chmod u+x nvim.appimage

mkdir -p "$INSTALL_DIR"
mv nvim.appimage "$INSTALL_DIR/nvim"

echo "Neovim installation completed!"

