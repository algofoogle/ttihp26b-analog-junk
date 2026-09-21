v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 190 -140 200 -140 {lab=#net1}
N 190 -140 190 -110 {lab=#net1}
N 190 -110 200 -110 {lab=#net1}
N 200 -110 200 -70 {lab=#net1}
N 200 -190 200 -170 {lab=Vbias}
N 200 -190 240 -190 {lab=Vbias}
N 200 -210 200 -190 {lab=Vbias}
N 240 -190 240 -140 {lab=Vbias}
N 240 -140 260 -140 {lab=Vbias}
N 200 -300 200 -270 {lab=VPWR}
N 160 -240 160 -190 {lab=Vbias}
N 160 -190 200 -190 {lab=Vbias}
N 200 -240 210 -240 {lab=VPWR}
N 210 -270 210 -240 {lab=VPWR}
N 200 -270 210 -270 {lab=VPWR}
C {sg13g2_pr/sg13_lv_nmos.sym} 220 -140 0 1 {name=M1
w=2.00u
l=0.45u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 260 -140 0 1 {name=p13 sig_type=std_logic lab=Vbias}
C {sg13g2_pr/sg13_lv_pmos.sym} 180 -240 0 0 {name=M2
w=1.00u
l=0.30u
ng=1
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 80 -340 0 1 {name=p1 lab=VPWR}
C {opin.sym} 80 -300 0 0 {name=p2 lab=Vbias}
C {iopin.sym} 80 -320 0 1 {name=p3 lab=VGND}
C {lab_pin.sym} 200 -300 0 1 {name=p4 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 200 -70 0 1 {name=p5 sig_type=std_logic lab=VGND}
