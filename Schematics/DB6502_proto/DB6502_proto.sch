EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title "DB6502 Hobby Computer Version 2"
Date "2020-11-03"
Rev "v003"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Open Source Hardware"
Comment4 "Author: Dawid Buchwald"
$EndDescr
Text GLabel 1650 1150 1    50   Input ~ 0
6502_RDY
NoConn ~ 1900 1450
Text GLabel 1500 1150 1    50   Input ~ 0
~IRQ
Text GLabel 1350 1150 1    50   Output ~ 0
~ML
Text GLabel 1800 1150 1    50   Output ~ 0
~VP
Wire Wire Line
	1800 1150 1800 1250
Wire Wire Line
	1800 1250 1900 1250
Wire Wire Line
	1650 1150 1650 1350
Wire Wire Line
	1650 1350 1900 1350
Wire Wire Line
	1500 1150 1500 1550
Wire Wire Line
	1500 1550 1900 1550
Wire Wire Line
	1350 1150 1350 1650
Wire Wire Line
	1350 1650 1900 1650
Text GLabel 1200 1150 1    50   Input ~ 0
~NMI
Wire Wire Line
	1200 1150 1200 1750
Wire Wire Line
	1200 1750 1900 1750
Text GLabel 1050 1150 1    50   Output ~ 0
SYNC
Wire Wire Line
	1050 1150 1050 1850
Wire Wire Line
	1050 1850 1900 1850
Wire Wire Line
	900  1150 900  1950
Wire Wire Line
	900  1950 1900 1950
Text Label 1700 2050 0    50   ~ 0
a0
Text Label 1700 2150 0    50   ~ 0
a1
Text Label 1700 2250 0    50   ~ 0
a2
Text Label 1700 2350 0    50   ~ 0
a3
Text Label 1700 2450 0    50   ~ 0
a4
Text Label 1700 2550 0    50   ~ 0
a5
Text Label 1700 2650 0    50   ~ 0
a6
Text Label 1700 2750 0    50   ~ 0
a7
Text Label 1700 2850 0    50   ~ 0
a8
Text Label 1700 2950 0    50   ~ 0
a9
Text Label 1700 3050 0    50   ~ 0
a10
Text Label 1700 3150 0    50   ~ 0
a11
Entry Wire Line
	1600 2150 1700 2050
Entry Wire Line
	1600 2250 1700 2150
Entry Wire Line
	1600 2350 1700 2250
Entry Wire Line
	1600 2450 1700 2350
Entry Wire Line
	1600 2550 1700 2450
Entry Wire Line
	1600 2650 1700 2550
Entry Wire Line
	1600 2750 1700 2650
Entry Wire Line
	1600 2850 1700 2750
Entry Wire Line
	1600 2950 1700 2850
Entry Wire Line
	1600 3050 1700 2950
Entry Wire Line
	1600 3150 1700 3050
Entry Wire Line
	1600 3250 1700 3150
Wire Wire Line
	1700 2050 1900 2050
Wire Wire Line
	1700 2150 1900 2150
Wire Wire Line
	1700 2250 1900 2250
Wire Wire Line
	1700 2350 1900 2350
Wire Wire Line
	1700 2450 1900 2450
Wire Wire Line
	1700 2550 1900 2550
Wire Wire Line
	1700 2650 1900 2650
Wire Wire Line
	1700 2750 1900 2750
Wire Wire Line
	1700 2850 1900 2850
Wire Wire Line
	1700 2950 1900 2950
Wire Wire Line
	1700 3050 1900 3050
Wire Wire Line
	1700 3150 1900 3150
Text GLabel 900  1150 1    50   Input ~ 0
+5V
Text Label 3100 3050 2    50   ~ 0
a12
Text Label 3100 2950 2    50   ~ 0
a13
Text Label 3100 2850 2    50   ~ 0
a14
Text Label 3100 2750 2    50   ~ 0
a15
Entry Wire Line
	3100 2750 3200 2850
Entry Wire Line
	3100 2850 3200 2950
Entry Wire Line
	3100 2950 3200 3050
Entry Wire Line
	3100 3050 3200 3150
Wire Wire Line
	2900 2750 3100 2750
Wire Wire Line
	2900 2850 3100 2850
Wire Wire Line
	2900 2950 3100 2950
Wire Wire Line
	2900 3050 3100 3050
Text Label 3100 1950 2    50   ~ 0
d0
Text Label 3100 2050 2    50   ~ 0
d1
Text Label 3100 2150 2    50   ~ 0
d2
Text Label 3100 2250 2    50   ~ 0
d3
Text Label 3100 2350 2    50   ~ 0
d4
Text Label 3100 2450 2    50   ~ 0
d5
Text Label 3100 2550 2    50   ~ 0
d6
Text Label 3100 2650 2    50   ~ 0
d7
Entry Wire Line
	3100 1950 3200 2050
Entry Wire Line
	3100 2050 3200 2150
Entry Wire Line
	3100 2150 3200 2250
Entry Wire Line
	3100 2250 3200 2350
Entry Wire Line
	3100 2350 3200 2450
Entry Wire Line
	3100 2450 3200 2550
Entry Wire Line
	3100 2550 3200 2650
Entry Wire Line
	3100 2650 3200 2750
Wire Wire Line
	2900 2650 3100 2650
Wire Wire Line
	2900 2550 3100 2550
Wire Wire Line
	2900 2450 3100 2450
Wire Wire Line
	2900 2350 3100 2350
Wire Wire Line
	2900 2250 3100 2250
Wire Wire Line
	2900 2150 3100 2150
Wire Wire Line
	2900 2050 3100 2050
Wire Wire Line
	2900 1950 3100 1950
Text GLabel 3000 3250 3    50   Input ~ 0
GND
Wire Wire Line
	2900 3150 3000 3150
Wire Wire Line
	3000 3150 3000 3250
Wire Bus Line
	1600 3550 3200 3550
Text GLabel 1750 3400 2    50   Input ~ 0
a[0..15]
Wire Bus Line
	1750 3400 1600 3400
Connection ~ 1600 3400
Wire Bus Line
	1600 3400 1600 3550
Text GLabel 3300 2750 2    50   Input ~ 0
d[0..7]
Text GLabel 3000 1150 1    50   Input ~ 0
~6502_RES
Wire Wire Line
	3000 1150 3000 1250
Wire Wire Line
	3000 1250 2900 1250
NoConn ~ 2900 1350
Text GLabel 3150 1150 1    50   Input ~ 0
~SO
Wire Wire Line
	3150 1150 3150 1450
Wire Wire Line
	3150 1450 2900 1450
Text GLabel 3300 1150 1    50   Input ~ 0
6502_CLK
Wire Wire Line
	3300 1150 3300 1550
Wire Wire Line
	3300 1550 2900 1550
Text GLabel 3450 1150 1    50   Input ~ 0
BE
Wire Wire Line
	3450 1150 3450 1650
Wire Wire Line
	3450 1650 2900 1650
Text GLabel 3600 1150 1    50   Output ~ 0
R~W
Wire Wire Line
	3600 1150 3600 1850
Wire Wire Line
	3600 1850 2900 1850
$Comp
L 6502:22V10C U7
U 1 1 5F680A6E
P 4950 1800
F 0 "U7" H 4700 2600 50  0000 C CNN
F 1 "22V10C" H 4700 2500 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W7.62mm_Socket" H 4950 1100 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1627189.pdf" H 4950 1800 50  0001 C CNN
	1    4950 1800
	1    0    0    -1  
$EndComp
Text GLabel 4350 1150 1    50   Input ~ 0
6502_CLK
Text GLabel 4200 1150 1    50   Input ~ 0
R~W
Wire Wire Line
	4350 1150 4350 1250
Wire Wire Line
	4350 1250 4450 1250
Wire Wire Line
	4200 1150 4200 1350
Wire Wire Line
	4200 1350 4450 1350
Text Label 4250 1550 0    50   ~ 0
a15
Text Label 4250 1650 0    50   ~ 0
a14
Text Label 4250 1750 0    50   ~ 0
a13
Text Label 4250 1850 0    50   ~ 0
a12
Text Label 4250 1950 0    50   ~ 0
a11
Text Label 4250 2050 0    50   ~ 0
a10
Text Label 4250 2150 0    50   ~ 0
a9
Text Label 4250 2250 0    50   ~ 0
a8
Text GLabel 4050 1150 1    50   Input ~ 0
EXRAM
Wire Wire Line
	4250 2250 4450 2250
Wire Wire Line
	4250 2150 4450 2150
Wire Wire Line
	4250 2050 4450 2050
Wire Wire Line
	4250 1950 4450 1950
Wire Wire Line
	4250 1850 4450 1850
Wire Wire Line
	4250 1750 4450 1750
Wire Wire Line
	4250 1650 4450 1650
Wire Wire Line
	4250 1550 4450 1550
Entry Wire Line
	4150 1650 4250 1550
Entry Wire Line
	4150 1750 4250 1650
Entry Wire Line
	4150 1850 4250 1750
Entry Wire Line
	4150 1950 4250 1850
Entry Wire Line
	4150 2050 4250 1950
Entry Wire Line
	4150 2150 4250 2050
Entry Wire Line
	4150 2250 4250 2150
Entry Wire Line
	4150 2350 4250 2250
Wire Wire Line
	5450 1250 5550 1250
Wire Wire Line
	5550 1250 5550 1050
Text GLabel 4350 2450 3    50   Input ~ 0
GND
Wire Wire Line
	4350 2450 4350 2350
Wire Wire Line
	4350 2350 4450 2350
Wire Wire Line
	4050 1150 4050 1450
Wire Wire Line
	4050 1450 4450 1450
Text GLabel 5700 1150 1    50   Output ~ 0
~WE
Text GLabel 5850 1150 1    50   Output ~ 0
~OE
Wire Wire Line
	5700 1150 5700 1350
Wire Wire Line
	5700 1350 5450 1350
Wire Wire Line
	5850 1150 5850 1450
Wire Wire Line
	5850 1450 5450 1450
Text GLabel 6000 1150 1    50   Output ~ 0
RAM1_~CS
Wire Wire Line
	6000 1150 6000 1550
Wire Wire Line
	6000 1550 5450 1550
Text GLabel 6150 1150 1    50   Output ~ 0
RAM2_~CS
Wire Wire Line
	6150 1150 6150 1650
Wire Wire Line
	6150 1650 5450 1650
Text GLabel 6300 1150 1    50   Output ~ 0
ROM_~CS
Wire Wire Line
	6300 1150 6300 1750
Wire Wire Line
	6300 1750 5450 1750
Text Label 6600 1550 0    50   ~ 0
a7
Text Label 6600 1450 0    50   ~ 0
a6
Text Label 6600 1350 0    50   ~ 0
a5
Entry Wire Line
	6500 1450 6600 1350
Entry Wire Line
	6500 1550 6600 1450
Entry Wire Line
	6500 1650 6600 1550
Wire Wire Line
	6600 1350 6750 1350
Wire Wire Line
	6600 1450 6750 1450
Wire Wire Line
	6600 1550 6750 1550
Text GLabel 7350 1000 2    50   Input ~ 0
+5V
Wire Wire Line
	7350 1000 7250 1000
Text GLabel 7350 2450 2    50   Input ~ 0
GND
Wire Wire Line
	7350 2450 7250 2450
Wire Wire Line
	7250 2450 6650 2450
Wire Wire Line
	6650 2450 6650 2050
Wire Wire Line
	6650 2050 6750 2050
Connection ~ 7250 2450
Wire Wire Line
	7250 2450 7250 2350
Wire Wire Line
	6650 2050 6650 1950
Wire Wire Line
	6650 1950 6750 1950
Connection ~ 6650 2050
Text GLabel 7850 1250 1    50   Output ~ 0
~LATCH
Wire Wire Line
	7750 1350 7850 1350
Wire Wire Line
	7850 1350 7850 1250
Text GLabel 8000 1250 1    50   Output ~ 0
~VIA1
Wire Wire Line
	8000 1250 8000 1450
Wire Wire Line
	8000 1450 7750 1450
Text GLabel 8150 1250 1    50   Output ~ 0
~VIA2
Wire Wire Line
	8150 1250 8150 1550
Wire Wire Line
	8150 1550 7750 1550
Text GLabel 8300 1250 1    50   Output ~ 0
~UART
Wire Wire Line
	8300 1250 8300 1650
Wire Wire Line
	8300 1650 7750 1650
Text GLabel 7850 2150 3    50   Output ~ 0
~IOCS3
Text GLabel 8000 2150 3    50   Output ~ 0
~IOCS2
Text GLabel 8150 2150 3    50   Output ~ 0
~IOCS1
Text GLabel 8300 2150 3    50   Output ~ 0
~IOCS0
Wire Wire Line
	7850 2150 7850 2050
Wire Wire Line
	7850 2050 7750 2050
Wire Wire Line
	7750 1950 8000 1950
Wire Wire Line
	8000 1950 8000 2150
Wire Wire Line
	7750 1850 8150 1850
Wire Wire Line
	8150 1850 8150 2150
Wire Wire Line
	7750 1750 8300 1750
Wire Wire Line
	8300 1750 8300 2150
Text GLabel 5550 2350 2    50   Input ~ 0
IN12
Text GLabel 5550 2250 2    50   BiDi ~ 0
IO13
Text GLabel 5550 2150 2    50   BiDi ~ 0
IO14
Text GLabel 5550 2050 2    50   BiDi ~ 0
IO15
Text GLabel 5550 1950 2    50   BiDi ~ 0
IO16
Wire Wire Line
	5450 1950 5550 1950
Wire Wire Line
	5450 2050 5550 2050
Wire Wire Line
	5450 2150 5550 2150
Wire Wire Line
	5450 2250 5550 2250
Wire Wire Line
	5450 2350 5550 2350
$Sheet
S 8700 5950 750  350 
U 6014B4D9
F0 "ports" 50
F1 "ports.sch" 50
$EndSheet
$Comp
L 74xx:74LS138 U8
U 1 1 5F9A1F2C
P 7250 1650
F 0 "U8" H 7250 1650 50  0000 C CNN
F 1 "74AC138" H 7150 1550 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 7250 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 7250 1650 50  0001 C CNN
	1    7250 1650
	1    0    0    -1  
$EndComp
$Comp
L 6502:65C02S U5
U 1 1 5F5A65C1
P 2400 2150
F 0 "U5" H 2400 3315 50  0000 C CNN
F 1 "65C02S" H 2400 3224 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 2400 3200 50  0001 C CNN
F 3 "" H 2250 3100 50  0001 C CNN
	1    2400 2150
	1    0    0    -1  
$EndComp
Wire Bus Line
	3200 2750 3300 2750
$Sheet
S 6950 5950 700  350 
U 5F8F4E1E
F0 "supervisor" 50
F1 "supervisor.sch" 50
$EndSheet
$Comp
L 74xx:74LS04 U?
U 5 1 5FD6D1DD
P 2350 4050
AR Path="/5F8F4E1E/5FD6D1DD" Ref="U?"  Part="5" 
AR Path="/5FD6D1DD" Ref="U4"  Part="5" 
F 0 "U4" H 2350 4367 50  0000 C CNN
F 1 "74AC04" H 2350 4276 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2350 4050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 2350 4050 50  0001 C CNN
	5    2350 4050
	1    0    0    -1  
$EndComp
Text GLabel 1950 4050 0    50   Input ~ 0
6502_CLK
Wire Wire Line
	1950 4050 2050 4050
Text GLabel 2750 4050 2    50   Output ~ 0
~6502_CLK
Wire Wire Line
	2650 4050 2750 4050
$Comp
L 74xx:74LS08 U?
U 2 1 5FDA6F78
P 3050 4600
AR Path="/5F8F4E1E/5FDA6F78" Ref="U?"  Part="2" 
AR Path="/5FDA6F78" Ref="U6"  Part="2" 
F 0 "U6" H 3050 4925 50  0000 C CNN
F 1 "74AC08" H 3050 4834 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3050 4600 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 3050 4600 50  0001 C CNN
	2    3050 4600
	1    0    0    -1  
$EndComp
Text GLabel 2650 4500 0    50   Input ~ 0
DBG_RDY
Wire Wire Line
	2650 4500 2750 4500
Wire Wire Line
	2100 4700 2650 4700
Text GLabel 3450 4600 2    50   Output ~ 0
6502_RDY
Wire Wire Line
	2600 5250 2500 5250
Text GLabel 2100 5650 0    50   Input ~ 0
+5V
Text GLabel 2300 4850 2    50   Input ~ 0
+5V
Wire Wire Line
	2200 5650 2200 5550
NoConn ~ 1900 5350
Text GLabel 2600 5250 2    50   Input ~ 0
~6502_CLK
$Comp
L 74xx:74LS32 U1
U 1 1 5FE9A12D
P 1800 4700
F 0 "U1" H 1800 5025 50  0000 C CNN
F 1 "74AC32" H 1800 4934 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 1800 4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1800 4700 50  0001 C CNN
	1    1800 4700
	1    0    0    -1  
$EndComp
Text Label 2400 4700 2    50   ~ 0
ws_rdy
Wire Wire Line
	2200 4950 2200 4850
Wire Wire Line
	2200 4850 2300 4850
Wire Wire Line
	2200 5650 2100 5650
$Comp
L 74xx:74HC74 U?
U 1 1 5FE3D22B
P 2200 5250
AR Path="/5F8F4E1E/5FE3D22B" Ref="U?"  Part="2" 
AR Path="/5FE3D22B" Ref="U3"  Part="1" 
F 0 "U3" H 1900 5650 50  0000 C CNN
F 1 "74AC74" H 1900 5550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2200 5250 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2200 5250 50  0001 C CNN
	1    2200 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 5350 3100 5350
Wire Wire Line
	1900 5150 1400 5150
Wire Wire Line
	1400 5150 1400 4800
Wire Wire Line
	1400 4800 1500 4800
Text GLabel 1400 4600 0    50   Input ~ 0
ROM_~CS
Wire Wire Line
	1400 4600 1500 4600
Text Label 1850 5150 2    50   ~ 0
ws_toggle
$Comp
L Device:C_Small C1
U 1 1 5FFF1E28
P 900 2150
F 0 "C1" H 992 2196 50  0000 L CNN
F 1 "0,1uF" H 992 2105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 900 2150 50  0001 C CNN
F 3 "~" H 900 2150 50  0001 C CNN
	1    900  2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  2050 900  1950
Connection ~ 900  1950
Text GLabel 900  2350 3    50   Input ~ 0
GND
Wire Wire Line
	900  2350 900  2250
Text GLabel 5550 950  1    50   Input ~ 0
+5V
$Comp
L Device:C_Small C5
U 1 1 600EDE42
P 5350 1050
F 0 "C5" V 5121 1050 50  0000 C CNN
F 1 "0,1uF" V 5212 1050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5350 1050 50  0001 C CNN
F 3 "~" H 5350 1050 50  0001 C CNN
	1    5350 1050
	0    1    1    0   
$EndComp
Text GLabel 5150 1050 0    50   Input ~ 0
GND
Wire Wire Line
	5150 1050 5250 1050
Wire Wire Line
	5450 1050 5550 1050
Connection ~ 5550 1050
Wire Wire Line
	5550 1050 5550 950 
$Comp
L Device:C_Small C6
U 1 1 60156577
P 7050 1000
F 0 "C6" V 6821 1000 50  0000 C CNN
F 1 "0,1uF" V 6912 1000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7050 1000 50  0001 C CNN
F 3 "~" H 7050 1000 50  0001 C CNN
	1    7050 1000
	0    1    1    0   
$EndComp
Text GLabel 6850 1000 0    50   Input ~ 0
GND
Wire Wire Line
	6850 1000 6950 1000
Wire Wire Line
	7150 1000 7250 1000
Connection ~ 7250 1000
Wire Wire Line
	7250 1000 7250 1050
$Comp
L 74xx:74LS32 U1
U 5 1 601AA5FE
P 850 6900
F 0 "U1" H 850 6950 50  0000 C CNN
F 1 "74AC32" H 850 6850 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 850 6900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 850 6900 50  0001 C CNN
	5    850  6900
	1    0    0    -1  
$EndComp
Text GLabel 750  6350 0    50   Input ~ 0
+5V
Text GLabel 750  7450 0    50   Input ~ 0
GND
Wire Wire Line
	750  6350 850  6350
Wire Wire Line
	750  7450 850  7450
$Comp
L Device:C_Small C2
U 1 1 601E7D6E
P 1150 6900
F 0 "C2" H 1242 6946 50  0000 L CNN
F 1 "0,1uF" H 1242 6855 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1150 6900 50  0001 C CNN
F 3 "~" H 1150 6900 50  0001 C CNN
	1    1150 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  6350 1150 6350
Wire Wire Line
	1150 6350 1150 6800
Connection ~ 850  6350
Wire Wire Line
	850  6350 850  6400
Wire Wire Line
	1150 7000 1150 7450
Wire Wire Line
	1150 7450 850  7450
Connection ~ 850  7450
Wire Wire Line
	850  7450 850  7400
$Comp
L 74xx:74LS32 U1
U 3 1 603ACD27
P 3950 6900
F 0 "U1" H 3950 7225 50  0000 C CNN
F 1 "74AC32" H 3950 7134 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3950 6900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3950 6900 50  0001 C CNN
	3    3950 6900
	1    0    0    -1  
$EndComp
Text GLabel 3550 6800 0    50   Input ~ 0
GND
Text GLabel 3550 7000 0    50   Input ~ 0
GND
Wire Wire Line
	3550 7000 3650 7000
Wire Wire Line
	3550 6800 3650 6800
NoConn ~ 4250 6900
$Comp
L 74xx:74LS32 U1
U 4 1 603CCE1F
P 3950 7450
F 0 "U1" H 3950 7775 50  0000 C CNN
F 1 "74AC32" H 3950 7684 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3950 7450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3950 7450 50  0001 C CNN
	4    3950 7450
	1    0    0    -1  
$EndComp
Text GLabel 3550 7350 0    50   Input ~ 0
GND
Text GLabel 3550 7550 0    50   Input ~ 0
GND
Wire Wire Line
	3550 7550 3650 7550
Wire Wire Line
	3550 7350 3650 7350
NoConn ~ 4250 7450
$Sheet
S 7800 5950 750  350 
U 5F910E81
F0 "serial" 50
F1 "serial.sch" 50
$EndSheet
$Comp
L 74xx:74LS21 U2
U 1 1 5FB20233
P 10200 1450
F 0 "U2" H 10200 1825 50  0000 C CNN
F 1 "74HC21" H 10200 1734 50  0000 C CNN
F 2 "Package_DIP:DIP-12_W7.62mm_Socket" H 10200 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 10200 1450 50  0001 C CNN
	1    10200 1450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS21 U2
U 2 1 5FB22533
P 3950 6300
F 0 "U2" H 3950 6675 50  0000 C CNN
F 1 "74HC21" H 3950 6584 50  0000 C CNN
F 2 "Package_DIP:DIP-12_W7.62mm_Socket" H 3950 6300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 3950 6300 50  0001 C CNN
	2    3950 6300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS21 U2
U 3 1 5FB2300D
P 1700 6900
F 0 "U2" H 1700 6950 50  0000 C CNN
F 1 "74HC21" H 1700 6850 50  0000 C CNN
F 2 "Package_DIP:DIP-12_W7.62mm_Socket" H 1700 6900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 1700 6900 50  0001 C CNN
	3    1700 6900
	1    0    0    -1  
$EndComp
Text GLabel 1600 6350 0    50   Input ~ 0
+5V
Text GLabel 1600 7450 0    50   Input ~ 0
GND
Wire Wire Line
	1600 7450 1700 7450
Wire Wire Line
	1700 6400 1700 6350
$Comp
L Device:C_Small C3
U 1 1 5FB8CE95
P 2000 6900
F 0 "C3" H 2092 6946 50  0000 L CNN
F 1 "0,1uF" H 2092 6855 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2000 6900 50  0001 C CNN
F 3 "~" H 2000 6900 50  0001 C CNN
	1    2000 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 6800 2000 6350
Wire Wire Line
	2000 6350 1700 6350
Connection ~ 1700 6350
Wire Wire Line
	1700 6350 1600 6350
Wire Wire Line
	1700 7450 2000 7450
Wire Wire Line
	2000 7450 2000 7000
Connection ~ 1700 7450
Wire Wire Line
	1700 7450 1700 7400
Text GLabel 9800 1200 1    50   Input ~ 0
~VIA1_IRQ
Wire Wire Line
	9800 1200 9800 1300
Wire Wire Line
	9800 1300 9900 1300
Text GLabel 9650 1200 1    50   Input ~ 0
~VIA2_IRQ
Text GLabel 9500 1200 1    50   Input ~ 0
~UART_IRQ
Text GLabel 9350 1200 1    50   Input ~ 0
~EXT_IRQ
Text GLabel 10600 1450 2    50   Output ~ 0
~IRQ
Wire Wire Line
	10500 1450 10600 1450
Wire Wire Line
	9650 1200 9650 1400
Wire Wire Line
	9650 1400 9900 1400
Wire Wire Line
	9500 1200 9500 1500
Wire Wire Line
	9500 1500 9900 1500
Wire Wire Line
	9350 1200 9350 1600
Wire Wire Line
	9350 1600 9900 1600
$Comp
L Device:R R1
U 1 1 5FC6DB04
P 9000 1250
F 0 "R1" V 8900 1250 50  0000 C CNN
F 1 "4K7" V 9000 1250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8930 1250 50  0001 C CNN
F 3 "~" H 9000 1250 50  0001 C CNN
	1    9000 1250
	1    0    0    -1  
$EndComp
Text GLabel 9000 1050 1    50   Input ~ 0
+5V
Wire Wire Line
	9000 1050 9000 1100
Wire Wire Line
	9000 1600 9350 1600
Connection ~ 9350 1600
Text GLabel 3550 6150 0    50   Input ~ 0
GND
Text GLabel 3550 6250 0    50   Input ~ 0
GND
Text GLabel 3550 6350 0    50   Input ~ 0
GND
Text GLabel 3550 6450 0    50   Input ~ 0
GND
Wire Wire Line
	3550 6450 3650 6450
Wire Wire Line
	3550 6350 3650 6350
Wire Wire Line
	3550 6250 3650 6250
Wire Wire Line
	3550 6150 3650 6150
NoConn ~ 4250 6300
$Comp
L 74xx:74HC74 U?
U 3 1 5FDF80F5
P 2550 6900
AR Path="/5F8F4E1E/5FDF80F5" Ref="U?"  Part="3" 
AR Path="/5FDF80F5" Ref="U3"  Part="3" 
F 0 "U3" H 2550 6950 50  0000 C CNN
F 1 "74AC74" H 2550 6850 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2550 6900 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2550 6900 50  0001 C CNN
	3    2550 6900
	1    0    0    -1  
$EndComp
Text GLabel 2450 7350 0    50   Input ~ 0
GND
Wire Wire Line
	2450 7350 2550 7350
Text GLabel 2450 6450 0    50   Input ~ 0
+5V
Wire Wire Line
	2450 6450 2550 6450
$Comp
L Device:C_Small C?
U 1 1 5FDF80FF
P 2900 6900
AR Path="/5F8F4E1E/5FDF80FF" Ref="C?"  Part="1" 
AR Path="/5FDF80FF" Ref="C4"  Part="1" 
F 0 "C4" H 2992 6946 50  0000 L CNN
F 1 "0,1uF" H 2992 6855 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2900 6900 50  0001 C CNN
F 3 "~" H 2900 6900 50  0001 C CNN
	1    2900 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 7350 2900 7350
Wire Wire Line
	2900 7350 2900 7000
Connection ~ 2550 7350
Wire Wire Line
	2550 7350 2550 7300
Wire Wire Line
	2900 6800 2900 6450
Wire Wire Line
	2900 6450 2550 6450
Connection ~ 2550 6450
Wire Wire Line
	2550 6450 2550 6500
$Comp
L 74xx:74HC74 U?
U 2 1 5FE82338
P 5050 6350
AR Path="/5F8F4E1E/5FE82338" Ref="U?"  Part="2" 
AR Path="/5FE82338" Ref="U3"  Part="2" 
F 0 "U3" H 4750 6750 50  0000 C CNN
F 1 "74AC74" H 4750 6650 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5050 6350 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5050 6350 50  0001 C CNN
	2    5050 6350
	1    0    0    -1  
$EndComp
Text GLabel 4650 6250 0    50   Input ~ 0
GND
Text GLabel 4650 6350 0    50   Input ~ 0
GND
Text GLabel 4950 6750 0    50   Input ~ 0
+5V
Text GLabel 5150 5950 2    50   Input ~ 0
+5V
NoConn ~ 5350 6250
NoConn ~ 5350 6450
Wire Wire Line
	4650 6250 4750 6250
Wire Wire Line
	4650 6350 4750 6350
Wire Wire Line
	4950 6750 5050 6750
Wire Wire Line
	5050 6750 5050 6650
Wire Wire Line
	5050 6050 5050 5950
Wire Wire Line
	5050 5950 5150 5950
$Comp
L Device:R R2
U 1 1 6011A69F
P 9200 1250
F 0 "R2" V 9100 1250 50  0000 C CNN
F 1 "4K7" V 9200 1250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9130 1250 50  0001 C CNN
F 3 "~" H 9200 1250 50  0001 C CNN
	1    9200 1250
	1    0    0    -1  
$EndComp
Text GLabel 9200 1050 1    50   Input ~ 0
+5V
Wire Wire Line
	9200 1050 9200 1100
Wire Wire Line
	9000 1400 9000 1600
Wire Wire Line
	9200 1400 9200 1500
Wire Wire Line
	9200 1500 9500 1500
Connection ~ 9500 1500
Wire Wire Line
	5400 7450 5500 7450
$Comp
L 74xx:74LS32 U1
U 2 1 5FCDB498
P 5100 7450
AR Path="/5FCDB498" Ref="U1"  Part="2" 
AR Path="/5F910E81/5FCDB498" Ref="U?"  Part="2" 
F 0 "U1" H 5100 7775 50  0000 C CNN
F 1 "74AC32" H 5100 7684 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5100 7450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5100 7450 50  0001 C CNN
	2    5100 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 7350 4800 7350
Wire Wire Line
	4700 7550 4800 7550
Text GLabel 4700 7350 0    50   Input ~ 0
GND
Text GLabel 4700 7550 0    50   Input ~ 0
GND
NoConn ~ 5500 7450
Wire Wire Line
	3350 4600 3450 4600
Wire Wire Line
	3100 5350 3100 4950
Wire Wire Line
	3100 4950 2650 4950
Wire Wire Line
	2650 4950 2650 4700
Wire Wire Line
	2650 4700 2750 4700
Connection ~ 2650 4700
$Sheet
S 9600 5950 750  350 
U 5FE5FF2A
F0 "memory" 50
F1 "memory.sch" 50
$EndSheet
Wire Wire Line
	5450 1850 6300 1850
Text Label 6750 1850 2    50   ~ 0
io_cs
Text GLabel 6300 1950 3    50   Output ~ 0
IOCS
Wire Wire Line
	6300 1950 6300 1850
Connection ~ 6300 1850
Wire Wire Line
	6300 1850 6750 1850
Wire Bus Line
	6500 1450 6500 1650
Wire Bus Line
	3200 2850 3200 3550
Wire Bus Line
	3200 2050 3200 2750
Wire Bus Line
	4150 1650 4150 2350
Wire Bus Line
	1600 2150 1600 3400
$EndSCHEMATC
