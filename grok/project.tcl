# Create project and set up
set proj_name "LED_Flasher_Arty_S7"
set proj_dir "./$proj_name"

create_project $proj_name $proj_dir -part xc7s50csga324-1

# Set project properties
set_property board_part digilentinc.com:arty-s7-50:part0:1.1 [current_project]

# Add VHDL source file
add_files -fileset sources_1 -norecurse {led_flasher.vhd}

# Create constraints file
file mkdir $proj_dir/$proj_name.srcs/constrs_1/new
set xdc_file "$proj_dir/$proj_name.srcs/constrs_1/new/arty_s7_50.xdc"

# Write XDC file content
set fid [open $xdc_file w]
puts $fid {
    ## Clock signal
    set_property -dict { PACKAGE_PIN R2   IOSTANDARD LVCMOS33 } [get_ports { clk }];
    create_clock -add -name sys_clk_pin -period 10.000 -waveform {0 5.000} [get_ports { clk }];

     ## Reset Button (active low)
    set_property -dict { PACKAGE_PIN C18    IOSTANDARD LVCMOS33 PULLUP true } [get_ports { reset }];

    ## LEDs
    set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { led }];
}
close $fid

# Import constraints file
add_files -fileset constrs_1 -norecurse $xdc_file

# Close project
#close_project