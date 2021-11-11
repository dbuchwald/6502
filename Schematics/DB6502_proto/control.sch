EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 6502:22V10C U?
U 1 1 618FAD35
P 1900 1850
AR Path="/618FAD35" Ref="U?"  Part="1" 
AR Path="/618DD0B9/618FAD35" Ref="U11"  Part="1" 
F 0 "U11" H 1650 2650 50  0000 C CNN
F 1 "22V10C" H 1650 2550 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W7.62mm_Socket" H 1900 1150 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1627189.pdf" H 1900 1850 50  0001 C CNN
	1    1900 1850
	1    0    0    -1  
$EndComp
Text GLabel 6000 4150 0    50   Input ~ 0
R~W
Wire Wire Line
	1300 1300 1400 1300
Text Label 1200 1400 0    50   ~ 0
a15
Text Label 1200 1500 0    50   ~ 0
a14
Text Label 1200 1600 0    50   ~ 0
a13
Text Label 1200 1700 0    50   ~ 0
a12
Text Label 1200 1800 0    50   ~ 0
a11
Text Label 1200 1900 0    50   ~ 0
a10
Text Label 1200 2000 0    50   ~ 0
a9
Text Label 1200 2100 0    50   ~ 0
a8
Text GLabel 2500 2400 2    50   Input ~ 0
EXRAM
Wire Wire Line
	1200 2100 1400 2100
Wire Wire Line
	1200 2000 1400 2000
Wire Wire Line
	1200 1900 1400 1900
Wire Wire Line
	1200 1800 1400 1800
Wire Wire Line
	1200 1700 1400 1700
Wire Wire Line
	1200 1600 1400 1600
Wire Wire Line
	1200 1500 1400 1500
Wire Wire Line
	1200 1400 1400 1400
Entry Wire Line
	1100 1500 1200 1400
Entry Wire Line
	1100 1600 1200 1500
Entry Wire Line
	1100 1700 1200 1600
Entry Wire Line
	1100 1800 1200 1700
Entry Wire Line
	1100 1900 1200 1800
Entry Wire Line
	1100 2000 1200 1900
Entry Wire Line
	1100 2100 1200 2000
Entry Wire Line
	1100 2200 1200 2100
Wire Wire Line
	2400 1300 2500 1300
Wire Wire Line
	2500 1300 2500 1100
Text GLabel 1300 2500 3    50   Input ~ 0
GND
Wire Wire Line
	1300 2500 1300 2400
Wire Wire Line
	1300 2400 1400 2400
Wire Wire Line
	2650 1200 2650 1400
Wire Wire Line
	2650 1400 2400 1400
Wire Wire Line
	2800 1200 2800 1500
Wire Wire Line
	2800 1500 2400 1500
Text GLabel 2650 1200 1    50   Output ~ 0
RAM1_~CS
Wire Wire Line
	2950 1200 2950 1600
Wire Wire Line
	2950 1600 2400 1600
Text GLabel 2800 1200 1    50   Output ~ 0
RAM2_~CS
Text GLabel 2950 1200 1    50   Output ~ 0
ROM_~CS
Text Label 3550 1400 0    50   ~ 0
a7
Text Label 3550 1300 0    50   ~ 0
a6
Text Label 3550 1200 0    50   ~ 0
a5
Entry Wire Line
	3450 1300 3550 1200
Entry Wire Line
	3450 1400 3550 1300
Entry Wire Line
	3450 1500 3550 1400
Wire Wire Line
	3550 1200 3700 1200
Wire Wire Line
	3550 1300 3700 1300
Wire Wire Line
	3550 1400 3700 1400
Text GLabel 4300 850  2    50   Input ~ 0
+5V
Wire Wire Line
	4300 850  4200 850 
Text GLabel 4300 2300 2    50   Input ~ 0
GND
Wire Wire Line
	4300 2300 4200 2300
Wire Wire Line
	4200 2300 3600 2300
Wire Wire Line
	3600 2300 3600 1900
Wire Wire Line
	3600 1900 3700 1900
Connection ~ 4200 2300
Wire Wire Line
	4200 2300 4200 2200
Wire Wire Line
	3600 1900 3600 1800
Wire Wire Line
	3600 1800 3700 1800
Connection ~ 3600 1900
Text GLabel 4800 1100 1    50   Output ~ 0
~LATCH
Wire Wire Line
	4700 1200 4800 1200
Wire Wire Line
	4800 1200 4800 1100
Text GLabel 4950 1100 1    50   Output ~ 0
~VIA
Wire Wire Line
	4950 1100 4950 1300
Wire Wire Line
	4950 1300 4700 1300
Wire Wire Line
	5100 1100 5100 1400
Wire Wire Line
	5100 1400 4700 1400
Text GLabel 5250 2000 3    50   Output ~ 0
~UART
Wire Wire Line
	5250 1100 5250 1500
Wire Wire Line
	5250 1500 4700 1500
Text GLabel 4950 2000 3    50   Output ~ 0
~IOCS3
Text GLabel 5100 2000 3    50   Output ~ 0
~IOCS2
Text GLabel 5250 1100 1    50   Output ~ 0
~IOCS1
Text GLabel 5100 1100 1    50   Output ~ 0
~IOCS0
Wire Wire Line
	4800 2000 4800 1900
Wire Wire Line
	4800 1900 4700 1900
Wire Wire Line
	4700 1800 4950 1800
Wire Wire Line
	4950 1800 4950 2000
Wire Wire Line
	4700 1700 5100 1700
Wire Wire Line
	5100 1700 5100 2000
Wire Wire Line
	4700 1600 5250 1600
Wire Wire Line
	5250 1600 5250 2000
$Comp
L 74xx:74LS138 U?
U 1 1 618FAD9F
P 4200 1500
AR Path="/618FAD9F" Ref="U?"  Part="1" 
AR Path="/618DD0B9/618FAD9F" Ref="U10"  Part="1" 
F 0 "U10" H 4200 1500 50  0000 C CNN
F 1 "74AC138" H 4100 1400 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 4200 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4200 1500 50  0001 C CNN
	1    4200 1500
	1    0    0    -1  
$EndComp
Text GLabel 2500 1000 1    50   Input ~ 0
+5V
$Comp
L Device:C_Small C?
U 1 1 618FADA6
P 2300 1100
AR Path="/618FADA6" Ref="C?"  Part="1" 
AR Path="/618DD0B9/618FADA6" Ref="C13"  Part="1" 
F 0 "C13" V 2071 1100 50  0000 C CNN
F 1 "0,1uF" V 2162 1100 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2300 1100 50  0001 C CNN
F 3 "~" H 2300 1100 50  0001 C CNN
	1    2300 1100
	0    1    1    0   
$EndComp
Text GLabel 2100 1100 0    50   Input ~ 0
GND
Wire Wire Line
	2100 1100 2200 1100
Wire Wire Line
	2400 1100 2500 1100
Connection ~ 2500 1100
Wire Wire Line
	2500 1100 2500 1000
$Comp
L Device:C_Small C?
U 1 1 618FADB1
P 4000 850
AR Path="/618FADB1" Ref="C?"  Part="1" 
AR Path="/618DD0B9/618FADB1" Ref="C12"  Part="1" 
F 0 "C12" V 3771 850 50  0000 C CNN
F 1 "0,1uF" V 3862 850 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4000 850 50  0001 C CNN
F 3 "~" H 4000 850 50  0001 C CNN
	1    4000 850 
	0    1    1    0   
$EndComp
Text GLabel 3800 850  0    50   Input ~ 0
GND
Wire Wire Line
	3800 850  3900 850 
Wire Wire Line
	4100 850  4200 850 
Connection ~ 4200 850 
Wire Wire Line
	4200 850  4200 900 
Wire Wire Line
	2400 1700 3400 1700
Text Label 3700 1700 2    50   ~ 0
io_cs
Text GLabel 3400 1800 3    50   Output ~ 0
IOCS
Wire Wire Line
	3400 1800 3400 1700
Connection ~ 3400 1700
Wire Wire Line
	3400 1700 3700 1700
Wire Wire Line
	2400 2200 2500 2200
Wire Wire Line
	2400 2400 2500 2400
Wire Wire Line
	2400 2300 2500 2300
Wire Wire Line
	2400 2000 2500 2000
Wire Wire Line
	2400 2100 2500 2100
Wire Wire Line
	1300 1200 1300 1300
Text GLabel 1300 1200 1    50   Input ~ 0
PHI2
Text GLabel 2500 2100 2    50   Input ~ 0
WS_DISABLE
Text GLabel 7600 4800 2    50   Output ~ 0
~WR
Text GLabel 7600 4250 2    50   Output ~ 0
~RD
Text GLabel 2500 2000 2    50   Output ~ 0
PLD_RDY
Text GLabel 1100 6000 0    50   Input ~ 0
~DBG_WAIT
Text GLabel 2500 2200 2    50   Input ~ 0
RDY_M2F
Text GLabel 2500 2300 2    50   Input ~ 0
RDY_M1F
Wire Wire Line
	3300 3300 3150 3300
Wire Wire Line
	3300 3400 3300 3300
Text GLabel 3300 3400 3    50   Output ~ 0
RDY_M2F
Wire Wire Line
	2200 3300 2550 3300
Connection ~ 2200 3300
Wire Wire Line
	2200 3400 2200 3300
Text GLabel 2200 3400 3    50   Output ~ 0
RDY_M1F
Text GLabel 2950 3000 2    50   Input ~ 0
~6502_RES
Wire Wire Line
	1750 3000 1750 3100
Wire Wire Line
	1850 3000 1750 3000
Text GLabel 1850 3000 2    50   Input ~ 0
~6502_RES
Wire Wire Line
	1250 3300 1450 3300
Text GLabel 1250 3300 0    50   Input ~ 0
6502_RDY
NoConn ~ 2050 3500
Wire Wire Line
	2050 3300 2200 3300
Connection ~ 1350 3950
Wire Wire Line
	2350 3400 2550 3400
Wire Wire Line
	2350 3950 2350 3400
Wire Wire Line
	1350 3950 2350 3950
Wire Wire Line
	1350 3400 1450 3400
Wire Wire Line
	1350 3950 1350 3400
Wire Wire Line
	1250 3950 1350 3950
Wire Wire Line
	1750 3800 1750 3700
Wire Wire Line
	1650 3800 1750 3800
Text GLabel 1650 3800 0    50   Input ~ 0
+5V
Wire Wire Line
	2850 3000 2950 3000
Wire Wire Line
	2850 3100 2850 3000
Wire Wire Line
	2850 3800 2850 3700
Wire Wire Line
	2750 3800 2850 3800
NoConn ~ 3150 3500
Text GLabel 2750 3800 0    50   Input ~ 0
+5V
$Comp
L 74xx:74HC74 U?
U 2 1 619687B9
P 2850 3400
AR Path="/5F8F4E1E/619687B9" Ref="U?"  Part="2" 
AR Path="/619687B9" Ref="U?"  Part="2" 
AR Path="/618DD0B9/619687B9" Ref="U15"  Part="2" 
F 0 "U15" H 2550 3800 50  0000 C CNN
F 1 "74AC74" H 2550 3700 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2850 3400 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2850 3400 50  0001 C CNN
	2    2850 3400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC74 U?
U 1 1 619687BF
P 1750 3400
AR Path="/5F8F4E1E/619687BF" Ref="U?"  Part="2" 
AR Path="/619687BF" Ref="U?"  Part="1" 
AR Path="/618DD0B9/619687BF" Ref="U15"  Part="1" 
F 0 "U15" H 1450 3800 50  0000 C CNN
F 1 "74AC74" H 1450 3700 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1750 3400 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1750 3400 50  0001 C CNN
	1    1750 3400
	1    0    0    -1  
$EndComp
Text GLabel 1250 3950 0    50   Input ~ 0
~PHI2
Text GLabel 1050 6400 0    50   Input ~ 0
+5V
Text GLabel 1050 7500 0    50   Input ~ 0
GND
Wire Wire Line
	1050 7500 1150 7500
Wire Wire Line
	1150 6450 1150 6400
$Comp
L Device:C_Small C?
U 1 1 619A14D7
P 1450 6950
AR Path="/619A14D7" Ref="C?"  Part="1" 
AR Path="/618DD0B9/619A14D7" Ref="C15"  Part="1" 
F 0 "C15" H 1542 6996 50  0000 L CNN
F 1 "0,1uF" H 1542 6905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1450 6950 50  0001 C CNN
F 3 "~" H 1450 6950 50  0001 C CNN
	1    1450 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 6850 1450 6400
Wire Wire Line
	1450 6400 1150 6400
Connection ~ 1150 6400
Wire Wire Line
	1150 6400 1050 6400
Wire Wire Line
	1150 7500 1450 7500
Wire Wire Line
	1450 7500 1450 7050
Connection ~ 1150 7500
Wire Wire Line
	1150 7500 1150 7450
Text GLabel 9200 1800 0    50   Input ~ 0
+5V
$Comp
L 74xx:74HC74 U?
U 3 1 619A14F2
P 2000 6950
AR Path="/5F8F4E1E/619A14F2" Ref="U?"  Part="3" 
AR Path="/619A14F2" Ref="U?"  Part="3" 
AR Path="/618DD0B9/619A14F2" Ref="U15"  Part="3" 
F 0 "U15" H 2000 7000 50  0000 C CNN
F 1 "74AC74" H 2000 6900 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2000 6950 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2000 6950 50  0001 C CNN
	3    2000 6950
	1    0    0    -1  
$EndComp
Text GLabel 1900 7400 0    50   Input ~ 0
GND
Wire Wire Line
	1900 7400 2000 7400
Text GLabel 1900 6500 0    50   Input ~ 0
+5V
Wire Wire Line
	1900 6500 2000 6500
$Comp
L Device:C_Small C?
U 1 1 619A14FC
P 2350 6950
AR Path="/5F8F4E1E/619A14FC" Ref="C?"  Part="1" 
AR Path="/619A14FC" Ref="C?"  Part="1" 
AR Path="/618DD0B9/619A14FC" Ref="C16"  Part="1" 
F 0 "C16" H 2442 6996 50  0000 L CNN
F 1 "0,1uF" H 2442 6905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2350 6950 50  0001 C CNN
F 3 "~" H 2350 6950 50  0001 C CNN
	1    2350 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 7400 2350 7400
Wire Wire Line
	2350 7400 2350 7050
Connection ~ 2000 7400
Wire Wire Line
	2000 7400 2000 7350
Wire Wire Line
	2350 6850 2350 6500
Wire Wire Line
	2350 6500 2000 6500
Connection ~ 2000 6500
Wire Wire Line
	2000 6500 2000 6550
$Comp
L Device:R_Network08 RN?
U 1 1 619A150C
P 9500 1400
AR Path="/619A150C" Ref="RN?"  Part="1" 
AR Path="/618DD0B9/619A150C" Ref="RN1"  Part="1" 
F 0 "RN1" H 9900 1450 50  0000 L CNN
F 1 "4K7" H 9900 1350 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 9775 1400 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9500 1400 50  0001 C CNN
	1    9500 1400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9200 1800 9300 1800
Wire Wire Line
	9700 1300 10200 1300
Wire Wire Line
	10200 1300 10200 1000
Wire Wire Line
	10050 1000 10050 1200
Wire Wire Line
	10050 1200 9700 1200
Text GLabel 9900 1000 1    50   Output ~ 0
EXT_BE
Wire Wire Line
	9700 1100 9900 1100
Wire Wire Line
	9900 1100 9900 1000
$Comp
L 74xx:74HC04 U?
U 2 1 619BEEEE
P 7200 1450
AR Path="/5F8F4E1E/619BEEEE" Ref="U?"  Part="5" 
AR Path="/619BEEEE" Ref="U?"  Part="4" 
AR Path="/618DD0B9/619BEEEE" Ref="U9"  Part="2" 
F 0 "U9" H 7200 1767 50  0000 C CNN
F 1 "74AC04" H 7200 1676 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7200 1450 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 7200 1450 50  0001 C CNN
	2    7200 1450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 1 1 619BEEF4
P 6500 1450
AR Path="/5F8F4E1E/619BEEF4" Ref="U?"  Part="6" 
AR Path="/619BEEF4" Ref="U?"  Part="6" 
AR Path="/618DD0B9/619BEEF4" Ref="U9"  Part="1" 
F 0 "U9" H 6500 1767 50  0000 C CNN
F 1 "74AC04" H 6500 1676 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6500 1450 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 6500 1450 50  0001 C CNN
	1    6500 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 1450 7500 1450
Text GLabel 6100 1450 0    50   Input ~ 0
~PHI2
Wire Wire Line
	6100 1450 6200 1450
Wire Wire Line
	6800 1450 6900 1450
$Comp
L 74xx:74HC04 U?
U 3 1 619C52E3
P 7900 1450
AR Path="/5F8F4E1E/619C52E3" Ref="U?"  Part="5" 
AR Path="/619C52E3" Ref="U?"  Part="4" 
AR Path="/618DD0B9/619C52E3" Ref="U9"  Part="3" 
F 0 "U9" H 7900 1767 50  0000 C CNN
F 1 "74AC04" H 7900 1676 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7900 1450 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 7900 1450 50  0001 C CNN
	3    7900 1450
	1    0    0    -1  
$EndComp
Text GLabel 8300 1450 2    50   Output ~ 0
PHI2
Wire Wire Line
	8200 1450 8300 1450
Text GLabel 1100 5200 0    50   Input ~ 0
DBG_BE
Text GLabel 1900 5300 2    50   Output ~ 0
BE
Wire Wire Line
	1100 5200 1200 5200
$Comp
L 74xx:74LS08 U?
U 2 1 61A30045
P 1500 5300
AR Path="/5F8F4E1E/61A30045" Ref="U?"  Part="4" 
AR Path="/618DD0B9/61A30045" Ref="U13"  Part="2" 
F 0 "U13" H 1500 5625 50  0000 C CNN
F 1 "74AC08" H 1500 5534 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1500 5300 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 1500 5300 50  0001 C CNN
	2    1500 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 5300 1900 5300
Text GLabel 1100 5400 0    50   Input ~ 0
EXT_BE
Wire Wire Line
	1100 5400 1200 5400
$Comp
L 74xx:74HC04 U?
U 7 1 61A438B3
P 2900 6950
AR Path="/5F8F4E1E/61A438B3" Ref="U?"  Part="7" 
AR Path="/618DD0B9/61A438B3" Ref="U9"  Part="7" 
F 0 "U9" H 2900 7000 50  0000 C CNN
F 1 "74AC04" H 2900 6900 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2900 6950 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 2900 6950 50  0001 C CNN
	7    2900 6950
	1    0    0    -1  
$EndComp
Text GLabel 2800 7550 0    50   Input ~ 0
GND
Wire Wire Line
	2800 7550 2900 7550
Text GLabel 2800 6350 0    50   Input ~ 0
+5V
Wire Wire Line
	2800 6350 2900 6350
$Comp
L Device:C_Small C?
U 1 1 61A438C5
P 3250 6950
AR Path="/5F8F4E1E/61A438C5" Ref="C?"  Part="1" 
AR Path="/618DD0B9/61A438C5" Ref="C17"  Part="1" 
F 0 "C17" H 3342 6996 50  0000 L CNN
F 1 "0,1uF" H 3342 6905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3250 6950 50  0001 C CNN
F 3 "~" H 3250 6950 50  0001 C CNN
	1    3250 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 6850 3250 6350
Wire Wire Line
	3250 6350 2900 6350
Connection ~ 2900 6350
Wire Wire Line
	2900 6350 2900 6450
Wire Wire Line
	3250 7050 3250 7550
Wire Wire Line
	3250 7550 2900 7550
Connection ~ 2900 7550
Wire Wire Line
	2900 7550 2900 7450
$Comp
L 74xx:74LS08 U?
U 5 1 61A438E0
P 3800 6950
AR Path="/5F8F4E1E/61A438E0" Ref="U?"  Part="5" 
AR Path="/618DD0B9/61A438E0" Ref="U13"  Part="5" 
F 0 "U13" H 3800 7000 50  0000 C CNN
F 1 "74AC08" H 3800 6900 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3800 6950 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 3800 6950 50  0001 C CNN
	5    3800 6950
	1    0    0    -1  
$EndComp
Text GLabel 3700 6350 0    50   Input ~ 0
+5V
Text GLabel 3700 7550 0    50   Input ~ 0
GND
Wire Wire Line
	3800 6450 3800 6350
Wire Wire Line
	3800 7450 3800 7550
Wire Wire Line
	4150 6850 4150 6350
Wire Wire Line
	4150 6350 3800 6350
Connection ~ 3800 6350
Wire Wire Line
	3800 6350 3700 6350
Wire Wire Line
	4150 7050 4150 7550
Wire Wire Line
	4150 7550 3800 7550
Connection ~ 3800 7550
Wire Wire Line
	3800 7550 3700 7550
$Comp
L Device:C_Small C?
U 1 1 61A438F5
P 4150 6950
AR Path="/5F8F4E1E/61A438F5" Ref="C?"  Part="1" 
AR Path="/618DD0B9/61A438F5" Ref="C18"  Part="1" 
F 0 "C18" H 4242 6996 50  0000 L CNN
F 1 "0,1uF" H 4242 6905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4150 6950 50  0001 C CNN
F 3 "~" H 4150 6950 50  0001 C CNN
	1    4150 6950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U?
U 1 1 61A58435
P 1500 4700
AR Path="/5F8F4E1E/61A58435" Ref="U?"  Part="1" 
AR Path="/618DD0B9/61A58435" Ref="U13"  Part="1" 
F 0 "U13" H 1500 5025 50  0000 C CNN
F 1 "74AC08" H 1500 4934 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1500 4700 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 1500 4700 50  0001 C CNN
	1    1500 4700
	1    0    0    -1  
$EndComp
Text GLabel 1100 4800 0    50   Input ~ 0
~DBG_RES
Text GLabel 1100 4600 0    50   Input ~ 0
~RES
Wire Wire Line
	1100 4600 1200 4600
Wire Wire Line
	1100 4800 1200 4800
Text GLabel 1900 4700 2    50   Output ~ 0
~6502_RES
Wire Wire Line
	1900 4700 1800 4700
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 61A6556C
P 9650 3650
AR Path="/61A6556C" Ref="X?"  Part="1" 
AR Path="/5F8F4E1E/61A6556C" Ref="X?"  Part="1" 
AR Path="/618DD0B9/61A6556C" Ref="X1"  Part="1" 
F 0 "X1" H 9900 3900 50  0000 L CNN
F 1 "8MHz" H 9900 3800 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 10100 3300 50  0001 C CNN
F 3 "" H 9550 3650 50  0001 C CNN
	1    9650 3650
	1    0    0    -1  
$EndComp
Text GLabel 9750 3250 2    50   Input ~ 0
+5V
Text GLabel 9750 4050 2    50   Input ~ 0
GND
$Comp
L Device:C_Small C?
U 1 1 61A65574
P 9350 3650
AR Path="/61A65574" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/61A65574" Ref="C?"  Part="1" 
AR Path="/618DD0B9/61A65574" Ref="C14"  Part="1" 
F 0 "C14" H 9250 3700 50  0000 R CNN
F 1 "0,1uF" H 9250 3600 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9350 3650 50  0001 C CNN
F 3 "~" H 9350 3650 50  0001 C CNN
	1    9350 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 3550 9350 3250
Wire Wire Line
	9350 3250 9650 3250
Wire Wire Line
	9650 3250 9650 3350
Wire Wire Line
	9350 3750 9350 4050
Wire Wire Line
	9350 4050 9650 4050
Wire Wire Line
	9650 4050 9650 3950
Wire Wire Line
	9650 3250 9750 3250
Connection ~ 9650 3250
Wire Wire Line
	9650 4050 9750 4050
Connection ~ 9650 4050
Text GLabel 10050 3650 2    50   Output ~ 0
~PHI2
Wire Wire Line
	9950 3650 10050 3650
Wire Wire Line
	10350 1000 10350 1400
Wire Wire Line
	10350 1400 9700 1400
Text GLabel 1000 2500 0    50   Input ~ 0
a[0..15]
Wire Bus Line
	1000 2500 1100 2500
$Comp
L 74xx:74HC04 U?
U 4 1 61CAD34E
P 6500 900
AR Path="/5F8F4E1E/61CAD34E" Ref="U?"  Part="6" 
AR Path="/5F910E81/61CAD34E" Ref="U?"  Part="5" 
AR Path="/618DD0B9/61CAD34E" Ref="U9"  Part="4" 
F 0 "U9" H 6500 1217 50  0000 C CNN
F 1 "74AC04" H 6500 1126 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6500 900 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 6500 900 50  0001 C CNN
	4    6500 900 
	1    0    0    -1  
$EndComp
Text GLabel 6900 900  2    50   Output ~ 0
UART_RES
Text GLabel 6100 900  0    50   Input ~ 0
~6502_RES
Wire Wire Line
	6100 900  6200 900 
Wire Wire Line
	6800 900  6900 900 
Text GLabel 6100 2100 0    50   Input ~ 0
6502_RDY
$Comp
L 74xx:74HC04 U?
U 5 1 61D0C1CC
P 6500 3050
AR Path="/5F910E81/61D0C1CC" Ref="U?"  Part="1" 
AR Path="/618DD0B9/61D0C1CC" Ref="U9"  Part="5" 
F 0 "U9" H 6500 3367 50  0000 C CNN
F 1 "74AC04" H 6500 3276 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6500 3050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 6500 3050 50  0001 C CNN
	5    6500 3050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 6 1 61D0C1D2
P 6500 3600
AR Path="/5F910E81/61D0C1D2" Ref="U?"  Part="2" 
AR Path="/618DD0B9/61D0C1D2" Ref="U9"  Part="6" 
F 0 "U9" H 6500 3917 50  0000 C CNN
F 1 "74AC04" H 6500 3826 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6500 3600 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 6500 3600 50  0001 C CNN
	6    6500 3600
	1    0    0    -1  
$EndComp
Text GLabel 6100 3600 0    50   Input ~ 0
~LATCH
Wire Wire Line
	6100 3600 6200 3600
Text GLabel 6100 3050 0    50   Input ~ 0
~WR
Wire Wire Line
	6100 3050 6200 3050
Wire Wire Line
	6800 3050 6900 3050
Wire Wire Line
	6900 3050 6900 3300
Wire Wire Line
	6900 3300 7500 3300
Wire Wire Line
	6800 3600 6900 3600
Wire Wire Line
	6900 3600 6900 3400
Wire Wire Line
	6900 3400 7500 3400
Text GLabel 8300 3300 2    50   Output ~ 0
LATCH_CP
$Comp
L Connector:TestPoint TP?
U 1 1 61D0C1E3
P 8200 3200
AR Path="/5F910E81/61D0C1E3" Ref="TP?"  Part="1" 
AR Path="/618DD0B9/61D0C1E3" Ref="TP2"  Part="1" 
F 0 "TP2" H 8258 3318 50  0000 L CNN
F 1 "Latch_CP" H 8258 3227 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5005-5009_Compact" H 8400 3200 50  0001 C CNN
F 3 "~" H 8400 3200 50  0001 C CNN
	1    8200 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3300 8200 3300
Wire Wire Line
	8200 3300 8200 3200
Connection ~ 8200 3300
Wire Wire Line
	8200 3300 8300 3300
Text GLabel 9900 2650 1    50   Input ~ 0
~VIA_IRQ
Wire Wire Line
	9900 2650 9900 2750
Wire Wire Line
	9900 2750 10000 2750
Text GLabel 9750 2650 1    50   Input ~ 0
~UART_IRQ
Text GLabel 9600 2650 1    50   Input ~ 0
~EXT_IRQ
Text GLabel 10700 2850 2    50   Output ~ 0
~IRQ
Wire Wire Line
	10600 2850 10700 2850
Wire Wire Line
	9750 2650 9750 2850
Wire Wire Line
	9750 2850 10000 2850
Wire Wire Line
	9600 2650 9600 2950
Wire Wire Line
	9600 2950 10000 2950
Text GLabel 10950 1000 1    50   Output ~ 0
~VIA_IRQ
Text GLabel 10800 1000 1    50   Output ~ 0
~UART_IRQ
Wire Wire Line
	10500 1500 9700 1500
Wire Wire Line
	10500 1000 10500 1500
Wire Wire Line
	10650 1600 9700 1600
Wire Wire Line
	10650 1000 10650 1600
Wire Wire Line
	10800 1700 9700 1700
Wire Wire Line
	10800 1000 10800 1700
Wire Wire Line
	10950 1800 9700 1800
Wire Wire Line
	10950 1000 10950 1800
Text GLabel 10050 1000 1    50   Output ~ 0
DBG_BE
$Comp
L 74xx:74LS32 U12
U 5 1 61E34EE3
P 4750 6950
F 0 "U12" H 4750 7000 50  0000 C CNN
F 1 "74AC32" H 4750 6900 50  0000 C CNN
F 2 "" H 4750 6950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4750 6950 50  0001 C CNN
	5    4750 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61E38BC7
P 5100 6950
AR Path="/5F8F4E1E/61E38BC7" Ref="C?"  Part="1" 
AR Path="/618DD0B9/61E38BC7" Ref="C19"  Part="1" 
F 0 "C19" H 5192 6996 50  0000 L CNN
F 1 "0,1uF" H 5192 6905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5100 6950 50  0001 C CNN
F 3 "~" H 5100 6950 50  0001 C CNN
	1    5100 6950
	1    0    0    -1  
$EndComp
Text GLabel 4650 6350 0    50   Input ~ 0
+5V
Text GLabel 4650 7550 0    50   Input ~ 0
GND
Wire Wire Line
	4650 7550 4750 7550
Wire Wire Line
	4750 7550 4750 7450
Wire Wire Line
	4650 6350 4750 6350
Wire Wire Line
	4750 6350 4750 6450
Wire Wire Line
	4750 6350 5100 6350
Wire Wire Line
	5100 6350 5100 6850
Connection ~ 4750 6350
Wire Wire Line
	5100 7050 5100 7550
Wire Wire Line
	5100 7550 4750 7550
Connection ~ 4750 7550
$Comp
L 74xx:74LS32 U12
U 1 1 61E72E16
P 6500 2000
F 0 "U12" H 6500 2300 50  0000 C CNN
F 1 "74AC32" H 6500 2200 50  0000 C CNN
F 2 "" H 6500 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6500 2000 50  0001 C CNN
	1    6500 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2100 6200 2100
Text GLabel 6100 1900 0    50   Input ~ 0
WS_DISABLE
Wire Wire Line
	6100 1900 6200 1900
Wire Wire Line
	6800 2000 6900 2000
Entry Wire Line
	1100 2300 1200 2200
Wire Wire Line
	1200 2200 1400 2200
Text Label 1200 2200 0    50   ~ 0
a7
$Comp
L 74xx:74LS08 U?
U 3 1 61F08DCE
P 1500 5900
AR Path="/5F8F4E1E/61F08DCE" Ref="U?"  Part="3" 
AR Path="/61F08DCE" Ref="U?"  Part="2" 
AR Path="/5F910E81/61F08DCE" Ref="U?"  Part="3" 
AR Path="/618DD0B9/61F08DCE" Ref="U13"  Part="3" 
F 0 "U13" H 1500 6225 50  0000 C CNN
F 1 "74AC08" H 1500 6134 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1500 5900 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 1500 5900 50  0001 C CNN
	3    1500 5900
	1    0    0    -1  
$EndComp
Text GLabel 1100 5800 0    50   Input ~ 0
PLD_RDY
Wire Wire Line
	1100 5800 1200 5800
Wire Wire Line
	1100 6000 1200 6000
Text GLabel 1900 5900 2    50   Output ~ 0
6502_RDY
Wire Wire Line
	1800 5900 1900 5900
Text GLabel 7600 2100 2    50   Output ~ 0
CYCLE_COMMIT
$Comp
L 74xx:74LS08 U?
U 4 1 62094E8A
P 7200 2100
AR Path="/5F8F4E1E/62094E8A" Ref="U?"  Part="3" 
AR Path="/62094E8A" Ref="U?"  Part="2" 
AR Path="/5F910E81/62094E8A" Ref="U?"  Part="3" 
AR Path="/618DD0B9/62094E8A" Ref="U13"  Part="4" 
F 0 "U13" H 7200 2425 50  0000 C CNN
F 1 "74AC08" H 7200 2334 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7200 2100 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 7200 2100 50  0001 C CNN
	4    7200 2100
	1    0    0    -1  
$EndComp
Text GLabel 6100 2300 0    50   Input ~ 0
~PHI2
Text GLabel 6100 2600 0    50   Input ~ 0
CYCLE_COMMIT
Wire Wire Line
	6100 2300 6700 2300
Wire Wire Line
	6700 2300 6700 2200
Wire Wire Line
	6700 2200 6900 2200
Wire Wire Line
	7500 2100 7600 2100
$Comp
L 74xx:74LS11 U14
U 4 1 6210112E
P 1150 6950
F 0 "U14" H 1150 7000 50  0000 C CNN
F 1 "74AC11" H 1150 6900 50  0000 C CNN
F 2 "" H 1150 6950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS11" H 1150 6950 50  0001 C CNN
	4    1150 6950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS11 U14
U 1 1 62106F70
P 7800 3300
F 0 "U14" H 7800 3600 50  0000 C CNN
F 1 "74AC11" H 7800 3500 50  0000 C CNN
F 2 "" H 7800 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS11" H 7800 3300 50  0001 C CNN
	1    7800 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2600 7000 2600
Wire Wire Line
	7000 2600 7000 3200
Wire Wire Line
	7000 3200 7500 3200
$Comp
L 74xx:74LS11 U14
U 2 1 62144563
P 10300 2850
F 0 "U14" H 10300 3150 50  0000 C CNN
F 1 "74AC11" H 10300 3050 50  0000 C CNN
F 2 "" H 10300 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS11" H 10300 2850 50  0001 C CNN
	2    10300 2850
	1    0    0    -1  
$EndComp
Text GLabel 10650 1000 1    50   Output ~ 0
~EXT_IRQ
Text GLabel 10500 1000 1    50   Output ~ 0
~DBG_RES
Text GLabel 10200 1000 1    50   Output ~ 0
~SO
Text GLabel 10350 1000 1    50   Output ~ 0
~NMI
$Comp
L 74xx:74LS32 U12
U 2 1 6218F42D
P 7200 4250
F 0 "U12" H 7200 4550 50  0000 C CNN
F 1 "74AC32" H 7200 4450 50  0000 C CNN
F 2 "" H 7200 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7200 4250 50  0001 C CNN
	2    7200 4250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U12
U 3 1 6219577F
P 7200 4800
F 0 "U12" H 7200 5100 50  0000 C CNN
F 1 "74AC32" H 7200 5000 50  0000 C CNN
F 2 "" H 7200 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7200 4800 50  0001 C CNN
	3    7200 4800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 1 1 62197FED
P 6500 4150
AR Path="/5F910E81/62197FED" Ref="U?"  Part="2" 
AR Path="/618DD0B9/62197FED" Ref="U16"  Part="1" 
F 0 "U16" H 6500 4467 50  0000 C CNN
F 1 "74AC04" H 6500 4376 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6500 4150 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 6500 4150 50  0001 C CNN
	1    6500 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4150 6100 4150
Wire Wire Line
	6800 4150 6900 4150
Wire Wire Line
	6100 4150 6100 4700
Wire Wire Line
	6100 4700 6900 4700
Connection ~ 6100 4150
Wire Wire Line
	6100 4150 6200 4150
Text GLabel 6000 4350 0    50   Input ~ 0
CYCLE_COMMIT
Wire Wire Line
	6000 4350 6800 4350
Wire Wire Line
	6900 4900 6800 4900
Wire Wire Line
	6800 4900 6800 4350
Connection ~ 6800 4350
Wire Wire Line
	6800 4350 6900 4350
Wire Wire Line
	7600 4800 7500 4800
Wire Wire Line
	7500 4250 7600 4250
Entry Wire Line
	1200 2300 1100 2400
Wire Wire Line
	1200 2300 1400 2300
Text Label 1200 2300 0    50   ~ 0
a6
Text GLabel 4800 2000 3    50   Output ~ 0
~IOCS4
Text GLabel 2500 1800 2    50   BiDi ~ 0
IO18
Text GLabel 2500 1900 2    50   BiDi ~ 0
IO17
Wire Wire Line
	2400 1800 2500 1800
Wire Wire Line
	2400 1900 2500 1900
$Comp
L 74xx:74HC04 U?
U 7 1 622DD316
P 5700 6950
AR Path="/5F8F4E1E/622DD316" Ref="U?"  Part="7" 
AR Path="/618DD0B9/622DD316" Ref="U16"  Part="7" 
F 0 "U16" H 5700 7000 50  0000 C CNN
F 1 "74AC04" H 5700 6900 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5700 6950 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 5700 6950 50  0001 C CNN
	7    5700 6950
	1    0    0    -1  
$EndComp
Text GLabel 5600 7550 0    50   Input ~ 0
GND
Wire Wire Line
	5600 7550 5700 7550
Text GLabel 5600 6350 0    50   Input ~ 0
+5V
Wire Wire Line
	5600 6350 5700 6350
$Comp
L Device:C_Small C?
U 1 1 622DD324
P 6050 6950
AR Path="/5F8F4E1E/622DD324" Ref="C?"  Part="1" 
AR Path="/618DD0B9/622DD324" Ref="C20"  Part="1" 
F 0 "C20" H 6142 6996 50  0000 L CNN
F 1 "0,1uF" H 6142 6905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6050 6950 50  0001 C CNN
F 3 "~" H 6050 6950 50  0001 C CNN
	1    6050 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 6850 6050 6350
Wire Wire Line
	6050 6350 5700 6350
Connection ~ 5700 6350
Wire Wire Line
	5700 6350 5700 6450
Wire Wire Line
	6050 7050 6050 7550
Wire Wire Line
	6050 7550 5700 7550
Connection ~ 5700 7550
Wire Wire Line
	5700 7550 5700 7450
Wire Bus Line
	3450 1300 3450 1500
Wire Bus Line
	1100 1500 1100 2500
$EndSCHEMATC
