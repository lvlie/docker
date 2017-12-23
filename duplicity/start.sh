#!/bin/bash

while true
 do
  test -d /backup/nas || exit 1
  test -d /config || exit 1
  test -d /data/unifi || exit 1
  test -d /etc/duplicity || exit 1
  test -d /var/log/duplicity || exit 1

  if [ $(date +%H) -eq 02 ] ; then
    echo "It's time, lets backup"
    export PASSPHRASE=$(cat /etc/duplicity/encpw)

    for FS in $(cat /etc/duplicity/filesystems) ; do
      if [ $(date +%d) -eq 01 ] ; then
        echo "It's the first of the month, lets do a full backup for ${FS}" | tee -a /var/log/duplicity/${FS///}.log
        duplicity full ${FS} file:///backup/nas${FS} | tee -a /var/log/duplicity/${FS///}.log
       else
        duplicity ${FS} file:///backup/nas${FS} | tee -a /var/log/duplicity/${FS///}.log
      fi
      echo "Removing backups older than 2M" | tee -a /var/log/duplicity/${FS///}.log
      duplicity remove-older-than 2M --force file:///backup/nas${FS} | tee -a /var/log/duplicity/${FS///}.log
    done

    unset PASSPHRASE
   else
    echo "Not yet time for backup"
    echo "SLEEPING 3600" && sleep 3600
  fi
done
