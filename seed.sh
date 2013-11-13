#!/usr/bin/env bash

while true; do
	last=`lua ./bitstamp.lua`
	echo "last_price = $last" | awesome-client
	sleep 5
done
