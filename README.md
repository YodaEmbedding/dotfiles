# Dotfiles

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

    stow -t / root

## Configuration Details

List of configs, which directories these belong in, and other details.

| Name           | Stow dir | Dependencies                                         | Details                                          |
| :------------- | :------- | :--------------------------------------------------- | :----------------------------------------------- |
| alacritty      | `$HOME`  | alacritty                                            | Terminal emulator                                |
| aliases        | `$HOME`  |                                                      | Shell aliases                                    |
| bash           | `$HOME`  |                                                      | Shell                                            |
| colors         | `$HOME`  |                                                      | Terminal and rofi colors                         |
| devilspie      | `$HOME`  | devilspie, devilspie2                                | Window tweaker                                   |
| dunst          | `$HOME`  |                                                      | Notification manager                             |
| frece          | `$HOME`  | frece rofi                                           | Frecency indexed database (mostly for rofi)      |
| git            | `$HOME`  |                                                      | Personal                                         |
| i3             | `$HOME`  | feh, i3lock-color, jq, maim, mlocate, rofi, ttf-noto, wmctrl | Window manager                           |
| i3blocks       | `$HOME`  | fping, gsimplecal, tff-font-awesome                  | Better system bar                                |
| latexmk        | `$HOME`  |                                                      | Latexmk config                                   |
| lint           | `$HOME`  |                                                      | Linting config                                   |
| mimeapps       | `$HOME`  |                                                      | Choose default app used to open files            |
| mpv            | `$HOME`  |                                                      | Video player                                     |
| ncmpcpp        | `$HOME`  |                                                      | Music player (MPD client)                        |
| nvim           | `$HOME`  | neovim, python-neovim                                | Better than emacs                                |
| PC-Mordor-Arch | `/`      |                                                      | Personal                                         |
| picom          | `$HOME`  |                                                      | Compositor                                       |
| polybar        | `$HOME`  | fping, progress, tff-font-awesome, trizen            | Better system bar                                |
| ranger         | `$HOME`  | ranger                                               | CLI file manager                                 |
| rofi           | `$HOME`  | rofi                                                 | GUI app/command launcher                         |
| root           | `/`      |                                                      | PYTHONSTARTUP                                    |
| scripts        | `$HOME`  |                                                      | Personal (e.g. `emoji` clipboard copier)         |
| systemd        | `$HOME`  |                                                      | Services                                         |
| termite        | `$HOME`  |                                                      | Terminal emulator                                |
| tmux           | `$HOME`  | tmux                                                 | Terminal multiplexer                             |
| tridactyl      | `$HOME`  | firefox                                              | Firefox vim-like browsing                        |
| vim            | `$HOME`  | vim                                                  | Better than emacs                                |
| xmodmap        | `$HOME`  |                                                      | Keyboard remappings (e.g. Caps Lock -> Escape)   |
| zathura        | `$HOME`  | zathura                                              | PDF reader                                       |
| zsh            | `$HOME`  | zplug                                                | Shell                                            |

