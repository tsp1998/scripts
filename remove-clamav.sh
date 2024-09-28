#!/bin/bash

sudo systemctl stop clamav-freshclam
sudo apt remove --purge clamav
sudo apt remove --purge clamav clamav-freshclam clamav-freshclam
sudo apt autoremove
sudo rm -rf /etc/clamav
sudo rm -rf /etc/clamav /var/log/clamav /usr/local/etc/freshclam.conf 