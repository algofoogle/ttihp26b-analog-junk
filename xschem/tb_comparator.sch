v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 180 -890 980 -490 {flags=graph
y1=-0.1
y2=1.3
ypos1=0
ypos2=2
divy=10
subdivy=2
unity=1
x1=0
x2=1.5e-06
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="5 6 4 18"
node="inp
inn
out
\\"diff; inp inn - 100 * 1.9 +\\""}
N 820 -380 820 -300 {lab=0}
N 760 -460 760 -380 {lab=out}
N 700 -460 700 -420 {lab=VPWR}
N 700 -340 700 -300 {lab=0}
N 600 -400 640 -400 {lab=#net1}
N 600 -360 640 -360 {lab=#net2}
N 280 -260 290 -260 {lab=0}
N 280 -260 280 -230 {lab=0}
N 280 -230 290 -230 {lab=0}
N 290 -230 290 -190 {lab=0}
N 680 -340 680 -300 {lab=Vbias}
N 290 -310 290 -290 {lab=Vbias}
N 290 -310 330 -310 {lab=Vbias}
N 290 -330 290 -310 {lab=Vbias}
N 290 -420 290 -390 {lab=VBREF}
N 330 -310 330 -260 {lab=Vbias}
N 330 -260 380 -260 {lab=Vbias}
C {devices/code_shown.sym} 1000 -630 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 1000 -820 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 50p 1500n
write tb_comparator.raw
.endc
"}
C {devices/launcher.sym} 1050 -880 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/tb_comparator.raw tran"
}
C {vsource.sym} 1140 -540 0 0 {name=V1 value="pulse(0.45 0.85 0 50n 50n 10n 120n)" savecurrent=false}
C {res.sym} 570 -400 3 0 {name=R1
value=1
footprint=1206
device=resistor
m=1}
C {res.sym} 790 -380 3 0 {name=R2
value=1Meg
footprint=1206
device=resistor
m=1}
C {gnd.sym} 1140 -510 0 0 {name=l2 lab=0}
C {gnd.sym} 820 -300 0 0 {name=l3 lab=0}
C {vsource.sym} 1060 -540 0 0 {name=V2 value=1.2 savecurrent=false}
C {gnd.sym} 1060 -510 0 0 {name=l4 lab=0}
C {lab_pin.sym} 1060 -570 0 0 {name=p1 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 1140 -570 0 0 {name=p3 sig_type=std_logic lab=inp}
C {lab_pin.sym} 760 -460 0 1 {name=p4 sig_type=std_logic lab=out}
C {lab_pin.sym} 540 -400 0 0 {name=p5 sig_type=std_logic lab=inp}
C {comparator.sym} 660 -380 0 0 {name=x1}
C {lab_pin.sym} 700 -460 0 0 {name=p6 sig_type=std_logic lab=VPWR}
C {gnd.sym} 700 -300 0 0 {name=l5 lab=0}
C {res.sym} 570 -360 3 1 {name=R3
value=1
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 540 -360 0 0 {name=p2 sig_type=std_logic lab=inn}
C {vsource.sym} 1140 -410 0 0 {name=V3 value="pulse(0.45 0.85 5n 50n 50n 10n 137n)" savecurrent=false}
C {gnd.sym} 1140 -380 0 0 {name=l1 lab=0}
C {lab_pin.sym} 1140 -440 0 0 {name=p7 sig_type=std_logic lab=inn}
C {sg13g2_pr/sg13_lv_nmos.sym} 310 -260 0 1 {name=M3
w=2.00u
l=0.26u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {vsource.sym} 1060 -410 0 0 {name=V4 value=1.2 savecurrent=false}
C {gnd.sym} 1060 -380 0 0 {name=l6 lab=0}
C {lab_pin.sym} 1060 -440 0 0 {name=p9 sig_type=std_logic lab=VBREF}
C {lab_pin.sym} 290 -420 0 0 {name=p10 sig_type=std_logic lab=VBREF}
C {lab_pin.sym} 380 -260 0 1 {name=p12 sig_type=std_logic lab=Vbias}
C {res.sym} 290 -360 0 0 {name=R4
value=30k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 290 -190 0 0 {name=l8 lab=0}
C {lab_pin.sym} 680 -300 0 0 {name=p8 sig_type=std_logic lab=Vbias}
