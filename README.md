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

| Name           | Stow directory | Details        |
| :------------: | :------------- | :------------- |
| bash           | `$HOME`        |                |
| colors         | `$HOME`        | Terminal and rofi colors |
| compton        | `$HOME`        |                |
| dunst          | `$HOME`        |                |
| git            | `$HOME`        | Personal       |
| i3             | `$HOME`        |                |
| i3blocks       | `$HOME`        | Better i3 bar  |
| mimeapps       | `$HOME`        | Choose default app used to open files |
| mpv            | `$HOME`        |                |
| PC-Mordor-Arch | `/`            | Personal       |
| root           | `/`            | Personal scripts (e.g. `emoji` clipboard copier) |
| termite        | `$HOME`        |                |
| vim            | `$HOME`        |                |
| xinit          | `$HOME`        | Default. I don't know why I included it in my dotfiles... |
| xmodmap        | `$HOME`        | Keyboard remappings (e.g. Caps Lock -> Escape) |
| zsh            | `$HOME`        |                |

