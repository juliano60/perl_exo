#!/usr/bin/env perl
use v5.14;
use warnings;
use Data::Dumper;

## recursively build a directory content

sub data_for_path {
    my $path = shift;

    if (-f $path) {
        return undef;
    }
    elsif (-d $path) {
        my $directory;
        opendir my $fh, $path or die "Cannot open directory: $!\n";

        my @content = readdir $fh;
        closedir $fh;

        for (@content) {
            next if ($_ eq '.' or $_ eq '..');
            
            $directory->{$_} = data_for_path("$path/$_");
        } 
        return $directory;
    }
    warn "$path is neither a directory nor a file\n";
    return undef;
}

die "Usage: $0 <dirname>\n" unless @ARGV;
my $start_dir = shift @ARGV;

print Dumper(data_for_path($start_dir));


__END__
