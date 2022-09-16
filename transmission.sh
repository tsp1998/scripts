env=dev
if [ $env = 'dev' ]; then
  export $(cat transmission.dev.env | xargs)
else
  export $(cat transmission.prod.env | xargs)
fi
sudo apt update
sudo apt install transmission-cli -y
tmpfile=$(mktemp)
chmod a+x $tmpfile
echo "
  killall transmission-cli
  ls /
" > $tmpfile
transmission-cli -f $tmpfile -w ~/Downloads $magnet_link