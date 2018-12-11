#!/usr/bin/env perl
use v5.14;
use warnings;
use Cwd;

## a program to change to a directory supplied on the command line.
## if empty change to the user's home directory.

#die "Usage: $0 <dirname>" unless @ARGV;

my $dir = $ARGV[0] // "";

if ($dir) {
    chdir $dir or (warn "Could not change directory: $!\n" and return);
}
else {
    chdir or (warn "Could not change directory: $!\n" and return);
}

say "Changed directory to : ", getcwd();

for (glob("* .*")) {
    say $_;
}
