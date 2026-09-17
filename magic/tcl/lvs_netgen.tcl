set layout_netlist_file_handle [readnet spice $project.lvs.spice]   ;# "L": Overall SPICE netlist extracted from layout.
set schem_netlist_file_handle  [readnet spice /dev/null]            ;# "S": Placeholder for schematic netlist; we'll add to it as needed, depending on what we're LVSing.
# readnet spice $::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice $schem_netlist_file_handle
readnet spice $::env(PDK_ROOT)/$::env(PDK)/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice $schem_netlist_file_handle
# readnet spice $::env(PDK_ROOT)/$::env(PDK)/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice $schem_netlist_file_handle
# readnet spice $::env(PDK_ROOT)/$::env(PDK)/libs.tech/ngspice/models/resistors_mod.lib
# readnet spice $::env(PDK_ROOT)/$::env(PDK)/libs.tech/ngspice/models/resistors_stat.lib
# readnet spice $::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice $schem_netlist_file_handle

if {$project eq "tt_um_algofoogle_analog_junk"} {

    # === LVS the whole design... ===

    # --- Add netlists that contribute to the overall schematics of the design ---

    # # Add spice files of any analog block(s), e.g:
    # readnet spice ../xschem/simulation/ringosc.spice $schem_netlist_file_handle
    # readnet spice ../xschem/simulation/csdac255.spice $schem_netlist_file_handle

    # # Add GL verilog of digital block(s) (i.e. flat file from LibreLane hardening):
    # readnet verilog ../verilog/gl/digital.pnl.v $schem_netlist_file_handle

    # Top-level abstract integration verilog, e.g. main project.v, or LVS-tweaked version:
    # readnet verilog ../src/LVS-project.v $schem_netlist_file_handle
    # readnet verilog ../verilog/dv/top.v $schem_netlist_file_handle
    readnet verilog ../src/project.v $schem_netlist_file_handle

    lvs "$layout_netlist_file_handle $project" "$schem_netlist_file_handle $project" \
        $::env(PDK_ROOT)/$::env(PDK)/libs.tech/netgen/$::env(PDK)_setup.tcl \
        $report_file \
        -blackbox

} else {

    # === LVS just a specific cell ===

    # Load SPICE netlist:
    readnet spice ../xschem/simulation/$project.spice $schem_netlist_file_handle
    
    lvs "$layout_netlist_file_handle $project" "$schem_netlist_file_handle $project" \
        $::env(PDK_ROOT)/$::env(PDK)/libs.tech/netgen/$::env(PDK)_setup.tcl \
        $report_file \
        -blackbox

}
