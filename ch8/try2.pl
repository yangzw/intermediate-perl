#! /usr/bin/perl
#匿名的IO对象
use strict;
use warnings;
use IO::File;

my @handlepairs;

foreach my $file (glob('*.input')){
	(my $out = $file) =~ s/\.input$/\.output/;
	#print "$out and $file";
	push @handlepairs,[
		(IO::File->new("$file",'r') || die),
		(IO::File->new("$out",'w') || die),
	];
}

while(@handlepairs){
	@handlepairs = grep{
		my $line;
		defined($line = $_->[0]->getline) and print {$_->[1]} $line;
	}@handlepairs;
}
