#!/bin/bash

# if /config doesnt exist, exit
test -d /config || exit 1
# same goes for data
test -d /data || exit 2
# create /config/couchpotato if it doesnt exist
test -d /config/plex || mkdir /config/plex
chown -R media:media /config/plex

# remove pid file
rm -f "/config/plex/Library/Application Support/Plex Media Server/plexmediaserver.pid"

# start dbus
rm -rf /var/run/*
mkdir -p /var/run/dbus
dbus-uuidgen --ensure
dbus-daemon --system --fork
sleep 1

# start avahi doesnt work in centos, check later
#avahi-daemon -D
#sleep 1

su - media -c "cd /usr/lib/plexmediaserver && HOME=/config/plex ./start.sh & " 
sleep 5

tail -f /config/plex/Library/Logs/**/*.log
