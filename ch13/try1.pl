#! /usr/bin/perl
use strict;
use warnings;
require "Animal.pm";

sub feed_a_horse_named{
	my $name = shift;
	my $horse = Horse->named($name);
	$horse->eat('grass');
	print "Returning from the subroutine.\n";  #horse在这里被销毁了
}
my $tv_horse = Horse->named("Mr.Ed");
$tv_horse->set_name("Mister Ed");
$tv_horse->set_color('black-and-white');
print $tv_horse->name, ' is colored', $tv_horse->color,"\n";
feed_a_horse_named('Gwen');
print Sheep->name, ' colored ',Sheep->color,' goes ' ,Sheep->sound,"\n";
