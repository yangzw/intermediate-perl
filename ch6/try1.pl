#! /usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use YAML;

my %total_bytes;
while(<>){
	my ($source,$destination,$bytes) = split;
	$total_bytes{$source}{$destination} += $bytes;
}

print Dumper(\%total_bytes);
print "---------------------\n";
print Dump(\%total_bytes);
