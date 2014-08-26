#!/bin/bash

# if /config doesnt exist, exit
test -d /config/httpd || exit 1

# copy conf
cp /config/httpd/proxy.conf /etc/httpd/conf.d/

# sleep 4
sleep 4

# start 
httpd -D FOREGROUND
