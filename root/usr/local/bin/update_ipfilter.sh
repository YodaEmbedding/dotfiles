#!/bin/bash -i

curl -O http://john.bitsurge.net/public/biglist.p2p.gz
rm -f biglist.p2p
7z x biglist.p2p.gz
mv biglist.p2p $HOME/.config/qBittorrent/biglist.p2p
rm biglist.p2p.gz

