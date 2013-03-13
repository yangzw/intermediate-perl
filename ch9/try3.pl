#递归数据结构  目录为例子  递归打印
#! /usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

sub data_for_path{
	my $path = shift;
	if(-f $path or -l $path){
		return undef;
	}
	if(-d $path){
		my %directory;
		opendir PATH,$path or die "Cannot opendir $path:$!";
		my @names = readdir PATH;
		closedir PATH;
		for my $name(@names){
			next if $name eq '.' or $name eq '..';
			$directory{$name} = data_for_path("$path/$name");
		}
		return \%directory;
	}
	warn "$path is neither a file nor a directory\n";
	return undef;
}
#print Dumper (data_for_path('..'));
sub dump_data_for_path{
	my $path = shift;
	my $data = shift;
	if(not defined $data){
		print "$path\n";
		return ;
	}
	my %directory = %$data;
	for(sort keys %directory){
		dump_data_for_path("$path/$_",$directory{$_});
	}
}

dump_data_for_path('..',data_for_path(".."));
