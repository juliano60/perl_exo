#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program to compute the circumference of a circle

sub PI {
    3.141592654;
}

sub circumference($) {
    my $r = shift;
    return 2 * PI() * $r;    
}

print 'Enter a radius: ';
chomp(my $radius = <STDIN>);

$radius = 0 if $radius < 0;

say 'Circle circumference: ' . circumference($radius);

