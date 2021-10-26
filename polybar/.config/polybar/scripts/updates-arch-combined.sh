#!/bin/sh

OS_NAME="$(cat /etc/*-release | grep '^NAME=' | head -n1 | cut -d'=' -f2)"

if [[ $OS_NAME != "Arch Linux" ]]; then
    exit 1
fi

updates_arch=$(checkupdates | wc -l)

# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -gt 0 ]; then
    echo "$updates_arch"
else
    echo ""
fi

