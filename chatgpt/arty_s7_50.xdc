## Clock signal
set_property PACKAGE_PIN r2 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Reset signal (active-low, connected to btn[0])
set_property PACKAGE_PIN C18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## LED output (connected to LD4 on the board)
set_property PACKAGE_PIN e18 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports led]