#继承与重载
#! /usr/bin/perl
use strict;
use warnings;

{
	package Animal;
	sub speak {
		my $class = shift;
		print "a $class goes ",$class->sound,"!\n";
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

my @animals;
while(1){
	print "please input the animals(Cow,Mouse,Horse,Sheep,empty for end):\n";
	chomp (my $animal = <STDIN>);
	$animal = ucfirst lc $animal;
	last until $animal =~ /^(Cow|Mouse|Horse|Sheep)/;
	push @animals, $animal;
}

$_->speak for @animals;
