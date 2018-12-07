#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

sub greet($) {
	state @people;
	my $person = shift;
	
	print "Hi $person! ";
	if (@people) {
		say "I've seen: @people";
	}
	else {
		say "You are the first one here!";
	}
	
	push @people, $person;
}

greet("Fred");
greet("Barney");
greet("Wilma");
greet("Betty");