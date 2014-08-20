#!/bin/bash

# if /config doesnt exist, exit
test -d /config || exit 1
# same goes for data
test -d /data || exit 2
# create /config/sickbeard if it doesnt exist
test -d /config/sickbeard || mkdir /config/sickbeard

cd /sickbeard

# get latest git data
git pull origin master


for file in config.ini sickbeard.db
 do
	if [ -f /config/sickbeard/${file} ]
	# if $file is in /config/sickbeard, remove existing one in docker image
	 then
		rm -rf /sickbeard/${file}
	# otherwise move the one from docker image to /config/sickbeard
	 else
		mv -f /sickbeard/${file} /config/sickbeard/${file}
	fi
done

# link /config version to /sickbeard
ln -sf /config/sickbeard/config.ini /sickbeard/config.ini
ln -sf /config/sickbeard/sickbeard.db /sickbeard/sickbeard.db

# start sickbeard
/usr/bin/python SickBeard.py
