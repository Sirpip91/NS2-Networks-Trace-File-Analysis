#	This is a awk program that will go through the trace file and
#	get the needed metrics to take from it: start time, stop time, number of packets ect...
#	They will get printed to the terminal

#start
BEGIN {
	recv_size=0
	startTime=1e6
	stopTime=0
	recNum=0
}
# The dollar sign denotes the column that we are taking the information on.
{
#	make the column data assigned to the variable name
event =$1
pktname=$41
flowname=$39
flowtype=$45
time=$3
packet_size=$37
node_id=$5
packet=$19

#if we find the agt packet and the time is 0 and the we track the time of the packet
if(packet=="AGT" && sendTime[pktname] == 0 && (event == "+" || event == "s")) {
	if (time < startTime) {
		startTime=time
	}
	sendTime[pktname] = time
	this_flow=flowtype
}

#if we find the agt packet and the r is recieved update the recieved packets
if(packet=="AGT" && event == "r") {
	if(time >stopTime) {
		stopTime=time
	}
	recv_size += packet_size
	recvTime[pktname] = time
	recNum = recNum + 1
}
}

END{
        if(recNum == 0){
            printf("awk program has reached end there must have been a problem \n")
        }

		#prints out our information so we can get data!
        printf("Start time is : %d\n", startTime)
        printf("Stop time is :  %d\n", stopTime)
        printf("Number of packets recieved : %d\n", recNum)
		#average throughput formula
        printf("Throughput (kbps) is :  %f\n", (recNum/(stopTime-startTime)*8/1000))
}