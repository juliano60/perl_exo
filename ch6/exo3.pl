#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## list all the keys/values in the ENV hash

my $key_len = 0;
for (keys %ENV) {
	if (length($_) > $key_len) {
		$key_len = length($_);
	}
}

for (sort keys %ENV) {
	printf "%*s %s\n", $key_len, $_, $ENV{$_}; 
}
