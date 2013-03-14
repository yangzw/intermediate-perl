#! /usr/bin/perl
use strict;
use warnings;

{
	package LivingCreature;
	sub speak{
		my $class = shift;
		if(@_){
			print "a $class speak ", @_,"!\n";
		}else{
			print "a $class goes ",$class->sound,"!\n";
		}
	}
}
{
	package Person;
	our @ISA = qw /LivingCreature/;
	sub sound{"hmmmm"}
}

{
	package Animal;
	our @ISA = qw /LivingCreature/;
	sub sound {die "all animals should define a sound"}
	sub speak {
		my $class = shift;
		die "animals can't talk!" if @_;
		$class->SUPER::speak;
	}
}

{
	package Cow;
	our @ISA = qw(Animal);
	sub sound {"moooo"}
}
{
	package Mouse;
	our @ISA = qw /Animal/;
	sub sound{'squeak'}
	sub speak{
		my $class = shift;
		$class->SUPER::speak;
		print "[but you can barely hear it!]\n";
	}
}
{
	package Horse;
	our @ISA = qw /Animal/;
	sub sound{"neigh"};
}
{
	package Sheep;
	our @ISA = qw /Animal/;
	sub sound{"baaaaah"};
}
Person->speak;
Person->speak("hello,world!");
Horse->speak;
Horse->speak("hello,world!");
