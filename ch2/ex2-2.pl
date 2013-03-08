#! /usr/bin/perl

chdir;

while(1){
	print "Please enter a regular expression> ";
	chomp(my $reg = <STDIN>);
	last unless (defined $reg && length $reg);
	print map{"\t$_\n"} grep {eval { /$reg/}} glob(".* *");
}
