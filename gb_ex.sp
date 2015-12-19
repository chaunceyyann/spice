amp application

*-----------------------------------------------------------------------------

V1 in 0 0.0 ac 1.0 SIN(2.5 2.5 1kHz)

aamp in aout gain_block
.model gain_block gain(gain=4 out_offset=-7.5)

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

*plot to .ps file nodes tline_input and tline_output every 1ns for 45ns
 * hardcopy tline_plot.ps V(tline_input) V(tline_output) xl 0.1ns 40ns

.endc

.end
