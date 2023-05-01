#make the simulator object 
set ns [new Simulator]

#make the trace file to operate on or write
set tracefile [open wiredlan.tr w]
$ns trace-all $tracefile

#make the nam for visuals
set namfile [open wiredlan.nam w]
$ns namtrace-all $namfile
#for the new trace format
$ns use-newtrace

#create nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

#making the link between nodes and the info
$ns duplex-link $n0 $n1 5Mb 2ms DropTail
$ns duplex-link $n2 $n1 10Mb 5ms DropTail
$ns duplex-link $n1 $n4 3Mb 10ms DropTail
$ns duplex-link $n4 $n3 100Mb 2ms DropTail
$ns duplex-link $n4 $n5 4Mb 10ms DropTail

# udp agent
#node 0 -> node 3
set udp [new Agent/UDP]
set null [new Agent/Null]
$ns attach-agent $n0 $udp
$ns attach-agent $n3 $null
$ns connect $udp $null


#TCP Agent
set tcp [new Agent/TCP]
set sink [new Agent/TCPSink]
$ns attach-agent $n2 $tcp
$ns attach-agent $n5 $sink
$ns connect $tcp $sink

#CBR Constant Bit Rate 
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp

#FTP File Transfer Protocol
set ftp [new Application/FTP]
$ftp attach-agent $tcp

#start
$ns at 1.0 "$cbr start"
$ns at 2.0 "$ftp start"

$ns at 10.0 "finish"

#put all info on trace and finsish!
proc finish {} {
 global ns tracefile namfile
 $ns flush-trace
 close $tracefile
 close $namfile
 exit 0
}

puts "Starting the session!"
$ns run