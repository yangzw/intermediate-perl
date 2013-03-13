#! /usr/bin/perl
require 'date.pm';
use strict;
use warnings;

my($sec,$min,$hour,$mday,$mon,$year,$wday) = localtime;
#print "$sec,$min,$hour,$mday,$mon,$year,$wday\n";
$year += 1900;
$wday =  Oogaboogoo::date::day($wday - 1);
$mon = Oogaboogoo::date::month($mon);
print "$wday, $mon $mday,$year\n";
