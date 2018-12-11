#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;
use Time::Moment;

## a program to compute the difference between now and 
## a date specified on the command line

die "Usage: $0 <year> <month>" unless @ARGV == 2;

my ($year, $month) = @ARGV;

say "$year, $month";
