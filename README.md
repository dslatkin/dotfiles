# danny's dotfiles

## Installing

Setup dotfiles:

1. `./install.sh`
2. `exec bash` or `exec zsh` to get shell changes

Then update VS Code's settings:

```jsonc
{
    "editor.fontFamily": "'FiraCode Nerd Font', Consolas, 'Courier New', monospace",
    "editor.fontLigatures": "'ss02'", // <=, >= variants
    "terminal.integrated.fontFamily": "'FiraCode Nerd Font', Consolas, 'Courier New', monospace",
}
```

## Development

I've tried to keep things pretty straightforward so that, in theory, it would be
pretty easy for someone to fork and hack on this to make it their own.

It would be very helpful to have a general understanding of
[chezmoi](https://chezmoi.io). It has an great model for syncing dotfiles,
namely:

-   Your dotfiles are managed with a "source" directory (a locally cloned
    git repo) and a "target" directory (your home directory).
-   You manage intended changes to your dotfiles in the source directory and
    apply them with `chezmoi apply`. You can preview changes with dry-runs.
-   File names are annotated with prefixes and suffixes as directives to
    do things like create symlinks, run scripts, etc.
-   Much file content and chezmoi configuration can be conditionally generated
    on the fly using a simple templating language.

Some things to know about how I've set things up:

-   This project uses a `.chezmoiroot` file, so your home directory files,
    scripts, chezmoi configuration, etc. are all actually in `/home/`.
-   Variables to target specific environments such as Windows, Mac, Linux, dev
    containers, etc. are defined in `/home/.chezmoi.toml.tmpl`.
-   Scripts that run on `chezmoi apply` are found in `/home/.chezmoiscripts/`.
    Mac and Linux run `.sh` scripts and Windows runs `.ps1` scripts.
-   Scripts that need to run on even more specicic platforms are narrowed with
    file patterns in `/home/.chezmoiignore` using `/home/.chezmoi.toml.tmpl`.
-   The `/home/dot_dotfiles` directory is used for improved organization of
    scripts sourced by other application's runtime config scripts.
-   All else is generally config specific to an application or a feature like
    fonts that expects its files to be in that specific place.

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
