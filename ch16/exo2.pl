#!/usr/bin/env perl
use v5.14;
use warnings;

## a program to report the access/modification times of files
## in the current directory

my @files = glob("*");

my %access_mod = map { $_ => [(stat $_)[8, 9]] } @files;

for (sort keys %access_mod) {
    printf "%-20s %-20s %-20s\n", $_, @{$access_mod{$_}};
}
