currentPath="$( cd -- "$(dirname "$1")" >/dev/null 2>&1 ; pwd -P )";
readarray -t args < "$currentPath/data/install-local-deb.txt";
for debPath in "${args[@]}"; do
  echo "installing ${debPath}";
  sudo apt update
  sudo apt install "$debPath"
  sudo apt-get install --fix-broken
  echo "installed ${debPath}";
done
