#!/usr/bin/env perl
use v5.14;
use warnings;
use Business::ISBN;

## parse the ISBN 9781449393090 and display the group code
## and publisher code

my $isbn = Business::ISBN->new('9781449393090');

say "Group code: ", $isbn->group_code;
say "Publisher code: ", $isbn->publisher_code;

__END__
