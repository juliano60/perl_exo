#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program to calculate the sum of numbers of 1 to 1000

sub total {
	my $sum = 0;
	
	for (@_) {
		$sum += $_;
	}
	
	$sum;
}

my $sum = total(1..1000);
say "The total is $sum";
