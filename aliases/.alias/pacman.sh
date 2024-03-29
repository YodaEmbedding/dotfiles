### PACKAGE MANAGEMENT ###

# Pacman
alias sp='sudo pacman'
alias sps='sudo pacman -S'
alias orphans='pacman -Qtdq'

# AUR package managers: paru
alias parus='paru -S'
alias paruq='paru -Qs'
alias paruss='paru -Ss'

# AUR package managers: pikaur
alias pk='pikaur'
alias pkq='pikaur -Qs'
alias pks='pikaur -S --noconfirm'
alias pku='pikaur -Syu'

# AUR package managers: trizen
alias tz='trizen'
alias tzq='trizen -Qs'
alias tzs='trizen --noedit -S'
alias tzu='trizen --noedit -Syu'

# AUR package managers: yay
alias yayq='yay -Qs'
alias yays='yay -S --noconfirm --nocleanmenu --nodiffmenu --noeditmenu --noredownload --norebuild --needed'
alias yayu='yay -Syu --noconfirm --nocleanmenu --nodiffmenu --noeditmenu --noredownload --norebuild --needed --ignore="$(tr "\n" "," < ~/.pkgignorelist)"'
alias yaya='yay -aSyu --noconfirm --nocleanmenu --nodiffmenu --noeditmenu --noredownload --norebuild --needed --ignore="$(tr "\n" "," < ~/.pkgignorelist)"'

# AUR: misc
aururl() {
  xdg-open "https://aur.archlinux.org/packages/$1"
}

# Homebrew
alias bi='brew install'
alias bic='brew install --cask'
