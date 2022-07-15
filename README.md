# dslatkin/dotfiles

## Installation

### Linux

1. Install [brew](https://brew.sh)
2. Modify `.profile` to add `brew` to `$PATH`
    -   Reapply `.profile` which runs on login shell inits by either
        restarting your computer or re-runing it with `~/. .profile`
3.  `brew install chezmoi`
    -   Chezmoi for dotfile manage
    -   Age for encryption of dotfiles
4.  `chezmoi init dslatkin/dotfiles --apply`

### Fonts

To make use of the FiraCode nerd fonts used in Starship's glyphs, make sure
your VS Code settings are configured to something like the following:

```json
{
    "editor.fontFamily": "'FiraCode NF', Consolas, 'Courier New', monospace",
    "editor.fontSize": 13,
    "terminal.integrated.fontFamily": "'FiraCode NF', Consolas, 'Courier New', monospace",
    "terminal.integrated.fontSize": 13,
    "editor.fontLigatures": "'ss02'"
} 
```

<!--
### Dev containers

Add this to your `settings.json` in VS Code and these dotfiles will automatically
get copied into [dev containers](https://code.visualstudio.com/docs/remote/containers):

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
-->

## Todos

-   [nu shell](https://nushell.sh)
-   [VS Code dev containers](https://www.chezmoi.io/user-guide/machines/containers-and-vms/)
-   [Windows via winget](https://github.com/twpayne/chezmoi/issues/812)
-   [homebrew bundle](https://github.com/Homebrew/homebrew-bundle)
-   [Debian unattended upgrades](https://wiki.debian.org/UnattendedUpgrades) for updating debian packages
