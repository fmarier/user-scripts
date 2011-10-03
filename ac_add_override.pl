#!/usr/bin/perl -p -i

# copyright (c) Benjamin Mako Hill <mako@debian.org>
# This software comes with ABSOLUTELY NO WARRANTY.
# This is free software and is licensed under the GNU GPL.

if (not $edited and m/^\s*\n$/) {
	s/^\s*\n$/X-AttachCheck-Override: Yes\n\n/;
	$edited = 1;
}
