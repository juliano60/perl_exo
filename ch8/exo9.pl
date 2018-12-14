#!/usr/bin/env perl
use v5.14;
use warnings;

## a program that print the content of each directory supplied
## on the command line

die "Usage: $0 <dirname>...\n" unless @ARGV;

sub list_dir($) {
    my $dir_fh = shift;

    while (my $entry = readdir $dir_fh) {
        next if ($entry eq '.' or $entry eq '..');
        print "$entry\n";
    }
}

for (@ARGV) {
    unless (-d $_) {
        warn "\"$_\" is not a directory";
        next;
    }

    opendir my $fh, $_ or die "Cannot open dir: $!\n";
    list_dir($fh);
}

__END__
