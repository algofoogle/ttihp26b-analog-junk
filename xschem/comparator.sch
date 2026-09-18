v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 460 -250 470 -250 {lab=VGND}
N 470 -250 470 -220 {lab=VGND}
N 460 -220 470 -220 {lab=VGND}
N 460 -220 460 -180 {lab=VGND}
N 340 -340 340 -300 {lab=#net1}
N 460 -300 580 -300 {lab=#net1}
N 580 -340 580 -300 {lab=#net1}
N 460 -300 460 -280 {lab=#net1}
N 340 -300 460 -300 {lab=#net1}
N 460 -370 580 -370 {lab=VGND}
N 460 -370 460 -330 {lab=VGND}
N 340 -370 460 -370 {lab=VGND}
N 580 -440 580 -400 {lab=#net2}
N 380 -510 540 -510 {lab=#net3}
N 340 -440 380 -440 {lab=#net3}
N 380 -510 380 -440 {lab=#net3}
N 340 -480 340 -440 {lab=#net3}
N 340 -440 340 -400 {lab=#net3}
N 330 -510 340 -510 {lab=VPWR}
N 330 -540 330 -510 {lab=VPWR}
N 330 -540 340 -540 {lab=VPWR}
N 580 -510 590 -510 {lab=VPWR}
N 590 -540 590 -510 {lab=VPWR}
N 580 -540 590 -540 {lab=VPWR}
N 340 -580 340 -540 {lab=VPWR}
N 580 -580 580 -540 {lab=VPWR}
N 460 -580 580 -580 {lab=VPWR}
N 460 -620 460 -580 {lab=VPWR}
N 340 -580 460 -580 {lab=VPWR}
N 580 -440 680 -440 {lab=#net2}
N 580 -480 580 -440 {lab=#net2}
N 680 -510 680 -440 {lab=#net2}
N 680 -510 720 -510 {lab=#net2}
N 760 -510 770 -510 {lab=VPWR}
N 770 -540 770 -510 {lab=VPWR}
N 760 -540 770 -540 {lab=VPWR}
N 760 -580 760 -540 {lab=VPWR}
N 580 -580 760 -580 {lab=VPWR}
N 760 -390 760 -280 {lab=#net4}
N 760 -250 770 -250 {lab=VGND}
N 770 -250 770 -220 {lab=VGND}
N 760 -220 770 -220 {lab=VGND}
N 760 -220 760 -180 {lab=VGND}
N 880 -390 880 -330 {lab=#net4}
N 760 -390 880 -390 {lab=#net4}
N 760 -480 760 -390 {lab=#net4}
N 880 -450 880 -390 {lab=#net4}
N 920 -390 920 -360 {lab=out}
N 920 -390 1000 -390 {lab=out}
N 920 -420 920 -390 {lab=out}
N 760 -580 920 -580 {lab=VPWR}
N 920 -580 920 -480 {lab=VPWR}
N 920 -450 930 -450 {lab=VPWR}
N 930 -480 930 -450 {lab=VPWR}
N 920 -480 930 -480 {lab=VPWR}
N 920 -330 930 -330 {lab=VGND}
N 930 -330 930 -300 {lab=VGND}
N 920 -300 930 -300 {lab=VGND}
N 920 -300 920 -180 {lab=VGND}
C {sg13g2_pr/sg13_lv_nmos.sym} 320 -370 0 0 {name=M1
w=4.00u
l=0.26u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 560 -510 0 0 {name=M4
w=8.00u
l=0.26u
ng=1
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 440 -250 0 0 {name=M5
w=2.00u
l=0.39u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 600 -370 0 1 {name=M2
w=4.00u
l=0.26u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 460 -330 0 0 {name=p1 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 460 -180 0 0 {name=p2 sig_type=std_logic lab=VGND}
C {sg13g2_pr/sg13_lv_pmos.sym} 360 -510 0 1 {name=M3
w=8.00u
l=0.26u
ng=1
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 460 -620 0 0 {name=p5 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 420 -250 0 0 {name=p6 sig_type=std_logic lab=Vbias}
C {sg13g2_pr/sg13_lv_pmos.sym} 740 -510 0 0 {name=M6
w=8.00u
l=0.26u
ng=1
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 740 -250 0 0 {name=M7
w=2.00u
l=0.39u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 760 -180 0 0 {name=p7 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 720 -250 0 0 {name=p8 sig_type=std_logic lab=Vbias}
C {sg13g2_pr/sg13_lv_pmos.sym} 900 -450 0 0 {name=M8
w=1.20u
l=0.13u
ng=1
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 900 -330 0 0 {name=M9
w=0.50u
l=0.13u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 920 -180 0 0 {name=p10 sig_type=std_logic lab=VGND}
C {iopin.sym} 220 -620 0 1 {name=p13 lab=VPWR}
C {ipin.sym} 300 -370 0 0 {name=p3 lab=in_p}
C {ipin.sym} 620 -370 0 1 {name=p4 lab=in_n}
C {opin.sym} 1000 -390 0 0 {name=p14 lab=out}
C {iopin.sym} 220 -590 0 1 {name=p9 lab=VGND}
C {ipin.sym} 220 -560 0 0 {name=p11 lab=Vbias}
