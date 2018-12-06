#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## reads a list of strings and outputs them in codepoint order

say 'Enter a list of strings (Ctrl-D to end): ';

my @lines = <STDIN>;

print "\n";
for (sort @lines) {
    print;
}
