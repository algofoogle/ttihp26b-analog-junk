# This script was formerly used as the 'setup script' by the "lvs" command in lvs_netgen.tcl.

puts "============ ANTON's tcl/lvs_setup_script.tcl ============"
# Imports this default setup from the PDK:
source  $::env(PDK_ROOT)/$::env(PDK)/libs.tech/netgen/$::env(PDK)_setup.tcl

puts "============ Finished loading PDK default $::env(PDK)_setup.tcl ============"

set cells1 [cells list -all -circuit1]
set cells2 [cells list -all -circuit2]

# Ignore simulation-only "mm_ok" property on various devices...

set devices {}
lappend devices ptap1
lappend devices ntap1
lappend devices rsil
lappend devices rppd
lappend devices rhigh
lappend devices sg13_lv_nmos
lappend devices sg13_lv_pmos

foreach dev $devices {
    # Remove mm_ok property from used devices in circuit 1:
    if {[lsearch $cells1 $dev] >= 0} { property "-circuit1 $dev" delete mm_ok }
    # Remove mm_ok property from used devices in circuit 2:
    if {[lsearch $cells1 $dev] >= 0} { property "-circuit2 $dev" delete mm_ok }
}

puts "============ Finished Anton's tcl/lvs_setup_script.tcl ============"
