EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 7000 6350 0    50   ~ 0
Global input labels:\n - ~CLKRQ~ - used to toggle to external clock, will happen at next master clock falling edge,\n - EXTCLK - external clock input,\n - ~STRETCH_0~ - used to indicate that the current cycle is not to be stretched\n - ~STRETCH_1~ - used to indicate that the current cycle is to be stretched by one full clock cycle\n - ~STRETCH_2~ - used to indicate that the current cycle is to be stretched by two full clock cycles\n - ~RES~ - master system reset (not the supervisor-controlled debug reset)\n\nGlobal output labels:\n - SYS_CLK - main system clock\n - ~SYS_CLK~ - inverted system clock
$Comp
L Oscillator:TCXO-14 X1
U 1 1 60F26D98
P 1300 2800
F 0 "X1" H 1400 3150 50  0000 L CNN
F 1 "14MHz" H 1400 3050 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 1750 2450 50  0001 C CNN
F 3 "http://www.golledge.com/pdf/products/tcxos/gtxos14.pdf" H 1200 2800 50  0001 C CNN
	1    1300 2800
	1    0    0    -1  
$EndComp
Text GLabel 1400 2350 2    50   Input ~ 0
+5V
Text GLabel 1400 3200 2    50   Input ~ 0
GND
Wire Wire Line
	1400 3200 1300 3200
Wire Wire Line
	1300 3200 1300 3100
Connection ~ 1300 3200
Wire Wire Line
	1300 2350 1300 2500
Connection ~ 1300 2350
Wire Wire Line
	1300 2350 1400 2350
$Comp
L 74xx:74HC04 U24
U 1 1 60F29EF5
P 6400 4200
F 0 "U24" H 6400 4517 50  0000 C CNN
F 1 "74AC04" H 6400 4426 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6400 4200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6400 4200 50  0001 C CNN
	1    6400 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5700 4900 5900
Connection ~ 4900 5700
Wire Wire Line
	4800 5700 4900 5700
Wire Wire Line
	4900 4500 5000 4500
Wire Wire Line
	4900 4600 5000 4600
Wire Wire Line
	4900 4800 5000 4800
Wire Wire Line
	4900 4900 5000 4900
Wire Wire Line
	4900 5100 5000 5100
Wire Wire Line
	4900 5200 5000 5200
Text GLabel 4900 5200 0    50   Input ~ 0
GND
Text GLabel 4900 5100 0    50   Input ~ 0
GND
Text GLabel 4900 4900 0    50   Input ~ 0
GND
Text GLabel 4900 4800 0    50   Input ~ 0
GND
Text GLabel 4900 4600 0    50   Input ~ 0
GND
Text GLabel 4900 4500 0    50   Input ~ 0
GND
NoConn ~ 6000 5100
NoConn ~ 6000 4800
NoConn ~ 6000 4500
Wire Wire Line
	5500 3800 5500 3900
Connection ~ 5500 3800
Wire Wire Line
	5400 3800 5500 3800
Wire Wire Line
	5100 3800 5200 3800
Text GLabel 5100 3800 0    50   Input ~ 0
GND
$Comp
L Device:C_Small C?
U 1 1 60F6BB47
P 5300 3800
AR Path="/5F8F4E1E/60F6BB47" Ref="C?"  Part="1" 
AR Path="/60F259A8/60F6BB47" Ref="C31"  Part="1" 
F 0 "C31" V 5071 3800 50  0000 C CNN
F 1 "0,1uF" V 5162 3800 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 5300 3800 50  0001 C CNN
F 3 "~" H 5300 3800 50  0001 C CNN
	1    5300 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	5500 5900 5500 5800
Wire Wire Line
	4900 5900 5500 5900
Wire Wire Line
	4900 5500 4900 5700
Wire Wire Line
	5000 5500 4900 5500
Wire Wire Line
	5600 3800 5500 3800
Wire Wire Line
	6700 4200 6800 4200
Text GLabel 7600 3700 2    50   Output ~ 0
~SYS_CLK
Wire Wire Line
	4900 4200 5000 4200
Text GLabel 4900 4200 0    50   Input ~ 0
EXTCLK
Text GLabel 4800 5700 0    50   Input ~ 0
GND
Text GLabel 5600 3800 2    50   Input ~ 0
+5V
$Comp
L 74xx:74LS157 U?
U 1 1 60F6BB5A
P 5500 4800
AR Path="/5F8F4E1E/60F6BB5A" Ref="U?"  Part="1" 
AR Path="/60F259A8/60F6BB5A" Ref="U25"  Part="1" 
F 0 "U25" H 5500 4800 50  0000 C CNN
F 1 "74HC157" H 5500 4600 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5500 4800 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc157.pdf" H 5500 4800 50  0001 C CNN
	1    5500 4800
	1    0    0    -1  
$EndComp
Text GLabel 4050 5100 2    50   Input ~ 0
~RES
Text GLabel 2950 5100 2    50   Input ~ 0
~RES
$Comp
L 74xx:74HC74 U?
U 1 1 60F6BB7E
P 2850 5500
AR Path="/5F8F4E1E/60F6BB7E" Ref="U?"  Part="1" 
AR Path="/60F259A8/60F6BB7E" Ref="U26"  Part="1" 
F 0 "U26" H 2550 5900 50  0000 C CNN
F 1 "74AC74" H 2550 5800 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2850 5500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2850 5500 50  0001 C CNN
	1    2850 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5500 2550 5500
Text GLabel 2450 5400 0    50   Input ~ 0
~CLKRQ
Wire Wire Line
	2450 5400 2550 5400
NoConn ~ 3150 5600
Text GLabel 2750 5900 0    50   Input ~ 0
+5V
Wire Wire Line
	2850 5900 2850 5800
Wire Wire Line
	2850 5100 2850 5200
Wire Wire Line
	3650 5400 3150 5400
$Comp
L 74xx:74HC74 U?
U 2 1 60F6BB8E
P 3950 5500
AR Path="/5F8F4E1E/60F6BB8E" Ref="U?"  Part="2" 
AR Path="/60F259A8/60F6BB8E" Ref="U26"  Part="2" 
F 0 "U26" H 3650 5900 50  0000 C CNN
F 1 "74AC74" H 3650 5800 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3950 5500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3950 5500 50  0001 C CNN
	2    3950 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5500 3650 5500
Wire Wire Line
	2750 5900 2850 5900
Wire Wire Line
	2850 5100 2950 5100
Wire Wire Line
	3850 5900 3950 5900
Wire Wire Line
	3950 5900 3950 5800
Text GLabel 3850 5900 0    50   Input ~ 0
+5V
Wire Wire Line
	4050 5100 3950 5100
Wire Wire Line
	3950 5100 3950 5200
NoConn ~ 4250 5600
Text Label 3200 5400 0    50   ~ 0
meta_sync
Wire Wire Line
	4250 5400 5000 5400
Text Label 4450 5400 0    50   ~ 0
clk_toggle
Wire Wire Line
	950  2350 1300 2350
Wire Wire Line
	950  2700 950  2350
Wire Wire Line
	950  3200 950  2900
Wire Wire Line
	1300 3200 950  3200
$Comp
L Device:C_Small C30
U 1 1 60F284C0
P 950 2800
F 0 "C30" H 850 2850 50  0000 R CNN
F 1 "0,1uF" H 850 2750 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 950 2800 50  0001 C CNN
F 3 "~" H 950 2800 50  0001 C CNN
	1    950  2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5500 2450 6050
Wire Wire Line
	2450 6050 3550 6050
Wire Wire Line
	3550 5500 3550 6050
Wire Wire Line
	7600 3700 6800 3700
Wire Wire Line
	6800 3700 6800 4200
Wire Wire Line
	6800 4200 6900 4200
Connection ~ 6800 4200
Text GLabel 7600 4200 2    50   Output ~ 0
SYS_CLK
Wire Wire Line
	7500 4200 7600 4200
Wire Wire Line
	6000 4200 6100 4200
$Comp
L 74xx:74HC04 U24
U 2 1 60FC0042
P 7200 4200
F 0 "U24" H 7200 4517 50  0000 C CNN
F 1 "74AC04" H 7200 4426 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7200 4200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 7200 4200 50  0001 C CNN
	2    7200 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 6050 2450 6050
Connection ~ 2450 6050
$Comp
L 74xx:74HC04 U24
U 3 1 60FC3BD8
P 2050 6050
F 0 "U24" H 2050 6367 50  0000 C CNN
F 1 "74AC04" H 2050 6276 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2050 6050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2050 6050 50  0001 C CNN
	3    2050 6050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U24
U 4 1 60FC4DFE
P 4000 3000
F 0 "U24" H 4000 3317 50  0000 C CNN
F 1 "74AC04" H 4000 3226 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4000 3000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4000 3000 50  0001 C CNN
	4    4000 3000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U24
U 5 1 60FC58B4
P 4700 3000
F 0 "U24" H 4700 3317 50  0000 C CNN
F 1 "74AC04" H 4700 3226 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4700 3000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4700 3000 50  0001 C CNN
	5    4700 3000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U24
U 6 1 60FC7C02
P 5400 3000
F 0 "U24" H 5400 3317 50  0000 C CNN
F 1 "74AC04" H 5400 3226 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5400 3000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5400 3000 50  0001 C CNN
	6    5400 3000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U24
U 7 1 60FC83F9
P 6250 7050
F 0 "U24" H 6480 7096 50  0000 L CNN
F 1 "74AC04" H 6480 7005 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6250 7050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6250 7050 50  0001 C CNN
	7    6250 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C37
U 1 1 60FC9100
P 5900 7050
F 0 "C37" H 5800 7100 50  0000 R CNN
F 1 "0,1uF" H 5800 7000 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 5900 7050 50  0001 C CNN
F 3 "~" H 5900 7050 50  0001 C CNN
	1    5900 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 6950 5900 6450
Wire Wire Line
	5900 6450 6250 6450
Wire Wire Line
	6250 6450 6250 6550
Wire Wire Line
	5900 7150 5900 7650
Wire Wire Line
	5900 7650 6250 7650
Wire Wire Line
	6250 7650 6250 7550
Text GLabel 6350 6450 2    50   Input ~ 0
+5V
Wire Wire Line
	6350 6450 6250 6450
Connection ~ 6250 6450
Text GLabel 6350 7650 2    50   Input ~ 0
GND
Wire Wire Line
	6250 7650 6350 7650
Connection ~ 6250 7650
$Comp
L 74xx:74HC74 U26
U 3 1 60FD151A
P 4950 7050
F 0 "U26" H 5180 7096 50  0000 L CNN
F 1 "74AC74" H 5180 7005 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4950 7050 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4950 7050 50  0001 C CNN
	3    4950 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C36
U 1 1 60FD2EEC
P 4600 7050
F 0 "C36" H 4500 7100 50  0000 R CNN
F 1 "0,1uF" H 4500 7000 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4600 7050 50  0001 C CNN
F 3 "~" H 4600 7050 50  0001 C CNN
	1    4600 7050
	1    0    0    -1  
$EndComp
Text GLabel 5050 7550 2    50   Input ~ 0
GND
Text GLabel 5050 6550 2    50   Input ~ 0
+5V
Wire Wire Line
	5050 6550 4950 6550
Wire Wire Line
	4600 6550 4600 6950
Wire Wire Line
	4600 7150 4600 7550
Wire Wire Line
	4600 7550 4950 7550
Wire Wire Line
	4950 7550 4950 7450
Connection ~ 4950 7550
Wire Wire Line
	4950 7550 5050 7550
Wire Wire Line
	4950 6650 4950 6550
Connection ~ 4950 6550
Wire Wire Line
	4950 6550 4600 6550
$Comp
L 74xx:74HC74 U23
U 3 1 60FD90C6
P 3750 7050
F 0 "U23" H 3980 7096 50  0000 L CNN
F 1 "74AC74" H 3980 7005 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3750 7050 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3750 7050 50  0001 C CNN
	3    3750 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C35
U 1 1 60FD90D0
P 3400 7050
F 0 "C35" H 3300 7100 50  0000 R CNN
F 1 "0,1uF" H 3300 7000 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 3400 7050 50  0001 C CNN
F 3 "~" H 3400 7050 50  0001 C CNN
	1    3400 7050
	1    0    0    -1  
$EndComp
Text GLabel 3850 7550 2    50   Input ~ 0
GND
Text GLabel 3850 6550 2    50   Input ~ 0
+5V
Wire Wire Line
	3850 6550 3750 6550
Wire Wire Line
	3400 6550 3400 6950
Wire Wire Line
	3400 7150 3400 7550
Wire Wire Line
	3400 7550 3750 7550
Wire Wire Line
	3750 7550 3750 7450
Connection ~ 3750 7550
Wire Wire Line
	3750 7550 3850 7550
Wire Wire Line
	3750 6650 3750 6550
Connection ~ 3750 6550
Wire Wire Line
	3750 6550 3400 6550
$Comp
L 74xx:74HC74 U23
U 1 1 60FDC6A2
P 2250 2800
F 0 "U23" H 2100 3300 50  0000 C CNN
F 1 "74AC74" H 2100 3200 50  0000 C CNN
F 2 "" H 2250 2800 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2250 2800 50  0001 C CNN
	1    2250 2800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC74 U22
U 2 1 60FDDC03
P 3200 2800
F 0 "U22" H 3050 3300 50  0000 C CNN
F 1 "74AC74" H 3050 3200 50  0000 C CNN
F 2 "" H 3200 2800 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3200 2800 50  0001 C CNN
	2    3200 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2700 2700 2700
Text GLabel 2150 3200 0    50   Input ~ 0
+5V
Wire Wire Line
	2150 3200 2250 3200
Wire Wire Line
	2250 3200 2250 3100
Text GLabel 3100 3200 0    50   Input ~ 0
+5V
Wire Wire Line
	3100 3200 3200 3200
Wire Wire Line
	3200 3200 3200 3100
Text GLabel 2350 2400 2    50   Input ~ 0
+5V
Wire Wire Line
	2350 2400 2250 2400
Wire Wire Line
	2250 2400 2250 2500
Text GLabel 3300 2400 2    50   Input ~ 0
+5V
Wire Wire Line
	3300 2400 3200 2400
Wire Wire Line
	3200 2400 3200 2500
NoConn ~ 2550 2900
NoConn ~ 3500 2900
Text GLabel 1650 6050 0    50   Input ~ 0
STRETCHED_CLOCK
Text GLabel 4900 4300 0    50   Input ~ 0
STRETCHED_CLOCK
Wire Wire Line
	1850 2800 1850 3350
Wire Wire Line
	2800 3350 2800 2800
Wire Wire Line
	2800 2800 2900 2800
$Comp
L 74xx:74LS32 U20
U 1 1 610048A8
P 4000 2150
F 0 "U20" H 4000 2475 50  0000 C CNN
F 1 "74AC32" H 4000 2384 50  0000 C CNN
F 2 "" H 4000 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4000 2150 50  0001 C CNN
	1    4000 2150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U20
U 2 1 6100A463
P 4850 2050
F 0 "U20" H 4850 2375 50  0000 C CNN
F 1 "74AC32" H 4850 2284 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4850 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4850 2050 50  0001 C CNN
	2    4850 2050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U20
U 3 1 6101346C
P 4850 1500
F 0 "U20" H 4850 1825 50  0000 C CNN
F 1 "74AC32" H 4850 1734 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4850 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4850 1500 50  0001 C CNN
	3    4850 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2700 3600 2700
Wire Wire Line
	3600 2700 3600 2250
Wire Wire Line
	3600 2250 3700 2250
Wire Wire Line
	2700 2700 2700 2050
Wire Wire Line
	2700 2050 3700 2050
Connection ~ 2700 2700
Wire Wire Line
	2700 2700 2900 2700
Wire Wire Line
	2700 2050 2700 1600
Wire Wire Line
	2700 1600 4550 1600
Connection ~ 2700 2050
Wire Wire Line
	4300 2150 4550 2150
$Comp
L 74xx:74LS32 U20
U 4 1 6102366F
P 10550 1900
F 0 "U20" H 10550 2225 50  0000 C CNN
F 1 "74AC32" H 10550 2134 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10550 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 10550 1900 50  0001 C CNN
	4    10550 1900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U20
U 5 1 610269FE
P 2450 7050
F 0 "U20" H 2680 7096 50  0000 L CNN
F 1 "74AC32" H 2680 7005 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2450 7050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2450 7050 50  0001 C CNN
	5    2450 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C34
U 1 1 61029AB8
P 2100 7050
F 0 "C34" H 2000 7100 50  0000 R CNN
F 1 "0,1uF" H 2000 7000 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 2100 7050 50  0001 C CNN
F 3 "~" H 2100 7050 50  0001 C CNN
	1    2100 7050
	1    0    0    -1  
$EndComp
Text GLabel 2550 7650 2    50   Input ~ 0
GND
Text GLabel 2550 6450 2    50   Input ~ 0
+5V
Wire Wire Line
	2550 6450 2450 6450
Wire Wire Line
	2100 6450 2100 6950
Wire Wire Line
	2100 7150 2100 7650
Wire Wire Line
	2100 7650 2450 7650
Wire Wire Line
	2450 7650 2450 7550
Connection ~ 2450 7650
Wire Wire Line
	2450 7650 2550 7650
Wire Wire Line
	2450 6550 2450 6450
Connection ~ 2450 6450
Wire Wire Line
	2450 6450 2100 6450
$Comp
L 74xx:74LS10 U21
U 1 1 6103B38F
P 5850 1500
F 0 "U21" H 5850 1825 50  0000 C CNN
F 1 "74AC10" H 5850 1734 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5850 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 5850 1500 50  0001 C CNN
	1    5850 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 2050 5250 2050
Wire Wire Line
	5250 2050 5250 1600
Wire Wire Line
	5250 1600 5550 1600
Wire Wire Line
	5150 1500 5550 1500
Text GLabel 3900 900  0    50   Input ~ 0
~STRETCH_0
Text GLabel 3900 1100 0    50   Input ~ 0
~STRETCH_1
Text GLabel 3900 1300 0    50   Input ~ 0
~STRETCH_2
Wire Wire Line
	3900 1300 4300 1300
Wire Wire Line
	4300 1300 4300 1950
Wire Wire Line
	4300 1950 4550 1950
Wire Wire Line
	4550 1400 4450 1400
Wire Wire Line
	4450 1400 4450 1100
Wire Wire Line
	4450 1100 3900 1100
Wire Wire Line
	3900 900  5250 900 
Wire Wire Line
	5250 900  5250 1400
Wire Wire Line
	5250 1400 5550 1400
Wire Wire Line
	6150 1500 6250 1500
Wire Wire Line
	6250 1500 6250 700 
Wire Wire Line
	6250 700  1850 700 
Wire Wire Line
	1850 700  1850 2700
Wire Wire Line
	1850 2700 1950 2700
$Comp
L 74xx:74LS10 U21
U 3 1 6105BACA
P 10550 2550
F 0 "U21" H 10550 2875 50  0000 C CNN
F 1 "74AC10" H 10550 2784 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10550 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 10550 2550 50  0001 C CNN
	3    10550 2550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS10 U21
U 2 1 6105F7CC
P 7500 2150
F 0 "U21" H 7500 2475 50  0000 C CNN
F 1 "74AC10" H 7500 2384 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7500 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 7500 2150 50  0001 C CNN
	2    7500 2150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS10 U21
U 4 1 61061C55
P 1150 7050
F 0 "U21" H 1380 7096 50  0000 L CNN
F 1 "74AC10" H 1380 7005 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1150 7050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 1150 7050 50  0001 C CNN
	4    1150 7050
	1    0    0    -1  
$EndComp
Text GLabel 1250 7650 2    50   Input ~ 0
GND
Wire Wire Line
	1250 7650 1150 7650
Wire Wire Line
	1150 7650 1150 7550
Text GLabel 1250 6450 2    50   Input ~ 0
+5V
Wire Wire Line
	1250 6450 1150 6450
Wire Wire Line
	1150 6450 1150 6550
$Comp
L Device:C_Small C33
U 1 1 6106F9F1
P 800 7050
F 0 "C33" H 700 7100 50  0000 R CNN
F 1 "0,1uF" H 700 7000 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 800 7050 50  0001 C CNN
F 3 "~" H 800 7050 50  0001 C CNN
	1    800  7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  6950 800  6450
Wire Wire Line
	800  6450 1150 6450
Connection ~ 1150 6450
Wire Wire Line
	800  7150 800  7650
Wire Wire Line
	800  7650 1150 7650
Connection ~ 1150 7650
Wire Wire Line
	1850 3350 2800 3350
Wire Wire Line
	2800 3350 3600 3350
Wire Wire Line
	3600 3350 3600 3000
Wire Wire Line
	3600 3000 3700 3000
Connection ~ 2800 3350
Wire Wire Line
	4300 3000 4400 3000
Wire Wire Line
	5000 3000 5100 3000
$Comp
L 74xx:74HC74 U22
U 3 1 610D5E1D
P 10550 4650
F 0 "U22" H 10780 4696 50  0000 L CNN
F 1 "74AC74" H 10780 4605 50  0000 L CNN
F 2 "" H 10550 4650 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 10550 4650 50  0001 C CNN
	3    10550 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C32
U 1 1 610D5E27
P 10200 4650
F 0 "C32" H 10100 4700 50  0000 R CNN
F 1 "0,1uF" H 10100 4600 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 10200 4650 50  0001 C CNN
F 3 "~" H 10200 4650 50  0001 C CNN
	1    10200 4650
	1    0    0    -1  
$EndComp
Text GLabel 10650 5150 2    50   Input ~ 0
GND
Text GLabel 10650 4150 2    50   Input ~ 0
+5V
Wire Wire Line
	10650 4150 10550 4150
Wire Wire Line
	10200 4150 10200 4550
Wire Wire Line
	10200 4750 10200 5150
Wire Wire Line
	10200 5150 10550 5150
Wire Wire Line
	10550 5150 10550 5050
Connection ~ 10550 5150
Wire Wire Line
	10550 5150 10650 5150
Wire Wire Line
	10550 4250 10550 4150
Connection ~ 10550 4150
Wire Wire Line
	10550 4150 10200 4150
$Comp
L 74xx:74HC74 U22
U 1 1 610E5B9F
P 6700 1600
F 0 "U22" H 6450 2100 50  0000 C CNN
F 1 "74AC74" H 6450 2000 50  0000 C CNN
F 2 "" H 6700 1600 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6700 1600 50  0001 C CNN
	1    6700 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3000 6250 3000
Wire Wire Line
	6250 3000 6250 1600
Wire Wire Line
	6250 1600 6400 1600
Wire Wire Line
	6250 1500 6400 1500
Connection ~ 6250 1500
$Comp
L 74xx:74HC74 U23
U 2 1 610F7213
P 10550 3500
F 0 "U23" H 10300 4000 50  0000 C CNN
F 1 "74AC74" H 10300 3900 50  0000 C CNN
F 2 "" H 10550 3500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 10550 3500 50  0001 C CNN
	2    10550 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4300 4900 4300
Text GLabel 6600 2000 0    50   Input ~ 0
+5V
Wire Wire Line
	6600 2000 6700 2000
Wire Wire Line
	6700 2000 6700 1900
Text GLabel 6800 1200 2    50   Input ~ 0
+5V
Wire Wire Line
	6800 1200 6700 1200
Wire Wire Line
	6700 1200 6700 1300
NoConn ~ 7000 1700
Wire Wire Line
	1850 2800 1600 2800
Wire Wire Line
	1850 2800 1950 2800
Connection ~ 1850 2800
Wire Wire Line
	7000 1500 7100 1500
Wire Wire Line
	7100 1500 7100 2050
Wire Wire Line
	7100 2050 7200 2050
Wire Wire Line
	3600 3350 7100 3350
Wire Wire Line
	7100 3350 7100 2250
Wire Wire Line
	7100 2250 7200 2250
Connection ~ 3600 3350
Text GLabel 7000 2150 0    50   Input ~ 0
+5V
Wire Wire Line
	7000 2150 7200 2150
Text GLabel 7900 2150 2    50   Output ~ 0
STRETCHED_CLOCK
Wire Wire Line
	7900 2150 7800 2150
Text GLabel 10450 3900 0    50   Input ~ 0
+5V
Wire Wire Line
	10450 3900 10550 3900
Wire Wire Line
	10550 3900 10550 3800
Text GLabel 10650 3100 2    50   Input ~ 0
+5V
Wire Wire Line
	10650 3100 10550 3100
Wire Wire Line
	10550 3100 10550 3200
NoConn ~ 10850 3400
NoConn ~ 10850 3600
NoConn ~ 10850 1900
NoConn ~ 10850 2550
Text GLabel 10050 3500 0    50   Input ~ 0
GND
Wire Wire Line
	10050 3500 10150 3500
Wire Wire Line
	10150 3500 10150 3400
Wire Wire Line
	10150 3400 10250 3400
Connection ~ 10150 3500
Wire Wire Line
	10150 3500 10250 3500
Text GLabel 10050 1900 0    50   Input ~ 0
GND
Wire Wire Line
	10050 1900 10150 1900
Wire Wire Line
	10150 1900 10150 1800
Wire Wire Line
	10150 1800 10250 1800
Wire Wire Line
	10150 1900 10150 2000
Wire Wire Line
	10150 2000 10250 2000
Connection ~ 10150 1900
Text GLabel 10050 2550 0    50   Input ~ 0
GND
Wire Wire Line
	10050 2550 10150 2550
Wire Wire Line
	10250 2450 10150 2450
Wire Wire Line
	10150 2450 10150 2550
Connection ~ 10150 2550
Wire Wire Line
	10150 2550 10250 2550
Wire Wire Line
	10150 2550 10150 2650
Wire Wire Line
	10150 2650 10250 2650
Wire Wire Line
	1650 6050 1750 6050
$EndSCHEMATC
