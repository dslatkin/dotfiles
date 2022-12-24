# danny's dotfiles

<!--
Todos

https://www.shell-tips.com/mac/defaults/#gsc.tab=0
https://github.com/mathiasbynens/dotfiles/blob/master/.macos

https://github.com/lucasresck/gnome-shell-extension-alt-tab-scroll-workaround

Include official autocomplete for git:

-   https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh
-   Note that this depends on bashrc autocomplete being installed first
-   Use chezmoi to manage these file updates

Automate system management including running `chezmoi apply` to refresh externals:

- Notes about `.chezmoiexternal.toml`:
    - Zsh example with gotchas: https://www.chezmoi.io/user-guide/include-files-from-elsewhere/
    - Maybe use v3 API instead of /archive/branch on GitHub repos: https://stackoverflow.com/a/8378458/9207275
    - Use --progress to show progress bar when downloading externals (and can be set in chezmoi config)
- On Mac, use launchd for automation
    https://www.launchd.info/
    https://www.soma-zone.com/LaunchControl/
- On Linux, use anacron since it will queue and combine updates that are
  scheduled when the computer is off or asleep
    https://askubuntu.com/a/848638/1624642

Configuration

-   Automate debconf https://github.com/phusion/baseimage-docker/issues/58#issuecomment-48032250

Explore or install these packages:

-   [homebrew bundle](https://github.com/Homebrew/homebrew-bundle)
-   [Debian unattended upgrades](https://wiki.debian.org/UnattendedUpgrades) for updating debian packages

Functions:

-   Check if in bash login vs. interactive shell 
    https://unix.stackexchange.com/a/26782/496182

Git autocomplete

-   https://github.com/git/git/blob/master/contrib/completion/git-completion.bash

-->

## Installation

Setup dotfiles:

1. `./install.sh`
2. `exec bash` or `exec zsh` to get shell changes
3. `chezmoi edit-config` to further customize

Update VS Code's settings:

```jsonc
{
	"editor.fontFamily": "'FiraCode Nerd Font', Consolas, 'Courier New', monospace",
	"editor.fontLigatures": "'ss02'", // <=, >= variants
	"editor.fontSize": 13,
	"terminal.integrated.fontFamily": "'FiraCode Nerd Font', Consolas, 'Courier New', monospace",
	"terminal.integrated.fontSize": 13
}
```

## References

- [Go template functions](https://pkg.go.dev/text/template)
- [Sprig template functions](http://masterminds.github.io/sprig/)
- [Chezmoi template functions](https://www.chezmoi.io/reference/templates/functions/)
- [Terminal shortcuts](https://stackoverflow.com/a/58966776/9207275)
- [fzf](https://github.com/junegunn/fzf)
    - [Keybindings](https://github.com/junegunn/fzf#using-the-finder)
    - [Search patterns](https://github.com/junegunn/fzf#search-syntax)

<!--
## Terminal colors

Make terminal output better

https://github.com/alrra/dotfiles/issues/19#issuecomment-195406139
https://stackoverflow.com/questions/2924697/how-does-one-output-bold-text-in-bash#comment123922440_2924755
https://stackoverflow.com/a/2924755/9207275
https://stackoverflow.com/a/42449998/9207275

Good reference: https://stackoverflow.com/a/28938235/9207275

These lists should work in shell script:

- Reset: \u001b[0m
- Black: \u001b[30m
- Red: \u001b[31m
- Green: \u001b[32m
- Yellow: \u001b[33m
- Blue: \u001b[34m
- Magenta: \u001b[35m
- Cyan: \u001b[36m
- White: \u001b[37m
- Background Black: \u001b[40m
- Background Red: \u001b[41m
- Background Green: \u001b[42m
- Background Yellow: \u001b[43m
- Background Blue: \u001b[44m
- Background Magenta: \u001b[45m
- Background Cyan: \u001b[46m
- Background White: \u001b[47m
- Bright Black: \u001b[30;1m
- Bright Red: \u001b[31;1m
- Bright Green: \u001b[32;1m
- Bright Yellow: \u001b[33;1m
- Bright Blue: \u001b[34;1m
- Bright Magenta: \u001b[35;1m
- Bright Cyan: \u001b[36;1m
- Bright White: \u001b[37;1m
- Background Bright Black: \u001b[40;1m
- Background Bright Red: \u001b[41;1m
- Background Bright Green: \u001b[42;1m
- Background Bright Yellow: \u001b[43;1m
- Background Bright Blue: \u001b[44;1m
- Background Bright Magenta: \u001b[45;1m
- Background Bright Cyan: \u001b[46;1m
- Background Bright White: \u001b[47;1m

Some terminals support an extended color set in the form `\u001b[38;5;${0..255}m`.

And for output in go templates, format it like:

```text/template
{{ writeToStdout "I'm black and \033[32mI'm green\033[0m and I'm black again" -}}
```

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
