#!/bin/bash
cd "$(dirname "$0")"
TIMESTAMP=$(TZ=":US/Central" date +%Y-%m-%d_%R:%S)
FILENAME=$(echo $TIMESTAMP.zip)
mkdir -p /storage/backups
zip -r /storage/backups/$FILENAME world
cp /storage/backups/$FILENAME /storage/IO-Server/latest-world-backup.zip
sh push.sh
