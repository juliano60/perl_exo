#!/usr/bin/env perl
use v5.14;
use warnings;
use Data::Dumper;
use Storable qw(nstore retrieve);

## save a data structure to disk using Storable

my $filename = 'bytes_stats.dat';
my $all = '**to-all**';

die "Usage: $0 <filename>" unless @ARGV;

sub build_structure {
    my $bytes_transferred;

    while (<>) {
        ## skip comments
        next if /\A#/;

        chomp;
        my ($source, $dest, $bytes) = split;
        $bytes_transferred->{$source}{$dest} += $bytes;
        $bytes_transferred->{$source}{$all} += $bytes;
    }

    return $bytes_transferred;
}

my $bytes_transferred;

if (-e $filename) {
    ## reconstruct data
    print "Loading data...\n";
    $bytes_transferred = eval { retrieve $filename };
    die "Error loading file: $@" if $@;

    print "Test: ", $bytes_transferred->{'gilligan.crew.hut'}{$all}, "\n";
}
else {
    print "Storing data...\n";
    $bytes_transferred = &build_structure;
    eval { nstore $bytes_transferred, $filename };
    die "Error storing file: $@" if $@;
}

print Dumper($bytes_transferred);


__END__
