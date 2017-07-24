#!/bin/sh

test -d /config/plexpy || exit 1

cd /opt/plexpy

git pull origin

/usr/bin/python PlexPy.py --nolaunch --datadir=/config/plexpy