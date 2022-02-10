# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\sim00\OneDrive\Documents\Atelier2\Atelier2_system\_ide\scripts\debugger_atelier2-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\sim00\OneDrive\Documents\Atelier2\Atelier2_system\_ide\scripts\debugger_atelier2-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351A78095A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351A78095A-13722093-0"}
fpga -file C:/Users/sim00/OneDrive/Documents/Atelier2/Atelier2/_ide/bitstream/Atelier2_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/sim00/OneDrive/Documents/Atelier2/Atelier2_wrapper/export/Atelier2_wrapper/hw/Atelier2_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/sim00/OneDrive/Documents/Atelier2/Atelier2/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/sim00/OneDrive/Documents/Atelier2/Atelier2/Debug/Atelier2.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
