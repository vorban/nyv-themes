#!/usr/bin/env bash

set -euo pipefail

# -- CONSTANTS
THEMES_DIR="$HOME/.config/nyv-themes/themes"
ALACRITTY_CONFIG_DIR="$HOME/.config/alacritty"
HYPRLAND_CONFIG_DIR="$HOME/.config/hypr"
WAYBAR_CONFIG_DIR="$HOME/.config/waybar"

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
    echo "- Alacritty colors SET."
else
    echo "- Alacritty colors SKIPPED."
fi

# -- HYPRLAND
if [ -f "$THEMES_DIR/$THEME/hyprland-colors.conf" ]; then
    mkdir -p "$ALACRITTY_CONFIG_DIR"
    cp "$THEMES_DIR/$THEME/hyprland-colors.conf" "$HYPRLAND_CONFIG_DIR/hyprland-colors.conf"
    hyprctl reload
    echo "- Hyprland colors SET."
else
    echo "- Hyprland colors SKIPPED."
fi

# -- WAYBAR
if [ -f "$THEMES_DIR/$THEME/waybar-config.jsonc" ]; then
    mkdir -p "$ALACRITTY_CONFIG_DIR"
    cp "$THEMES_DIR/$THEME/waybar-config.jsonc" "$WAYBAR_CONFIG_DIR/config.jsonc"
    cp "$THEMES_DIR/$THEME/waybar-style.css" "$WAYBAR_CONFIG_DIR/style.css"
    echo "- Waybar colors SET."
else
    echo "- Waybar colors SKIPPED."
fi
