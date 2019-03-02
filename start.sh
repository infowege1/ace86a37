#!/bin/sh

cd /opt/acey-master/ && node . >/dev/null 2>&1 &

while true; do
        sleep 60000
        rm -rf /tmp/v8-compile-cache-0/* >/dev/null 2>&1 &
done
