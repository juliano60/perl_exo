#!/usr/bin/env perl
use v5.14;
use warnings;
use Data::Dumper;
use JSON;

## save a data structure to disk using JSON

my $filename = 'bytes_stats.json';
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
    open my $fh, '<:utf8', $filename or die "Cannot open file: $!\n";

    my $encoded = <$fh>;

    $bytes_transferred = eval { decode_json $encoded };
    die "Error loading file: $@" if $@;

    print "Test: ", $bytes_transferred->{'gilligan.crew.hut'}{$all}, "\n";
}
else {
    print "Storing data...\n";
    $bytes_transferred = &build_structure;

    open my $fh, '>:utf8', $filename or die "Cannot open file: $!\n";
    my $encoded = eval { encode_json $bytes_transferred };
    die "Error encoding: $@" if $@;

    print $fh $encoded;
}

print Dumper($bytes_transferred);


__END__
