# Nyv Themes

A repo to define and swap themes on arch+hyprland desktop.

It defines themes, assigns wallpapers, and define a family mode.

## Installation

You need to add the following lines to your config files:

```conf
# ~/.config/hypr/hyprland.conf

source = ~/.config/hypr/hyprland-colors.conf

```

```toml
# ~/.config/alacritty/alacritty.toml

[general]

import = [
    # ...
    "~/.config/alacritty/alacritty-colors.toml"
]
```
