#! /usr/bin/perl
use strict;
use warnings;

{
	package Animal;
	sub named{
		my $class = shift;
		my $name = shift;
		my $self = {Name => $name,Color=>$class->default_color};
		bless $self,$class;
	}
	sub name{
		my $either = shift;
		ref $either ? $either->{Name} : "an unnamed $either";
	}
	sub speak{
		my $either = shift;
		print $either->name, " goes ",$either->sound,"\n";
	}
	sub eat{
		my $either = shift;
		my $food = shift;
		print $either->name," eats $food.\n";
	}
	sub default_color{'brown'}
	sub color{
		my $self = shift;
		$self->{Color};
	}
	sub set_color{
		my $self = shift;
		$self->{Color} = shift;
	}
}
{
	package Horse;
	our @ISA = qw /Animal/;
	sub sound{'neigh'};
}
{
	package Sheep;
	our @ISA = qw /Animal/;
	sub sound{'baaaah'};
}
my $tv_horse = Horse->named("Mr.Ed");
$tv_horse->eat('hay');
$tv_horse->set_color('black-and-white');
print $tv_horse->name, ' is colored', $tv_horse->color,"\n";
Sheep->eat('grass');
