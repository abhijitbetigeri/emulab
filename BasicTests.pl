#!/usr/bin/perl -w

#
# Description: Script/Tool to support testing in the Emulab Environment
# This script can be used to carryout testng related to ping/rtquery/
# traceroute/cleanup
#
print "\n!!!Basic Test Script for EMULAB Experiments!!!\n";

#
# Collect the Input arguments provided by the user in the terminal
#
my $argc = @ARGV;
my $testType = $ARGV[0] || "notest";
my $node1_ip = $ARGV[1] || "null";
my $count = $ARGV[2] || 1;
chomp ($testType);
chomp ($node1_ip);
chomp ($count);

#
# Calculate the timestamp for creating the Logs file for that time stamp.
# Create the test file for storing the test results.
#
my $date = `date`;
$date =~ s/ /_/g;
my $testfilename = "TESTLOG_"."$date";
system ("touch ./testfilename");

if ($testType eq "notest") {
    print "########################################################\n";
    print "\nERROR: No Test Type specified.\n";
    print "\nPlease specify the test type as ping/traceroute/rtquery\n";
    print "\n./BasicTests.pl ping/traceroute/rtquery 10.1.1.2/google.com [COUNT]\n";
    print "########################################################\n\n";
    exit (0);
}
if ($node1_ip eq "null") {
    if ($testType eq "rtquery") {
	print "Proceeding to carryout the rtquery tests!!!\n";
    }
    elsif ($testType eq "cleanup") {
	print "Cleaning the TEST files created for storing the log entries related to this project\n"; 
    }
    else {
    	print "########################################################\n";
	print "\nERROR: No node specified for the tests.\n";
 	print "\nPlease specify the node as: IP/Hostname Ex: \"10.1.1.2/google.com\"\n";
	print "\n./BasicTests.pl ping/traceroute/rtquery 10.1.1.2/google.com [COUNT]\n";
	print "########################################################\n\n";
	exit (0);
    }
}

#
# Check the type of Test and carry out the functionality
#
if ($testType eq "ping") {
    my $results = `ping -c $count $node1_ip >> $testfilename`;
    print "Output Results are Redirected to >>>> $testfilename\n";
}
elsif ($testType eq "rtquery") {
    my $results = `rtquery >> $testfilename`;
    print "Output Results are Redirected to >>>> $testfilename\n";
}
elsif ($testType eq "traceroute") {
    my $results = `traceroute $node1_ip >> $testfilename`;
    print "Output Results are Redirected to >>>> $testfilename\n";
}
elsif ($testType eq "cleanup") {
    my $results = `rm -f ./TESTLOG_*`;
    print "Output Results are Redirected to >>>> $testfilename\n";
}

print "\nProgram Exiting!!!!\n";


#######################
# Test scripts outputs
#######################
