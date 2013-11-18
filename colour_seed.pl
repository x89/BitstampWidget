#!/usr/bin/env perl

my $prev = 0;
my $colour = "#fff";
do {
	$last=`lua ./bitstamp.lua`;
	$last=sprintf '%.2f', $last;

	$colour = "#0f0" if $last > $prev;
	$colour = "#f00" if $prev > $last;

	`echo "last_price = '$last'" | awesome-client`;
	`echo "btc_colour = '$colour'" | awesome-client`;

	$prev=$last;
	sleep 2;
} while 1
