#!perl -wT

use strict;
use warnings;
use Test::Most;
use Geo::Coder::US::Census;

eval 'use Test::Carp';

CARP: {
	if($@) {
		plan skip_all => 'Test::Carp needed to check error messages';
	} else {
		my $g = new_ok('Geo::Coder::US::Census');
		eval {
			does_carp_that_matches(sub { my $location = $g->geocode(); }, qr/^Usage: geocode\(/);
		};
		done_testing();
	}
}
