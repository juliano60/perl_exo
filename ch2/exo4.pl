#!/usr/bin/env perl
use v5.14;
use warnings;
use Cwd;
use File::Spec;

## read a list of files in the current directory and convert names
## to their full path specification.

my $cur_dir = getcwd();

for (glob("*")) {
    printf "    %s\n", File::Spec->catfile($cur_dir, $_);
}

__END__
