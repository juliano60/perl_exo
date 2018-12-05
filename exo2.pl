#!/usr/bin/env perl
use v5.14;
use utf8;
use warnings;

## transform output of perldoc -u -f atan2

my @lines = `perldoc -u -f atan2`;

for (@lines) {
    s/\w<(.+?)>/\U$1/g;
    say;
}

