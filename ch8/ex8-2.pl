#! /usr/bin/perl
use strict;
use warnings;
use IO::File;

my %log;
open IN,'<',"data_file";
while(<IN>){
	chomp;
	my ($name, $others) = split /:/,$_;
	$log{$name} = IO::File->new("$name.info",'w') unless $log{$name};
	print {$log{$name}} "$_\n";
}
