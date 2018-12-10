#!/usr/bin/env perl
## Copyright (C) 20XX by Yours Truly
use v5.14;
use warnings;
use utf8;

## a program to match three copies of whatever
## is stored in $what

my $what = 'fred|barney';

while (<>) {
	chomp;
	
	if (/($what){3}/) {
		say "Matched: $_";
	}
}