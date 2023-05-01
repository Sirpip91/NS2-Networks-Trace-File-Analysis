#	This is a awk program that will go through the trace file and
#	take the needed infromation to find the average packet delivery,
#	then output is put into terminal.
#	

BEGIN{
        sendpkt=0
        recvpkt=0
        forwardpkt=0
}

{
    packet=$19
    event=$1

    if(event == "s" && packet == "AGT"){
        sendpkt++;
    }
    if(event == "r" && packet == "AGT"){
        recvpkt++;
    }
    if(event == "f" && packet == "RTR"){
        forwardpkt++;
    }
}

END{
    printf("num of sent packets are: %d \n", sendpkt);
    printf("num of recieved packets are: %d \n", recvpkt);
    printf("num of forward packets are: %d \n", forwardpkt);
    printf("Packet delivery Ratio is : %f \n", (recvpkt/sendpkt));
}