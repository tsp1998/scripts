sudo apt-get autoremove
sudo du -sh /var/cache/apt 
sudo apt-get autoclean
sudo apt-get clean
journalctl --disk-usage
sudo journalctl --vacuum-time=3d
du -h /var/lib/snapd/snaps
source 'remove-old-snaps.sh'
du -h /var/lib/snapd/snaps
du -sh ~/.cache/thumbnails
rm -rf ~/.cache/thumbnails/*