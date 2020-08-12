# ZedBoard Pin Assignments
############################
# On-board Slide Switches  #
############################
set_property PACKAGE_PIN R18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN N15 [get_ports count_e]
set_property IOSTANDARD LVCMOS33 [get_ports count_e]

set_property PACKAGE_PIN  Y9 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -period 10 [get_ports clock]

############################
# On-board led             #
############################
set_property PACKAGE_PIN T22 [get_ports count[0]]
set_property IOSTANDARD LVCMOS33 [get_ports count[0]]
set_property PACKAGE_PIN T21 [get_ports count[1]]
set_property IOSTANDARD LVCMOS33 [get_ports count[1]]
set_property PACKAGE_PIN U22 [get_ports count[2]]
set_property IOSTANDARD LVCMOS33 [get_ports count[2]]
set_property PACKAGE_PIN U21 [get_ports count[3]]
set_property IOSTANDARD LVCMOS33 [get_ports count[3]]
set_property PACKAGE_PIN V22 [get_ports count[4]]
set_property IOSTANDARD LVCMOS33 [get_ports count[4]]
set_property PACKAGE_PIN W22 [get_ports count[5]]
set_property IOSTANDARD LVCMOS33 [get_ports count[5]]
set_property PACKAGE_PIN U19 [get_ports count[6]]
set_property IOSTANDARD LVCMOS33 [get_ports count[6]]
set_property PACKAGE_PIN U14 [get_ports count[7]]
set_property IOSTANDARD LVCMOS33 [get_ports count[7]]
