#! /usr/bin/perl
use strict;
use warnings;
use Storable;
use Data::Dumper;

my @data1 = qw / one won/;
my @data2 = qw /two too to/;
push @data2, \@data1;
push @data1,\@data2;
store [\@data1,\@data2], 'some_file';

#my $result = retrieve 'some_file';
#$Data::Dumper::Purity = 1;
#print Dumper($result);

my ($arr1,$arr2) = @{retrieve 'some_file'};
$Data::Dumper::Purity = 1;
print Dumper($arr1,$arr2);
