#!/usr/bin/env perl
use v5.14;
use warnings;
use IO::Tee;

## a program to print today's date and day of the week to a user
## chosen destination.

my $help =<<"END_USAGE";
Usage: $0 <num>
num:
1\t\tFor output to the file output.txt
2\t\tFor output to a scalar
3\t\tFor output to both the file and scalar
END_USAGE

die "$help\n" unless @ARGV;

my $num = shift @ARGV;

my $string;
my $fh;

if ($num == 1) {
    open my $file_fh, '>', 'output.txt' or die "Cannot open file: $!";
    $fh = $file_fh;
}
elsif ($num == 2) {
    open my $scalar_fh, '>', \ $string or die "Cannot open string handle\n";
    $fh = $scalar_fh;
}
elsif ($num == 3) {
    open my $file_fh, '>', 'output.txt' or die "Cannot open file: $!";
    open my $scalar_fh, '>', \ $string or die "Cannot open string handle\n";
    $fh = IO::Tee->new($file_fh, $scalar_fh);
}

my $dow = (localtime)[6];
my $today = localtime;
my @week_days = qw( Sunday Monday Tuesday Wednesday Thursday Friday Saturday );

print $fh <<"MSG";
Today's date: $today
Today is $week_days[$dow]
MSG

print STDOUT <<"MSG" if $num == 2 or $num == 3;
Scalar is:
$string
MSG

__END__
