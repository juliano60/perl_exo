#!/usr/bin/env perl
use v5.14;
use warnings;
use Module::CoreList;
use List::Util qw(max);

## print the name and first release date of every core modules
## in Perl v5.14.2

my @modules = keys %{$Module::CoreList::version{5.014}};

my $max_len = max(map { length } @modules);

for (@modules) {
    printf "%${max_len}s %s\n", $_, Module::CoreList->first_release($_); 
}

__END__
