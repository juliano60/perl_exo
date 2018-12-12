#!/usr/bin/env perl
use v5.14;
use warnings;

## a program that catches signals and reports how many times it
## has seen that signal before. Exit on SIGINT

sub int_handler {
    die "Received SIGINT, exiting...\n";
}

sub hup_handler {
    state $hup_count = 0;

    ++$hup_count;
    say "HUP signals seen: $hup_count times";
}

sub usr_handler {
    state $usr_count = 0;

    ++$usr_count;
    say "USR signals seen: $usr_count times";
} 

$SIG{'INT'} = 'int_handler';
$SIG{'HUP'} = 'hup_handler';
$SIG{'USR1'} = 'usr_handler';

say "I am $$";

while (1) {
    ;
}
