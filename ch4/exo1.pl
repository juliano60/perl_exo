#!/usr/bin/env perl
use v5.14;
use warnings;
use List::Util qw(sum);

## a program to total a list of numbers

my @fred = qw{1 3 5 7 9};
my $fred_total = sum(@fred);
say "The total of \@fred is $fred_total.";

say "Enter some numbers on separate lines (ctrl-d to end):";
chomp(my @numbers = <STDIN>);

my $user_total = sum(@numbers);
say "The total of those numbers is $user_total";
