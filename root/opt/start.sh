#!/bin/sh

python3 /opt/tv/HTTPAceProxy-master/acehttp.py >/dev/null 2>&1 &

while true; do
        sleep 21600
        cd /opt/acelist/ && php as.php /opt/acelist/playlists/as > /dev/null 2>&1
done

