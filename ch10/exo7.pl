#!/usr/bin/env perl
use v5.14;
use warnings;

## sort a list of words in dictionary order.
## Ignore capitalization and internal punctuaction.

open my $fh, '<', 'data.txt' or die "Cannot open file: $!\n";

chomp(my @words = <$fh>);

my @sorted = 
    map $_->[0],
    sort { $a->[1] cmp $b->[1] }
    map { 
        my $copy = $_;
        $copy =~ tr/A-Z/a-z/;
        $copy =~ tr/a-z//cd;
        [$_, $copy]
        } @words;


for (@sorted) {
    print "$_\n";
}

__END__
