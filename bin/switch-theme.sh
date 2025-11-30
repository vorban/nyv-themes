#!/usr/bin/env bash

set -euo pipefail

# -- CONSTANTS
THEMES_DIR="$HOME/.config/nyv-themes/themes"
ALACRITTY_CONFIG_DIR="$HOME/.config/alacritty"

# -- INPUT VALIDATION
THEME="$1"

if [ -z "$THEME" ]; then
    echo "Usage: switch-theme <theme-name>"
    exit 1
fi

if [ ! -d "$THEMES_DIR/$THEME" ]; then
    echo "Theme not found: $THEME"
    exit 1
fi

# -- ALACRITTY
if [ -f "$THEMES_DIR/$THEME/alacritty-colors.toml" ]; then
    mkdir -p "$ALACRITTY_CONFIG_DIR"
    cp "$THEMES_DIR/$THEME/alacritty-colors.toml" "$ALACRITTY_CONFIG_DIR/alacritty-colors.toml"
    echo "Alacritty colors updated for theme '$THEME'."
else
    echo "No Alacritty colors found in theme '$THEME'."
fi
