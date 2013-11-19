#!/usr/bin/env lua
-- Bitstamp widget for Awesome WM 3.5
-- David Trail <bitwidget@trailbeans.eu>

local json = require('dkjson')
local https = require('ssl.https')
local posix = require('posix')

local sleep_time = 2

function bitstamp_table()
	-- Makes an HTTPS request to the bitstamp ticker to get the latest price.
	-- Keys: low, ask, high, volume, timestamp, last, bid
	local resp = table

	assert(https.request{
		url = "https://www.bitstamp.net:443/api/ticker/",
		sink = ltn12.sink.table(resp),
		protocol = "tlsv1",
		timeout = sleep_time
	}, "Couldn't establish a connection.")

	return json.decode(resp[1])
end

local stamp = bitstamp_table()

if stamp then
	print(stamp["last"])
else
	posix.sleep(60) -- Probably went over the rate limit.
end
