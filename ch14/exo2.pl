#!/usr/bin/env perl
use v5.14;
use warnings;

## sort a hash for lastname and then by firstname to break ties

my %last_name = ( 
    fred        => 'flinstone',
    Wilma       => 'Flinstone',
    Barney      => 'Rubble',
    betty       => 'rubble',
    'Bamm-Bamm' => 'Rubble',
    PEBBLES     => 'FLINSTONE'
);

sub by_name {
    "\L$last_name{$a}" cmp "\L$last_name{$b}" or
    "\L$a" cmp "\L$b";
}

for (sort by_name keys %last_name) {
    say "$last_name{$_} $_";
}

