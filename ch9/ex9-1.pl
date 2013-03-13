#! /usr/bin/perl
use strict;
use warnings;

my @output = 
	map $_->[0],
	sort {$a->[1] <=> $b->[1]}
	map [$_,-s $_],
	glob "/bin/*";

print "$_\n" for @output;
