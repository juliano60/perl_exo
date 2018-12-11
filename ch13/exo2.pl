#!/usr/bin/env perl
use v5.14;
use warnings;
use Cwd;
use File::Spec;

## change directory to a user supplied directory
## and list its content. Do it using a directory handle.

my $dir = shift @ARGV;

if ($dir) {
    chdir $dir or (warn "Cannot change directory: $!\n" and return);
}
else {
    chdir or (warn "Cannot change directory: $!\n" and return);
}

my $cwd = getcwd();
say "Cd to ", $cwd;

opendir my $dh, $cwd or die "Cannot open directory: $!\n";

while ($_ = readdir $dh) {
    my $name = File::Spec->catfile($cwd, $_);
    say "$name";
}
