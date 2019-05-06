#!/bin/zsh

if [ -z $1 ] || [ -z $2 ]; then
  echo "args: <stream url> <file name> <time 00:00:00.000 format>";
  echo "";
  echo "Example: ./script.zsh https://xynta.pisos/stream/here.m3u8 00:01:30";
  exit;
fi


set count = find . -maxdepth 1 -exec echo \; | wc -l
ffmpeg -i $1 -t $3 -c copy $2$count.mp4
