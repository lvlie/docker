#!/bin/bash

# if /config doesnt exist, exit
test -d /config || exit 1
# same goes for data
test -d /data || exit 2
# create /config/sickbeard if it doesnt exist
test -d /config/sickbeard || mkdir /config/sickbeard

cd /sickbeard

# get latest git data
git pull origin

# start sickbeard
/usr/bin/python SickBeard.py --datadir /config/sickbeard
