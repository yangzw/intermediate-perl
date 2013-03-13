#! /usr/bin/perl
use strict;
use warnings;

my %provisions = (
'The Skipper'
=> [qw(blue_shirt hat jacket preserver sunscreen)],
'The Professor' => [qw(sunscreen water_bottle slide_rule radio) ],
'Gilligan'
=> [qw(red_shirt hat lucky_socks water_bottle) ],
);

my @person_list = map{
	[$_ => $provisions{$_}];
}keys %provisions;
print "${$_}[1]->[0]\n" for @person_list;
