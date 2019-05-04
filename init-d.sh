#!/bin/sh
### BEGIN INIT INFO
# Provides:          astra
# Required-Start:    $network $syslog $named
# Required-Stop:     $network $syslog $named
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Astra TV streaming software
### END INIT INFO

if [ -z "$1" ] ; then
    echo "Usage: $0 [start|stop|restart]"
    exit 0
fi

PORT="4000"
APP="astra-$PORT"
BINFILE="/usr/bin/astra"
PIDFILE="/var/run/$APP.pid"
LOGFILE="/var/log/$APP.log"
CFGFILE="/etc/astra/$APP.conf"

if [ "$1" = "start" ]; then
    if [ -f $PIDFILE ]; then
        kill $(cat $PIDFILE)
        sleep 1
    fi
    ulimit -n 65536
    $BINFILE -c $CFGFILE -p $PORT --pid $PIDFILE --log $LOGFILE --daemon
elif [ "$1" = "stop" ]; then
    if [ -f $PIDFILE ]; then
        kill $(cat $PIDFILE)
    fi
elif [ "$1" = "restart" ]; then
    $0 start
else
    exec $0
fi

exit 0
