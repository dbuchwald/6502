EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title "DB6502 Hobby Computer Version 2"
Date "2020-10-13"
Rev "v003"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Open Source Hardware"
Comment4 "Author: Dawid Buchwald"
$EndDescr
$Comp
L Connector:Conn_01x32_Female J2
U 1 1 6014BD0C
P 4700 6200
F 0 "J2" H 4728 6176 50  0000 L CNN
F 1 "System Bus" H 4728 6085 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x32_P2.54mm_Vertical" H 4700 6200 50  0001 C CNN
F 3 "~" H 4700 6200 50  0001 C CNN
	1    4700 6200
	0    -1   -1   0   
$EndComp
Text Label 3200 6600 1    50   ~ 0
a0
Text Label 3300 6600 1    50   ~ 0
a1
Text Label 3400 6600 1    50   ~ 0
a2
Text Label 3500 6600 1    50   ~ 0
a3
Text Label 3600 6600 1    50   ~ 0
a4
Text Label 3700 6600 1    50   ~ 0
a5
Text Label 3800 6600 1    50   ~ 0
a6
Text Label 3900 6600 1    50   ~ 0
a7
Text Label 4000 6600 1    50   ~ 0
a8
Text Label 4100 6600 1    50   ~ 0
a9
Text Label 4200 6600 1    50   ~ 0
a10
Text Label 4300 6600 1    50   ~ 0
a11
Text Label 4400 6600 1    50   ~ 0
a12
Text Label 4500 6600 1    50   ~ 0
a13
Text Label 4600 6600 1    50   ~ 0
a14
Text Label 4700 6600 1    50   ~ 0
a15
Wire Wire Line
	3200 6600 3200 6400
Wire Wire Line
	3300 6600 3300 6400
Wire Wire Line
	3400 6600 3400 6400
Wire Wire Line
	3500 6600 3500 6400
Wire Wire Line
	3600 6600 3600 6400
Wire Wire Line
	3700 6600 3700 6400
Wire Wire Line
	3800 6600 3800 6400
Wire Wire Line
	3900 6600 3900 6400
Wire Wire Line
	4000 6600 4000 6400
Wire Wire Line
	4100 6600 4100 6400
Wire Wire Line
	4200 6600 4200 6400
Wire Wire Line
	4300 6600 4300 6400
Wire Wire Line
	4400 6600 4400 6400
Wire Wire Line
	4500 6600 4500 6400
Wire Wire Line
	4600 6600 4600 6400
Wire Wire Line
	4700 6600 4700 6400
Entry Wire Line
	3100 6700 3200 6600
Entry Wire Line
	3200 6700 3300 6600
Entry Wire Line
	3300 6700 3400 6600
Entry Wire Line
	3400 6700 3500 6600
Entry Wire Line
	3500 6700 3600 6600
Entry Wire Line
	3600 6700 3700 6600
Entry Wire Line
	3700 6700 3800 6600
Entry Wire Line
	3800 6700 3900 6600
Entry Wire Line
	3900 6700 4000 6600
Entry Wire Line
	4000 6700 4100 6600
Entry Wire Line
	4100 6700 4200 6600
Entry Wire Line
	4200 6700 4300 6600
Entry Wire Line
	4300 6700 4400 6600
Entry Wire Line
	4400 6700 4500 6600
Entry Wire Line
	4500 6700 4600 6600
Entry Wire Line
	4600 6700 4700 6600
Text GLabel 4600 6800 3    50   BiDi ~ 0
a[0..15]
Wire Bus Line
	4600 6800 4600 6700
Text Label 4800 6600 1    50   ~ 0
d0
Text Label 4900 6600 1    50   ~ 0
d1
Text Label 5000 6600 1    50   ~ 0
d2
Text Label 5100 6600 1    50   ~ 0
d3
Text Label 5200 6600 1    50   ~ 0
d4
Text Label 5300 6600 1    50   ~ 0
d5
Text Label 5400 6600 1    50   ~ 0
d6
Text Label 5500 6600 1    50   ~ 0
d7
Wire Wire Line
	4800 6600 4800 6400
Wire Wire Line
	4900 6600 4900 6400
Wire Wire Line
	5000 6600 5000 6400
Wire Wire Line
	5100 6600 5100 6400
Wire Wire Line
	5200 6600 5200 6400
Wire Wire Line
	5300 6600 5300 6400
Wire Wire Line
	5400 6600 5400 6400
Wire Wire Line
	5500 6600 5500 6400
Entry Wire Line
	4700 6700 4800 6600
Entry Wire Line
	4800 6700 4900 6600
Entry Wire Line
	4900 6700 5000 6600
Entry Wire Line
	5000 6700 5100 6600
Entry Wire Line
	5100 6700 5200 6600
Entry Wire Line
	5200 6700 5300 6600
Entry Wire Line
	5300 6700 5400 6600
Entry Wire Line
	5400 6700 5500 6600
Text GLabel 5400 6800 3    50   BiDi ~ 0
d[0..7]
Wire Bus Line
	5400 6800 5400 6700
Text Label 2350 4250 0    50   ~ 0
d0
Text Label 2350 4350 0    50   ~ 0
d1
Text Label 2350 4450 0    50   ~ 0
d2
Text Label 2350 4550 0    50   ~ 0
d3
Text Label 2350 4650 0    50   ~ 0
d4
Text Label 2350 4750 0    50   ~ 0
d5
Text Label 2350 4850 0    50   ~ 0
d6
Text Label 2350 4950 0    50   ~ 0
d7
Wire Wire Line
	2350 4250 2650 4250
Wire Wire Line
	2350 4350 2650 4350
Wire Wire Line
	2350 4450 2650 4450
Wire Wire Line
	2350 4550 2650 4550
Wire Wire Line
	2350 4650 2650 4650
Wire Wire Line
	2350 4750 2650 4750
Wire Wire Line
	2350 4850 2650 4850
Wire Wire Line
	2350 4950 2650 4950
Entry Wire Line
	2250 4150 2350 4250
Entry Wire Line
	2250 4250 2350 4350
Entry Wire Line
	2250 4350 2350 4450
Entry Wire Line
	2250 4450 2350 4550
Entry Wire Line
	2250 4550 2350 4650
Entry Wire Line
	2250 4650 2350 4750
Entry Wire Line
	2250 4750 2350 4850
Entry Wire Line
	2250 4850 2350 4950
Text GLabel 4700 1050 1    50   Input ~ 0
SYNC
Text GLabel 4550 1050 1    50   Input ~ 0
~ML
Text GLabel 4400 1050 1    50   Input ~ 0
~VP
Text GLabel 4250 1050 1    50   Output ~ 0
RDY
Wire Wire Line
	2300 950  2300 1050
Text GLabel 2300 950  1    50   Input ~ 0
+5V
$Comp
L Device:R R7
U 1 1 6017257F
P 2300 1200
F 0 "R7" H 2230 1154 50  0000 R CNN
F 1 "4K7" H 2230 1245 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2230 1200 50  0001 C CNN
F 3 "~" H 2300 1200 50  0001 C CNN
	1    2300 1200
	-1   0    0    1   
$EndComp
Text GLabel 4100 1050 1    50   Output ~ 0
BE
Wire Wire Line
	2000 950  2000 1050
Text GLabel 2000 950  1    50   Input ~ 0
+5V
$Comp
L Device:R R6
U 1 1 6017DC7B
P 2000 1200
F 0 "R6" H 2070 1246 50  0000 L CNN
F 1 "4K7" H 2070 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1930 1200 50  0001 C CNN
F 3 "~" H 2000 1200 50  0001 C CNN
	1    2000 1200
	1    0    0    -1  
$EndComp
Text GLabel 3950 1050 1    50   Output ~ 0
~IRQ
Wire Wire Line
	1700 950  1700 1050
Text GLabel 1700 950  1    50   Input ~ 0
+5V
$Comp
L Device:R R5
U 1 1 601857FE
P 1700 1200
F 0 "R5" H 1770 1246 50  0000 L CNN
F 1 "4K7" H 1770 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1630 1200 50  0001 C CNN
F 3 "~" H 1700 1200 50  0001 C CNN
	1    1700 1200
	1    0    0    -1  
$EndComp
Text GLabel 3800 1050 1    50   Output ~ 0
~NMI
Wire Wire Line
	1400 950  1400 1050
Text GLabel 1400 950  1    50   Input ~ 0
+5V
$Comp
L Device:R R4
U 1 1 601898AB
P 1400 1200
F 0 "R4" H 1470 1246 50  0000 L CNN
F 1 "4K7" H 1470 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1330 1200 50  0001 C CNN
F 3 "~" H 1400 1200 50  0001 C CNN
	1    1400 1200
	1    0    0    -1  
$EndComp
Text GLabel 3650 1050 1    50   Output ~ 0
~SO
Text GLabel 3350 1050 1    50   Output ~ 0
6502_CLK
Text GLabel 3200 1050 1    50   Output ~ 0
R~W
Wire Wire Line
	1100 950  1100 1050
Text GLabel 1100 950  1    50   Input ~ 0
+5V
$Comp
L Device:R R3
U 1 1 601C227D
P 1100 1200
F 0 "R3" H 1170 1246 50  0000 L CNN
F 1 "4K7" H 1170 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1030 1200 50  0001 C CNN
F 3 "~" H 1100 1200 50  0001 C CNN
	1    1100 1200
	1    0    0    -1  
$EndComp
Text GLabel 3500 1050 1    50   Output ~ 0
~6502_RES
Wire Wire Line
	1100 1350 1100 1950
Wire Wire Line
	1400 1350 1400 1850
Wire Wire Line
	1700 1350 1700 1750
Wire Wire Line
	2000 1350 2000 1650
Wire Wire Line
	2300 1350 2300 1550
Wire Wire Line
	3500 2050 4950 2050
Wire Wire Line
	3500 1050 3500 2050
Connection ~ 3650 1950
Wire Wire Line
	3650 1950 4950 1950
Wire Wire Line
	3650 1050 3650 1950
Wire Wire Line
	2300 1550 4250 1550
Wire Wire Line
	3800 1850 4950 1850
Connection ~ 3800 1850
Wire Wire Line
	1400 1850 3800 1850
Wire Wire Line
	3800 1050 3800 1850
Connection ~ 3950 1750
Wire Wire Line
	1700 1750 3950 1750
Wire Wire Line
	3950 1750 4950 1750
Wire Wire Line
	3950 1050 3950 1750
Connection ~ 4100 1650
Wire Wire Line
	2000 1650 4100 1650
Wire Wire Line
	4100 1650 4950 1650
Wire Wire Line
	4100 1050 4100 1650
Wire Wire Line
	4250 1550 4950 1550
Connection ~ 4250 1550
Wire Wire Line
	4250 1050 4250 1550
Wire Wire Line
	4400 1450 4950 1450
Wire Wire Line
	4400 1050 4400 1450
Wire Wire Line
	4550 1350 4950 1350
Wire Wire Line
	4550 1050 4550 1350
Wire Wire Line
	4700 1250 4700 1050
Wire Wire Line
	4700 1250 4950 1250
$Comp
L Connector:Conn_01x32_Female J3
U 1 1 60166003
P 5150 2650
F 0 "J3" H 5178 2626 50  0000 L CNN
F 1 "Controls" H 5178 2535 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x32_P2.54mm_Vertical" H 5150 2650 50  0001 C CNN
F 3 "~" H 5150 2650 50  0001 C CNN
	1    5150 2650
	1    0    0    -1  
$EndComp
Text GLabel 4850 1050 1    50   Input ~ 0
~RES
Wire Wire Line
	4850 1050 4850 1150
Wire Wire Line
	4850 1150 4950 1150
Wire Wire Line
	1100 1950 3650 1950
Wire Wire Line
	800  950  800  1050
Text GLabel 800  950  1    50   Input ~ 0
+5V
$Comp
L Device:R R2
U 1 1 601F1941
P 800 1200
F 0 "R2" H 870 1246 50  0000 L CNN
F 1 "4K7" H 870 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 730 1200 50  0001 C CNN
F 3 "~" H 800 1200 50  0001 C CNN
	1    800  1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  2050 3500 2050
Wire Wire Line
	800  1350 800  2050
Connection ~ 3500 2050
Wire Wire Line
	3350 1050 3350 2150
Wire Wire Line
	3350 2150 4950 2150
Wire Wire Line
	3200 1050 3200 2250
Wire Wire Line
	3200 2250 4950 2250
$Comp
L Connector:Conn_01x32_Female J1
U 1 1 60200164
P 2850 5250
F 0 "J1" H 2878 5226 50  0000 L CNN
F 1 "I/O Bus" H 2878 5135 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x32_P2.54mm_Vertical" H 2850 5250 50  0001 C CNN
F 3 "~" H 2850 5250 50  0001 C CNN
	1    2850 5250
	1    0    0    -1  
$EndComp
Text Label 2500 3750 0    50   ~ 0
a0
Text Label 2500 3850 0    50   ~ 0
a1
Text Label 2500 3950 0    50   ~ 0
a2
Text Label 2500 4050 0    50   ~ 0
a3
Text Label 2500 4150 0    50   ~ 0
a4
Wire Wire Line
	2500 4150 2650 4150
Wire Wire Line
	2500 4050 2650 4050
Wire Wire Line
	2500 3950 2650 3950
Wire Wire Line
	2500 3850 2650 3850
Wire Wire Line
	2500 3750 2650 3750
Entry Wire Line
	2400 3650 2500 3750
Entry Wire Line
	2400 3750 2500 3850
Entry Wire Line
	2400 3850 2500 3950
Entry Wire Line
	2400 3950 2500 4050
Entry Wire Line
	2400 4050 2500 4150
Text GLabel 2000 4950 1    50   Input ~ 0
~LATCH
Text GLabel 1850 4950 1    50   Input ~ 0
~VIA1
Text GLabel 1700 4950 1    50   Input ~ 0
~VIA2
Text GLabel 1550 4950 1    50   Input ~ 0
~UART
Text GLabel 1400 4950 1    50   Input ~ 0
~IOCS0
Text GLabel 1250 4950 1    50   Input ~ 0
~IOCS1
Text GLabel 1100 4950 1    50   Input ~ 0
~IOCS2
Text GLabel 950  4950 1    50   Input ~ 0
~IOCS3
Wire Wire Line
	2000 4950 2000 5150
Wire Wire Line
	2000 5150 2650 5150
Wire Wire Line
	1850 4950 1850 5250
Wire Wire Line
	1850 5250 2650 5250
Wire Wire Line
	1700 4950 1700 5350
Wire Wire Line
	1700 5350 2650 5350
Wire Wire Line
	1550 4950 1550 5450
Wire Wire Line
	1550 5450 2650 5450
Wire Wire Line
	1400 4950 1400 5550
Wire Wire Line
	1400 5550 2650 5550
Wire Wire Line
	1250 4950 1250 5650
Wire Wire Line
	1250 5650 2650 5650
Wire Wire Line
	1100 4950 1100 5750
Wire Wire Line
	1100 5750 2650 5750
Wire Wire Line
	950  4950 950  5850
Wire Wire Line
	950  5850 2650 5850
Text GLabel 2150 4950 1    50   Input ~ 0
IOCS
Wire Wire Line
	2150 4950 2150 5050
Wire Wire Line
	2150 5050 2650 5050
Text GLabel 800  4950 1    50   Input ~ 0
~OE
Text GLabel 650  4950 1    50   Input ~ 0
~WE
Wire Wire Line
	650  4950 650  6050
Wire Wire Line
	650  6050 2650 6050
Wire Wire Line
	800  4950 800  5950
Wire Wire Line
	800  5950 2650 5950
Text GLabel 3050 1050 1    50   Output ~ 0
EXRAM
Wire Wire Line
	3050 1050 3050 2350
Wire Wire Line
	3050 2350 4950 2350
Text GLabel 2900 1050 1    50   Input ~ 0
SR_DAT
Text GLabel 2750 1050 1    50   Input ~ 0
SR_CLK
Text GLabel 2600 1050 1    50   Input ~ 0
SR_OUT
Wire Wire Line
	2900 1050 2900 2450
Wire Wire Line
	2900 2450 4950 2450
Wire Wire Line
	2750 1050 2750 2550
Wire Wire Line
	2750 2550 4950 2550
Wire Wire Line
	2600 1050 2600 2650
Wire Wire Line
	2600 2650 4950 2650
$Comp
L Device:R R8
U 1 1 604F21BB
P 2300 2600
F 0 "R8" H 2230 2554 50  0000 R CNN
F 1 "4K7" H 2230 2645 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2230 2600 50  0001 C CNN
F 3 "~" H 2300 2600 50  0001 C CNN
	1    2300 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 2450 2300 2350
Wire Wire Line
	2300 2350 3050 2350
Connection ~ 3050 2350
Text GLabel 2300 2850 3    50   Input ~ 0
GND
Wire Wire Line
	2300 2850 2300 2750
Text GLabel 6400 6950 2    50   Input ~ 0
~OE
Text GLabel 6400 6800 2    50   Input ~ 0
~WE
Wire Wire Line
	6400 6950 6000 6950
Wire Wire Line
	6000 6950 6000 6400
Wire Wire Line
	6400 6800 6100 6800
Wire Wire Line
	6100 6800 6100 6400
Text GLabel 6400 6650 2    50   Input ~ 0
+5V
Text GLabel 6400 6500 2    50   Input ~ 0
GND
Wire Wire Line
	6400 6500 6300 6500
Wire Wire Line
	6300 6500 6300 6400
Wire Wire Line
	6200 6650 6200 6400
Wire Wire Line
	6200 6650 6400 6650
Text GLabel 2550 6850 0    50   Input ~ 0
GND
Text GLabel 2550 6750 0    50   Input ~ 0
+5V
Wire Wire Line
	2550 6750 2650 6750
Wire Wire Line
	2550 6850 2650 6850
Text GLabel 6400 7100 2    50   Input ~ 0
6502_CLK
Wire Wire Line
	6400 7100 5900 7100
Wire Wire Line
	5900 7100 5900 6400
Text GLabel 6400 7250 2    50   Input ~ 0
R~W
Wire Wire Line
	6400 7250 5800 7250
Wire Wire Line
	5800 7250 5800 6400
Text GLabel 6400 7400 2    50   Input ~ 0
~6502_RES
Wire Wire Line
	6400 7400 5700 7400
Wire Wire Line
	5700 7400 5700 6400
Text GLabel 950  6850 3    50   Input ~ 0
CLK
Wire Wire Line
	950  6850 950  6350
Wire Wire Line
	950  6350 2650 6350
Text GLabel 800  6850 3    50   Input ~ 0
R~W
Wire Wire Line
	800  6850 800  6250
Wire Wire Line
	800  6250 2650 6250
Text GLabel 650  6850 3    50   Input ~ 0
~6502_RES
Wire Wire Line
	650  6850 650  6150
Wire Wire Line
	650  6150 2650 6150
Text GLabel 6400 7550 2    50   Input ~ 0
SYNC
Wire Wire Line
	6400 7550 5600 7550
Wire Wire Line
	5600 7550 5600 6400
Text GLabel 4850 2750 0    50   Input ~ 0
DBG_CLK
Wire Wire Line
	4850 2750 4950 2750
Text GLabel 4850 2850 0    50   Output ~ 0
IN12
Text GLabel 4850 2950 0    50   Input ~ 0
IO13
Text GLabel 4850 3050 0    50   Input ~ 0
IO14
Text GLabel 4850 3150 0    50   Input ~ 0
IO15
Text GLabel 4850 3250 0    50   Input ~ 0
IO16
Wire Wire Line
	4850 2850 4950 2850
Wire Wire Line
	4850 2950 4950 2950
Wire Wire Line
	4850 3050 4950 3050
Wire Wire Line
	4850 3150 4950 3150
Wire Wire Line
	4850 3250 4950 3250
Text Label 4450 3350 0    50   ~ 0
d0
Text Label 4450 3450 0    50   ~ 0
d1
Text Label 4450 3550 0    50   ~ 0
d2
Text Label 4450 3650 0    50   ~ 0
d3
Text Label 4450 3750 0    50   ~ 0
d4
Text Label 4450 3850 0    50   ~ 0
d5
Text Label 4450 3950 0    50   ~ 0
d6
Text Label 4450 4050 0    50   ~ 0
d7
Wire Wire Line
	4450 3350 4950 3350
Wire Wire Line
	4450 3450 4950 3450
Wire Wire Line
	4450 3550 4950 3550
Wire Wire Line
	4450 3650 4950 3650
Wire Wire Line
	4450 3750 4950 3750
Wire Wire Line
	4450 3850 4950 3850
Wire Wire Line
	4450 3950 4950 3950
Wire Wire Line
	4450 4050 4950 4050
Entry Wire Line
	4350 3250 4450 3350
Entry Wire Line
	4350 3350 4450 3450
Entry Wire Line
	4350 3450 4450 3550
Entry Wire Line
	4350 3550 4450 3650
Entry Wire Line
	4350 3650 4450 3750
Entry Wire Line
	4350 3750 4450 3850
Entry Wire Line
	4350 3850 4450 3950
Entry Wire Line
	4350 3950 4450 4050
Text GLabel 4850 4250 0    50   Input ~ 0
GND
Text GLabel 4850 4150 0    50   Input ~ 0
+5V
Wire Wire Line
	4850 4150 4950 4150
Wire Wire Line
	4850 4250 4950 4250
Text GLabel 1100 6850 3    50   Input ~ 0
RAM1_~CS
Wire Wire Line
	1100 6850 1100 6450
Wire Wire Line
	1100 6450 2650 6450
Text GLabel 1250 6850 3    50   Input ~ 0
RAM2_~CS
Text GLabel 1400 6850 3    50   Input ~ 0
ROM_~CS
Wire Wire Line
	1250 6850 1250 6550
Wire Wire Line
	1250 6550 2650 6550
Wire Wire Line
	1400 6850 1400 6650
Wire Wire Line
	1400 6650 2650 6650
$Comp
L Device:R R9
U 1 1 60B17A68
P 5650 1300
F 0 "R9" H 5720 1346 50  0000 L CNN
F 1 "220" H 5720 1255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5580 1300 50  0001 C CNN
F 3 "~" H 5650 1300 50  0001 C CNN
	1    5650 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 60B19002
P 5650 1700
F 0 "D1" V 5689 1582 50  0000 R CNN
F 1 "PWR" V 5598 1582 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 5650 1700 50  0001 C CNN
F 3 "~" H 5650 1700 50  0001 C CNN
	1    5650 1700
	0    -1   -1   0   
$EndComp
Text GLabel 5650 1050 1    50   Input ~ 0
+5V
Wire Wire Line
	5650 1050 5650 1150
Wire Wire Line
	5650 1450 5650 1550
Text GLabel 5650 1950 3    50   Input ~ 0
GND
Wire Wire Line
	5650 1950 5650 1850
Wire Bus Line
	2400 3650 2400 4050
Wire Bus Line
	4700 6700 5400 6700
Wire Bus Line
	2250 4150 2250 4850
Wire Bus Line
	4350 3250 4350 3950
Wire Bus Line
	3100 6700 4600 6700
$EndSCHEMATC
