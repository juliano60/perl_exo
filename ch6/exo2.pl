#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## word count program

say 'Enter a list of words on separate lines (ctrl-d to end):';

my %word_count = ();

while (my $word = <STDIN>) {
	chomp $word;	
	++$word_count{$word};
}

print "\n";
for (sort keys %word_count) {
	say "$_: $word_count{$_}";
}


