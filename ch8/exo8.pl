#!/usr/bin/env perl
use v5.14;
use warnings;

## process a log file and output log messages to each corresponding
## file. Messages starting with Gilligan should go to gilligan.info,
## messages starting with Skipper should go to skipper.info etc...

open my $fh, '<', 'data-file.txt' or die "Cannot open file: $!\n";

while (<$fh>) {
    state $handles;

    my ($person) = /(\S+):/;
    my $filename = "\L${person}.info";

    unless ($handles->{$filename}){
        open my $file, '>', $filename or die "Cannot open file: $!\n";

        $handles->{$filename} = $file;
    }

    print {$handles->{$filename}} $_;
}
     

__END__
