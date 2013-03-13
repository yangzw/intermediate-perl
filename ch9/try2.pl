#施瓦茨变换
#! /usr/bin/perl
use strict;
use warnings;

my @input_data = qw /asdfa asdfweifh gsrfliwe waefiupwe awebdlk aefuwei fuadk aweifs series sarifi asdf saekgb/;
my @output_data = 
	map $_->[0],
	sort {$a->[1] cmp $b->[1]}
	map [$_,"\U$_"],
	@input_data;
	
print "@output_data\n";
