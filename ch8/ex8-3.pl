#! /usr/bin/perl
use strict;
use warnings;
use IO::Dir;

my $dir;
my @not_dirs = grep {! -d} @ARGV;
print "$_ is not a direcotry!\n" for @not_dirs;
my @dirs = grep { -d } @ARGV;
while(@dirs){
	$dir = shift @dirs;
	print "--------(DIR:$dir)------------\n";
	my $dir_fh = IO::Dir->new($dir) or die "Could not open dirhandle:$!\n";
	while(defined(my $file = $dir_fh->read)){
		next if ($file eq '.' or $file eq '..');
		print "$file\n";
	}
}
