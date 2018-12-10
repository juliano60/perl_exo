#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program to print the values in the ENV hash.
## output undefined value for environment variables without
## a value.

my $length = 0;
for (keys %ENV) {
	$length = length($_) if length($_) > $length;
}

$ENV{'a'} = undef;
$ENV{'b'} = undef;
$ENV{'c'} = 0;

for (sort keys %ENV) {
	printf "%${length}s %s\n", $_, $ENV{$_} // 'undefined value';
}
