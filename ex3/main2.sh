#!/bin/bash

read -r -d '' SampleLog << EOM
192.168.1.33 - - [8/Jan/2021:14:10:18 +0600] "GET /pic/incrediblehulk.gif HTTP/1.1" 404 177 "-" "Mozilla/5.0"
192.168.1.43 - - [8/Jan/2021:14:11:18 +0600] "GET /pic/captainamerica.gif HTTP/1.1" 200 377 "-" "Chrome 3.0"
192.168.2.212 - - [8/Jan/2021:14:11:18 +0600] "GET /pic/batgirl.gif HTTP/1.1" 200 377 "-" "Internet Explorer"
192.168.1.101 - - [8/Jan/2021:14:11:18 +0600] "GET /pic/captainamerica.gif HTTP/1.1" 200 377 "-" "Mozilla/5.1"
192.168.1.33 - - [8/Jan/2021:14:11:18 +0600] "GET /pic/wonderwoman.gif HTTP/1.1" 500 377 "-" "Mozilla/4.0"
EOM

echo $SampleLog\n

####echo $SampleLog | grep -P -o '\S+gif' | sed 's,/pic/,,g' | sed "s/.*/[&]/" | sed 's/$/ with code:/'

echo $SampleLog | grep -oP '\S+gif' |  sed 's,/pic/,,g' | sed "s/.*/[&]/"

echo $SampleLog | grep -oP '\S+gif [^3]*' | cut -f1,3 -d' ' | sed 's/gif/&] with code: [/' | sed 's,/pic/,,g' | sed "s/.*/[&]/"
