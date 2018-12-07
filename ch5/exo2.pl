#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program to output a list of strings in a right justified
## 20 character column

say "Enter a list of strings on separate lines (ctrl-d to end): ";

chomp(my @lines = <STDIN>);

## print ruler
print "\n";
say "1234567890" x 3;

for (@lines) {
	printf "%20s\n", $_;
}
