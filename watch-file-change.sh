fileOrdirectoryToWatch=$1
commandToRunOnChange=$2
while inotifywait -e close_write $fileOrdirectoryToWatch; do $commandToRunOnChange; done