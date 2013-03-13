#! /usr/bin/perl
use strict;
use warnings;
use utf8;

use File::Find;
use Time::Local;

my $target_dow = 5;        # Sunday is 0, Monday is 1, ...
my @starting_directories = ("..");

my $seconds_per_day = 24 * 60 * 60;
my($sec, $min, $hour, $day, $mon, $yr, $dow) = localtime;
my $start = timelocal(0, 0, 0, $day, $mon, $yr);        # midnight today

while ($dow != $target_dow) {
	# Back up one day
	$start -= $seconds_per_day;        # hope no DST! :-)
	if (--$dow < 0) {
		$dow += 7;
	}
}
my $stop = $start + $seconds_per_day;

my($gather, $yield)  = gather_mtime_between($start, $stop);
find($gather, @starting_directories);
my @files = $yield->();

for my $file (@files) {
	my $mtime = (stat $file)[9];        # mtime via slice
	print "\$mtime: $mtime\n";
	my $when = localtime $mtime;
	print "$when: $file\n";
}

sub gather_mtime_between{
	my $start = shift;
	my $stop = shift;
	my @files;
	return (
		sub{
			my $timestamp = (stat $_)[9];
			unless (defined $timestamp){
				warn "Can't stat $File::Find::name: $!,skipping\n";
				return;
			}
			push @files,$_ if ($timestamp <= $stop and $timestamp >= $start)
		},
		sub{return @files}
	);
}
