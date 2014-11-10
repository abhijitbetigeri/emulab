#!/usr/bin/perl -w

open (FILE_LOG, "./Test_Logger");
while (<FILE_LOG>) {
        if ($_ =~ m/(.*)buflen=(.*),\ nbuf=(.*),\ align=(.*)/) {
                print "$2 $3";
        }
        if ($_ =~ m/(.*)\ bytes\ in\ (.*)real\ seconds =(.*)\ KB\/sec(.*)/) {
                print "\t$2 $3\n";
        }
        if ($_ =~ m/(.*)Program to run ttcp in loop(.*)/) {
                print "\n\nNew Program Statistics\n\n";
                print "\nSize of Buffer\t  Number of Chunks\t Time taken \t Throughput in KB/Sec\n\n";
        }

}
close (FILE_LOG);
