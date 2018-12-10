#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

## a program to do the guess a number game

my $secret_number = int(1 + rand 100);	## [1,100]

say "Guess the number between 1 and  100:";

while (<STDIN>) {
	chomp;

	last if (/exit|quit|\A\s*\z/);
	next unless (/\d+/);

	if ($_ < $secret_number) {
		say "Too low";
	}
	elsif ($_ > $secret_number) {
		say "Too high";
	}
	else {
		say "Bingo!";
		last;
	}
}