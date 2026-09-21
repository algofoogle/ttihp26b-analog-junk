#!/usr/bin/bash

TARGET="tt_um_algofoogle_analog_junk.mag"
if [ -e "$TARGET" ]; then
    echo "$TARGET already exists"
else
    if [ ! -f magicrc ]; then
        echo "WARNING: There is no local magicrc file, so this might not work as expected."
        echo "You could get one from:"
        echo "https://github.com/algofoogle/ttihp26b-analog-junk/blob/main/magic/magicrc"
    fi
    #magic -dnull -noconsole -rcfile .magicrc magic_init_project.tcl
    magic -dnull -noconsole magic_init_project.tcl
fi
