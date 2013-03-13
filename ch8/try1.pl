#! /usr/bin/perl
use strict;
use warnings;
use IO::File;

my $log_fh;
open $log_fh, ">>",'tmp'
	or die "Could not open :$!";
print {$log_fh} "We need more coconuts~\n"x3;
close $log_fh;

my $fh = IO::File->new('tmp','r');
while(<$fh>){
	print "$_";
}
