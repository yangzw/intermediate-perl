#! /usr/bin/perl
use strict;
use warnings;

{
	my $count;
	sub count_one {++$count};
	sub count_so_far{return $count};
}
count_one();
count_one();
count_one();
print "we have seen ", count_so_far()," coconuts!\n";
