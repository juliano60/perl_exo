#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program to total a list of numbers

sub total {
	my $sum = 0;
	
	for (@_) {
		$sum += $_;
	}
	
	$sum;
}

my @fred = qw{1 3 5 7 9};
my $fred_total = total(@fred);
say "The total of \@fred is $fred_total.";

say "Enter some numbers on separate lines (ctrl-d to end):";
chomp(my @numbers = <STDIN>);

my $user_total = total(@numbers);
say "The total of those numbers is $user_total";