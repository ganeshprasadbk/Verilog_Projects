# ZedBoard Pin Assignments
############################
# On-board Slide Switches  #
############################
set_property PACKAGE_PIN  Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 [get_ports clk]
