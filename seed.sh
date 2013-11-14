#!/usr/bin/env sh

while true; do
	last=`lua ./bitstamp.lua`
	last=$(printf '%.2f' $last)
	echo "last_price = '$last'" | awesome-client
#	echo "Updated to $last"
	sleep 2
done
