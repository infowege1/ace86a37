#!/bin/sh

/opt/acestream/acestream.start >/dev/null 2>&1 &

while true; do
        sleep $1
        rm -rf /opt/acestream/androidfs/acestream.engine/.ACEStream/collected_torrent_files/*
done
