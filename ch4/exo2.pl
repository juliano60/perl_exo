#!/usr/bin/env perl
use v5.14;
use warnings;
use List::Util qw(sum);

my $sum = sum(1..1000);
say "The total is $sum";
