#	This is a awk program that will go through the trace file and
#	take the needed infromation to find the throughput,
#	then output it into a text file which then can be used to graph.
#	please add the > "outputfilename.txt" after running this program.

#throughput
#start
BEGIN {
	recv=0
	gtime=1;
	time =0;
	packet_size =$6
	time_interval = .01;

}

{
#setup the variables and assign the correct column data to the variable
event =$1
time=$2
node_id = 3
pkttype = $5
packet_size = $6

if(time>gtime)
{
	print gtime, (packet_size * recv * 8.0)/1000;
	gtime+=time_interval;
	recv=0;
}



if((event == "r") && (pkttype == "tcp"))
{
	recv++;
}


}
#end of the function
END {
printf("\n")
}



