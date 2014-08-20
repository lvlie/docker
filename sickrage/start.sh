#!/bin/bash

# if /config doesnt exist, exit
test -d /config || exit 1
# same goes for data
test -d /data || exit 2
# create /config/sickrage if it doesnt exist
test -d /config/sickrage || mkdir /config/sickrage

cd /sickrage

# get latest git data
git pull origin

# start sickrage
/usr/bin/python SickBeard.py --datadir /config/sickrage
