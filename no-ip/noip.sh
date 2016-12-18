#!/bin/bash

# Search for custom config file, if it doesn't exist, copy the default one
if [ ! -f /config/noip/noip.conf ]; then
  echo "Place config file in mounted dir under /config/noip/noip.conf" 
  exit 1
fi

. /config/noip/noip.conf

if [ -z "$DOMAINS" ]; then
  echo "DOMAINS must be defined in noip.conf"
  exit 1
elif [ "$DOMAINS" = "foo.ddns.net" ]; then
  echo "Please enter your domain in noip.conf"
  exit 1
fi

if [ -z "$USERNAME" ]; then
  echo "USERNAME must be defined in noip.conf"
  exit 1
elif [ "$USERNAME" = 'email@example.com' ]; then
  echo "Please enter your username in noip.conf"
  exit 1
fi

if [ -z "$PASSWORD" ]; then
  echo "PASSWORD must be defined in noip.conf"
  exit 1
elif [ "$PASSWORD" = "your password here" ]; then
  echo "Please enter your password in noip.conf"
  exit 1
fi

if [ -z "$INTERVAL" ]; then
  INTERVAL='30m'
fi

if [[ ! "$INTERVAL" =~ ^[0-9]+[mhd]$ ]]; then
  echo "INTERVAL must be a number followed by m, h, or d. Example: 5m"
  exit 1
fi

USER_AGENT="lvlie docker no-ip/.1 $USERNAME"

while true
do
  echo [$(date '+%b %d %X')]
  RESPONSE=$(curl -S -s -k --user-agent "$USER_AGENT" -u "$USERNAME:$PASSWORD" "https://dynupdate.no-ip.com/nic/update?hostname=$DOMAINS" 2>&1)

  # Sometimes the API returns "nochg" without a space and ip address. It does this even if the password is incorrect.
  if [[ $RESPONSE =~ ^(good|nochg) ]] ; then
    echo "No-IP successfully called. Result was \"$RESPONSE\"."
  elif [[ $RESPONSE =~ ^(nohost|badauth|badagent|abuse|!donator) ]] ; then
    echo "Something went wrong. Check your settings. Result was \"$RESPONSE\"."
    echo "For an explanation of error codes, see http://www.noip.com/integrate/response"
    exit 2
  elif [[ $RESPONSE =~ ^911 ]] ; then
    echo "Server returned "911". Waiting for 30 minutes before trying again."
    sleep 1800
    continue
  else
    echo "Couldn't update. Trying again in 5 minutes. Output from curl command was \"$RESPONSE\"."
  fi

  sleep $INTERVAL
done
