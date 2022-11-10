#!/usr/bin/env bash

URL=$1
DOMAIN=$(echo -n $URL | cut -d "/" -f 3)
if [[ $DOMAIN == "oper.ru" || $DOMAIN == "www.youtube.com" ]]; then
    exec mpv \
        --speed=2 \
        --geometry="$((1920/2))x$((1080/2))+$((1920+1920/2))+$((1080/2))" \
        "$URL" 2>&1
elif [[ $DOMAIN == "www.opennet.ru" ]]; then
    w3m "$URL"
else
    exec qutebrowser --target auto "$URL"
fi
