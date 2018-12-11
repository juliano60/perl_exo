#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;
use Module::CoreList;

## a program to list all the modules that came 
## with perl version 5.24

my %modules = %{$Module::CoreList::version{5.024}};

for (sort keys %modules) {
	say "$_ => $modules{$_}";
}