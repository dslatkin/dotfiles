# dslatkin/dotfiles

## Setup

### Install brew

#### Linux

1. Install [brew](https://brew.sh)
2. Modify `.profile` to add `brew` to $PATH
    -   Reapply `.profile` which runs on login shell inits by either
        restarting your computer or re-runing it with `~/. .profile`
3.  `brew install chezmoi`
    -   Chezmoi for dotfile manage
    -   Age for encryption of dotfiles
4.  `chezmoi init dslatkin/dotfiles --apply`

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

If you sync your VS Code settings, `dotfile.*` settings are excluded
by default. To fix this, add this setting to revert that:

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

-   [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish)
-   Windows (use Scoop for package management)
-   Use a brewfile with [homebrew bundle](https://github.com/Homebrew/homebrew-bundle)
-   Install [Unattended upgrades](https://wiki.debian.org/UnattendedUpgrades) for updating debian packages
