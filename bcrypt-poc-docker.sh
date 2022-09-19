function runDockerCommand() {
  echo "executing $1" 
  eval $1
  echo "done $1" 
}
declare -a fileNames=('bcrypt-poc-10' 'bcrypt-poc-12' 'bcrypt-poc-14' 'bcrypt-poc-16' 'bcrypt-poc-18')
declare -a images=('ubuntu' 'fedora' 'archlinux' 'centos' 'elementary/docker')
for i in ${images[@]}; do
  for j in ${fileNames[@]}; do
    runDockerCommand "docker run -it -v ~/TSP/Node/bcrypt-poc:/data $i ./data/$j"
  done
  docker system prune -f
done