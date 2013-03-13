package Oogaboogoo::date;
use strict;

my @day = qw /ark dip wap sen pop sep kir/;
my @month = qw / diz pod bod rod sip wax lin sen kun fiz nap dep/;

sub day{
	my $num = shift;
	print "Unlegal day!\n" unless $num <= 6 and $num >= 0;
	$day[$num];
}

sub month{
	my $num = shift;
	print "Unlegal month!\n" unless $num <= 11 and $num >= 0;
	$month[$num];
}
1;
