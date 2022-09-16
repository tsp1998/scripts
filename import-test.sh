env=dev
if [ $env = 'dev' ]; then
  export $(cat import-test.dev.env | xargs)
else
  export $(cat import-test.prod.env | xargs)
fi
echo $name