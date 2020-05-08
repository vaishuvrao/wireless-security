
BEGIN {
recv=0;
gotime = 1;
time = 0;
packet_size = 250;
time_interval=1;
cumthroughput=0
throughput=0
#source = "8";
#  sink = "15";
    srcn = length(source);
    dstn = length(sink);
}
#body
{
       event = $1
             time = $2
             node_id = $3
             level = $4
             pktType = $7
	src = substr($14,2,srcn)
	dst = substr($15,1,dstn) 	

 if(time>gotime) {
  throughput = (packet_size * recv * 8.0)/1000;
  print gotime, throughput;
  gotime+= time_interval;
  recv=0;
  }

if (( event == "r") && ( pktType == "cbr" ) && ( level=="RTR" ) && (src == source) && (dst == sink) )
{
 recv++;
}

} #body


END {
;
}
