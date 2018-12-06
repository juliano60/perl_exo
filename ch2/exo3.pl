#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## prompts for a string and a number, outputs the string repeated
## the number of times indicated by the number

print 'Enter a string: ';
chomp(my $str = <STDIN>);

print 'Enter a number: ';
my $num = <STDIN>;

say 'Result: ' . $str x $num;

