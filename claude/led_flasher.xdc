# Clock signal (100 MHz)
set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }];

# Reset push button (BTN0)
set_property -dict { PACKAGE_PIN C18   IOSTANDARD LVCMOS33 } [get_ports { rst }];

# LED output (LD0)
set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { led_out }];
