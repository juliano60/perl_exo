#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program that prints each line of its input
## that mention fred or Fred

while (<STDIN>) {
	chomp;
	if (/fred/i) {
		say "$_";
	}
}
