#!/usr/bin/perl

use RRDs;

my $cur_time = time();
my $start_time = $cur_time - 86400;     # set end time to 24 hours ago
         RRDs::graph "/home/mickevi/public_html/graph_temp.png",   
         "--start= $start_time",
         "--end= $cur_time",
         "--title= Temp källaren",
         "--height= 300",
         "--width= 500",
         "--vertical-label= °C",
         "DEF:OutsideTemp=/home/mickevi/rrddata/temp_1.rrd:outsidetemp:AVERAGE",                         
         "COMMENT:\t\t\t\tNu     Medel    Max    Min\\n",
         "HRULE:0#0000FF",         
         "LINE2:OutsideTemp#0000FF:Källaren\t\t\t",   
         "GPRINT:OutsideTemp:LAST:%6.1lf",
         "GPRINT:OutsideTemp:AVERAGE:%6.1lf",
         "GPRINT:OutsideTemp:MAX:%6.1lf",
         "GPRINT:OutsideTemp:MIN:%6.1lf\\n";

my $err=RRDs::error;
if ($err) {print "problem generating the graph: $err\n";}

print "Done!\n"
