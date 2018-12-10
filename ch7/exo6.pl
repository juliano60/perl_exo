#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program that prints each line that
## mentions both wilma and fred

while (<STDIN>) {
	chomp;
	
	if (/wilma/ && /fred/) {
		say "$_";
	} 
}