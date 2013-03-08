#! /usr/bin/perl
use strict;
use warnings;

my %gilligan_info = (
	name => "Gilligan",
	hat => "White",
	shirt => "Red",
	position =>"First Mate",
);
my %skipper = (
	name => 'Skipper',
	hat => 'Black',
	shirt =>'Blut',
	position =>'Captain',
);

my @crew = (\%gilligan_info, \%skipper);
my $format =  "%-15s %-7s %-7s %-15s\n";
printf $format, qw / Name Shirt Hat Position/;
for my $crewmember (@crew){
	printf $format, @$crewmember{qw / name shirt hat position/};
}
