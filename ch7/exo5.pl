#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program that prints each line that
## has two same nonwhitespace characters
## next to each other.

while (<STDIN>) {
	chomp;
	
	if (/(\S)\1/) {
		say "$_";
	} 
}