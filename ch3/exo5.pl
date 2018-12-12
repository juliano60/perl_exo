#!/usr/bin/env perl
use v5.14;
use warnings;

## report a list of files in a directory that match a pattern
## supplied by the user.

my $dir = "/etc";

while (1) {
    print 'Enter a pattern: ';
    chomp (my $regex = <STDIN>);

    last unless (defined $regex && length $regex); 

    my @files = eval { grep { /$regex/ } glob("$dir/*") };
    warn "Invalid pattern: $@\n" and next if $@;

    print "Result: \n", map { "    $_\n" } @files; 
}


__END__
