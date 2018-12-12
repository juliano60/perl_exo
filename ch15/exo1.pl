#!/usr/bin/env perl
use v5.14;
use warnings;

## a program to list the content of the root directory using system

chdir '/' or die "Cannot cd to /: $!\n";

!system 'ls', '-l', 'a' or die "Child error\n";

## to get the child exist status
## $ret = system(...)
## print $ret >> 8;


