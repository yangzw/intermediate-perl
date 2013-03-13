#! /usr/bin/perl
use strict;
use warnings;

my %passenger_1 = (
	name => "Ginger",
	age => 22,
	occupation => 'Movie star',
	real_age => 35,
	hat => undef,
);

my %passenger_2 = (
	name => "Mary Ann",
	age => 19,
	hat => 'boonet',
	favorite_food => 'corn',
);
my @passengers = (\%passenger_1,\%passenger_2);
