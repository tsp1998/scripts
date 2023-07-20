#!/bin/bash

# Clean user-specific temporary files
rm -rf ~/.cache/*
rm -rf ~/.local/share/Trash/*
rm -rf ~/.thumbnails/*
rm -rf ~/.local/share/gvfs-metadata/*
rm -rf ~/.local/share/recently-used.xbel

# Clean system-wide temporary files
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

# Clean apt cache
sudo apt-get clean

# Remove old versions of installed packages
sudo apt-get autoremove --purge

# Clean browser cache (replace 'firefox' with your preferred browser)
firefox --new-window "about:preferences#privacy"
# Uncomment the above line and modify it for each browser you use.

# Clean thumbnail cache for other applications (modify as needed)
rm -rf ~/.thumbnails/*
rm -rf ~/.cache/mozilla/*
rm -rf ~/.cache/chromium/*
rm -rf ~/.cache/google-chrome/*

# Clean old log files
sudo find /var/log -type f -name "*.gz" -delete

# Clean system journal logs
# sudo journalctl --vacuum-time=7d

# Clean old backups (use with caution)
# sudo rm -rf /backup-directory/*

# Clean old crash reports
sudo rm -rf /var/crash/*

# Clean old package cache
sudo apt-get clean

# Clean unneeded localization files
sudo apt-get autoclean

# Clean Docker data (if you use Docker)
# docker system prune -af

# Clean Snap cache (if you use Snap packages)
# sudo rm -rf ~/snap/*
# sudo rm -rf /var/snap/*

# Clean other non-required directories (add more as needed)
# sudo rm -rf /path/to/directory

# Clean old kernel versions (use with caution)
# sudo apt-get autoremove --purge $(dpkg -l 'linux-*' | awk '/^ii/{print $2}' | grep -E '[0-9]+.[0-9]+.[0-9]+-[0-9]+')

# Clean unused configuration files (use with caution)
# sudo dpkg -P $(dpkg -l | grep '^rc' | awk '{print $2}')

# Clean cache for other applications (modify as needed)
# sudo rm -rf /path/to/application/cache

# Clean system swap files
# sudo swapoff -a && sudo swapon -a

# Clean old user logs (modify as needed)
find /var/log -type f -name "*.log" -mtime +30 -delete

# Clean old system logs (modify as needed)
find /var/log -type f -name "*.log.*" -mtime +30 -delete

# Clean old temporary files in /var
# sudo find /var -type f -name "*~" -delete
# sudo find /var -type f -name "*.bak" -delete
# sudo find /var -type f -name "*.old" -delete

# Clean old temporary files in /tmp
sudo find /tmp -type f -mtime +7 -delete

# Clean systemd journal logs
# sudo journalctl --vacuum-size=100M

# Clean unused locale files
# sudo localepurge

# Clean orphaned packages (use with caution)
# sudo deborphan | xargs sudo apt-get -y remove --purge

# Clean old printer logs (if applicable)
# sudo rm -rf /var/log/cups/*

# Clean old mail logs (if applicable)
# sudo rm -rf /var/log/mail.*

# Clean old proxy logs (if applicable)
# sudo rm -rf /var/log/squid/*

# Clean old system update logs
