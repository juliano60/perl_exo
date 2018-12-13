#!/usr/bin/env perl
use v5.14;
use warnings;

## produce a summary of the file coconet.dat
my %bytes_transferred;

my $filename = 'coconet.dat';

open my $fh, '<', $filename or die "Cannot open file: $!\n";

while (<$fh>) {
    ## skip comments
    next if /\A#/;
    chomp;

    my ($source, $dest, $bytes) = split;
    #print "$source $dest: $bytes\n";
    $bytes_transferred{$source}{$dest} += $bytes;
} 
    
for my $source (sort keys %bytes_transferred) {
    print "$source\n";

    my $dest = $bytes_transferred{$source};

    for (sort keys %$dest) {
       print "    $_: $dest->{$_}\n"; 
    } 
}


__END__
