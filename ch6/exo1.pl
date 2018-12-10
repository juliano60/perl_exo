#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## ask the user for a name and report
## the corresponding family name

my %family_names = (
	fred 	=> 'flinstone',
	barney 	=> 'rubble',
	wilma	=> 'flinstone',
);

print "Enter a name: ";
chomp(my $name = <STDIN>);

if (exists $family_names{$name}) {
	say "${name}'s family name is $family_names{$name}";
}
