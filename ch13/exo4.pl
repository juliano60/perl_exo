#!/usr/bin/env perl
use v5.14;
use warnings;
use File::Spec;
use File::Basename;

## a program to rename the first argument to the second argument

die "Usage: $0 <old_name> <new_name>" unless @ARGV == 2;

my ($old_name, $dest) = @ARGV;

if (-d $dest) {
    $dest = File::Spec->catfile($dest, basename $old_name);
}

rename $old_name, $dest or
    die "Could not rename $old_name to $dest: $!\n";
