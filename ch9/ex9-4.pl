#! /usr/bin/perl
use strict;
use warnings;

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
	my $empty = shift;
	my $path = shift;
	my $data = shift;
	#print $path,$data;
	if(not defined $data){
		print $empty,"$path\n";
		return;
	}
	my %directory = %$data;
	if(!%directory){
		print $empty,"$path, an empty direcotry\n";
		return;
	}
	else{
		print $empty,"$path, with contents:\n";
		for(sort keys %directory){
			dump_data_for_path("$empty  ","$_",$directory{$_});
		}
	}
}

dump_data_for_path('','.',data_for_path("."));
