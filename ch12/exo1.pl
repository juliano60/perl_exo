#!/usr/bin/env perl
use v5.14;
use warnings;

## report whether each file is readable, writable, executable or
## doesn't exist for a list of files supplied on the command line

sub test_file ($) {
    my $file = shift;

    if (not -e $file) {
        say "$file does not exist";
    }
    else {
        say "$file exists";
        -r $file and say "$file is readable";
        -w _ and say "$file is writable";
        -x _ and say "$file is executable";
    }
}

die "Usage: $0 <file>...\n" unless @ARGV;

for (@ARGV) {
    test_file $_;
}
