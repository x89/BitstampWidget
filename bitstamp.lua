#!/usr/bin/env lua
-- Bitstamp widget for Awesome WM 3.5
-- 12/11/13 - David Trail <bitwidget@trailbeans.eu>

local json = require('dkjson')
local https = require('ssl.https')

function bitstamp_table()
	-- Keys: low, ask, high, volume, timestamp, last, bid
	-- for k, v in pairs(bitstamp_table) do print(k, v) end
	local resp = table

	https.request{
		url = "https://www.bitstamp.net:443/api/ticker/",
		sink = ltn12.sink.table(resp),
		protocol = "tlsv1"
	}

	assert(resp[1])

	return(json.decode(resp[1]))
end


stamp = bitstamp_table()

-- Keys: low, ask, high, volume, timestamp, last, bid
-- for k, v in pairs(bitstamp_table()) do print(k, v) end

print(stamp["last"])
