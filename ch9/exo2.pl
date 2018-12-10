#!/usr/bin/env perl
## Copyright (C) 20XX by Yours Truly
use v5.14;
use warnings;
use utf8;

## a program that replaces the word fred (case-insensitive) an
## a supplied input file and write the result to an output
## file

my $filename = shift @ARGV;

if (!defined($filename)) {
	die "Usage: $0 filename";
}

open my $fh, '<:utf8', $filename or die "Error opening file: $!";

my $out_file = $filename =~ s/\.(\w+)$/.out/r;
open my $out, '>', $out_file or die "Error opening file: $!";

while (<$fh>) {
	s/fred/Larry/ig;
	print $out $_;
}