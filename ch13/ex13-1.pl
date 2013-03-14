#! /usr/bin/perl
use strict;
use warnings;
require "Animal.pm";

{
	package RaceHorse;
	our @ISA = qw /Horse/;
	dbmopen (our %STANDINGS,"standings",0666) or die "Cannot access standings dbm:$!";
	sub named{
		my $self = shift->SUPER::named(@_);
		my $name = $self->name;
		my @standings = split ' ',$STANDINGS{$name} || "0 0 0 0";
		@$self{qw /wins places shows losses/} = @standings;
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
	sub DESTROY{
		my $self = shift;
		$STANDINGS{$self->name} = "@$self{qw/wins places shows losses/}";
		$self->SUPER::DESTROY;
	}
}

my $runner = RaceHorse->named("Billy Boy");
$runner->won;
print $runner->name, " has standings ", $runner->standings, "\n";
