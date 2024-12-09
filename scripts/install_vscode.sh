#!/bin/bash

# Temporary file for VSCode .deb package
TEMP_FILE="/tmp/vscode.deb"

# Download VSCode .deb package
echo "Downloading VSCode .deb package..."
if curl -sL 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -o "$TEMP_FILE"; then
    echo "Download completed."
else
    echo "Error: Failed to download VSCode package." >&2
    exit 1
fi

# Install the downloaded package
echo "Installing VSCode..."

if sudo DEBIAN_FRONTEND=noninteractive dpkg -i "$TEMP_FILE"; then
    echo "VSCode installed successfully."
else
    echo "Error: VSCode installation failed."
    exit 1
fi

# Clean up the temporary file
rm -f "$TEMP_FILE"
echo "Temporary file cleaned up."

echo "VSCode installation completed!"
