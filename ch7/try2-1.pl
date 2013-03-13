#! /usr/bin/perl
use strict;
use warnings;
use File::Find;

sub create_find_callbacks_that_sum_the_size{
	my $total_size = 0;
	return (sub {$total_size += -s if -f},sub{return $total_size});
}

my ($count_em,$get_result) = create_find_callbacks_that_sum_the_size();
find($count_em,'/bin');
my $total_size = &$get_result();
print "total size of bin is $total_size\n";
