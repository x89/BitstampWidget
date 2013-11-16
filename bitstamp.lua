#!/usr/bin/env lua
-- Bitstamp widget for Awesome WM 3.5
-- David Trail <bitwidget@trailbeans.eu>

local json = require('dkjson')
local https = require('ssl.https')

function bitstamp_table()
	-- Makes an HTTPS request to the bitstamp ticker to get the latest price.
	-- Keys: low, ask, high, volume, timestamp, last, bid
	local resp = table

	https.request{
		url = "https://www.bitstamp.net:443/api/ticker/",
		sink = ltn12.sink.table(resp),
		protocol = "tlsv1"
	}

	assert(resp[1])

	return json.decode(resp[1])
end

local stamp = bitstamp_table()

--[[
if not stamp then
	local posix = require('posix')
	posix.sleep(60)
end
--]]

print(stamp["last"])
