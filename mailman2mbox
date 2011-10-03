#!/usr/bin/perl
while (<STDIN>) {
  s/^(From:? .*) (at|en) /\1\@/;
  s/^Date: ([A-Z][a-z][a-z]) +([A-Z][a-z][a-z]) +([0-9]+) +([0-9:]+) +([0-9]+)/Date: \1, \3 \2 \5 \4 +0000/; 
  print;
}
