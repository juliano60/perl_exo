#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## reads a list of strings and prints out the list in reversed order

say 'Enter a list of words (Ctrl-D to end):';
my @lines = <STDIN>;

print "\n", reverse @lines;

