#!/usr/bin/env perl

use strict;
use warnings;

my ($prev, $last, $colour) = (0, 0, "#fff");

while ("loop forever") {
	$last=`lua ./bitstamp.lua`;
	next unless $last;
	$last=sprintf '%.2f', $last;

	$colour = "#0f0" if $last > $prev;
	$colour = "#f00" if $prev > $last;

	`echo "last_price = '$last'" | awesome-client`;
	`echo "btc_colour = '$colour'" | awesome-client`;

	$prev=$last;
	sleep 10;
}
