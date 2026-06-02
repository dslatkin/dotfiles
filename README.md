# danny's dotfiles

To manually install:

- On macOS, run `./install-mac.sh`
- On Linux, run `./install-linux.sh`

## Dev containers

For dev containers, add the following to your user settings:

```jsonc
{
    "dotfiles.repository": "dslatkin/dotfiles",
    "dotfiles.targetPath": "~/.dotfiles/vscode",
    "dotfiles.installCommand": "install-linux.sh",

    // Sync dotfiles settings across machines (by default, they don't)
    "settingsSync.ignoredSettings": [
        "-dotfiles.repository",
        "-dotfiles.targetPath",
        "-dotfiles.installCommand",
    ]
}
```

## Nerd fonts

To get Fira Code with Nerd Font glyphs working with VS Code:

```jsonc
{
    "editor.fontFamily": "'FiraCode Nerd Font', Consolas, 'Courier New', monospace",
    "editor.fontLigatures": "'ss02'", // use variants <= and >=
    "terminal.integrated.fontFamily": "'FiraCode Nerd Font', Consolas, 'Courier New', monospace",
}
```

## 1Password agents

On macOS, the preferred way to configure all clients, terminal and GUI, with
1Password's SSH agent is to create and activate a `plist` entry [as described
here](https://www.1password.dev/ssh/agent/compatibility#configure-ssh_auth_sock-globally-for-every-client).
Note the command at the bottom that you need to activate it with `launchctl`.
There's also an undocumented step that requires you allow the entry under
macOS's "Login Items & Extensions" -> "App Background Activity" setting, or else
the agent won't activate on startup. The `plist` entry will show up as "sh: Item
from unidentified developer" since it executes a `sh` command.

There are similar instructions on that page for configuring Linux with a shell
profile script in `/etc/profile.d/`.

1Password's SSH agent in dev containers should work automatically if the agent
has been configured in this way.

<!--
todo - Update

## Development

I've tried to keep things pretty straightforward so that, in theory, it would be
pretty easy for someone to fork and hack on this to make it their own.

It would be very helpful to have a general understanding of
[chezmoi](https://chezmoi.io). It has a great model for syncing dotfiles,
namely:

-   Your dotfiles are managed with a "source" directory (a locally cloned git
    repo) and a "target" directory (your home directory).
-   You manage intended changes to your dotfiles in the source directory and
    apply them with `chezmoi apply`. You can preview changes with dry-runs.
-   File names are annotated with prefixes and suffixes as directives to do
    things like create symlinks, run scripts, etc.
-   Much file content and chezmoi configuration can be conditionally generated
    on the fly using a simple templating language.

Some things to know about how I've set this up:

-   This project uses a `.chezmoiroot` file, so your home directory files,
    scripts, chezmoi configuration, etc. are all actually in `/home/`.
-   Variables to target specific environments such as Windows, Mac, Linux, dev
    containers, etc. are defined in `/home/.chezmoi.toml.tmpl`.
-   Scripts that run on `chezmoi apply` are found in `/home/.chezmoiscripts/`.
    Mac and Linux run `.sh` scripts and Windows runs `.ps1` scripts.
-   Scripts that need to run on even more specific platforms are narrowed with
    file patterns in `/home/.chezmoiignore` using `/home/.chezmoi.toml.tmpl`.
-   The `/home/dot_dotfiles` directory is used for improved organization of
    scripts sourced by other application's runtime config scripts.
-   All else is generally configuration specific to an platform, application,
    and/or feature like a font that expects files to be in a specific place.

If you want to make this your own, a good place to start poking around would be
in `/home/.chezmoi.toml.tmpl`, `/home/.chezmoiscripts/`, and
`/home/.chezmoiignore`.

## References

- Template functions
    -   [Go template functions](https://pkg.go.dev/text/template)
    -   [Sprig template functions](http://masterminds.github.io/sprig/)
    -   [Chezmoi init template
        functions](https://www.chezmoi.io/reference/templates/functions/)
- `fzf`
    -   [Keybindings](https://github.com/junegunn/fzf#using-the-finder)
    -   [Search patterns](https://github.com/junegunn/fzf#search-syntax)
-->
