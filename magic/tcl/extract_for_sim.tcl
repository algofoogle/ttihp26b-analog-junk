set project [lindex $argv $argc-1]
load $project.mag
flatten tt_um_flat
load tt_um_flat
select top cell
cellname delete $project
cellname rename tt_um_flat ${project}_parax
echo "======= PERFORMING INITIAL EXTRACTION: extract all ======"
extract all
ext2sim labels on
ext2sim
extresist tolerance 1

# extresist tolerance 20 ; # Merge more resistors (normally 10%, pushing up to 20% for simpler netlist)
#NOTE: Uri uses tolerance 1 -- how is this different?
echo "======= EXTRACTING RESISTORS: extresist ======"
extresist
echo "======= ext2spice lvs ======"
ext2spice lvs
echo "======= ext2spice cthresh 0 ======"
# ext2spice cthresh 0 ; # Ignore caps below 1e-18 (normally 0, this should cut out ~36% of caps)
# ext2spice cthresh 0.005 ; # Ignore caps below 5e-18
ext2spice cthresh 0.025 ; # Ignore caps below 25e-18
#NOTE: Uri uses cthresh 10, while Matt uses 0 -- what units are these? According to Tim Edwards: fF

echo "======= ext2spice extresist on ======"
ext2spice extresist on
echo "======= ext2spice main run ======"
ext2spice -o $project.sim.spice
echo "======= DONE ======"
quit -noprompt
