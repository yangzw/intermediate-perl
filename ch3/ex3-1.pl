#! /usr/bin/perl
use strict;
use File::Spec;
use Cwd;

my $curdir = getcwd();
print map { "    " . File::Spec->catfile($curdir,$_) . "\n"} glob(".* *");
