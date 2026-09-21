v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 180 -890 980 -490 {flags=graph
y1=-0.0015
y2=1.3
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
color="5 6 4 18 8 21"
node="inp
inn
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
y1=2.8e-06
y2=5.9e-05
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
N 1460 -870 1460 -790 {lab=0}
N 1400 -950 1400 -870 {lab=out}
N 1340 -950 1340 -910 {lab=VPWR}
N 1340 -830 1340 -760 {lab=0}
N 1070 -780 1080 -780 {lab=0}
N 1070 -780 1070 -750 {lab=0}
N 1070 -750 1080 -750 {lab=0}
N 1080 -750 1080 -710 {lab=0}
N 1320 -830 1320 -760 {lab=Vbias}
N 1080 -830 1080 -810 {lab=Vbias_ALT}
N 1080 -830 1120 -830 {lab=Vbias_ALT}
N 1080 -850 1080 -830 {lab=Vbias_ALT}
N 1080 -940 1080 -910 {lab=VBREF}
N 1120 -830 1120 -780 {lab=Vbias_ALT}
N 1120 -780 1140 -780 {lab=Vbias_ALT}
N 1280 -850 1280 -810 {lab=#net1}
N 1280 -930 1280 -890 {lab=#net2}
N 1590 -770 1600 -770 {lab=0}
N 1590 -770 1590 -740 {lab=0}
N 1590 -740 1600 -740 {lab=0}
N 1600 -740 1600 -700 {lab=0}
N 1600 -820 1600 -800 {lab=Vbias}
N 1600 -820 1640 -820 {lab=Vbias}
N 1600 -840 1600 -820 {lab=Vbias}
N 1640 -820 1640 -770 {lab=Vbias}
N 1640 -770 1660 -770 {lab=Vbias}
N 1600 -930 1600 -900 {lab=VBREF}
N 1560 -870 1560 -820 {lab=Vbias}
N 1560 -820 1600 -820 {lab=Vbias}
N 1600 -870 1610 -870 {lab=VBREF}
N 1610 -900 1610 -870 {lab=VBREF}
N 1600 -900 1610 -900 {lab=VBREF}
N 1140 -780 1140 -720 {lab=Vbias_ALT}
C {devices/code_shown.sym} 1000 -1220 0 0 {name=MODEL only_toplevel=true
text_size_1=0.25
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 1010 -640 0 0 {name=NGSPICE only_toplevel=true
text_size_1=0.2
value=".param temp=27
.param vinlo=0.3
.param vinhi=0.9
.param vnudge=0.02
.option savecurrents
.control
save 
+ @r2[i] @n.x1.xm5.nsg13_lv_nmos[ids] @n.xm3.nsg13_lv_nmos[ids] @n.xm1.nsg13_lv_nmos[ids]
+ all
tran 50p 5000n
write tb_comparator.raw
.endc
"}
C {devices/launcher.sym} 1060 -1280 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/tb_comparator.raw tran"
}
C {vsource.sym} 1140 -1140 0 0 {name=V1 value="pulse(\{vinlo-vnudge\} \{vinhi+vnudge\} 0 100n 100n 20n 239n)" savecurrent=false}
C {res.sym} 1250 -930 3 0 {name=R1
value=1
footprint=1206
device=resistor
m=1}
C {res.sym} 1430 -870 3 0 {name=R2
value=1Meg
footprint=1206
device=resistor
m=1}
C {gnd.sym} 1140 -1110 0 0 {name=l2 lab=0}
C {gnd.sym} 1460 -790 0 0 {name=l3 lab=0}
C {vsource.sym} 1060 -1140 0 0 {name=Vvpwr value=1.2 savecurrent=false}
C {gnd.sym} 1060 -1110 0 0 {name=l4 lab=0}
C {lab_pin.sym} 1060 -1170 0 0 {name=p1 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 1140 -1170 0 0 {name=p3 sig_type=std_logic lab=inp}
C {lab_pin.sym} 1400 -950 0 1 {name=p4 sig_type=std_logic lab=out}
C {lab_pin.sym} 1220 -930 0 0 {name=p5 sig_type=std_logic lab=inp}
C {comparator.sym} 1300 -870 0 0 {name=x1}
C {lab_pin.sym} 1340 -950 0 0 {name=p6 sig_type=std_logic lab=VPWR}
C {gnd.sym} 1340 -760 0 0 {name=l5 lab=0}
C {res.sym} 1250 -810 3 1 {name=R3
value=1
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 1220 -810 0 0 {name=p2 sig_type=std_logic lab=inn}
C {vsource.sym} 1140 -1030 0 0 {name=V3 value="pulse(\{vinlo\} \{vinhi\} 10n 100n 100n 20n 271n)" savecurrent=false}
C {gnd.sym} 1140 -1000 0 0 {name=l1 lab=0}
C {lab_pin.sym} 1140 -1060 0 0 {name=p7 sig_type=std_logic lab=inn}
C {sg13g2_pr/sg13_lv_nmos.sym} 1100 -780 0 1 {name=M3
w=2.00u
l=0.39u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {vsource.sym} 1060 -1030 0 0 {name=Vvbref value=1.2 savecurrent=false}
C {gnd.sym} 1060 -1000 0 0 {name=l6 lab=0}
C {lab_pin.sym} 1060 -1060 0 0 {name=p9 sig_type=std_logic lab=VBREF}
C {lab_pin.sym} 1080 -940 0 0 {name=p10 sig_type=std_logic lab=VBREF}
C {res.sym} 1080 -880 0 0 {name=R4
value=30k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 1080 -710 0 0 {name=l8 lab=0}
C {lab_pin.sym} 1320 -760 0 0 {name=p8 sig_type=std_logic lab=Vbias}
C {sg13g2_pr/sg13_lv_nmos.sym} 1620 -770 0 1 {name=M1
w=2.00u
l=0.39u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 1600 -930 0 0 {name=p11 sig_type=std_logic lab=VBREF}
C {lab_pin.sym} 1660 -770 0 1 {name=p13 sig_type=std_logic lab=Vbias}
C {gnd.sym} 1600 -700 0 0 {name=l7 lab=0}
C {sg13g2_pr/sg13_lv_pmos.sym} 1580 -870 0 0 {name=M2
w=1.00u
l=0.30u
ng=1
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 1140 -720 0 1 {name=p12 sig_type=std_logic lab=Vbias_ALT}
