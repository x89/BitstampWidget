#!/usr/bin/env sh

while true; do
	last=`lua ./bitstamp.lua`
	echo "last_price = $last" | awesome-client
	sleep 3
done
