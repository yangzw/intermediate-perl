#! /usr/bin/perl
use strict;
use warnings;

{
	package Animal;
	use Carp qw/croak/;
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
	sub set_name{
		ref(my $self = shift) or croak "instance variable needed";
		$self->{Name} = shift;
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
	sub sound{croak "subclass must define a sound"}
	sub color{
		my $self = shift;
		ref $self ? $self->{Color} : $self->default_color;
	}
	sub set_color{
		ref(my $self = shift) or croak "instance variable needed";
		$self->{Color} = shift;
	}
}
{
	package Horse;
	our @ISA = qw /Animal/;
	sub sound{'neigh'}
}
{
	package Sheep;
	our @ISA = qw /Animal/;
	sub color{"white"}
	sub sound{'baaaah'}
}
my $tv_horse = Horse->named("Mr.Ed");
$tv_horse->set_name("Mister Ed");
$tv_horse->set_color('black-and-white');
print $tv_horse->name, ' is colored', $tv_horse->color,"\n";
print Sheep->name, ' colored ',Sheep->color,' goes ' ,Sheep->sound,"\n";
