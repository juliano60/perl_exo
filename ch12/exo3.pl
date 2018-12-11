#!/usr/bin/env perl
use v5.14;
use warnings;

## use stacked file tests to list files that are readable, writable
## and owned by you.

die "Usage: $0 <file>...\n" unless @ARGV;

for (@ARGV) {
    if (-r -w -o $_) {
        say "$_ is readable, writable and owned by you";
    }
}
