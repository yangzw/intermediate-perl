#! /usr/bin/perl
use strict;
use warnings;
use 5.014;
use IO::Tee;

print "Choose to file or scalar or both(f/s/b):";
chomp (my $choice = <STDIN>);
my $fh;
my $scalar;
given($choice){
	when('s'){ open $fh,'>',\$scalar}
	when('f'){open $fh, ">","$0.out"}
	when('b'){
		open my $file_fh, ">","$0.out"; open my $scalar_fh,">",\$scalar;
		$fh = IO::Tee->new($file_fh,$scalar_fh,\*STDOUT)
	}
	default{print "not a choice\n";return}
};

my $date = localtime;
my $day_of_week = (localtime)[6];

print $fh <<"HERE";
This is run $$
The date is $date
The day of the week is $day_of_week
HERE

print STDOUT <<"HERE" if $choice =~ m/^[st]/i;
Scalar contains:
$scalar
HERE

#print "$scalar\n";
