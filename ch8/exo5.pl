#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program to test if any word ends with the letter
## a. Use named capture.

while (<>) {
	chomp;
	
	if (/(?<LABEL>\w+a)\b(?<WORD>.{0,5})/) {
		say "words contains $+{LABEL} and $+{WORD}";
	}
	else {
		say "No match: |$_|";
	}
}
