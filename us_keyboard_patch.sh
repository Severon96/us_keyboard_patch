#!/usr/bin/env bash

# root check
if [ "$EUID" -ne 0 ]
  then echo "Please run as root."
  exit
fi

# copy patch to keyboard data folder
cp us_patch.diff /usr/share/X11/xkb/symbols

# change directory
pushd /usr/share/X11/xkb/symbols/us_patch.diff

# create a backup of the original us keyboard data
cp us us.backup

# apply the patch
git apply us_patch.diff

# reconfigure X11 keyboard extension data
dpkg-reconfigure xkb-data

# restore directory
popd
