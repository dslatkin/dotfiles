# danny's dotfiles

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
