#! /usr/bin/perl
use strict;
use warnings;

my $dir = shift @ARGV // "/home/yang/";
my @list = split /\n/,`ls -l --block-size=KB $dir`;
my @result = map{
	$_ =~ /([0-9]+?)kB/;
	my @array = split /\s/ if $1 <= 1;
	$array[-1] // ();
} @list;
print "$_\n" for @result;
