#!/bin/bash

# if /backup doesnt exist, exit
test -d /backup || exit 1

# create dbus setup
rm -rf /var/run/*
mkdir -p /var/run/dbus
chown messagebus:messagebus /var/run/dbus
dbus-uuidgen --ensure
dbus-daemon --system --fork
sleep 1

# start avahi in the background
avahi-daemon -D
sleep 1

# start appletalk in the background
/etc/init.d/netatalk start
sleep 3

# create log file (if non-existent) and tail it
touch /var/log/netatalk.log && tail -f /var/log/netatalk.log
