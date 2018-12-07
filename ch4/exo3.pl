#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program to determine the list of numbers of the
## average of a supplied list.

sub total {
	my $sum = 0;
	
	for (@_) {
		$sum += $_;
	}
	
	return $sum;
}

sub average {
	if (@_ == 0) { return; }

	return total(@_) / @_;
}

sub above_average {
	my $avg = average(@_);

	my @res = ();
	for (@_) {
		push @res, $_ if $_ > $avg;
	}
	
	return @res;
}

my @fred = above_average(1..10);
say "\@fred is @fred";

my @barney = above_average(100, 1..10);
say "\@barney is @barney";