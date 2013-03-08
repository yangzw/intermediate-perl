#! /usr/bin/perl
use strict;
use warnings;
use Business::ISBN;

$isbn_of_the_book = Business::ISBN->new('0596102062');
print $isbn_of_the_book->group_code,"\n";
print $isbn_of_the_book->publisher_code,"\n";
