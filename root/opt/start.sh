#!/bin/sh

python3 /opt/tv/HTTPAceProxy-master/acehttp.py >/dev/null 2>&1 &

while true; do
        sleep 6000
        find /tmp/acehttp.log -depth -type f -mmin +5 -print0 | xargs -0 -r rm -f > /dev/null 2>&1
done
