#!/usr/bin/env perl
use v5.14;
use warnings;
use List::Util qw(sum);

sub average {
	if (@_ == 0) { return; }

	return sum(@_) / @_;
}

my @data = (1..10);
my $avg1 = average(@data);
my @fred = grep { $_ > $avg1 } @data; 
say "\@fred is @fred";

@data = (100, 1..10);
my $avg2 = average(@data);
my @barney = grep { $_ > $avg2 } @data; 
say "\@barney is @barney";
