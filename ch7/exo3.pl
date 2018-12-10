#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program that prints each line that contains
## a period.

while (<STDIN>) {
	chomp;
	if (/\./) {
		say "$_";
	}
}
