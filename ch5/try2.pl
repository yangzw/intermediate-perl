#! /usr/bin/perl
use strict;
use warnings;

my @allclasses;

sub ini_class_list{
	my @class1 = qw /Mike LiMing Emma/;
	my @class1_with_teacher = ('Mr.Wang',\@class1);
	my @class2 = qw /Allen Chris James/;
	my @class2_with_teacher = ('Mr.Liu',\@class2);
	@allclasses = (\@class1_with_teacher,\@class2_with_teacher);
}

ini_class_list();
print "$allclasses[1]->[0]\n";
