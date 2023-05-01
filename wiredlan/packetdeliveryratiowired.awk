#	This is a awk program that will go through the trace file and
#	take the needed infromation to find the average packet delivery,
#	then output is put into terminal.
#	

BEGIN{
        enqueue=0
        recvpkt=0
        droppkt=0
        ack=0
        cbr=0
        tcp=0
}

{
    packet=$19
    event=$1
    type=$5

    if(event == "+"){
        enqueue++;
    }
    if(event == "r"){
        recvpkt++;
    }
    if(event == "d"){
        forwardpkt++;
    }
    if(type == "tcp")
    {
        tcp++;
    }
    if(type == "cbr")
    {
        cbr++;
    }
    if(type == "ack")
    {
        ack++;
    }
}

END{
    printf("num of enqueues are: %d \n", enqueue);
    printf("num of recieved packets are: %d \n", recvpkt);
    printf("num of dropped packets are: %d \n", droppkt);
    printf("num of ack are: %d \n", ack);
    printf("num of cbr are: %d \n", cbr);
    printf("num of tcp are: %d \n", tcp);
}