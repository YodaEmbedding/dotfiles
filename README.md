# Dotfiles

[![Click for full album.](https://i.imgur.com/tJlW7l1.gif)](https://imgur.com/a/W5QwA)

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

| Name           | Stow directory | Dependencies                                   | Details                                          |
| :------------- | :------------- | :--------------------------------------------- | :----------------------------------------------- |
| bash           | `$HOME`        |                                                | Shell                                            |
| colors         | `$HOME`        |                                                | Terminal and rofi colors                         |
| compton        | `$HOME`        |                                                | Compositor                                       |
| dunst          | `$HOME`        |                                                | Notification manager                             |
| git            | `$HOME`        |                                                | Personal                                         |
| i3             | `$HOME`        | feh, i3lock-color, jq, mlocate, rofi, ttf-noto | Window manager                                   |
| i3blocks       | `$HOME`        | fping, gsimplecal, tff-font-awesome            | Better i3 bar                                    |
| mimeapps       | `$HOME`        |                                                | Choose default app used to open files            |
| mpv            | `$HOME`        |                                                | Video player                                     |
| PC-Mordor-Arch | `/`            |                                                | Personal                                         |
| root           | `/`            |                                                | Personal scripts (e.g. `emoji` clipboard copier) |
| termite        | `$HOME`        |                                                | Terminal emulator                                |
| vim            | `$HOME`        | neovim, neovim-plug, python-neovim             | Better than emacs                                |
| xmodmap        | `$HOME`        |                                                | Keyboard remappings (e.g. Caps Lock -> Escape)   |
| zsh            | `$HOME`        | zplug                                          | Shell                                            |

