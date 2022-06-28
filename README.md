# dslatkin/dotfiles

These are my [dotfiles](https://dotfiles.github.io/), primarily meant for use in
VS Code dev containers extending Debian images.

## Features

-   [fish](https://fishshell.com/): An opinionated, beginner-friendly shell
-   [starship](https://starship.rs/): Minimal, fast, customizable prompt.about every shell

## Setup

If you're using Mac or Linux, you should use [brew](https://brew.sh) as your package
manager. Follow brew's install prompts. For Linux, you'll modify `.profile` to add brew to your
path, but since `.profile` is only executed for login shells, you'll either need to
restart your computer or manually execute it with `~/. .profile`.

With brew installed, install [chezmoi](https://www.chezmoi.io/) (for dotfile management)
and [age](https://age-encryption.org) (for encrypting sensitive dotfiles):

```sh
brew install chezmoi age
```

Then initialize chezmoi and apply your dotfiles from this repo:

```sh
chezmoi init --apply dslatkin
```

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
