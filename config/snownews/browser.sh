#!/usr/bin/env bash

URL=$1
DOMAIN=$(echo -n $URL | cut -d "/" -f 3)
if [[ $DOMAIN == "oper.ru" ]]; then
    exec mpv --speed=2 "$URL" 2>&1
else
    exec qutebrowser --target auto "$URL"
fi
