#! /usr/bin/perl
use strict;
use warnings;
#use Oogaboogoo::date; #qw /day/;
use Oogaboogoo::date qw(:all);

my ($day,$year,$month) = (localtime)[6,5,4];
my $day_name = day($day);
my $month_name = month($month);
#my $month_name = Oogaboogoo::date::month($month);
$year += 1900;
print "$day:$month:$year\n$day_name:$month_name:$year\n";
