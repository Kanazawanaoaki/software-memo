# software lec11
ソフトウェア第一の第１１回．  

GNUPLOTによるグラフ描画  
```
$ gnuplot

	G N U P L O T
	Version 5.2 patchlevel 2    last modified 2017-11-01

	Copyright (C) 1986-1993, 1998, 2004, 2007-2017
	Thomas Williams, Colin Kelley and many others

	gnuplot home:     http://www.gnuplot.info
	faq, bugs, etc:   type "help FAQ"
	immediate help:   type "help"  (plot window: hit 'h')

Terminal type is now 'qt'
gnuplot> plot sin(x)
gnuplot> splot x**2+y**2
gnuplot> exit
```
```
gnuplot> plot 'samp.dat' using 1:2 title 'graph1' with linespoint
gnuplot> plot 'samp.dat' using 1:2 title 'graph1' with linespoint linecolor rgb "green" linetype 5 linewidth 2 pointsize 5
```
```
gnuplot> show colorname
gnuplot> test
```
```
gnuplot> plot "samp.dat" using 1:2 title 'graph 1' with line,"samp.dat" using 1:3 title 'graph2' with line
gnuplot> pl "samp.dat" u 1:2 t 'graph1' w l lw 2.0,"samp.dat" u 1:3 t 'graph2' w l lw 3.0
gnuplot> set xrange[1:1.6]
gnuplot> set yrange[1:3]
gnuplot> replot
gnuplot> set grid
gnuplot> set xlabel "data()"
gnuplot> set ylabel "ydata"
gnuplot> replot
```

```
gnuplot> set output "samp-out.eps"
gnuplot> set terminal postscript enhanced color "Helvetica,20"

Terminal type is now 'postscript'
Options are 'landscape enhanced defaultplex \
   leveldefault color colortext \
   dashlength 1.0 linewidth 1.0 pointscale 1.0 butt noclip \
   nobackground \
   palfuncparam 2000,0.003 \
   "Helvetica" 20  fontscale 1.0 '
gnuplot> set yrange[1:10]
gnuplot> set logscale y
gnuplot> set format y "10^{%L}"
gnuplot> set key spacing 1.4
gnuplot> set title "{/Helvetica*2.0 Sample-out}"
gnuplot> set xlabel "data0"
gnuplot> set ylabel "y-data"
gnuplot> set xlabel font "Helvetica,24"
gnuplot> set ylabel font "Helvetica,24"
gnuplot> plot 'samp.dat' using 1:3 title "{/Symbol G}_{a}" w lp lc rgb "red" lw 3 ps 3, 'samp.dat' using 1:3 title "{/Symbol g}^{b}" w lp lc rgb "blue" lw 3 ps 3
```
