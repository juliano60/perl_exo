#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program to test if any word ends with the letter
## a. Use named capture.

while (<>) {
	chomp;
	
	if (/(?<LABEL>\w+a)\b/) {
		say "word contains $+{LABEL}";
	}
	else {
		say "No match: |$_|";
	}
}
