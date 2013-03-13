#! /usr/bin/perl
use strict;
use warnings;

my %provisions;
my $person;

while(<>){
	if (/^(\S.*)/) { # a person's name (no leading whitespace)
		$person = $1;
		#$provisions{$person} = [ ] unless exists $provisions{$person};
} elsif (/^\s+(\S.*)/) { # a provision
	die 'No person yet!' unless defined $person;
	push @{$provisions{$person}}, $1;
} else {
	die "I don't understand: $_";
}
}

print "$_\n" for @{$provisions{'Gilligan'}};
