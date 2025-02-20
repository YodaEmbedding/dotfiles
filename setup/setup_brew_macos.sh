#!/bin/bash


# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "/Users/$(whoami)/.zprofile"


# Install Homebrew packages

brew install coreutils
brew install findutils
brew install git
brew install moreutils
brew install neovim
brew install python
brew install zsh

brew install bat
brew install fd
brew install fzf
brew install htop
brew install lf
brew install ripgrep
brew install sd
brew install stow
brew install tmux
brew install tree
brew install vim
brew install wget

brew install boost
brew install clang
brew install dircolors
brew install ffmpeg
brew install gcc
brew install git-delta
brew install gnupg
brew install imagemagick
brew install mosh
brew install neofetch
brew install nmap
brew install nodejs
brew install openssl@3
brew install pinentry-mac
brew install pipx
brew install ptpython
brew install python@3.11
brew install qview
brew install rust
brew install sqlite
brew install yazi
brew install zoxide

brew install hugo
brew install openfortivpn

# brew install --cask firefox
# brew install --cask google-chrome
# brew install --cask thunderbird

# brew install --cask alacritty
brew install --cask font-iosevka
brew install --cask iterm2
brew install --cask linearmouse
brew install --cask mpv
brew install --cask qview
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask zoom

