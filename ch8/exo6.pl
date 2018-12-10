#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program to print any line that ends in whitespace
## other than just a newline

while (<>) {
	chomp;

	if (/[ ]\z/) {		
		say "$_++";
	}
}