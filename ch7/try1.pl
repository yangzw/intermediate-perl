#! /usr/bin/perl
use strict;
use warnings;

sub skiper_greets{
	my $person = shift;
	print "Skipper::Hey there, $person!\n";
}

sub gilligan_greets{
	my $person = shift;
	if($person eq "Skipper"){
		print "Gilligan: Sir, yes,sir,$person!\n";
	}else{
		print "Gilligan:Hi,$person!\n";
	}
}

sub professor_greets{
	my $person = shift;
	print "Professor: By my calculations, you must be $person!\n";
}

my %greets = (
	Gilligan => \&gilligan_greets,
	Skipper => \&skiper_greets,
	Professor => \&professor_greets,
);

my @room;
for my $person (qw /Skipper Gilligan Professor/){
	print "\n";
	print "$person walks into the room.\n";
	for my $room_person (@room){
		$greets{$person}->($room_person);
		$greets{$room_person}->($person);
	}
	push @room,$person;
}
