#! /usr/bin/perl
use strict;
use warnings;

my @input = qw /Mary-Ann fuck-you fuckyoa Emma-watson You-are-yong Diw-daeEes /;
my @output = 
	map $_->[0],
	sort {$a->[1] cmp $b->[1]}
	map {
		my $tran = $_;$tran =~ tr/A-Z/a-z/;$tran =~ tr/a-z//cd;
		[$_, $tran];
	}@input;

print "$_\n" for @output;
