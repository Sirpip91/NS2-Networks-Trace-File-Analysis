#shell script to run with gnuplot



set terminal png
set output '10nodewirelesslan.png'
set xrange [0:30]
set xlabel "Time(in seconds)"
set autoscale
set yrange [0:1000]
set ylabel "Packets"
set grid
set style data lines
plot "10nodeformated.txt" using 1:2 title "UDP wireless" lt rgb "green"