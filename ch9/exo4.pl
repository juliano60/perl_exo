#!/usr/bin/env perl
## Copyright (C) 20XX by Yours Truly
use v5.14;
use warnings;
use utf8;

## a program to add a copyright line to a bunch of supplied
## filenames

my $copyright = "## Copyright (C) 20XX by Yours Truly";

my %filenames =  map {($_, 1)} @ARGV;

while (<>) {
	if (/\A## Copyright/) {
		## remove from list of files to process
		delete $filenames{$ARGV};
	}
}

@ARGV = sort keys %filenames;
exit unless @ARGV;	## not interested in STDIN

$^I = ".bak";	## backup filename extension

while (<>) {
	if (/\A#!/) {
		print $_;
		say $copyright;
	}
	else {
		print $_;
	}
}