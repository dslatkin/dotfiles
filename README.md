# dslatkin/dotfiles

These are my [dotfiles](https://dotfiles.github.io/), primarily meant for use in
VS Code dev containers based off Debian images.

## Get started

As always, inspect the [shell script](install.sh).

Add this to your `settings.json` in VS Code and they'll automatically
get copied into [dev containers](https://code.visualstudio.com/docs/remote/containers)
that you open:

```json
{
    "dotfiles.repository": "https://github.com/dslatkin/dotfiles.git",
    "dotfiles.targetPath": "~/dotfiles",
    "dotfiles.installCommand": "~/dotfiles/install.sh",
    "remote.containers.dotfiles.repository": "https://github.com/dslatkin/dotfiles.git",
    "remote.containers.dotfiles.targetPath": "~/dotfiles",
    "remote.containers.dotfiles.installCommand": "~/dotfiles/install.sh",
    "terminal.integrated.profiles.linux": {
        "fish": { "path": "/usr/bin/fish" },
        // ...
    },
}
```

If you sync your VS Code settings, you'll want to add this setting as well
to automatically sync the `dotfile.*` settings which are by default exluded:

```json
{
  "settingsSync.ignoredSettings": [
        "-dotfiles.installCommand",
        "-dotfiles.repository",
        "-dotfiles.targetPath",
        "-remote.containers.dotfiles.installCommand",
        "-remote.containers.dotfiles.repository",
        "-remote.containers.dotfiles.targetPath"
    ],
}
```

## Features

-   [fish](https://fishshell.com/): An opinionated, beginner-friendly shell. Not
    POSIX-compliant (unlike `zsh`) but more beginner-friendly and requires
    less configuration for nicer features.
