#!/usr/bin/perl -w

print ("############################################\n");
print ("Usage: ./ttcp_loop.pl #num_pkts #size_of_each_pkt udp/tcp TTCP_SVR_IP\n");
print ("############################################\n");
print "******** Program to run ttcp in loop *********\n";

if ($ARGV[0] && $ARGV[1] && $ARGV[2] && $ARGV[3]) {
    print ("Count of packets:$ARGV[0] \nSize of each packet:$ARGV[1] \n");
    print ("Type of traffic:$ARGV[2] \nTTCP Server IP Address: $ARGV[3]\n");
}
else {
    print ("Missing Paramters for Running program!!!!!!!\n");
    exit;
}
chomp ($ARGV[0]);
chomp ($ARGV[1]);
chomp ($ARGV[2]);
chomp ($ARGV[3]);
my $num_pkts = $ARGV[0];
my $length = $ARGV[1];
my $tcp_udp = $ARGV[2];
my $ip = $ARGV[3];

while (1) {
    my $ret = 0;
    if ($tcp_udp eq "tcp") {
	$ret = `ttcp -t -s -l $length -n $num_pkts $ip`;
    }
    elsif ($tcp_udp eq "udp"){	
	$ret = `ttcp -t -s -u -l $length -n $num_pkts $ip`;
    }
    else {
	print "Invalid traffic type, please specify traffic type as either tcp/udp\n";
	exit(0);
    }
    if ($length < 1000) { 
	$length = $length+100;
    }
    elsif ($length => 1000 && $length <=8000) { 
	$length = $length+1000;
    }
    else {
	exit;
    }
   #print "$ret\n";
}


