# folders=$(cat open-explorer.data.txt)
# echo $folders
fileName=open-explorer.data.txt
while IFS= read -r line || [[ -n "$line" ]]; do
  if [[ -d $line ]]; then
    echo opening $line
    # nautilus $line
    # xdg-open $line
    gio open $line
    echo opened $line
  else
    echo "Not a directory: $line"
  fi
done <$fileName
