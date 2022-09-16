#!/bin/bash
dir=~/Downloads/abc
filesString=$(find $dir)
files=($filesString)
for file in ${files[@]}; do
  if [[ -d $file ]]; then
    echo $file
  fi
done