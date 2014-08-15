#!/bin/bash

# if /config doesnt exist, exit
test -d /config || exit 1
# same goes for data
test -d /data || exit 2

sabnzbdplus --daemon --config-file /config -s 0.0.0.0:8080
sleep 5

tail -f /config/logs/sabnzbd.*
