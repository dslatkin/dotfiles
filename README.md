# dslatkin/dotfiles

<!--
Todos

Use `dialog` apt package to give ncurses widgets in bash scripts so that
we can prompt non-me people (I don't know how else to say that lol) for
things like chezmoi template data info, packages to install or skip, etc.
Good guide here:

    https://linuxconfig.org/how-to-use-ncurses-widgets-in-shell-scripts-on-linux

Set up install script that bootstraps system with chezmoi and does first
chezmoi apply

-   Use `dialog` package above
-   [VS Code dev containers](https://www.chezmoi.io/user-guide/machines/containers-and-vms/)

Explore or install these packages:

-   [nu shell](https://nushell.sh)
-   [Windows via winget](https://github.com/twpayne/chezmoi/issues/812)
-   [homebrew bundle](https://github.com/Homebrew/homebrew-bundle)
-   [Debian unattended upgrades](https://wiki.debian.org/UnattendedUpgrades) for updating debian packages

-->

## Installation

Linux:

1. Install [brew](https://brew.sh)
2. Modify `.profile` to add `brew` to `$PATH`
   - Reapply `.profile` which runs on login shell inits by either
     restarting your computer or re-runing it with `~/. .profile`
3. `brew install chezmoi`
   - Chezmoi for dotfile manage
   - Age for encryption of dotfiles
4. `chezmoi init dslatkin/dotfiles --apply`

VS Code Settings:

```json
{
	"editor.fontFamily": "'FiraCode Nerd Font', 'monospace', monospace", // Mac: "'FiraCode NF', Consolas, 'Courier New', monospace",
	"editor.fontLigatures": "'ss02'", // use <=, >= variants
	"editor.fontSize": 13,
	"terminal.integrated.fontFamily": "'FiraCode Nerd Font', Consolas, 'Courier New', monospace",
	"terminal.integrated.fontSize": 13
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
