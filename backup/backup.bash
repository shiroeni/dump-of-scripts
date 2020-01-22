#!/bin/bash

# Required predefined env-variables
#   PATH_TO_DIR - path to target directory with required files
#   YD_USERNAME - username of Yandex.Disk
#   YD_PASSWORD - password of Yandex.Disk
#

TIMESTAMP=$(date +%s)
ARCHIVE_NAME="backup_$TIMESTAMP.zip"

echo "Archiving directory"
zip "/tmp/$ARCHIVE_NAME" "$PATH_TO_DIR" 

echo "Sending to Yandex.Disk"
curl -T "/tmp/$ARCHIVE_NAME" --user "$YD_USERNAME:$YD_PASSWORD" "https://webdav.yandex.ru/$ARCHIVE_NAME"

echo "Cleanup..."
rm "/tmp/$ARCHIVE_NAME"
