#!/usr/bin/bash
# Generates new map for minecraft server with mapcraft

if [ -d "/home/minecraft/output" ]; then
  echo "Drop old renders";
  rm -rf /home/minecraft/output; true
fi

echo "Render new map";
/usr/local/bin/mapcrafter -c render.conf -j 2

# TODO: use symlinks in mapcrafter
echo "Remove old render"
rm -rf /var/www/html/*

echo "Copy new render"
cp -r /home/minecraft/output /var/www/html

