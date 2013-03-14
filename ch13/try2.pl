#! /usr/bin/perl
use strict;
use warnings;
require "Animal.pm";

{
	package Barn;
	sub new {bless [],shift}
	sub add {push @{+shift},shift}
	sub contents{@{+shift}}
	sub DESTROY{
		my $self = shift;
		print "$self is being destroyed...\n";
		while(@$self){
			my $homeless = shift @$self;
			print " ",$homeless->name, " goes homeless.\n";
		}
		#for($self->contents){
		#	print "  ",$_->name, " goes homeless.\n";
		#}
	}
}

my $barn0 = Barn->new;
$barn0->add(Horse->named('ad'));
$barn0->add(Sheep->named('dd'));
print "Burn the barn:\n";
$barn0 =  undef;

my $barn = Barn->new;
my @horses = (Horse->named('Bessie'),Horse->named('Gwen'));
$barn->add($_) for @horses;
print "Burn the barn:\n";
$barn = undef;
print "Lose the horse:\n";
@horses = ();
print "End of program.\n";
