#!/bin/bash

TEMP_FILE="/tmp/source-code-pro.zip"
TEMP_DIR="/tmp/source-code-pro-release/"

# Download fonts from GitHub
echo "Downloading Source Code Pro font from GitHub"
if curl -sL 'https://github.com/adobe-fonts/source-code-pro/archive/refs/heads/release.zip' -o "$TEMP_FILE"; then
    echo "Download completed."
else
    echo "Error: Failed to download the font." >&2
    exit 1
fi

mkdir -p ~/.local/share/fonts

unzip -o "$TEMP_FILE" -d /tmp/ > /dev/null

find "$TEMP_DIR" -name '*.ttf' -exec mv {} ~/.local/share/fonts/ \;

fc-cache -fv > /dev/null

rm -rf "$TEMP_FILE" "$TEMP_DIR"

echo "Source Code Pro installed successfully!"
