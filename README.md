# dotfiles & configs
Here you'll find my personal Linux config files and some extra scripts too.

## Installation

Clone the repo anywhere and run the installer — it will create symlinks from your home directory into the repo, so changes to the repo are immediately reflected everywhere.

```bash
git clone https://github.com/rrobertobt/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The script detects your OS (macOS / Linux) and only shows compatible modules. It will ask which configs you want to link before touching anything.

**Options**

| Flag | Effect |
|------|--------|
| _(none)_ | Interactive: pick modules from a numbered menu |
| `-a` | Select all compatible modules |
| `-y` | Auto-confirm replacements (backs up originals first) |
| `-n` | Dry run — preview changes without applying them |
| `-h` | Print help |

Flags can be combined, e.g. `./install.sh -a -n` to preview everything.

**Safeguards**
- If the symlink already points to the right place, it is skipped.
- If something already exists at the target location you are asked whether to back it up and replace it — nothing is overwritten silently.
- Backups are saved next to the original with a `.bak.<timestamp>` suffix.
- Missing parent directories are created automatically.

_Quick links:_
- **Terminals configs**
  - [kitty](https://github.com/rrobertobt/dotfiles/tree/master/.config/kitty/kitty.conf)
  - [Alacritty](https://github.com/rrobertobt/dotfiles/tree/master/.config/alacritty/alacritty.yaml)
  - [Konsole](https://github.com/rrobertobt/dotfiles/tree/master/.local/share/konsole)
- **Shells**
  - [zsh](https://github.com/rrobertobt/dotfiles/blob/master/.zshrc)
  - [bash](https://github.com/rrobertobt/dotfiles/blob/master/.bashrc)
  - [fish](https://github.com/rrobertobt/dotfiles/tree/master/.config/fish/config.fish)
  - **Prompts**
    - [starship](https://github.com/rrobertobt/dotfiles/blob/master/.config/starship.toml)
	- [powerlevel10k](https://github.com/rrobertobt/dotfiles/tree/master/.p10k)
- **vim (neovim)**
  - [vimrc](https://github.com/rrobertobt/dotfiles/blob/master/.vimrc)
  - [init](https://github.com/rrobertobt/dotfiles/blob/master/.config/nvim/init.vim)
- **Scripts**
  - [Color scripts](https://github.com/rrobertobt/dotfiles/tree/master/scripts/color_scripts)

## Gallery, see how my configs look
**starship prompt**
- Basic use

![basic](https://raw.githubusercontent.com/rrobertobt/dotfiles/master/screenshots/basic.gif)
- Git

![git](https://raw.githubusercontent.com/rrobertobt/dotfiles/master/screenshots/git.gif)
- Showing errors

![errors](https://raw.githubusercontent.com/rrobertobt/dotfiles/master/screenshots/errors.gif)

**powerlevel10k zsh teme**
## Software I use
