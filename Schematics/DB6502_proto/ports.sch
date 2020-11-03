EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "DB6502 Hobby Computer Version 2"
Date "2020-10-30"
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
L Device:R R8
U 1 1 6017257F
P 2300 1200
F 0 "R8" H 2230 1154 50  0000 R CNN
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
L Device:R R7
U 1 1 6017DC7B
P 2000 1200
F 0 "R7" H 2070 1246 50  0000 L CNN
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
L Device:R R6
U 1 1 601857FE
P 1700 1200
F 0 "R6" H 1770 1246 50  0000 L CNN
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
L Device:R R5
U 1 1 601898AB
P 1400 1200
F 0 "R5" H 1470 1246 50  0000 L CNN
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
L Device:R R4
U 1 1 601C227D
P 1100 1200
F 0 "R4" H 1170 1246 50  0000 L CNN
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
L Device:R R3
U 1 1 601F1941
P 800 1200
F 0 "R3" H 870 1246 50  0000 L CNN
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
L Device:R R9
U 1 1 604F21BB
P 2300 2600
F 0 "R9" H 2230 2554 50  0000 R CNN
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
L Device:R R16
U 1 1 60B17A68
P 10800 1000
F 0 "R16" H 10870 1046 50  0000 L CNN
F 1 "220" H 10870 955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10730 1000 50  0001 C CNN
F 3 "~" H 10800 1000 50  0001 C CNN
	1    10800 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 60B19002
P 10800 1400
F 0 "D1" V 10839 1282 50  0000 R CNN
F 1 "PWR" V 10748 1282 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 10800 1400 50  0001 C CNN
F 3 "~" H 10800 1400 50  0001 C CNN
	1    10800 1400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10800 750  10800 850 
Wire Wire Line
	10800 1150 10800 1250
Wire Wire Line
	10800 1650 10800 1550
$Comp
L power:+5V #PWR?
U 1 1 60061B56
P 10250 750
AR Path="/60061B56" Ref="#PWR?"  Part="1" 
AR Path="/6014B4D9/60061B56" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 10250 600 50  0001 C CNN
F 1 "+5V" H 10265 923 50  0000 C CNN
F 2 "" H 10250 750 50  0001 C CNN
F 3 "" H 10250 750 50  0001 C CNN
	1    10250 750 
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60061B5C
P 10250 1650
AR Path="/60061B5C" Ref="#PWR?"  Part="1" 
AR Path="/6014B4D9/60061B5C" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 10250 1400 50  0001 C CNN
F 1 "GND" H 10255 1477 50  0000 C CNN
F 2 "" H 10250 1650 50  0001 C CNN
F 3 "" H 10250 1650 50  0001 C CNN
	1    10250 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	10350 1350 10350 1450
Connection ~ 10350 1450
Connection ~ 10350 950 
Wire Wire Line
	10350 950  10350 1050
Text GLabel 10250 950  0    50   Output ~ 0
+5V
Text GLabel 10250 1450 0    50   Output ~ 0
GND
Wire Wire Line
	10250 1450 10350 1450
Wire Wire Line
	10250 950  10350 950 
$Comp
L Device:CP C?
U 1 1 60061B6C
P 10350 1200
AR Path="/60061B6C" Ref="C?"  Part="1" 
AR Path="/6014B4D9/60061B6C" Ref="C15"  Part="1" 
F 0 "C15" H 10468 1246 50  0000 L CNN
F 1 "10uF" H 10468 1155 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 10388 1050 50  0001 C CNN
F 3 "~" H 10350 1200 50  0001 C CNN
	1    10350 1200
	1    0    0    -1  
$EndComp
$Comp
L 6502:USB_B J6
U 1 1 600837D4
P 8750 2600
AR Path="/6014B4D9/600837D4" Ref="J6"  Part="1" 
AR Path="/5F8F4E1E/600837D4" Ref="J?"  Part="1" 
F 0 "J6" H 8807 3067 50  0000 C CNN
F 1 "USB Debug" H 8807 2976 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 8900 2550 50  0001 C CNN
F 3 "" H 8900 2550 50  0001 C CNN
	1    8750 2600
	1    0    0    -1  
$EndComp
NoConn ~ 8650 3000
Text GLabel 8750 3200 3    50   Input ~ 0
GND
$Comp
L Device:Ferrite_Bead_Small FB1
U 1 1 600837DC
P 9600 2400
AR Path="/6014B4D9/600837DC" Ref="FB1"  Part="1" 
AR Path="/5F8F4E1E/600837DC" Ref="FB?"  Part="1" 
F 0 "FB1" V 9363 2400 50  0000 C CNN
F 1 "FB" V 9454 2400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9530 2400 50  0001 C CNN
F 3 "~" H 9600 2400 50  0001 C CNN
	1    9600 2400
	0    1    1    0   
$EndComp
Text GLabel 10550 2400 2    50   Input ~ 0
+5V
Wire Wire Line
	9050 2400 9250 2400
Wire Wire Line
	9050 2700 9150 2700
Text GLabel 10550 2850 2    50   BiDi ~ 0
DBG_USBD-
Text GLabel 10550 2600 2    50   BiDi ~ 0
DBG_USBD+
$Comp
L Device:R R11
U 1 1 600837E7
P 10300 2850
AR Path="/6014B4D9/600837E7" Ref="R11"  Part="1" 
AR Path="/5F8F4E1E/600837E7" Ref="R?"  Part="1" 
F 0 "R11" V 10400 2850 50  0000 C CNN
F 1 "27" V 10300 2850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10230 2850 50  0001 C CNN
F 3 "~" H 10300 2850 50  0001 C CNN
	1    10300 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R10
U 1 1 600837ED
P 10300 2600
AR Path="/6014B4D9/600837ED" Ref="R10"  Part="1" 
AR Path="/5F8F4E1E/600837ED" Ref="R?"  Part="1" 
F 0 "R10" V 10400 2600 50  0000 C CNN
F 1 "27" V 10300 2600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10230 2600 50  0001 C CNN
F 3 "~" H 10300 2600 50  0001 C CNN
	1    10300 2600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10450 2850 10550 2850
Wire Wire Line
	10450 2600 10550 2600
Wire Wire Line
	9150 2700 9150 2850
$Comp
L Device:C_Small C9
U 1 1 600837F6
P 9600 3050
AR Path="/6014B4D9/600837F6" Ref="C9"  Part="1" 
AR Path="/5F8F4E1E/600837F6" Ref="C?"  Part="1" 
F 0 "C9" H 9692 3096 50  0000 L CNN
F 1 "47pF" H 9692 3005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9600 3050 50  0001 C CNN
F 3 "~" H 9600 3050 50  0001 C CNN
	1    9600 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 600837FC
P 9950 3050
AR Path="/6014B4D9/600837FC" Ref="C12"  Part="1" 
AR Path="/5F8F4E1E/600837FC" Ref="C?"  Part="1" 
F 0 "C12" H 10042 3096 50  0000 L CNN
F 1 "47pF" H 10042 3005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9950 3050 50  0001 C CNN
F 3 "~" H 9950 3050 50  0001 C CNN
	1    9950 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 2600 9600 2600
Wire Wire Line
	9150 2850 9950 2850
Text GLabel 9600 3250 3    50   Input ~ 0
GND
Text GLabel 9950 3250 3    50   Input ~ 0
GND
Wire Wire Line
	9600 2950 9600 2600
Connection ~ 9600 2600
Wire Wire Line
	9600 2600 10150 2600
Wire Wire Line
	9600 3150 9600 3250
Wire Wire Line
	9950 3250 9950 3150
Wire Wire Line
	9950 2950 9950 2850
Connection ~ 9950 2850
Wire Wire Line
	9950 2850 10150 2850
$Comp
L Device:C_Small C6
U 1 1 6008380E
P 9250 3050
AR Path="/6014B4D9/6008380E" Ref="C6"  Part="1" 
AR Path="/5F8F4E1E/6008380E" Ref="C?"  Part="1" 
F 0 "C6" H 9342 3096 50  0000 L CNN
F 1 "10nF" H 9342 3005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9250 3050 50  0001 C CNN
F 3 "~" H 9250 3050 50  0001 C CNN
	1    9250 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2950 9250 2400
Connection ~ 9250 2400
Wire Wire Line
	9250 2400 9500 2400
Text GLabel 9250 3250 3    50   Input ~ 0
GND
Wire Wire Line
	9250 3250 9250 3150
Wire Wire Line
	8750 3000 8750 3200
Wire Wire Line
	9700 2400 10550 2400
$Comp
L Jumper:Jumper_2_Open JP?
U 1 1 6008381B
P 7150 3450
AR Path="/5F8F4E1E/6008381B" Ref="JP?"  Part="1" 
AR Path="/6014B4D9/6008381B" Ref="JP3"  Part="1" 
F 0 "JP3" H 7150 3685 50  0000 C CNN
F 1 "DBG RxD Source" H 7150 3594 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 7150 3450 50  0001 C CNN
F 3 "~" H 7150 3450 50  0001 C CNN
	1    7150 3450
	1    0    0    -1  
$EndComp
Text GLabel 6850 3450 0    50   Input ~ 0
DBG_USB_RxD
Text GLabel 7450 3450 2    50   Output ~ 0
DBG_RxD
Wire Wire Line
	6850 3450 6950 3450
Wire Wire Line
	7350 3450 7450 3450
$Comp
L Connector:Conn_01x06_Male J9
U 1 1 6009D58F
P 9050 1250
AR Path="/6014B4D9/6009D58F" Ref="J9"  Part="1" 
AR Path="/5F8F4E1E/6009D58F" Ref="J?"  Part="1" 
F 0 "J9" H 9150 1700 50  0000 C CNN
F 1 "Debug UART" H 9150 1600 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 9050 1250 50  0001 C CNN
F 3 "~" H 9050 1250 50  0001 C CNN
	1    9050 1250
	1    0    0    -1  
$EndComp
Text GLabel 9350 1050 2    50   Input ~ 0
GND
Wire Wire Line
	9350 1050 9300 1050
Wire Wire Line
	9250 1150 9300 1150
Wire Wire Line
	9300 1150 9300 1050
Connection ~ 9300 1050
Wire Wire Line
	9300 1050 9250 1050
Text GLabel 9350 1250 2    50   Input ~ 0
+5V
Wire Wire Line
	9350 1250 9250 1250
NoConn ~ 9250 1550
Text GLabel 9350 1350 2    50   Output ~ 0
DBG_RxD
Wire Wire Line
	9350 1350 9250 1350
Text GLabel 9350 1450 2    50   Input ~ 0
DBG_TxD
Wire Wire Line
	9350 1450 9250 1450
$Comp
L Jumper:Jumper_3_Open JP?
U 1 1 600BD263
P 7150 2150
AR Path="/5F910E81/600BD263" Ref="JP?"  Part="1" 
AR Path="/6014B4D9/600BD263" Ref="JP1"  Part="1" 
F 0 "JP1" H 7150 2387 50  0000 C CNN
F 1 "Serial A ~CTS~ Source" H 7150 2289 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7150 2150 50  0001 C CNN
F 3 "~" H 7150 2150 50  0001 C CNN
	1    7150 2150
	1    0    0    -1  
$EndComp
Text GLabel 7050 2400 0    50   Output ~ 0
UART_A_~CTS
Wire Wire Line
	7150 2300 7150 2400
Wire Wire Line
	7050 2400 7150 2400
Text GLabel 6800 2150 0    50   Input ~ 0
UART_A_~CTS~_USB
Wire Wire Line
	6800 2150 6900 2150
Text GLabel 7500 2150 2    50   Input ~ 0
UART_A_~CTS~_232
Wire Wire Line
	7400 2150 7500 2150
$Comp
L Jumper:Jumper_3_Open JP?
U 1 1 600BD270
P 7150 2800
AR Path="/5F910E81/600BD270" Ref="JP?"  Part="1" 
AR Path="/6014B4D9/600BD270" Ref="JP2"  Part="1" 
F 0 "JP2" H 7150 3024 50  0000 C CNN
F 1 "Serial A RxD Source" H 7150 2933 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7150 2800 50  0001 C CNN
F 3 "~" H 7150 2800 50  0001 C CNN
	1    7150 2800
	1    0    0    -1  
$EndComp
Text GLabel 7050 3050 0    50   Output ~ 0
UART_A_RxD
Wire Wire Line
	7150 2950 7150 3050
Wire Wire Line
	7050 3050 7150 3050
Text GLabel 6800 2800 0    50   Input ~ 0
UART_A_RxD_USB
Wire Wire Line
	6800 2800 6900 2800
Text GLabel 7500 2800 2    50   Input ~ 0
UART_A_RxD_232
Wire Wire Line
	7400 2800 7500 2800
$Comp
L Jumper:Jumper_2_Open JP?
U 1 1 600E7866
P 7150 3850
AR Path="/5F910E81/600E7866" Ref="JP?"  Part="1" 
AR Path="/6014B4D9/600E7866" Ref="JP4"  Part="1" 
F 0 "JP4" H 7150 4097 50  0000 C CNN
F 1 "Serial B ~CTS~ Source" H 7150 3999 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7150 3850 50  0001 C CNN
F 3 "~" H 7150 3850 50  0001 C CNN
	1    7150 3850
	1    0    0    -1  
$EndComp
Text GLabel 7450 3850 2    50   Output ~ 0
UART_B_~CTS
Wire Wire Line
	7350 3850 7450 3850
Text GLabel 6850 3850 0    50   Input ~ 0
UART_B_~CTS~_USB
Wire Wire Line
	6850 3850 6950 3850
$Comp
L Jumper:Jumper_2_Open JP?
U 1 1 600E7870
P 7150 4250
AR Path="/5F910E81/600E7870" Ref="JP?"  Part="1" 
AR Path="/6014B4D9/600E7870" Ref="JP5"  Part="1" 
F 0 "JP5" H 7150 4485 50  0000 C CNN
F 1 "Serial B RxD Source" H 7150 4394 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7150 4250 50  0001 C CNN
F 3 "~" H 7150 4250 50  0001 C CNN
	1    7150 4250
	1    0    0    -1  
$EndComp
Text GLabel 7450 4250 2    50   Output ~ 0
UART_B_RxD
Wire Wire Line
	7350 4250 7450 4250
Text GLabel 6850 4250 0    50   Input ~ 0
UART_B_RxD_USB
Wire Wire Line
	6850 4250 6950 4250
$Comp
L 6502:USB_B J8
U 1 1 6013434C
P 8750 5400
AR Path="/6014B4D9/6013434C" Ref="J8"  Part="1" 
AR Path="/5F8F4E1E/6013434C" Ref="J?"  Part="1" 
AR Path="/5F910E81/6013434C" Ref="J?"  Part="1" 
F 0 "J8" H 8807 5867 50  0000 C CNN
F 1 "USB B" H 8807 5776 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 8900 5350 50  0001 C CNN
F 3 "" H 8900 5350 50  0001 C CNN
	1    8750 5400
	1    0    0    -1  
$EndComp
NoConn ~ 8650 5800
Text GLabel 8750 6050 3    50   Input ~ 0
GND
$Comp
L Device:Ferrite_Bead_Small FB3
U 1 1 60134354
P 9600 5200
AR Path="/6014B4D9/60134354" Ref="FB3"  Part="1" 
AR Path="/5F8F4E1E/60134354" Ref="FB?"  Part="1" 
AR Path="/5F910E81/60134354" Ref="FB?"  Part="1" 
F 0 "FB3" V 9363 5200 50  0000 C CNN
F 1 "FB" V 9454 5200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9530 5200 50  0001 C CNN
F 3 "~" H 9600 5200 50  0001 C CNN
	1    9600 5200
	0    1    1    0   
$EndComp
Text GLabel 10550 5200 2    50   Input ~ 0
+5V
Wire Wire Line
	9050 5200 9250 5200
Wire Wire Line
	9050 5500 9150 5500
Text GLabel 10550 5650 2    50   BiDi ~ 0
UART_B_USBD-
Text GLabel 10550 5400 2    50   BiDi ~ 0
UART_B_USBD+
$Comp
L Device:R R15
U 1 1 6013435F
P 10300 5650
AR Path="/6014B4D9/6013435F" Ref="R15"  Part="1" 
AR Path="/5F8F4E1E/6013435F" Ref="R?"  Part="1" 
AR Path="/5F910E81/6013435F" Ref="R?"  Part="1" 
F 0 "R15" V 10400 5650 50  0000 C CNN
F 1 "27" V 10300 5650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10230 5650 50  0001 C CNN
F 3 "~" H 10300 5650 50  0001 C CNN
	1    10300 5650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R14
U 1 1 60134365
P 10300 5400
AR Path="/6014B4D9/60134365" Ref="R14"  Part="1" 
AR Path="/5F8F4E1E/60134365" Ref="R?"  Part="1" 
AR Path="/5F910E81/60134365" Ref="R?"  Part="1" 
F 0 "R14" V 10400 5400 50  0000 C CNN
F 1 "27" V 10300 5400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10230 5400 50  0001 C CNN
F 3 "~" H 10300 5400 50  0001 C CNN
	1    10300 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10450 5650 10550 5650
Wire Wire Line
	10450 5400 10550 5400
Wire Wire Line
	9150 5500 9150 5650
$Comp
L Device:C_Small C11
U 1 1 6013436E
P 9600 5850
AR Path="/6014B4D9/6013436E" Ref="C11"  Part="1" 
AR Path="/5F8F4E1E/6013436E" Ref="C?"  Part="1" 
AR Path="/5F910E81/6013436E" Ref="C?"  Part="1" 
F 0 "C11" H 9692 5896 50  0000 L CNN
F 1 "47pF" H 9692 5805 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9600 5850 50  0001 C CNN
F 3 "~" H 9600 5850 50  0001 C CNN
	1    9600 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 60134374
P 9950 5850
AR Path="/6014B4D9/60134374" Ref="C14"  Part="1" 
AR Path="/5F8F4E1E/60134374" Ref="C?"  Part="1" 
AR Path="/5F910E81/60134374" Ref="C?"  Part="1" 
F 0 "C14" H 10042 5896 50  0000 L CNN
F 1 "47pF" H 10042 5805 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9950 5850 50  0001 C CNN
F 3 "~" H 9950 5850 50  0001 C CNN
	1    9950 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 5400 9600 5400
Wire Wire Line
	9150 5650 9950 5650
Text GLabel 9600 6050 3    50   Input ~ 0
GND
Text GLabel 9950 6050 3    50   Input ~ 0
GND
Wire Wire Line
	9600 5750 9600 5400
Connection ~ 9600 5400
Wire Wire Line
	9600 5400 10150 5400
Wire Wire Line
	9600 5950 9600 6050
Wire Wire Line
	9950 6050 9950 5950
Wire Wire Line
	9950 5750 9950 5650
Connection ~ 9950 5650
Wire Wire Line
	9950 5650 10150 5650
$Comp
L Device:C_Small C8
U 1 1 60134386
P 9250 5850
AR Path="/6014B4D9/60134386" Ref="C8"  Part="1" 
AR Path="/5F8F4E1E/60134386" Ref="C?"  Part="1" 
AR Path="/5F910E81/60134386" Ref="C?"  Part="1" 
F 0 "C8" H 9342 5896 50  0000 L CNN
F 1 "10nF" H 9342 5805 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9250 5850 50  0001 C CNN
F 3 "~" H 9250 5850 50  0001 C CNN
	1    9250 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 5750 9250 5200
Connection ~ 9250 5200
Wire Wire Line
	9250 5200 9500 5200
Text GLabel 9250 6050 3    50   Input ~ 0
GND
Wire Wire Line
	9250 6050 9250 5950
Wire Wire Line
	8750 5800 8750 6050
Wire Wire Line
	9700 5200 10550 5200
$Comp
L 6502:USB_B J7
U 1 1 6015EA06
P 8750 4000
AR Path="/6014B4D9/6015EA06" Ref="J7"  Part="1" 
AR Path="/5F8F4E1E/6015EA06" Ref="J?"  Part="1" 
AR Path="/5F910E81/6015EA06" Ref="J?"  Part="1" 
F 0 "J7" H 8807 4467 50  0000 C CNN
F 1 "USB A" H 8807 4376 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 8900 3950 50  0001 C CNN
F 3 "" H 8900 3950 50  0001 C CNN
	1    8750 4000
	1    0    0    -1  
$EndComp
NoConn ~ 8650 4400
Text GLabel 8750 4650 3    50   Input ~ 0
GND
Wire Wire Line
	8750 4500 8750 4400
$Comp
L Device:Ferrite_Bead_Small FB2
U 1 1 6015EA0F
P 9600 3800
AR Path="/6014B4D9/6015EA0F" Ref="FB2"  Part="1" 
AR Path="/5F8F4E1E/6015EA0F" Ref="FB?"  Part="1" 
AR Path="/5F910E81/6015EA0F" Ref="FB?"  Part="1" 
F 0 "FB2" V 9363 3800 50  0000 C CNN
F 1 "FB" V 9454 3800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9530 3800 50  0001 C CNN
F 3 "~" H 9600 3800 50  0001 C CNN
	1    9600 3800
	0    1    1    0   
$EndComp
Text GLabel 10550 3800 2    50   Input ~ 0
+5V
Wire Wire Line
	9050 3800 9250 3800
Wire Wire Line
	9700 3800 10300 3800
Wire Wire Line
	9050 4100 9150 4100
Text GLabel 10550 4250 2    50   BiDi ~ 0
UART_A_USBD-
Text GLabel 10550 4000 2    50   BiDi ~ 0
UART_A_USBD+
$Comp
L Device:R R13
U 1 1 6015EA1B
P 10300 4250
AR Path="/6014B4D9/6015EA1B" Ref="R13"  Part="1" 
AR Path="/5F8F4E1E/6015EA1B" Ref="R?"  Part="1" 
AR Path="/5F910E81/6015EA1B" Ref="R?"  Part="1" 
F 0 "R13" V 10400 4250 50  0000 C CNN
F 1 "27" V 10300 4250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10230 4250 50  0001 C CNN
F 3 "~" H 10300 4250 50  0001 C CNN
	1    10300 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R12
U 1 1 6015EA21
P 10300 4000
AR Path="/6014B4D9/6015EA21" Ref="R12"  Part="1" 
AR Path="/5F8F4E1E/6015EA21" Ref="R?"  Part="1" 
AR Path="/5F910E81/6015EA21" Ref="R?"  Part="1" 
F 0 "R12" V 10400 4000 50  0000 C CNN
F 1 "27" V 10300 4000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10230 4000 50  0001 C CNN
F 3 "~" H 10300 4000 50  0001 C CNN
	1    10300 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10450 4250 10550 4250
Wire Wire Line
	10450 4000 10550 4000
Wire Wire Line
	9150 4100 9150 4250
$Comp
L Device:C_Small C10
U 1 1 6015EA2A
P 9600 4450
AR Path="/6014B4D9/6015EA2A" Ref="C10"  Part="1" 
AR Path="/5F8F4E1E/6015EA2A" Ref="C?"  Part="1" 
AR Path="/5F910E81/6015EA2A" Ref="C?"  Part="1" 
F 0 "C10" H 9692 4496 50  0000 L CNN
F 1 "47pF" H 9692 4405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9600 4450 50  0001 C CNN
F 3 "~" H 9600 4450 50  0001 C CNN
	1    9600 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 6015EA30
P 9950 4450
AR Path="/6014B4D9/6015EA30" Ref="C13"  Part="1" 
AR Path="/5F8F4E1E/6015EA30" Ref="C?"  Part="1" 
AR Path="/5F910E81/6015EA30" Ref="C?"  Part="1" 
F 0 "C13" H 10042 4496 50  0000 L CNN
F 1 "47pF" H 10042 4405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9950 4450 50  0001 C CNN
F 3 "~" H 9950 4450 50  0001 C CNN
	1    9950 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 4000 9600 4000
Wire Wire Line
	9150 4250 9950 4250
Text GLabel 9600 4650 3    50   Input ~ 0
GND
Text GLabel 9950 4650 3    50   Input ~ 0
GND
Wire Wire Line
	9600 4350 9600 4000
Connection ~ 9600 4000
Wire Wire Line
	9600 4000 10150 4000
Wire Wire Line
	9600 4550 9600 4650
Wire Wire Line
	9950 4650 9950 4550
Wire Wire Line
	9950 4350 9950 4250
Connection ~ 9950 4250
Wire Wire Line
	9950 4250 10150 4250
$Comp
L Device:C_Small C7
U 1 1 6015EA42
P 9250 4450
AR Path="/6014B4D9/6015EA42" Ref="C7"  Part="1" 
AR Path="/5F8F4E1E/6015EA42" Ref="C?"  Part="1" 
AR Path="/5F910E81/6015EA42" Ref="C?"  Part="1" 
F 0 "C7" H 9342 4496 50  0000 L CNN
F 1 "10nF" H 9342 4405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9250 4450 50  0001 C CNN
F 3 "~" H 9250 4450 50  0001 C CNN
	1    9250 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4350 9250 3800
Connection ~ 9250 3800
Wire Wire Line
	9250 3800 9500 3800
Text GLabel 9250 4650 3    50   Input ~ 0
GND
Wire Wire Line
	9250 4650 9250 4550
$Comp
L power:PWR_FLAG #FLG02
U 1 1 6015EA4D
P 10300 3800
AR Path="/6014B4D9/6015EA4D" Ref="#FLG02"  Part="1" 
AR Path="/5F8F4E1E/6015EA4D" Ref="#FLG?"  Part="1" 
AR Path="/5F910E81/6015EA4D" Ref="#FLG?"  Part="1" 
F 0 "#FLG02" H 10300 3875 50  0001 C CNN
F 1 "PWR_FLAG" H 10300 3973 50  0000 C CNN
F 2 "" H 10300 3800 50  0001 C CNN
F 3 "~" H 10300 3800 50  0001 C CNN
	1    10300 3800
	1    0    0    -1  
$EndComp
Connection ~ 10300 3800
Wire Wire Line
	10300 3800 10550 3800
$Comp
L power:PWR_FLAG #FLG01
U 1 1 6015EA55
P 8750 4500
AR Path="/6014B4D9/6015EA55" Ref="#FLG01"  Part="1" 
AR Path="/5F8F4E1E/6015EA55" Ref="#FLG?"  Part="1" 
AR Path="/5F910E81/6015EA55" Ref="#FLG?"  Part="1" 
F 0 "#FLG01" H 8750 4575 50  0001 C CNN
F 1 "PWR_FLAG" V 8750 4627 50  0000 L CNN
F 2 "" H 8750 4500 50  0001 C CNN
F 3 "~" H 8750 4500 50  0001 C CNN
	1    8750 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8750 4650 8750 4500
Connection ~ 8750 4500
Wire Wire Line
	10250 1650 10350 1650
Wire Wire Line
	10350 1450 10350 1650
Connection ~ 10350 1650
Wire Wire Line
	10350 1650 10800 1650
Wire Wire Line
	10350 750  10250 750 
Wire Wire Line
	10350 750  10350 950 
Wire Wire Line
	10350 750  10800 750 
Connection ~ 10350 750 
$Comp
L Connector:Conn_01x06_Male J4
U 1 1 601F90F8
P 6800 1250
AR Path="/6014B4D9/601F90F8" Ref="J4"  Part="1" 
AR Path="/5F8F4E1E/601F90F8" Ref="J?"  Part="1" 
AR Path="/5F910E81/601F90F8" Ref="J?"  Part="1" 
F 0 "J4" H 6900 1700 50  0000 C CNN
F 1 "UART A" H 6900 1600 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 6800 1250 50  0001 C CNN
F 3 "~" H 6800 1250 50  0001 C CNN
	1    6800 1250
	1    0    0    -1  
$EndComp
Text GLabel 7200 950  2    50   Input ~ 0
GND
Text GLabel 7200 1250 2    50   Input ~ 0
+5V
Wire Wire Line
	7200 1250 7000 1250
Text GLabel 7200 1350 2    50   Output ~ 0
UART_A_RxD
Wire Wire Line
	7200 1350 7000 1350
Text GLabel 7200 1450 2    50   Input ~ 0
UART_A_TxD
Wire Wire Line
	7200 1450 7000 1450
Wire Wire Line
	7000 1050 7100 1050
Wire Wire Line
	7100 1050 7100 950 
Wire Wire Line
	7100 950  7200 950 
Text GLabel 7200 1100 2    50   Input ~ 0
UART_A_~RTS
Text GLabel 7200 1600 2    50   Output ~ 0
UART_A_~CTS
Wire Wire Line
	7200 1600 7100 1600
Wire Wire Line
	7100 1600 7100 1550
Wire Wire Line
	7100 1550 7000 1550
Wire Wire Line
	7100 1150 7100 1100
Wire Wire Line
	7100 1100 7200 1100
Wire Wire Line
	7000 1150 7100 1150
$Comp
L Connector:Conn_01x06_Male J5
U 1 1 601F9110
P 7900 1250
AR Path="/6014B4D9/601F9110" Ref="J5"  Part="1" 
AR Path="/5F8F4E1E/601F9110" Ref="J?"  Part="1" 
AR Path="/5F910E81/601F9110" Ref="J?"  Part="1" 
F 0 "J5" H 8000 1700 50  0000 C CNN
F 1 "UART B" H 8000 1600 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 7900 1250 50  0001 C CNN
F 3 "~" H 7900 1250 50  0001 C CNN
	1    7900 1250
	1    0    0    -1  
$EndComp
Text GLabel 8300 950  2    50   Input ~ 0
GND
Text GLabel 8300 1250 2    50   Input ~ 0
+5V
Wire Wire Line
	8300 1250 8100 1250
Text GLabel 8300 1350 2    50   Output ~ 0
UART_B_RxD
Wire Wire Line
	8300 1350 8100 1350
Text GLabel 8300 1450 2    50   Input ~ 0
UART_B_TxD
Wire Wire Line
	8300 1450 8100 1450
Wire Wire Line
	8100 1050 8200 1050
Wire Wire Line
	8200 1050 8200 950 
Wire Wire Line
	8200 950  8300 950 
Text GLabel 8300 1100 2    50   Input ~ 0
UART_B_~RTS
Text GLabel 8300 1600 2    50   Output ~ 0
UART_B_~CTS
Wire Wire Line
	8300 1600 8200 1600
Wire Wire Line
	8200 1600 8200 1550
Wire Wire Line
	8200 1550 8100 1550
Wire Wire Line
	8200 1150 8200 1100
Wire Wire Line
	8200 1100 8300 1100
Wire Wire Line
	8100 1150 8200 1150
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
