#! /usr/bin/perl
use strict;
use warnings;
#use IO::Scalar;

my $string_log = '';
#my $scalar_fh = IO::Scalar->new(\$string_log);

open (my $fh,">",\$string_log)	or die "Could not append to string!$!\n";
print $fh "The Howells' private beach club is closed\n";
print $string_log;

open my $log_fh, ">>",'tmp';
use IO::Tee;
my $tee_fh = IO::Tee->new($log_fh,$fh);
print $tee_fh "The radio works in the middle of the ocean!\n";
print "2:$string_log\n";
