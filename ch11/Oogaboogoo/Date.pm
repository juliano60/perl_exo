use v5.14;
use warnings;

package Oogaboogoo::Date;

our @day = qw/ark dip wap sen pop sep kir/;

sub number_to_day_name {
    my $num = shift;

    die "Number out of range\n" if ($num < 0 or $num > $#day);

    return $day[$num];
}

our @month = qw/diz pod bod rod sip wax lin sen kun fiz nap dep/;

sub number_to_month_name {
    my $num = shift;

    die "Number out of range\n" if ($num < -1 or $num > $#month);

    return $month[$num];
}

1;
