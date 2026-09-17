<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

A custom GDS layout implements some simple analog circuits with an interface to the Tiny Tapeout digital pins of a 1x1 tile.

## How to test

Various `ui_in` inputs select parts of the analog circuit and the `uo_out` pins reflect results.

## External hardware

Maybe an oscilloscope for carefully monitoring things, but otherwise MicroPython scripts run on the Tiny Tapeout demo board can drive the thing and gather results. For more info, see the original repo (https://github.com/algofoogle/ttihp26b-analog-junk).
