#! /usr/bin/perl
use strict;
use warnings;
use File::Find;

sub create_find_callbacks_that_sum_the_size{
	my $total_size = 0;
	return (sub {$total_size += -s if -f},sub{return $total_size});
}

my %subs;
foreach my $dir (qw (/bin /lib /man)){
	my ($count_em,$get_result) = create_find_callbacks_that_sum_the_size();
	$subs{$dir}{CALLBACK} = $count_em;
	$subs{$dir}{GETTER} = $get_result;
}

for (keys %subs){
	find($subs{$_}{CALLBACK},$_);
}

for (sort keys %subs){
	my $sum = $subs{$_}{GETTER}->();
	print "$_ has $sum bytes\n";
}
