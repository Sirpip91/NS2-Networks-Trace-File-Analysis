#shell script to run with gnuplot

set terminal png
set output 'udpextranodewiredlanincreased.png'
set xrange [0:30]
set xlabel "Time(in seconds)"
set autoscale
set yrange [0:125]
set ylabel "Packets"
set grid
set style data lines
plot "test.txt" using 1:2 title "TCP wired"