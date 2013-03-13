#! /usr/bin/perl
use strict;
use warnings;

my $ref;
{
	my @array = qw /a b c d/;
	$ref = \@array;

	print "$ref->[2]\n";
}
#print $array[2];
print "$ref->[2]\n";
