# dslatkin/dotfiles

These are my [dotfiles](https://dotfiles.github.io/), primarily meant for use in
VS Code dev containers based on Debian images.

## Features
    
-   [fish](https://fishshell.com/): An opinionated, beginner-friendly shell.
-   [starship](https://starship.rs/): Minimal, fast, customizable prompt.about every shell.

## Setup

Most of the work is done in [install.sh](install.sh). Make sure to inspect that
file and any of the scripts it downloads and runs.

### Fonts

You'll need a [Nerd Font](https://nerdfonts.com) for the glyphs used in
starship. I've found browsing their GitHub to be the easiest way to download
just the fonts I need.

Personally, I like [Fira Code](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)
with the following settings:

```json
{
    "editor.fontFamily": "'FiraCode NF', Consolas, 'Courier New', monospace",
    "editor.fontSize": 13,
    "terminal.integrated.fontFamily": "'FiraCode NF', Consolas, 'Courier New', monospace",
    "terminal.integrated.fontSize": 13,
    "editor.fontLigatures": "'ss02'"
} 
```

### Dotfiles

Add this to your `settings.json` in VS Code and these dotfiles will automatically
get copied into [dev containers](https://code.visualstudio.com/docs/remote/containers)
that you open:

```json
{
    "dotfiles.repository": "https://github.com/dslatkin/dotfiles.git",
    "dotfiles.targetPath": "~/dotfiles",
    "dotfiles.installCommand": "~/dotfiles/install.sh",
    "terminal.integrated.defaultProfile.linux": "fish",
    "terminal.integrated.profiles.linux": {
        "fish": {
            "path": "/usr/bin/fish"
        },
    }
}
```

If you sync your VS Code settings, `dotfile.*` settings are excluded from sync
by default. To fix this, add this setting:

```json
{
    "settingsSync.ignoredSettings": [
        "-dotfiles.installCommand",
        "-dotfiles.repository",
        "-dotfiles.targetPath",
    ]
}
```

## Todos

-   [chezmoi](https://www.chezmoi.io/)
-   [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish)
