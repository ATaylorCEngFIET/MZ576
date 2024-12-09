# Set project name and directory
set project_name "led_flasher"
set project_dir "[pwd]/${project_name}"

# Create project
create_project ${project_name} ${project_dir} -part xc7s50csga324-1

# Create VHDL source file
add_files -norecurse led_flasher.vhd
set_property file_type {VHDL} [get_files led_flasher.vhd]

# Create XDC constraint file
add_files -fileset constrs_1 -norecurse led_flasher.xdc

# Set top module
set_property top led_flasher [current_fileset]
