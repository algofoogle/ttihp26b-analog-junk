v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 180 -890 980 -490 {flags=graph
y1=-0.0017
y2=1.2
ypos1=0
ypos2=2
divy=24
subdivy=2
unity=1
x1=0
x2=5e-06
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="5 6 10 4 18 21 3"
node="inp
inn
out_pex
out
\\"dd; inp inn > \\"
XXx1.diff
XXx1.diff_amp"
xlabmag=0.5
ylabmag=1.2
legendmag=0.7
vlegend=0
legend=1}
B 2 180 -1300 980 -900 {flags=graph
y1=1e-05
y2=0.00012
ypos1=0
ypos2=2
divy=24
subdivy=2
unity=1
x1=0
x2=5e-06
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="5 6 21 4"
node="\\"Ivbias (-A); i(vvbref) -1 *\\"
\\"Ivpwr (-A); i(vvpwr) -1 *\\"
\\"Itail (A); i(@n.x1.xm5.nsg13_lv_nmos[ids])\\"
\\"Iref (A); i(@n.xm1.nsg13_lv_nmos[ids])\\""
xlabmag=0.5
ylabmag=1.2
legendmag=0.7
vlegend=0
legend=1
hcursor2_y=2.451498e-05
hcursor1_y=3.5965596e-06}
N 1540 -1070 1550 -1070 {lab=0}
N 1540 -1070 1540 -1040 {lab=0}
N 1540 -1040 1550 -1040 {lab=0}
N 1550 -1040 1550 -1000 {lab=0}
N 1550 -1120 1550 -1100 {lab=Vbias_ALT}
N 1550 -1120 1590 -1120 {lab=Vbias_ALT}
N 1550 -1140 1550 -1120 {lab=Vbias_ALT}
N 1550 -1230 1550 -1200 {lab=VBREF}
N 1590 -1120 1590 -1070 {lab=Vbias_ALT}
N 1590 -1070 1610 -1070 {lab=Vbias_ALT}
N 1610 -1070 1610 -1010 {lab=Vbias_ALT}
N 1350 -840 1380 -840 {lab=out}
N 1620 -840 1670 -840 {lab=out_pex}
C {devices/code_shown.sym} 1000 -1220 0 0 {name=MODEL only_toplevel=true
text_size_1=0.25
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 1000 -640 0 0 {name=NGSPICE only_toplevel=true
text_size_1=0.2
value=".param temp=27
.param vinlo=0.3
.param vinhi=0.9
.param vnudge=0.02
*.option savecurrents
.control
tran 50p 5000n
save
+ @r2[i] @n.x1.xm5.nsg13_lv_nmos[ids] @n.xm3.nsg13_lv_nmos[ids] @n.xm1.nsg13_lv_nmos[ids]
+ all
write tb_comparator.raw
.endc
"}
C {devices/launcher.sym} 1060 -1280 0 0 {name=h5
descr="tb_comparator.raw" 
tclcommand="xschem raw_read $netlist_dir/tb_comparator.raw tran"
}
C {vsource.sym} 1140 -1140 0 0 {name=V1 value="pulse(\{vinlo-vnudge\} \{vinhi+vnudge\} 0 100n 100n 20n 239n)" savecurrent=false}
C {res.sym} 1230 -890 0 1 {name=R1
value=100k
footprint=1206
device=resistor
m=1}
C {res.sym} 1380 -810 0 0 {name=R2
value=1Meg
footprint=1206
device=resistor
m=1}
C {gnd.sym} 1140 -1110 0 0 {name=l2 lab=0}
C {gnd.sym} 1380 -780 0 0 {name=l3 lab=0}
C {vsource.sym} 1060 -1140 0 0 {name=Vvpwr value=1.2 savecurrent=false}
C {gnd.sym} 1060 -1110 0 0 {name=l4 lab=0}
C {lab_pin.sym} 1060 -1170 0 0 {name=p1 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 1140 -1170 0 0 {name=p3 sig_type=std_logic lab=inp}
C {lab_pin.sym} 1380 -840 3 1 {name=p4 sig_type=std_logic lab=out}
C {lab_pin.sym} 1230 -920 1 0 {name=p5 sig_type=std_logic lab=inp}
C {comparator.sym} 1250 -840 0 0 {name=x1}
C {lab_pin.sym} 1290 -880 1 0 {name=p6 sig_type=std_logic lab=VPWR}
C {gnd.sym} 1290 -800 0 0 {name=l5 lab=0}
C {res.sym} 1230 -790 2 0 {name=R3
value=100k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 1230 -760 3 0 {name=p2 sig_type=std_logic lab=inn}
C {vsource.sym} 1140 -1030 0 0 {name=V3 value="pulse(\{vinlo\} \{vinhi\} 10n 100n 100n 20n 271n)" savecurrent=false}
C {gnd.sym} 1140 -1000 0 0 {name=l1 lab=0}
C {lab_pin.sym} 1140 -1060 0 0 {name=p7 sig_type=std_logic lab=inn}
C {sg13g2_pr/sg13_lv_nmos.sym} 1570 -1070 0 1 {name=M3
w=2.00u
l=0.45u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {vsource.sym} 1060 -1030 0 0 {name=Vvbref value=1.2 savecurrent=false}
C {gnd.sym} 1060 -1000 0 0 {name=l6 lab=0}
C {lab_pin.sym} 1060 -1060 0 0 {name=p9 sig_type=std_logic lab=VBREF}
C {lab_pin.sym} 1550 -1230 0 0 {name=p10 sig_type=std_logic lab=VBREF}
C {res.sym} 1550 -1170 0 0 {name=R4
value=30k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 1550 -1000 0 0 {name=l8 lab=0}
C {lab_pin.sym} 1270 -800 3 0 {name=p8 sig_type=std_logic lab=Vbias}
C {lab_pin.sym} 1610 -1010 0 1 {name=p12 sig_type=std_logic lab=Vbias_ALT}
C {res.sym} 1500 -890 0 1 {name=R5
value=100k
footprint=1206
device=resistor
m=1}
C {res.sym} 1670 -810 0 0 {name=R6
value=1Meg
footprint=1206
device=resistor
m=1}
C {gnd.sym} 1670 -780 0 0 {name=l9 lab=0}
C {lab_pin.sym} 1670 -840 3 1 {name=p14 sig_type=std_logic lab=out_pex}
C {lab_pin.sym} 1500 -920 1 0 {name=p15 sig_type=std_logic lab=inp}
C {comparator.sym} 1520 -840 0 0 {name=x2
schematic=comparator_pex.sim
spice_sym_def="tcleval(.include [file normalize ../magic/comparator.sim.spice])"
tclcommand="textwindow [file normalize ../magic/comparator.sim.spice]"
}
C {lab_pin.sym} 1560 -880 1 0 {name=p16 sig_type=std_logic lab=VPWR}
C {gnd.sym} 1560 -800 0 0 {name=l10 lab=0}
C {res.sym} 1500 -790 2 0 {name=R7
value=100k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 1500 -760 3 0 {name=p17 sig_type=std_logic lab=inn}
C {lab_pin.sym} 1540 -800 3 0 {name=p18 sig_type=std_logic lab=Vbias}
C {vbias.sym} 1060 -840 0 0 {name=x3}
C {lab_pin.sym} 1060 -890 1 0 {name=p11 sig_type=std_logic lab=VBREF}
C {gnd.sym} 1060 -790 0 0 {name=l7 lab=0}
C {lab_pin.sym} 1120 -840 2 0 {name=p13 sig_type=std_logic lab=Vbias}
