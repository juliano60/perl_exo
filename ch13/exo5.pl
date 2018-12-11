#!/usr/bin/env perl
use v5.14;
use warnings;

## a program to list any symbolic link in a specified directory

die "Usage: $0 <dirname>" unless @ARGV;

my $dir = shift @ARGV;

for (glob("$dir/*")) {
    if (-l $_) {
        my $name = readlink $_;
        printf "%s ---> %s\n", $_, $name // "";
    }
}
