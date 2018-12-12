#!/usr/bin/env perl
use v5.14;
use warnings;

## filter filenames supplied on the command line by selecting
## those that are less than 1000 bytes.

my @files = grep { -s $_ < 1000 } @ARGV;

print "Files: \n", map { sprintf "    %s\n", $_ } @files;

__END__
