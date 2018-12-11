#!/usr/bin/env perl
use v5.14;
use warnings;

## identify the oldest file named on the command line

sub oldest {
    my $file = shift;
    my $oldest_age = -M $file;
    
    for (@_) {
        my $age = -M $_;

        if (-e $_ && $age > $oldest_age) {
            ($file, $oldest_age) = ($_, $age);
        }
    }

    return ($file, $oldest_age);
}

die "Usage: $0 <file>...\n" unless @ARGV;

my ($file, $age) = oldest(@ARGV);

printf "%s is the oldest file: %.1f days (%d hours)\n", $file, $age, int($age * 24);
