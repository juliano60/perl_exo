#!/usr/bin/env perl
use v5.14;
use warnings;

## order the current directory content by size

my @sorted =
    map $_->{NAME},
    sort { $a->{SIZE} <=> $b->{SIZE} }
    map {NAME => $_,
        SIZE => -s $_ }, glob'*'; 

print "@sorted\n";


__END__
