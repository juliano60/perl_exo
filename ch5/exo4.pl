#!/usr/bin/env perl
use v5.14;
use warnings;

## produce a summary of the file coconet.dat
my %bytes_transferred;

sub total_sent {
    my $key = shift;

    my $sum = 0;
    for (keys %{$bytes_transferred{$key}}) {
        $sum += $bytes_transferred{$key}{$_};
    }
    
    $sum;
}

sub by_bytes_transferred {
    my $sum_a = total_sent($a);
    my $sum_b = total_sent($b);

    return $sum_b <=> $sum_a;
}

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
    
for my $source (sort by_bytes_transferred keys %bytes_transferred) {
    print "$source: ", total_sent($source), "\n";

    my $dest = $bytes_transferred{$source};

    for (sort { $dest->{$b} <=> $dest->{$a} } keys %$dest) {
       print "    $_: $dest->{$_}\n"; 
    } 
}


__END__
