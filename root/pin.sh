#!/bin/sh

echo 'start processing nginx pin...'
cat /opt/nginxdefault_template | sed s/\$1/$1/g > /etc/nginx/conf.d/default.conf

echo 'pin have been created successfull!'
