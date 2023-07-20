echo 'stopping clamav-freshclam service'
sudo systemctl stop clamav-freshclam
echo 'stopped clamav-freshclam service'
sudo mkdir /var/log/clamav/
sudo touch /var/log/clamav/freshclam.log
sudo chmod a+w /var/log/clamav/freshclam.log
echo 'starting freshclam update'
sudo freshclam
echo 'freshclam update done'
sudo rm /var/log/clamav/freshclam.log
echo 'starting clamav-freshclam service'
sudo systemctl start clamav-freshclam
echo 'started clamav-freshclam service'
