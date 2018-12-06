#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## prompts for two numbers and outputs the product

print 'Enter first number: ';
my $num1 = <STDIN>;

print 'Enter second number: ';
my $num2 = <STDIN>;

say "Result: " . $num1 * $num2;
