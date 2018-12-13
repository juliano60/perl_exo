#!/usr/bin/env perl
use v5.14;
use warnings;
use Carp qw(croak);

## write a check_items_for_all subroutine that checks the required items
## for each crew member

sub is_hash_ref($) {
    my $ref = shift;

    return eval { keys %$ref; 1};
}

sub is_array_ref($) {
    my $ref = shift;

    return eval { push @$ref, (); 1; }
}

sub check_required_items {
    my ($who, $items) = @_;
    croak "Expected array reference" unless is_array_ref($items);

    my @required = qw(preserver sunscreen water_bottle jacket);
    my %person_items = map {$_, 1} @$items;

    my @missing = ();

    for my $required_item (@required) {
        unless ($person_items{$required_item}) {
            push @missing, $required_item;
        }
    }

    if (@missing) {
        print "$who is missing items: @missing\n";
    }
}

sub check_items_for_all($) {
    my $ref = shift;
    croak "Expected a hashref" unless is_hash_ref($ref);

    check_required_items($_, $$ref{$_}) for (sort keys %$ref);
}

my %all = (
    Gilligan    => [qw(red_shirt hat lucky_socks water_bottle)],
    Skipper     => [qw(blue_shirt hat jacket preserver sunscreen)],
    Professor   => [qw(sunscreen water_bottle slide_rule batteries radio)],
);

check_items_for_all(\%all);

__END__
