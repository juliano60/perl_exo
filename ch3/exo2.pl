#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## reads a list of numbers and outputs a list of persons from a list
## corresponding to those numbers

my @people = qw(fred betty barney dino wilma pebbles bamm-bamm);

say 'Enter a list of integers (Ctrl-D to end): ';

chomp(my @numbers = <STDIN>);

print "\n";
for (@numbers) {
    if (($_-1) < 0 || ($_-1) > $#people) {
        warn "Number out of range\n";
        next;
    }

    say $people[$_-1];
} 
