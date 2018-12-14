#!/usr/bin/env perl
use v5.14;
use warnings;
use FindBin qw($Bin);

use lib $Bin;
use Oogaboogoo::Date; 

print Oogaboogoo::Date::number_to_day_name(0), "\n";
print Oogaboogoo::Date::number_to_month_name(1), "\n";

my ($mday, $month, $year, $dow) = (localtime)[3, 4, 5, 6];
$year += 1900;

printf "Today is %s %s %d %d\n", Oogaboogoo::Date::number_to_day_name($dow),
        Oogaboogoo::Date::number_to_month_name($month), $mday, $year; 

__END__
