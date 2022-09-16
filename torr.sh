env=dev
if [ $env = 'dev' ]; then
  export $(cat torr.dev.env | xargs)
else
  export $(cat torr.prod.env | xargs)
fi
apt update
apt install curl -y
function getGoogleDriveAccessToken() {
  response=$(curl -d "client_id=$client_id&scope=https://www.googleapis.com/auth/drive.file" https://oauth2.googleapis.com/device/code)
  echo $response
  code=$(python getValueFromJSONStringForKey.py "$response" user_code)
  device_code=$(python getValueFromJSONStringForKey.py "$response" device_code)
  apt-get install python-pip -y
  python -m pip install selenium
  python google-auth-selenium.py $code $email $password
  wait
  response=$(curl -d client_id=$client_id -d client_secret=$client_secret -d device_code=$device_code -d grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Adevice_code https://accounts.google.com/o/oauth2/token)
  echo $response
  wait
  echo $(python getValueFromJSONStringForKey.py "$response" access_token)
}
echo $access_token
if [[ $access_token = '' ]]; then
  access_token=$(getGoogleDriveAccessToken)
  echo $access_token
fi
wait
dir=~/Downloads/abc
filesString=$(find $dir)
files=($filesString)
declare -A filesIds
function createFolder() {
  access_token=$1
  file=$2
  parentPath="${file%/*}"
  parentId=${filesIds[$parentPath]}
  parents=''
  if [[ $parentId != '' ]]; then
    parents="$parentId"
  fi
  echo "file $file\n"
  echo "parentPath $parentPath\n"
  echo "parentId $parentId\n"
  echo "parents $parents\n"
  response=$(
    curl \
      -H "Authorization: Bearer $access_token" \
      -H "Content-Type: application/json" \
      -d "{\"name\": \"$file\", \"parents\": [$parents], \"mimeType\": \"application/vnd.google-apps.folder\"}" \
      "https://www.googleapis.com/drive/v3/files"
  )
  echo $response
  id=$(python getValueFromJSONStringForKey.py "$response" id)
  filesIds["$file"]=$id
  echo "id $id"
  echo "$filesIds["$file"] ${filesIds["$file"]}"
}
for file in ${files[@]}; do
  if [[ -d $file ]]; then
    response=$(createFolder "$access_token" "$file")
    wait
    echo $response
    if [[ $response == *"auth"* ]] && [[ $response == *"error"* ]]; then
      echo "There is error"
      access_token=$(getGoogleDriveAccessToken)
      wait
      echo $access_token
      response=$(createFolder "$access_token" "$file")
      wait
      echo $response
    fi
  fi
done
wait
echo $filesIds