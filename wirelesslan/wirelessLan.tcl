#wireless lan tcl script (simulates wireless)


#initialize the variables
set val(chan) Channel/WirelessChannel;#Channel Type
set val(prop) Propagation/TwoRayGround;# radio-propagation model
set val(netif) Phy/WirelessPhy;# network interface type WAVELAN DSSS 2.4GHz
set val(mac) Mac/802_11;# MAC type
set val(ifq) Queue/DropTail/PriQueue;# interface queue type
set val(ll) LL;# link layer type
set val(ant) Antenna/OmniAntenna;# antenna model
set val(ifqlen) 50;# max packet in ifq
set val(nn) 6;# number of mobilenodes
set val(rp) AODV;# routing protocol
set val(x) 500;# in metres
set val(y) 500;# in metres
#Adhoc OnDemand Distance Vector

set ns [new Simulator]

#file io
set tracefile [open wirelessLan.tr w]
$ns trace-all $tracefile
set namfile [open wirelessLan.nam w]
$ns namtrace-all-wireless $namfile $val(x) $val(y)

#for the new trace format
$ns use-newtrace


#topography
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)

#GOD Creation - General Operations Director
create-god $val(nn)

set channel1 [new $val(chan)]


#Setup the node aswell as the trace settings
$ns node-config -adhocRouting $val(rp) \
  	-llType $val(ll) \
  	-macType $val(mac) \
  	-ifqType $val(ifq) \
  	-ifqLen $val(ifqlen) \
  	-antType $val(ant) \
  	-propType $val(prop) \
  	-phyType $val(netif) \
  	-topoInstance $topo \
  	-agentTrace ON \
  	-macTrace ON \
 	-routerTrace ON \
 	-movementTrace ON \
 	-channel $channel1 

# 6 nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
#random movement.
$n0 random-motion 0
$n1 random-motion 0
$n2 random-motion 0
$n3 random-motion 0
$n4 random-motion 0
$n5 random-motion 0

#initial position of the nodes
$ns initial_node_pos $n0 50
$ns initial_node_pos $n1 85
$ns initial_node_pos $n2 1
$ns initial_node_pos $n3 15
$ns initial_node_pos $n4 200
$ns initial_node_pos $n5 135

#initial coordinates of the nodes #max value is 500
$n0 set X_ 25.0
$n0 set Y_ 20.0
$n0 set Z_ 0.0

$n1 set X_ 210.0
$n1 set Y_ 230.0
$n1 set Z_ 0.0

$n2 set X_ 100.0
$n2 set Y_ 200.0
$n2 set Z_ 0.0

$n3 set X_ 150.0
$n3 set Y_ 230.0
$n3 set Z_ 0.0

$n4 set X_ 430.0
$n4 set Y_ 320.0
$n4 set Z_ 0.0

$n5 set X_ 300.0
$n5 set Y_ 450.0
$n5 set Z_ 0.0


#mobility of the nodes
#At what Time? Which node? Where to? at What Speed?
$ns at 1.0 "$n1 setdest 300.0 200.0 25.0"
$ns at 1.0 "$n2 setdest 150.0 175.0 15.0"
$ns at 1.0 "$n3 setdest 100.0 225.0 75.0"
$ns at 1.0 "$n4 setdest 300.0 130.0 5.0"
$ns at 1.0 "$n5 setdest 190.0 440.0 15.0"
#the nodes can move any number of times at any location during the simulation (runtime)
$ns at 5.0 "$n5 setdest 100.0 200.0 30.0"

#creation of agents
set tcp [new Agent/TCP]
set sink [new Agent/TCPSink]
$ns attach-agent $n0 $tcp
$ns attach-agent $n5 $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.1 "$ftp start"

set udp [new Agent/UDP]
set null [new Agent/Null]
$ns attach-agent $n2 $udp
$ns attach-agent $n3 $null
$ns connect $udp $null
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$ns at 1.0 "$cbr start"

$ns at 30.0 "finish"

proc finish {} {
 global ns tracefile namfile
 $ns flush-trace
 close $tracefile
 close $namfile
 exit 0
}

puts "Starting Simulation"
$ns run