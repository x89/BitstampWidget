-- Paste the following somewhere above Wibox

last_price = 0.00

btc_colour = "#fff"

-- {{{ Wibox
bitstampwidget = wibox.widget.textbox()

-- Register the Bitstamp timer listner
bitstamp_timer = timer({ timeout = 1 })
bitstamp_timer:connect_signal("timeout", function()
	bitstampwidget:set_markup('<span color="' .. btc_colour ..'">$' .. last_price .. '</span> ')
end)
bitstamp_timer:start()

-- Add "bitstampwidget" to the array of items in your taskbar, under wibox, next to the clock for example.
