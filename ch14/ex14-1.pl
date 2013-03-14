#! /usr/bin/perl
use strict;
use warnings;

{
	package MyDate;
	use vars qw /$AUTOLOAD/;
	use Carp;
	my %Allowed_methods = qw / data 3 month 4 year 5/;
	my @offsets = qw / 0 0 0 0 1 1900 0 0 0/;
	sub new{bless {},$_[0]}
	sub DESTROY {}
	sub AUTOLOAD{
		my $method = $AUTOLOAD;
		$method =~ s/.*:://;
		unless(exists $Allowed_methods{$method}){
			carp "Unknown method:$AUTOLOAD";
			return;
		}
		my $slice_index = $Allowed_methods{$method};
		return (localtime)[$slice_index] +$offsets[$slice_index];
	}
}

my $date = MyDate->new();
sub UNIVERSAL::debug{
	my $self = shift;
	print '['.localtime.']'.join '|',@_;
}
print "The date is " ,$date->data ,"\n";
print "The month is " , $date->month ,"\n";
print "The year is " , $date->year ,"\n";

$date->debug("i'm all done","yeah?:");
