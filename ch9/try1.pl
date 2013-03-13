#! /usr/bin/perl
use strict;
use warnings;

my @sorted = sort 1,2,3,4,5,11,32;
print "@sorted\n";
my @sort = sort {$a <=> $b} @sorted;
print "@sort\n";

my @input = qw /Gilligan Skipper Professor Ginger Mary_Ann/;
my @sorted_positions = sort {$input[$a] cmp $input[$b]} 0 .. $#input;
my @ranks;
@ranks[@sorted_positions] = (1 .. @sorted_positions);
for(0..$#ranks){
	print "$input[$_] sorts into positino $ranks[$_]\n";
}
