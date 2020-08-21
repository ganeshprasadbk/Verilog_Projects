Introduction:
Real Time Clock (RTC) is an important device for good relation with world. The first
application is to display the real time on 24h basis and it can be easily converted to accommodate
a 12h clock as well. The RTC can display in hours, minutes and seconds. This design is more
involved in the traffic controller design. The display system needs to be populated with all the
six, seven-segment LEDs for the real time clock applications.
The main applications of RTC are
 Real Time Display
 Stop Watch
 Industrial timer
 Photographic timer
 Medical Application using three alarm setting

Design Process of RTC:
The basic digital clock contained hours, minutes and seconds. Each one has MSB and
LSB.
The seven segments illustrate the “00-00-00” values of hours, HRM (hours of
MSB value) and HRL (Hours of LSB value). Then minutes as MIN_M and MIN_L. Then seconds as declared as SEC_M and SEC_L.


The basic digital block contain two designs,
 Counter
 Seven Segmentation
These are the main building blocks of digital clock. Counter will count the number in
decimal as 23:59:59. This is the 24h clock operation and it can easily convert to accommodate a
12h clock by changing format_ctrl to 0

Note:
To open the Xilinx project directly, double click & open
Real_Time_Clock.xpr
Path: ~\Xilinx_implementation\Real_Time_Clock\Real_Time_Clock.xpr
