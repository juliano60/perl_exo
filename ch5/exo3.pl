#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

say "Enter column width followed by a list of strings:";
chomp(my $width = <STDIN>);
chomp(my @lines = <STDIN>);

## determine rule length
my $ruler_length = 3;
if (($width / 10) >= 3) {
	$ruler_length = $width / 10 + 1;
}

## print ruler
say("1234567890" x $ruler_length);

for (@lines) {
	printf "%*s\n", $width, $_;
}