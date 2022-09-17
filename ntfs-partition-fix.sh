partitionPath=/dev/sda4
sudo apt update
sudo apt install ntfs-3g -y
sudo ntfsfix $partitionPath