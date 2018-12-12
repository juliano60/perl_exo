#!/usr/bin/env perl
use v5.14;
use warnings;

## a program to report the access/modification times of files
## in the current directory

my @files = glob("*");

my %access_mod = map { $_ => [(stat $_)[8, 9]] } @files;

sub format_time ($) {
    my $tm = shift;
    my ($yy, $mm, $day) = (localtime $tm)[5,4,3];
    return sprintf("%4d-%02d-%02d", $yy+1900, $mm+1, $day);
}


for (sort keys %access_mod) {
    my @times = map { format_time($_) } @{$access_mod{$_}};

    printf "%-20s %-20s %-20s\n", $_, @times;
}
