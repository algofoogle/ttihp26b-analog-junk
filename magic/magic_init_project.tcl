# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2024-2025 Tiny Tapeout LTD
# Authors: Uri Shaked and Anton Maurovic
# Description:
#   This script initializes a new Magic project for an analog design on Tiny Tapeout.
#   It has been been modified by Anton for this particular ttihp26b 1x1 project.

# Important: before running this script, download the the .def file from
# https://github.com/TinyTapeout/tt-support-tools/raw/refs/heads/main/tech/ihp-sg13g2/def/tt_block_1x1_pgvdd.def

# Run the script like this:
#   magic -dnull -noconsole -rcfile magicrc magic_init_project.tcl
# ...and expect to find tt_um_algofoogle_ttsky26c_analog.mag has been created.

# Change the settings below to match your design:
# ------------------------------------------------
set TOP_LEVEL_CELL      tt_um_algofoogle_analog_junk
set TEMPLATE_FILE       tt_block_1x1_pgvdd.def
set TEMPLATE_HEIGHT     154.9um             ;# Rounded down to nearest 0.1um
set POWER_STRIPE_VGAP   5um                 ;# Top and bottom margin between power stripe and tile boundary
set POWER_STRIPE_WIDTH  3um                 ;# The minimum width is 2.1um
set POWER_TOP_METAL     met6

# Power stripes: NET name, x position. You can add additional power stripes for each net, as needed.
# Min spacing: 1.64um. I rounded up to 1.7um so went with X at 0.1um and 0.1+3.0+1.7 = 4.8um
set POWER_STRIPES {
    VDPWR 0.1um
    VGND  4.8um
}

# Read in the pin positions
# -------------------------
def read $TEMPLATE_FILE
cellname rename tt_um_template $TOP_LEVEL_CELL

# Draw the power stripes
# --------------------------------
proc draw_power_stripe {name x} {
    global POWER_STRIPE_WIDTH
    global POWER_STRIPE_VGAP
    global TEMPLATE_HEIGHT
    global POWER_TOP_METAL
    box  $x $POWER_STRIPE_VGAP   $x $TEMPLATE_HEIGHT
    box width $POWER_STRIPE_WIDTH
    box shrink north $POWER_STRIPE_VGAP ;# Shrink the top edge, down.
    paint $POWER_TOP_METAL
    label $name FreeSans 2.8u 90 0 0 center $POWER_TOP_METAL
    port make
    port use [expr {$name eq "VGND" ? "ground" : "power"}] ;# Attach "use" flag: this is ground or power (e.g. for LEF export later).
    port class bidirectional
    port connections n s e w
}

# You can add power stripes, as you need.
foreach {name x} $POWER_STRIPES {
    puts "Drawing power stripe $name at $x"
    draw_power_stripe $name $x
}

# Save the layout and export GDS/LEF
# ----------------------------------
save ${TOP_LEVEL_CELL}.mag
#file mkdir gds
#gds write gds/${TOP_LEVEL_CELL}.gds
#file mkdir lef
#lef write lef/${TOP_LEVEL_CELL}.lef -hide -pinonly
# puts "::: If you are running this script directly (without 'source')"
# puts "::: to build $TOP_LEVEL_CELL.mag, you should now: quit"
quit
