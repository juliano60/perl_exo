#!/usr/bin/env perl
use v5.14;
use warnings;

## read a list of strings from the file sample_test.txt
## and let the user match using regular expresssions

my @data;
my $filename = 'sample_text.txt';

open my $fh, '<', $filename or die "Cannot open file: $!\n";

while (<$fh>) {
    push @data, split;
}

while (1) {
    print 'Enter a pattern: ';
    chomp(my $regex = <STDIN>);

    ## exit on a blank line
    $regex =~ /\A\s*\z/ && last;

    eval {$regex = qr($regex); };
    warn "Pattern invalid: $@\n" if $@;

    my @matches = grep { /$regex/ } @data;

    if (@matches) {
        say "Number of matches: ", scalar(@matches);
        say $_ for (@matches);
    }
    else {
        say "No match found.";
    }
}
