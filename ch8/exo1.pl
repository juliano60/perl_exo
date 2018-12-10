#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

while (<>) {
	chomp;
	
	if (/match/) {
		say "Matched |$`<$&>$'|";
	}
	else {
		say "No match: |$_|";
	}
}
