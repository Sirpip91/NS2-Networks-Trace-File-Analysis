# Networks Trace File Analysis

<b> This project was created for studying CSMA/CD and 802.11 (CSMA/CD) Protocols</b>

Structure of the project:
The two types of networks are separated into Two folders:

<b>1. wiredlan </b>
    This folder contains the files for wired LAN; CSMA/CD Protocols
    wiredlan.tcl is the original tcl;
    wiredlanincreased7.tcl; and wiredlanincreased.tcl are the additional loads done to the network.
    
    we then have packetdeliveryratiowired.awk and throughputwired.awk
    these are the wired networks program to create the data output and formated text for graphs.

    test.txt is the output used to creat graphs for wired.

    also are .png which are created from the outputs from our makegraph.sh
    I have left them to see :)



<b>2. wirelesslan</b>
    This folder contains the files for wireless LAN; Ad Hoc mode 802.11 Protocols
    wirelessLan.tcl is the original ns2 file to build upon.
    wirelessLan5nodes.tcl showcases additional load with 5 nodes.
    we then have 10node.tcl which showcases 10 nodes


    we then have packetdeliveryratio.awk, throughput.awk, and throughputavg.awk
    each of these output the needed information for wireless networks in the terminal.

    there are .txt which are created to use  makegraph.sh shell script that outputs
    the .png that are the graphs.

each script is in the folder that it needs to be in for that particular network setting (wireless/wired).


I hope you enjoyed project and the experiments that have been created to observer network behavior.


Thank you.

<br>

![website banner](https://github.com/Sirpip91/NS2-Networks-Trace-File-Analysis/blob/main/wirelesslan/10nodewirelesslan.png)

