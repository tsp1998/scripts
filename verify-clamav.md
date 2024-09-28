verify (before install)

gpg --import cisco-talos.gpg
gpg --verify clamav-1.4.1.linux.x86_64.deb.sig

conf copy and modify (after install)
sudo apt install clamav-daemon clamav-freshclam
clamconf -g freshclam.conf > freshclam.conf
clamconf -g clamd.conf > clamd.conf
clamconf -g clamav-milter.conf > clamav-milter.conf
sudo touch /var/log/freshclam.log
sudo chmod 600 /var/log/freshclam.log 
sudo chown clamav /var/log/freshclam.log 
freshclam -d
groupadd clamav
sudo cp /usr/local/etc/freshclam.conf.sample /usr/local/etc/freshclam.conf
sudo vi /usr/local/etc/freshclam.conf
sudo freshclam