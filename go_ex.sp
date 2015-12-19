amp version 1

*-----------------------------------------------------------------------------

V1 in 0 0.0 ac 1.0 SIN(2.5 2.5 1kHz)
V2 vref 0 dc 3.32

rf rmesh aout 300
rg1 rmesh vrefi 90
r1 vrefi vref 10
rg2 vrefi 0 30
xor in rmesh aout OPAMP1

*-----------------------------------------------------------------------------
* OPAMP MACRO MODEL, SINGLE-POLE 
* connections:      non-inverting input
*                   |   inverting input
*                   |   |   output
*                   |   |   |
.SUBCKT OPAMP1      1   2   6
* INPUT IMPEDANCE
RIN	1	2	10MEG
* DC GAIN (100K) AND POLE 1 (100HZ)
EGAIN	3 0	1 2	100K
RP1	3	4	1K
CP1	4	0	1.5915UF
* OUTPUT BUFFER AND RESISTANCE
EBUFFER	5 0	4 0	1
ROUT	5	6	10
.ENDS


*-----------------------------------------------------------------------------

.control
  set hcopydevtype=postscript

* color0 is background color
* color1 is the grid and text color
* colors 2-15 are for the vectors if you want to specify them
* uncomment next three lines to plot colors on white background
  set hcopypscolor=true
  set color0=rgb:f/f/f
  set color1=rgb:0/0/0

* to print the results directly to a printer uncomment the following line
* set hcopydev=kec3112

* run DC operating point simulation first
  op

*run transient simulation for 40ns with timesteps of 100ps
  tran 1e-5 2e-3

*plot nodes tline_input and tline_output every 1ns for 45ns
  plot in aout
* plot v(1) v(4)

*plot to .ps file nodes tline_input and tline_output every 1ns for 45ns
 * hardcopy tline_plot.ps V(tline_input) V(tline_output) xl 0.1ns 40ns

.endc

.end
