#!/usr/bin/env perl
use v5.14;
use warnings;

## execute an external command and send output to ls.out
## and error to ls.err

open STDOUT, '>', 'ls.out' or die "Cannot redirect STDOUT: $!\n";
open STDERR, '>', 'ls.err' or die "Cannot redirect STDERR: $!\n";

chdir '/' or die "Cannot cd: $!\n";
exec 'ls', '-l', 'a' or die "Child error\n";
