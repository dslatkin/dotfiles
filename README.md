# dslatkin/dotfiles

These are my [dotfiles](https://dotfiles.github.io/).

Add this to your `settings.json` in VS Code and they'll automatically
get copied into [dev containers](https://code.visualstudio.com/docs/remote/containers)
that you open:

```json
{
  "dotfiles.repository": "dslatkin/dotfiles",
  "dotfiles.targetPath": "~/dotfiles",
  "dotfiles.installCommand": "~/dotfiles/install.sh"
}
```
