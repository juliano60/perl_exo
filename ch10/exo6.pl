#!/usr/bin/env perl
use v5.14;
use warnings;
use Benchmark;

my @files = glob("*");

sub schwart_sort {
    my @sorted = 
            map $_->{NAME},
            sort { $a->{SIZE} <=> $b->{SIZE} }
            map {NAME => $_, SIZE => -s $_ }, @files;
}

sub normal_sort {
    my @sorted = sort { -s $a <=> -s $b } @files;
}

## use the Benchmark module to compare coderefs
my $count = 100_000;

timethis($count, \&normal_sort);

timethis($count, \&schwart_sort);

__END__
