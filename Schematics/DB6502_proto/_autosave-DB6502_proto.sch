EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title "DB6502 Hobby Computer Version 2"
Date "2020-10-30"
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
L 6502:22V10C U4
U 1 1 5F680A6E
P 4800 1800
F 0 "U4" H 4550 2600 50  0000 C CNN
F 1 "22V10C" H 4550 2500 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W7.62mm_Socket" H 4800 1100 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1627189.pdf" H 4800 1800 50  0001 C CNN
	1    4800 1800
	1    0    0    -1  
$EndComp
Text GLabel 4050 1150 1    50   Input ~ 0
R~W
Wire Wire Line
	4200 1150 4200 1250
Wire Wire Line
	4200 1250 4300 1250
Wire Wire Line
	4050 1150 4050 1350
Wire Wire Line
	4050 1350 4300 1350
Text Label 4100 1550 0    50   ~ 0
a15
Text Label 4100 1650 0    50   ~ 0
a14
Text Label 4100 1750 0    50   ~ 0
a13
Text Label 4100 1850 0    50   ~ 0
a12
Text Label 4100 1950 0    50   ~ 0
a11
Text Label 4100 2050 0    50   ~ 0
a10
Text Label 4100 2150 0    50   ~ 0
a9
Text Label 4100 2250 0    50   ~ 0
a8
Text GLabel 3900 1150 1    50   Input ~ 0
EXRAM
Wire Wire Line
	4100 2250 4300 2250
Wire Wire Line
	4100 2150 4300 2150
Wire Wire Line
	4100 2050 4300 2050
Wire Wire Line
	4100 1950 4300 1950
Wire Wire Line
	4100 1850 4300 1850
Wire Wire Line
	4100 1750 4300 1750
Wire Wire Line
	4100 1650 4300 1650
Wire Wire Line
	4100 1550 4300 1550
Entry Wire Line
	4000 1650 4100 1550
Entry Wire Line
	4000 1750 4100 1650
Entry Wire Line
	4000 1850 4100 1750
Entry Wire Line
	4000 1950 4100 1850
Entry Wire Line
	4000 2050 4100 1950
Entry Wire Line
	4000 2150 4100 2050
Entry Wire Line
	4000 2250 4100 2150
Entry Wire Line
	4000 2350 4100 2250
Wire Wire Line
	5300 1250 5400 1250
Wire Wire Line
	5400 1250 5400 1050
Text GLabel 4200 2450 3    50   Input ~ 0
GND
Wire Wire Line
	4200 2450 4200 2350
Wire Wire Line
	4200 2350 4300 2350
Wire Wire Line
	3900 1150 3900 1450
Wire Wire Line
	3900 1450 4300 1450
Text GLabel 5550 1150 1    50   Output ~ 0
~WE
Text GLabel 5700 1150 1    50   Output ~ 0
~OE
Wire Wire Line
	5550 1150 5550 1350
Wire Wire Line
	5550 1350 5300 1350
Wire Wire Line
	5700 1150 5700 1450
Wire Wire Line
	5700 1450 5300 1450
Text GLabel 5850 1150 1    50   Output ~ 0
RAM1_~CS
Wire Wire Line
	5850 1150 5850 1550
Wire Wire Line
	5850 1550 5300 1550
Text GLabel 6000 1150 1    50   Output ~ 0
RAM2_~CS
Wire Wire Line
	6000 1150 6000 1650
Wire Wire Line
	6000 1650 5300 1650
Text GLabel 6150 1150 1    50   Output ~ 0
ROM_~CS
Wire Wire Line
	6150 1150 6150 1750
Wire Wire Line
	6150 1750 5300 1750
Text GLabel 6300 1150 1    50   Output ~ 0
IOCS
Wire Wire Line
	6300 1150 6300 1850
Wire Wire Line
	6300 1850 5300 1850
Text Label 6600 1500 0    50   ~ 0
a7
Text Label 6600 1400 0    50   ~ 0
a6
Text Label 6600 1300 0    50   ~ 0
a5
Entry Wire Line
	6500 1400 6600 1300
Entry Wire Line
	6500 1500 6600 1400
Entry Wire Line
	6500 1600 6600 1500
Wire Wire Line
	6600 1300 6750 1300
Wire Wire Line
	6600 1400 6750 1400
Wire Wire Line
	6600 1500 6750 1500
Text GLabel 7250 900  1    50   Input ~ 0
+5V
Wire Wire Line
	7250 900  7250 950 
Text GLabel 7250 2500 3    50   Input ~ 0
GND
Wire Wire Line
	7250 2500 7250 2400
Wire Wire Line
	7250 2400 6650 2400
Wire Wire Line
	6650 2400 6650 2000
Wire Wire Line
	6650 2000 6750 2000
Connection ~ 7250 2400
Wire Wire Line
	7250 2400 7250 2300
Wire Wire Line
	6650 2000 6650 1900
Wire Wire Line
	6650 1900 6750 1900
Connection ~ 6650 2000
Wire Wire Line
	6650 1800 6750 1800
Text GLabel 7850 1200 1    50   Output ~ 0
~LATCH
Wire Wire Line
	7750 1300 7850 1300
Wire Wire Line
	7850 1300 7850 1200
Text GLabel 8000 1200 1    50   Output ~ 0
~VIA1
Wire Wire Line
	8000 1200 8000 1400
Wire Wire Line
	8000 1400 7750 1400
Text GLabel 8150 1200 1    50   Output ~ 0
~VIA2
Wire Wire Line
	8150 1200 8150 1500
Wire Wire Line
	8150 1500 7750 1500
Text GLabel 8300 1200 1    50   Output ~ 0
~UART
Wire Wire Line
	8300 1200 8300 1600
Wire Wire Line
	8300 1600 7750 1600
Text GLabel 7850 2100 3    50   Output ~ 0
~IOCS3
Text GLabel 8000 2100 3    50   Output ~ 0
~IOCS2
Text GLabel 8150 2100 3    50   Output ~ 0
~IOCS1
Text GLabel 8300 2100 3    50   Output ~ 0
~IOCS0
Wire Wire Line
	7850 2100 7850 2000
Wire Wire Line
	7850 2000 7750 2000
Wire Wire Line
	7750 1900 8000 1900
Wire Wire Line
	8000 1900 8000 2100
Wire Wire Line
	7750 1800 8150 1800
Wire Wire Line
	8150 1800 8150 2100
Wire Wire Line
	7750 1700 8300 1700
Wire Wire Line
	8300 1700 8300 2100
Text GLabel 5400 2350 2    50   Input ~ 0
RDY_M1
Text GLabel 5400 2250 2    50   Input ~ 0
RDY_M2
Text GLabel 5400 2150 2    50   Input ~ 0
CLK_TOGGLE
Text GLabel 5400 2050 2    50   BiDi ~ 0
IO15
Text GLabel 5400 1950 2    50   Output ~ 0
RDY
Wire Wire Line
	5300 1950 5400 1950
Wire Wire Line
	5300 2050 5400 2050
Wire Wire Line
	5300 2150 5400 2150
Wire Wire Line
	5300 2250 5400 2250
Wire Wire Line
	5300 2350 5400 2350
$Sheet
S 9850 6000 750  350 
U 6014B4D9
F0 "ports" 50
F1 "ports.sch" 50
$EndSheet
$Comp
L 74xx:74LS138 U5
U 1 1 5F9A1F2C
P 7250 1600
F 0 "U5" H 7250 1600 50  0000 C CNN
F 1 "74AC138" H 7150 1500 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 7250 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 7250 1600 50  0001 C CNN
	1    7250 1600
	1    0    0    -1  
$EndComp
$Comp
L 6502:65C02S U3
U 1 1 5F5A65C1
P 2400 2150
F 0 "U3" H 2400 3315 50  0000 C CNN
F 1 "65C02S" H 2400 3224 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 2400 3200 50  0001 C CNN
F 3 "" H 2250 3100 50  0001 C CNN
	1    2400 2150
	1    0    0    -1  
$EndComp
Wire Bus Line
	3200 2750 3300 2750
$Sheet
S 6950 6000 700  350 
U 5F8F4E1E
F0 "supervisor" 50
F1 "supervisor.sch" 50
$EndSheet
Text GLabel 6650 1800 0    50   Input ~ 0
IOCS
$Comp
L 74xx:74LS08 U?
U 2 1 5FDA6F78
P 9900 1900
AR Path="/5F8F4E1E/5FDA6F78" Ref="U?"  Part="2" 
AR Path="/5FDA6F78" Ref="U6"  Part="2" 
F 0 "U6" H 9900 2225 50  0000 C CNN
F 1 "74AC08" H 9900 2134 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 9900 1900 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 9900 1900 50  0001 C CNN
	2    9900 1900
	1    0    0    -1  
$EndComp
Text GLabel 9500 1800 0    50   Input ~ 0
DBG_RDY
Wire Wire Line
	9500 1800 9600 1800
Text GLabel 10300 1900 2    50   Output ~ 0
6502_RDY
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
Text GLabel 5400 950  1    50   Input ~ 0
+5V
$Comp
L Device:C_Small C4
U 1 1 600EDE42
P 5200 1050
F 0 "C4" V 4971 1050 50  0000 C CNN
F 1 "0,1uF" V 5062 1050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5200 1050 50  0001 C CNN
F 3 "~" H 5200 1050 50  0001 C CNN
	1    5200 1050
	0    1    1    0   
$EndComp
Text GLabel 5000 1050 0    50   Input ~ 0
GND
Wire Wire Line
	5000 1050 5100 1050
Wire Wire Line
	5300 1050 5400 1050
Connection ~ 5400 1050
Wire Wire Line
	5400 1050 5400 950 
$Comp
L Device:C_Small C5
U 1 1 60156577
P 7050 950
F 0 "C5" V 6821 950 50  0000 C CNN
F 1 "0,1uF" V 6912 950 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7050 950 50  0001 C CNN
F 3 "~" H 7050 950 50  0001 C CNN
	1    7050 950 
	0    1    1    0   
$EndComp
Text GLabel 6850 950  0    50   Input ~ 0
GND
Wire Wire Line
	6850 950  6950 950 
Wire Wire Line
	7150 950  7250 950 
Connection ~ 7250 950 
Wire Wire Line
	7250 950  7250 1000
$Sheet
S 8850 6000 750  350 
U 5F910E81
F0 "uart" 50
F1 "uart.sch" 50
$EndSheet
$Comp
L 74xx:74LS21 U1
U 1 1 5FB20233
P 9900 1350
F 0 "U1" H 9900 1725 50  0000 C CNN
F 1 "74HC21" H 9900 1634 50  0000 C CNN
F 2 "Package_DIP:DIP-12_W7.62mm_Socket" H 9900 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 9900 1350 50  0001 C CNN
	1    9900 1350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS21 U1
U 2 1 5FB22533
P 9900 2500
F 0 "U1" H 9900 2875 50  0000 C CNN
F 1 "74HC21" H 9900 2784 50  0000 C CNN
F 2 "Package_DIP:DIP-12_W7.62mm_Socket" H 9900 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 9900 2500 50  0001 C CNN
	2    9900 2500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS21 U1
U 3 1 5FB2300D
P 900 6900
F 0 "U1" H 900 6950 50  0000 C CNN
F 1 "74HC21" H 900 6850 50  0000 C CNN
F 2 "Package_DIP:DIP-12_W7.62mm_Socket" H 900 6900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 900 6900 50  0001 C CNN
	3    900  6900
	1    0    0    -1  
$EndComp
Text GLabel 900  6300 1    50   Input ~ 0
+5V
Text GLabel 900  7500 3    50   Input ~ 0
GND
Wire Wire Line
	900  7500 900  7450
Wire Wire Line
	900  6400 900  6350
$Comp
L Device:C_Small C2
U 1 1 5FB8CE95
P 1200 6900
F 0 "C2" H 1292 6946 50  0000 L CNN
F 1 "0,1uF" H 1292 6855 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1200 6900 50  0001 C CNN
F 3 "~" H 1200 6900 50  0001 C CNN
	1    1200 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 6800 1200 6350
Wire Wire Line
	1200 6350 900  6350
Connection ~ 900  6350
Wire Wire Line
	900  6350 900  6300
Wire Wire Line
	900  7450 1200 7450
Wire Wire Line
	1200 7450 1200 7000
Connection ~ 900  7450
Wire Wire Line
	900  7450 900  7400
Text GLabel 9500 1100 1    50   Input ~ 0
~VIA1_IRQ
Wire Wire Line
	9500 1100 9500 1200
Wire Wire Line
	9500 1200 9600 1200
Text GLabel 9350 1100 1    50   Input ~ 0
~VIA2_IRQ
Text GLabel 9200 1100 1    50   Input ~ 0
~UART_IRQ
Text GLabel 9050 1100 1    50   Input ~ 0
~EXT_IRQ
Text GLabel 10300 1350 2    50   Output ~ 0
~IRQ
Wire Wire Line
	10200 1350 10300 1350
Wire Wire Line
	9350 1100 9350 1300
Wire Wire Line
	9350 1300 9600 1300
Wire Wire Line
	9200 1100 9200 1400
Wire Wire Line
	9200 1400 9600 1400
Wire Wire Line
	9050 1100 9050 1500
Wire Wire Line
	9050 1500 9600 1500
$Comp
L Device:R R1
U 1 1 5FC6DB04
P 8700 1150
F 0 "R1" V 8600 1150 50  0000 C CNN
F 1 "4K7" V 8700 1150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8630 1150 50  0001 C CNN
F 3 "~" H 8700 1150 50  0001 C CNN
	1    8700 1150
	1    0    0    -1  
$EndComp
Text GLabel 8700 950  1    50   Input ~ 0
+5V
Wire Wire Line
	8700 950  8700 1000
Wire Wire Line
	8700 1500 9050 1500
Connection ~ 9050 1500
Text GLabel 9500 2350 0    50   Input ~ 0
GND
Text GLabel 9500 2450 0    50   Input ~ 0
GND
Text GLabel 9500 2550 0    50   Input ~ 0
GND
Text GLabel 9500 2650 0    50   Input ~ 0
GND
Wire Wire Line
	9500 2650 9600 2650
Wire Wire Line
	9500 2550 9600 2550
Wire Wire Line
	9500 2450 9600 2450
Wire Wire Line
	9500 2350 9600 2350
NoConn ~ 10200 2500
$Comp
L 74xx:74HC74 U?
U 3 1 5FDF80F5
P 1750 6900
AR Path="/5F8F4E1E/5FDF80F5" Ref="U?"  Part="3" 
AR Path="/5FDF80F5" Ref="U2"  Part="3" 
F 0 "U2" H 1750 6950 50  0000 C CNN
F 1 "74AC74" H 1750 6850 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 1750 6900 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1750 6900 50  0001 C CNN
	3    1750 6900
	1    0    0    -1  
$EndComp
Text GLabel 1750 7400 3    50   Input ~ 0
GND
Wire Wire Line
	1750 7400 1750 7350
Text GLabel 1750 6400 1    50   Input ~ 0
+5V
Wire Wire Line
	1750 6400 1750 6450
$Comp
L Device:C_Small C?
U 1 1 5FDF80FF
P 2100 6900
AR Path="/5F8F4E1E/5FDF80FF" Ref="C?"  Part="1" 
AR Path="/5FDF80FF" Ref="C3"  Part="1" 
F 0 "C3" H 2192 6946 50  0000 L CNN
F 1 "0,1uF" H 2192 6855 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2100 6900 50  0001 C CNN
F 3 "~" H 2100 6900 50  0001 C CNN
	1    2100 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 7350 2100 7350
Wire Wire Line
	2100 7350 2100 7000
Connection ~ 1750 7350
Wire Wire Line
	1750 7350 1750 7300
Wire Wire Line
	2100 6800 2100 6450
Wire Wire Line
	2100 6450 1750 6450
Connection ~ 1750 6450
Wire Wire Line
	1750 6450 1750 6500
$Comp
L Device:R R2
U 1 1 6011A69F
P 8900 1150
F 0 "R2" V 8800 1150 50  0000 C CNN
F 1 "4K7" V 8900 1150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8830 1150 50  0001 C CNN
F 3 "~" H 8900 1150 50  0001 C CNN
	1    8900 1150
	1    0    0    -1  
$EndComp
Text GLabel 8900 950  1    50   Input ~ 0
+5V
Wire Wire Line
	8900 950  8900 1000
Wire Wire Line
	8700 1300 8700 1500
Wire Wire Line
	8900 1300 8900 1400
Wire Wire Line
	8900 1400 9200 1400
Connection ~ 9200 1400
$Sheet
S 7900 6000 700  350 
U 5FEB1407
F0 "memory" 50
F1 "memory.sch" 50
$EndSheet
Text GLabel 4200 1150 1    50   Input ~ 0
6502_CLK
Text Notes 750  5900 0    50   ~ 0
This is main sheet with 6502 CPU, and the following\ncomponents:\n - glue logic PLD (ATF22V10 and 74AC32)\n - I/O address decoder (74AC138)\n - IRQ handler (74HC21)\n - Wait state generator (74AC74 and others)\n\nThe main interactions with other sheets are:\n - Address and Data Busses are shared with all sheets\n - 6502 clock signal is sourced from supervisor sheet\n - Reset signal is sourced from supervisor sheet\n - Bus Enable signal is sourced from supervisor sheet\n - IRQ and NMI signals are soured from uart and io sheets\n - Memory (RAM and ROM) are on the memory sheet\n - All the extra signals are sourced to ports sheet
Wire Wire Line
	10200 1900 10300 1900
Text GLabel 9500 2000 0    50   Input ~ 0
RDY
Wire Wire Line
	9500 2000 9600 2000
$Comp
L 74xx:74HC74 U?
U 2 1 5FA6308B
P 5750 3700
AR Path="/5F8F4E1E/5FA6308B" Ref="U?"  Part="2" 
AR Path="/5FA6308B" Ref="U2"  Part="2" 
F 0 "U2" H 5450 4100 50  0000 C CNN
F 1 "74AC74" H 5450 4000 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5750 3700 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5750 3700 50  0001 C CNN
	2    5750 3700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC74 U?
U 1 1 5FA636F8
P 4750 3700
AR Path="/5F8F4E1E/5FA636F8" Ref="U?"  Part="2" 
AR Path="/5FA636F8" Ref="U2"  Part="1" 
F 0 "U2" H 4450 4100 50  0000 C CNN
F 1 "74AC74" H 4450 4000 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4750 3700 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4750 3700 50  0001 C CNN
	1    4750 3700
	1    0    0    -1  
$EndComp
Text GLabel 4250 4200 0    50   Input ~ 0
6502_CLK
Text GLabel 4550 3150 0    50   Input ~ 0
~6502_RES
Wire Wire Line
	4550 3150 4750 3150
Wire Wire Line
	4750 3150 4750 3400
Wire Wire Line
	4750 3150 5750 3150
Wire Wire Line
	5750 3150 5750 3400
Connection ~ 4750 3150
Text GLabel 4650 4100 0    50   Input ~ 0
+5V
Wire Wire Line
	4650 4100 4750 4100
Wire Wire Line
	4750 4100 4750 4000
Text GLabel 5650 4100 0    50   Input ~ 0
+5V
Wire Wire Line
	5650 4100 5750 4100
Wire Wire Line
	5750 4100 5750 4000
Wire Wire Line
	5050 3600 5200 3600
Wire Wire Line
	4250 4200 4350 4200
Wire Wire Line
	4350 4200 4350 3700
Wire Wire Line
	4350 3700 4450 3700
Wire Wire Line
	4350 4200 5350 4200
Wire Wire Line
	5350 4200 5350 3700
Wire Wire Line
	5350 3700 5450 3700
Connection ~ 4350 4200
Text GLabel 4350 3600 0    50   Input ~ 0
RDY
Wire Wire Line
	4350 3600 4450 3600
Text GLabel 6150 3600 2    50   Output ~ 0
RDY_M2
Wire Wire Line
	6050 3600 6150 3600
Text GLabel 5200 3700 3    50   Output ~ 0
RDY_M1
Wire Wire Line
	5200 3600 5200 3700
NoConn ~ 6050 3800
Connection ~ 5200 3600
Wire Wire Line
	5200 3600 5450 3600
NoConn ~ 5050 3800
Wire Bus Line
	6500 1400 6500 1600
Wire Bus Line
	3200 2850 3200 3550
Wire Bus Line
	3200 2050 3200 2750
Wire Bus Line
	4000 1650 4000 2350
Wire Bus Line
	1600 2150 1600 3400
$EndSCHEMATC
