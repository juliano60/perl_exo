#!/usr/bin/env perl
use v5.14;
use warnings;
use Time::Local;
use File::Find;

die "Usage: $0 <starting_dir>" unless @ARGV;

sub gather_mtime_between {
    my ($start, $end) = @_;
    my @files = ();

    return (
        sub {
            my $mtime = (stat $_)[9];
            warn "Cannot stat $File::Find::name: $!\n" and return unless $mtime;
            push @files, $File::Find::name if (-f _ && 
                    $mtime >= $start && $mtime < $end);
        },
        sub {
            return @files;
        });
}

## gather all files that were modified on Monday (i.e. between
## Monday 00:00:00 and Tuesday 00:00:00

my ($sec, $min, $hr, $mday, $mon, $year, $dow, undef, undef) = localtime;

## today at midnight
my $start = timelocal(0,0,0, $mday, $mon, $year);
my $seconds_per_day = 24 * 60 * 60;
my $target_dow = 1;     ## Sunday 0, Monday 1

while ($dow != $target_dow) {
    $start -= $seconds_per_day;
    --$dow;
}

my $start_str = localtime($start);
print "Start: $start_str\n";

my $end = $start + $seconds_per_day;
my $end_str = localtime($end);
print "End: $end_str\n";

my ($callback, $getter) = gather_mtime_between($start, $end);

find($callback, $ARGV[0]);

for ($getter->()) {
    print "$_\n";
}

__END__
