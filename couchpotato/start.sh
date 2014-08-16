#!/bin/bash

# if /config doesnt exist, exit
test -d /config || exit 1
# same goes for data
test -d /data || exit 2
# create /config/couchpotato if it doesnt exist
test -d /config/couchpotato || mkdir /config/couchpotato

# here is the git checkout
cd /CouchPotatoServer

# get latest git data
git pull origin master

# start couchpotato
/usr/bin/python CouchPotato.py --daemon --data_dir /config/couchpotato

sleep 5

# make sure couchpotato can restart itself without killing the docker container
tail -f /config/couchpotato/logs/*.log
