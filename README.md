# Dotfiles

![showcase](https://github.com/YodaEmbedding/dotfiles/assets/721196/4528634c-2bf2-43a1-b39c-194339dde3a2)

[![Click for full album.](https://i.imgur.com/tJlW7l1.gif)](https://imgur.com/a/W5QwA)

[![Click for full album.](https://i.imgur.com/azSHUBZ.gif)](https://imgur.com/a/JK2Pc6m)

<!-- [[![Click for full album.](https://i.imgur.com/0DqKJaD.mp4)](https://imgur.com/a/W5QwA) -->
<!-- [Full album.](https://imgur.com/a/W5QwA) -->

## Installation

This dotfiles repository uses a combination of `git` and GNU `stow`. To use, simply clone:

    cd ~
    git clone https://github.com/SicariusNoctis/dotfiles.git
    cd dotfiles

## Usage

From inside `~/dotfiles`, one may symlink configurations of choice into the `$HOME` directory in the following manner:

    stow i3
    stow vim

Similarly, configurations for other directories may be symlinked as follows:

    stow -t ~ -d hosts common-home

Starter install:

```bash
stow aliases bash cargo colors git lf lint mimeapps mpv nvim ptpython pypoetry python ranger readline ripgrep scripts snippets tmux uv yazi zsh
stow -t ~ -d hosts common-home
```

## Configuration Details

List of configs, which directories these belong in, and other details.

| Name           | Stow dir | Dependencies                                         | Details                                          |
| :------------- | :------- | :--------------------------------------------------- | :----------------------------------------------- |
| alacritty      | `$HOME`  | alacritty                                            | Terminal emulator                                |
| aliases        | `$HOME`  |                                                      | Shell aliases                                    |
| bash           | `$HOME`  |                                                      | Shell                                            |
| cargo          | `$HOME`  | cargo                                                | Rust                                             |
| colors         | `$HOME`  |                                                      | Terminal and rofi colors                         |
| devilspie      | `$HOME`  | devilspie, devilspie2                                | Window tweaker                                   |
| dunst          | `$HOME`  |                                                      | Notification manager                             |
| frece          | `$HOME`  | frece rofi                                           | Frecency indexed database (mostly for rofi)      |
| git            | `$HOME`  |                                                      | Personal                                         |
| hosts/\*       | `/`      |                                                      | Personal                                         |
| hosts/\*-home  | `$HOME`  |                                                      | Personal                                         |
| i3             | `$HOME`  | feh, i3lock-color, jq, maim, mlocate, rofi, ttf-noto, wmctrl | Window manager                           |
| i3blocks       | `$HOME`  | fping, gsimplecal, tff-font-awesome                  | Better system bar                                |
| latexmk        | `$HOME`  |                                                      | Latexmk config                                   |
| lint           | `$HOME`  |                                                      | Linting config                                   |
| mimeapps       | `$HOME`  |                                                      | Choose default app used to open files            |
| mpv            | `$HOME`  |                                                      | Video player                                     |
| ncmpcpp        | `$HOME`  |                                                      | Music player (MPD client)                        |
| nushell        | `$HOME`  | nushell                                              | Structured shell                                 |
| nvim           | `$HOME`  | neovim, python-neovim                                | Better than emacs                                |
| pacdef         | `$HOME`  | paru                                                 | Declarative package management                   |
| picom          | `$HOME`  |                                                      | Compositor                                       |
| polybar        | `$HOME`  | fping, progress, tff-font-awesome, trizen            | Better system bar                                |
| ptpython       | `$HOME`  | ptpython                                             | Python REPL                                      |
| python         | `$HOME`  |                                                      | PYTHONSTARTUP                                    |
| ranger         | `$HOME`  | ranger                                               | CLI file manager                                 |
| readline       | `$HOME`  |                                                      | GNU readline config (vi bindings)                |
| ripgrep        | `$HOME`  | ripgrep                                              | Search utility                                   |
| rofi           | `$HOME`  | rofi                                                 | GUI app/command launcher                         |
| scripts        | `$HOME`  |                                                      | Personal (e.g. `emoji` clipboard copier)         |
| skhd           | `$HOME`  | skhd                                                 | Keyboard shortcuts (MacOS)                       |
| systemd        | `$HOME`  |                                                      | Services                                         |
| termite        | `$HOME`  |                                                      | Terminal emulator                                |
| thunar         | `$HOME`  | thunar                                               | File manager                                     |
| tmux           | `$HOME`  | tmux                                                 | Terminal multiplexer                             |
| tridactyl      | `$HOME`  | firefox                                              | Firefox vim-like browsing                        |
| vim            | `$HOME`  | vim                                                  | Better than emacs                                |
| xmodmap        | `$HOME`  |                                                      | Keyboard remappings (e.g. Caps Lock -> Escape)   |
| xonsh          | `$HOME`  | xonsh                                                | Shell -- Python based!                           |
| zathura        | `$HOME`  | zathura                                              | PDF reader                                       |
| zsh            | `$HOME`  | zplug                                                | Shell                                            |

