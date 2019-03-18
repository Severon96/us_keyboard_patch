mv us_patch.diff /usr/share/X11/xkb/symbols
cd /usr/share/X11/xkb/symbols/us_patch.diff
cp us us.backup
git apply us_patch.diff
sudo dpkg-reconfigure xkb-data