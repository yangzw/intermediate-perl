#! /usr/bin/perl
use strict;
use warnings;

my %total_bytes;
my %total_bytes2;
while(<>){
	next if /^#/;
	my ($source, $destination, $bytes) = split;
	$total_bytes{$source}{$destination} += $bytes;
	$total_bytes2{$source} += $bytes;
}


my @sorted_source = sort {$total_bytes2{$b} <=> $total_bytes2{$a} } keys %total_bytes2;
for my $source (@sorted_source){
	my @des = sort {$total_bytes{$source}{$b} <=> $total_bytes{$source}{$a} } keys %{$total_bytes{$source}};
	print "$source sends $total_bytes2{$source} bytes all together\n";
	for my $destination (@des){
		print "$source => ${$total_bytes{$source}}{$destination}:"," $destination byte\n";
	}
	print "\n";
}
