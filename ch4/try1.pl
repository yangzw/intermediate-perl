#! /usr/bin/perl
# 引用
use strict;
use warnings;

sub check_required_items{
	my $who = shift;
	my $items = shift;
	my @required = qw / preserver sunscreen water_bottle jacket /;
	my @missing = ();
	for my $item(@required){
		unless (grep $item eq $_, @$items){
			print "$who is missing $item. \n";
			push @missing,$item;
		}
	}

	if(@missing){
		print "Adding \"@missing\" to \"@$items\" of $who\n";
		push @$items,@missing;
	}
}

my @professor = qw / sunscreen water_bottle slide_rule batteries radio /;
check_required_items('Professor',\@professor);
