#!/usr/bin/env lua
-- Bitstamp widget for Awesome WM 3.5

local json = require('dkjson')
local https = require('ssl.https')
local posix = require('posix')

function bitstamp_table()
	-- Makes an HTTPS request to the bitstamp ticker to get the latest price.
	-- Keys: low, ask, high, volume, timestamp, last, bid
	local resp = table

	assert(https.request{
		url = "https://www.bitstamp.net:443/api/ticker/",
		sink = ltn12.sink.table(resp),
		protocol = "tlsv1"
	}, "Couldn't establish a connection.")

	--assert(json.decode(resp[1]), "API call returned failure.")

	return assert(json.decode(resp[1]))
end

local stamp = bitstamp_table()

if stamp then
	print(stamp["last"])
end
