# Create a new Vivado project
create_project led_flasher ./led_flasher -part xc7s50csga324-1

# Add VHDL source file
add_files ./LED_Flasher.vhd
set_property FILE_TYPE {VHDL} [get_files ./LED_Flasher.vhd]

# Add existing constraints file (ensure arty_s7_50.xdc exists)
add_files ./arty_s7_50.xdc
set_property FILE_TYPE {XDC} [get_files ./arty_s7_50.xdc]

# Set the top module
set_property top LED_Flasher [current_fileset]

# Run synthesis
launch_runs synth_1 -jobs 4

# Run implementation
launch_runs impl_1 -jobs 4

# Generate the bitstream
launch_runs impl_1 -to_step write_bitstream

# Save the project
save_project_as ./led_flasher