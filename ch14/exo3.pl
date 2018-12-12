#!/usr/bin/env perl
use v5.14;
use warnings;

## report the positions where a substring is found in a given string

print "Enter a string: ";
chomp(my $str = <STDIN>);

print "Enter a substring to be found: ";
chomp(my $search = <STDIN>);

my $ind = -1;
my @pos = ();

while (1) {
    $ind = index($str, $search, $ind + 1);

    last if $ind == -1;
    push @pos, $ind;
}

for (@pos) {
    say $_;
}
