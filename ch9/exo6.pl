#!/usr/bin/env perl
use v5.14;
use warnings;

## read a list of patterns from a file and test them
## each against a user supplied string

die "Usage: $0 <string>\n" unless @ARGV;

my $str = shift @ARGV;

open my $fh, '<', 'patterns.dat' or die "Cannot open file: $!\n";

## save patterns
my %patterns;

while (<$fh>) {
    chomp;
    next if /\A\s*\z/;

    my $regex = eval { qr/$_/ };
    next unless ($regex);

    $patterns{$regex} = $.;
}
    
for (keys %patterns) {
    print "$str: $patterns{$_}\n" if $str =~ $_;
}


__END__
