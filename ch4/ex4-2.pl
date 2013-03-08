#! /usr/bin/perl
use strict;
use warnings;

my @gilligan = qw / red_shirt hat luck_socks water_bottle/;
my @skipper = qw / blue_shirt hat jacket preserver sunscreen/;
my @professor = qw / suncreen water_bottle slide_rule batteries radio/ ;
my %all = (
	Gilligan => \@gilligan,
	Skipper => \@skipper,
	Professor => \@professor,
);

check_items_for_all(\%all);

sub check_items_for_all{
	my $all = shift;
	for (qw /Gilligan Skipper Professor/){
		check_required_items($_, $$all{$_});
	}
}
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
