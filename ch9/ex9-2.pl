#! /usr/bin/perl
use strict;
use warnings;
use Benchmark;

my $r = timethese(-2,
	{
		a => sub{
			my @output = 
			map $_->[0],
			sort {$a->[1] <=> $b->[1]}
			map [$_,-s $_],
			glob "/*";
		},
		 b => sub{
			my @sorted = sort {-s $a <=> -s $b } glob "/*";
	}});
