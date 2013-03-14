#向子类中添加变量
#使用类变量
#! /usr/bin/perl
use strict;
use warnings;
require "Animal.pm";

{
	package RaceHorse;
	our @ISA = qw /Horse/;
	sub named{
		my $self = shift->SUPER::named(@_);
		$self->{$_} = 0 for qw /wins places shows losses/;
		$self;
	}
	sub won{shift->{wins}++;}
	sub placed{shift->{places}++;}
	sub showed{shift->{shows}++;}
	sub lost{shift->{losses}++;}
	sub standings{
		my $self = shift;
		join ', ' ,map "$self->{$_} $_",qw/wins places shows losses/;
	}
}

my $racer = RaceHorse->named('Billy Boy');
$racer->won;
$racer->won;
$racer->won;
$racer->showed;
$racer->lost;
print $racer->name, " has standings of:",$racer->standings, ".\n";


my @horses = map Horse->named($_), qw /Bessie Gwen/;
my @racehorses = RaceHorse->named('billy Boy');
print "we've seen:\n", map(" $_\n",Animal->registered);
print "End of program\n";
