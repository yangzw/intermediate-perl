#! /usr/bin/perl
use strict;
use warnings;
use File::Find;

my @starting_derectories = qw /./;
my $total_size;

find(
	sub{
		$total_size += -s if -f $_;
		print "$File::Find::name found\n";
		print "\$_ is $_\n";
	},
	@starting_derectories,
);

print "$total_size\n";

my $callback;
{
	my $count = 0;
	$callback = sub { print ++$count, ": $File::Find::name\n"};
}
find($callback, '.');
