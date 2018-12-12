#!/usr/bin/env perl
use v5.14;
use warnings;

## a program to parse the output of the date command

my $output = `date`;

my ($wkday) = $output =~ /(\S+).*/; 

say "Weekday: $wkday";

my $workdays = "Mon Tue Wed Thu Fri";

if ($workdays =~ /$wkday/) {
    say "Get to work";
}
else {
    say "Go play";
}


