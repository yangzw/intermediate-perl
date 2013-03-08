#! /usr/bin/perl
use strict;
use warnings;

my @input_numbers = (1,2,4,8,16,32,64);
my @odd_digit_sum = grep {
	my @digits = split //;
	my $sum;
	$sum += $_ for @digits;
	$sum % 2;
} @input_numbers;
print "@odd_digit_sum\n";

