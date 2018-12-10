#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program to test if any word ends with the letter
## a

while (<>) {
	chomp;
	
	if (/(\b\w*a\b)/) {
		say "\$1 contains $1";
	}
	else {
		say "No match: |$_|";
	}
}
