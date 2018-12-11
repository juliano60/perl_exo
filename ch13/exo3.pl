#!/usr/bin/env perl
use v5.14;
use warnings;

## a program that removes any file mentioned on the command line

die "Usage: $0 <file>..." unless @ARGV;

for (@ARGV) {
    unlink $_ or warn "Could not delete $_: $!\n";
}
