# dslatkin/dotfiles

<!--
Todos

https://github.com/lucasresck/gnome-shell-extension-alt-tab-scroll-workaround

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

Set up nice aliases and functions for frequently used things

-   Some of these specific to git are already in gitconfig
-   Should have alias and shell function script files which get copied to a
    hidden home directory, then `source`ed or something into `.bashrc`, etc.
-   Useful functions I should write:
    -   Check if in bash login vs. interactive shell 
        https://unix.stackexchange.com/a/26782/496182

Set up git autocomplete

    https://github.com/git/git/blob/master/contrib/completion/git-completion.bash

Set up byobu

    https://www.byobu.org/

-->

## Installation

Linux:

1. Run the install script `./install.sh`
2. Start a new shell with changes `exec bash`
3. `chezmoi edit-config` to customize machine-specific settings

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

Note: There's a dev container as a record of general deps and suggested settings
to maintain this repo, but typically I don't do this work in a dev container
since the use of the dotfiles themselves take care of any machine-to-machine
differences.

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
