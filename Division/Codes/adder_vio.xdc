############################
# On-board clock  #
############################

set_property PACKAGE_PIN  Y9 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -period 10 [get_ports clock]