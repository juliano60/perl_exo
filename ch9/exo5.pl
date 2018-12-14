#!/usr/bin/env perl
use v5.14;
use warnings;

## a program to return the rightmost match given a string and a series
## of patterns.

sub rightmost {
    my ($str, $patterns) = @_;

    my $pos = -1;
    my $key;

    for (sort keys %$patterns) {
        if ($str =~ $patterns->{$_}) {
            my $curr = $-[0];

            if ($curr > $pos) {
                $pos = $curr;
                $key = $_;
            }
        }
    }

    return $key;
}

my %patterns = (
    Gilligan    => qr/(?:Willie )?Gilligan/,
    'Mary-Ann'  => qr/Mary-Ann/,
    Ginger      => qr/Ginger/,
    Professor   => qr/(?:The )?Professor/,
    Skipper     => qr/Skipper/,
    'A Howell'  => qr/Mrs?\. Howell/,
);

my $key = rightmost(
        'There is Mrs. Howell, Ginger, and Gilligan',
        \%patterns 
    );

print "$key matched\n" if $key;


__END__
