#!/bin/sh

echo 'start processing nginx pin...'
cat /opt/default_template | sed s/\$1/$1/g > /opt/acey-master/config/main.yaml

echo 'pin have been created successfull!'
