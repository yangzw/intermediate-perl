#! /usr/bin/perl
use strict;
use warnings;

opendir my $dh, '.' or die "Could not open directory:$!\n";
foreach my $file (readdir($dh)){
	print "$file\n";
}
print "-------------------\n";
foreach my $file (readdir($dh)){
	print "$file\n";
}
print "-------------------\n";
use IO::Dir;
my $dir_fh = IO::Dir->new('.') || die "Could not open dirhandle!\n";
while(defined(my $file = $dir_fh->read)){
	print "$file\n";
}
print "-------------------\n";
$dir_fh->rewind;
while(defined(my $file = $dir_fh->read)){
	print "$file\n";
}
