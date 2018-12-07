#!/usr/bin/env perl
use v5.14;
use warnings;
use utf8;

sub greet($) {
	state $last_person;
	my $name = shift;
	
	print "Hi $name! ";
	if (!defined($last_person)) {
		say "You are the first one here!";
	}
	else {
		say "$last_person is also here!"
	}
	
	$last_person = $name;
}

greet("Fred");
greet("Barney");
