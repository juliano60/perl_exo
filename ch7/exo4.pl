#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program that prints each line that
## has a word that is capitalised but not
## all capitalised

while (<STDIN>) {
	chomp;
	
	if (/\p{Uppercase}\p{Lowercase}+/) {
		say "$_";
	} 
}