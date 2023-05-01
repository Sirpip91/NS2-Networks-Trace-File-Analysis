#	This is a awk program that will go through the trace file and
#	take the needed infromation to find the throughput,
#	then output it into a text file which then can be used to graph.
#	please add the > "outputfilename.txt" after running this program.

#throughput
#start
BEGIN {
	recv=0
	currentTime = previousTime = 0
	timetic=0.1
}

{
#setup the variables and assign the correct column data to the variable
event =$1
time=$3
node_id=$5
packet=$19
pkt_id=$41
flow_id=$39
packet_size=$37
flow_type=$45

if(previousTime == 0)
	previousTime = time

#find the needed recieved packet and AGT packets.
if (packet == "AGT" && event == "r") {
	recv = recv + packet_size
	currentTime = currentTime + (time-previousTime)
	#if we are still good with time
	if (currentTime >= timetic) {
		#throughput formula
		printf ("%f %f \n", time,(recv/currentTime)*(8/1000))
		recv=0
		currentTime=0
	}
	previousTime=time
}
}
#end of the function
END {
printf("\n")
}

