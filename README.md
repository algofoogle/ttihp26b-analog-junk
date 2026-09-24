![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg)

# ttihp26b analog comparator driven by two 8b DACs in a 1x1 Tiny Tapeout tile

![tt_um_algofoogle_analog_junk custom GDS layout](./docs/layout.png)

Custom analog layout using the IHP sg13g2 open PDK, implementing a basic comparator whose inputs are driven by two 8-bit R2R DACs, all within a Tiny Tapeout 1x1 "digital only" tile.

* This project was built upon the ttihp-analog-template repo (read more [below](#how-this-project-was-created)).
* [Read the documentation for this project](docs/info.md)

## What is Tiny Tapeout?

Tiny Tapeout is an educational project that aims to make it easier and cheaper than ever to get your VLSI designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

## Analog projects

For specifications and instructions, see the [analog specs page](https://tinytapeout.com/specs/analog/).

## How this project was created

### Basic setup

1.  Make sure you've got your PDK environment (esp. environment variables like `PDK_ROOT` and `PDK`) loaded correctly.
2.  Go to https://github.com/tinyTapeout/ttihp-analog-template and "[Use this template](https://github.com/TinyTapeout/ttihp-analog-template/generate)"
3.  [Enable GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part) for the new repo.
4.  Create minimal docs, i.e. put something unique in [docs/info.md](./docs/info.md)
5.  Update [info.yaml](./info.yaml):
    *   Fill in the `project` section, deciding on a `top_module` name of the pattern `tt_um_YOURGITHUBNAME_YOURPROJECTNAME` -- in my case: `tt_um_algofoogle_analog_junk`
    *   Put in a single (dummy) `uo[0]` output pin.
    *   Because this is not using a true "analog" slot, delete `analog_pins` and the `ua[*]` pins at the bottom.
6.  Update the top module name in [src/project.v](./src/project.v) to reflect the one in point 5 above.
7.  Create the [`magic/`](./magic/) subdirectory, then in there download the [`tt_block_1x1_pgvdd.def`](https://github.com/TinyTapeout/tt-support-tools/blob/main/tech/ihp-sg13g2/def/tt_block_1x1_pgvdd.def) ([raw file download link here](https://github.com/TinyTapeout/tt-support-tools/raw/refs/heads/main/tech/ihp-sg13g2/def/tt_block_1x1_pgvdd.def)) template for 1x1 tiles.
8.  Drop in a copy of:
    *   [`magic/magic_init_project.tcl`](./magic/magic_init_project.tcl) -- NOTE: At minimum you'll need to edit this file to set `TOP_LEVEL_CELL`, and if porting this to a different template size, or different PDK, be sure to set the other paramaters in lines 17~30. You might also need to change the name(s) within `POWER_STRIPES` (e.g. sky130 optionally provides `VAPWR`).
    *   [`magic/make_1x1_tile_mag.sh`](./magic/make_1x1_tile_mag.sh) -- Edit [`magic/make_1x1_tile_mag.sh`](./magic/make_1x1_tile_mag.sh) to set your `TARGET` .mag filename (based on your top module name from point 5 above).
    *   [`magic/Makefile`](./magic/Makefile) -- Update `PROJECT_NAME`
    *   [`magic/magicrc`](./magic/magicrc) -- NOTE: My `magicrc` not only selects the correct PDK in a particular way which you might need to modify for your own environment, but it also has a few basic other things set up how I like for Magic.
    *   Everything in [`magic/tcl/`](./magic/tcl/) -- Update `lvs_netgen.tcl` to have the correct `tt_um_...` name.
9.  Build the `.mag` file by running:
    ```bash
    cd magic
    ./make_1x1_tile_mag.sh
    ```
10. Edit the resulting `tt_um_algofoogle_analog_junk.mag` in Magic to create some initial layout.
11. Generate GDS and LEF from the `.mag` file:
    ```bash
    make update_gds
    ```
12. Add the [`gds/`](./gds/) and [`lef/`](./lef/) files to the repo.
13. Commit and push everything to GitHub, and let GitHub Actions run through the `custom_gds` job and `precheck`.

### GDS art

See [`art/README.md`](./art/README.md)


### Basic comparator design notes

*   Vbias for my tail current NFET (2u/0.39u):
    *   Vbias=0.4705V when the mirror source NFET is fed from 1.2Vcc by a 30k R, for a ref current of 24.32uA (&plusmn; 0.2uA spikes during output edges) -- actual tail current ranges from 3.6uA to 24.5uA.
    *   Vbias=0.4504V when fed by PFET 1.0u/0.3u, for Iref of 19.5uA
*   Original version had L as multiples of 0.13u, but now I went with 50nm rounding (for easy layout).
    *   Iref PFET remains 1u/0.3u, mirror NFET is now 2u/0.45u: Vbias=0.4513V, Iref is 19.4uA.


## A note on LVS

I often find that Magic doesn't extract all "shorted" resistors (those with 0R) when using the IHP PDK. It will sometimes just do 1, and leave any other shorted nodes disconnected. For that reason I manually edited [`magic/tt_um_algofoogle_analog_junk.lvs.spice`](./magic/tt_um_algofoogle_analog_junk.lvs.spice) to add the missing 0R resistors at the bottom, and ran the top-level LVS like this:

```bash
netgen -batch eval 'set project tt_um_algofoogle_analog_junk ; set report_file "top.lvs.report" ; source tcl/lvs_netgen.tcl'
```

## Resources

- [FAQ](https://tinytapeout.com/faq/)
- [Digital design lessons](https://tinytapeout.com/digital_design/)
- [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
- [Join the community](https://tinytapeout.com/discord)
