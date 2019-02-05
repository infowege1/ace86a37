#!/bin/sh

#MAIN_pin="$RANDOM"
MAIN_pin="$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 8)"
./pin.sh $MAIN_pin
