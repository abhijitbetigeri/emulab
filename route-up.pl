#!/usr/bin/perl -w

print("Bringing up the routed daemon\n");
my $route_ret = `routed -s -P rdisc_interval=15`;
if ($route_ret == 0) {
	print ("The routed daemon is running successfully\n");
}
else {
	print ("The routed daemon failed with error code: $route_ret\n");
}



