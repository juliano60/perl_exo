#!/usr/bin/env perl
use v5.14;
use warnings;

## read a list of numbers and sort them numerically

say "Enter a list of numbers: ";

my @numbers;
while (<>) {
    push @numbers, split;
}

for (sort { $a <=> $b } @numbers) {
    printf "%10g\n", $_;
}

