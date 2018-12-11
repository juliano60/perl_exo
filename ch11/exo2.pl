#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;
use Time::Moment;

## a program to compute the difference between now and 
## a date specified on the command line

die "Usage: $0 <year> <month>" unless @ARGV == 2;

my ($year, $month) = @ARGV;

my $tm = Time::Moment->new(
        year    => $year,
        month   => $month
);

my $now = Time::Moment->now;

my $delta_years = $tm->delta_years($now);
my $delta_mon = $tm->delta_months($now) % 12;

printf "%d year%s, %d month%s\n", $delta_years, ($delta_years > 1 ? "s" : ""), 
        $delta_mon, ($delta_mon > 1 ? "s" : "");
