# ZedBoard Pin Assignments
############################
# On-board Slide Switches  #
############################
set_property PACKAGE_PIN F22 [get_ports ab[0]]
set_property IOSTANDARD LVCMOS33 [get_ports ab[0]]

set_property PACKAGE_PIN G22 [get_ports ab[1]]
set_property IOSTANDARD LVCMOS33 [get_ports ab[1]]

set_property PACKAGE_PIN M15 [get_ports rset]
set_property IOSTANDARD LVCMOS33 [get_ports rset]


set_property PACKAGE_PIN  Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 [get_ports clk]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets rset_IBUF]

############################
# On-board led             #
############################
set_property PACKAGE_PIN T22 [get_ports disp_cntr[0]]
set_property IOSTANDARD LVCMOS33 [get_ports disp_cntr[0]]

set_property PACKAGE_PIN T21 [get_ports disp_cntr[1]]
set_property IOSTANDARD LVCMOS33 [get_ports disp_cntr[1]]

set_property PACKAGE_PIN U22 [get_ports disp_cntr[2]]
set_property IOSTANDARD LVCMOS33 [get_ports disp_cntr[2]]

set_property PACKAGE_PIN U21 [get_ports disp_cntr[3]]
set_property IOSTANDARD LVCMOS33 [get_ports disp_cntr[3]]

set_property PACKAGE_PIN U19 [get_ports enter]
set_property IOSTANDARD LVCMOS33 [get_ports enter]

set_property PACKAGE_PIN U14 [get_ports exit]
set_property IOSTANDARD LVCMOS33 [get_ports exit]

#set_property PACKAGE_PIN W22 [get_ports state[0]]
#set_property IOSTANDARD LVCMOS33 [get_ports state[0]]

#set_property PACKAGE_PIN U19 [get_ports state[1]]
#set_property IOSTANDARD LVCMOS33 [get_ports state[1]]

#set_property PACKAGE_PIN U14 [get_ports state[2]]
#set_property IOSTANDARD LVCMOS33 [get_ports state[2]]

