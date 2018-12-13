#!/usr/bin/env perl
use v5.14;
use warnings;

my %gilligan_info = (
    name        => 'Gilligan',
    hat         => 'White',
    shirt       => 'Red',
    position    => 'First Mate',
    location    => 'The Island',
);

my %skipper_info = (
    name        => 'Skipper',
    hat         => 'Black',
    shirt       => 'Blue',
    position    => 'Captain',
    location    => 'The Island',
);

my %mr_howell_info = (
    name        => 'Mr. Howell',
    hat         => 'Black',
    shirt       => 'Blue',
    position    => 'Captain',
    location    => 'The Island',
);

my %mrs_howell_info = (
    name        => 'Mrs. Howell',
    hat         => 'Black',
    shirt       => 'Blue',
    position    => 'Captain',
    location    => 'The Island',
);

my @crew = (\%gilligan_info,
            \%skipper_info,
            \%mr_howell_info,
            \%mrs_howell_info,
            );

for (@crew) {
    if ($$_{'name'} =~ /Howell/) {
        $$_{'location'} = 'The Island Country Club';
    }
}

my $format = "%-15s%-7s%-7s%-15s%-15s\n";
printf $format, qw(Name Hat Shirt Position Location);

for my $member (@crew) {
    printf $format, @$member{qw(name hat shirt position location)};
}

__END__
