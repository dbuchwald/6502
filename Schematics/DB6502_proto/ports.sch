EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title "DB6502 Hobby Computer Version 2"
Date "2020-11-03"
Rev "v003"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Open Source Hardware"
Comment4 "Author: Dawid Buchwald"
$EndDescr
$Comp
L Connector:Conn_01x32_Female J10
U 1 1 6014BD0C
P 4700 6200
F 0 "J10" H 4728 6176 50  0000 L CNN
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
6502_RDY
Text GLabel 4100 1050 1    50   Output ~ 0
BE
Wire Wire Line
	2000 950  2000 1050
Text GLabel 2000 950  1    50   Input ~ 0
+5V
$Comp
L Device:R R5
U 1 1 6017DC7B
P 2000 1200
F 0 "R5" H 2070 1246 50  0000 L CNN
F 1 "4K7" H 2070 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1930 1200 50  0001 C CNN
F 3 "~" H 2000 1200 50  0001 C CNN
	1    2000 1200
	1    0    0    -1  
$EndComp
Text GLabel 3950 1050 1    50   Output ~ 0
~IRQ
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
	2000 1350 2000 1650
Wire Wire Line
	3500 2050 5200 2050
Wire Wire Line
	3500 1050 3500 2050
Connection ~ 3650 1950
Wire Wire Line
	3650 1950 5200 1950
Wire Wire Line
	3650 1050 3650 1950
Wire Wire Line
	3800 1850 5200 1850
Connection ~ 3800 1850
Wire Wire Line
	1400 1850 3800 1850
Wire Wire Line
	3800 1050 3800 1850
Wire Wire Line
	3950 1750 5200 1750
Wire Wire Line
	3950 1050 3950 1750
Connection ~ 4100 1650
Wire Wire Line
	2000 1650 4100 1650
Wire Wire Line
	4100 1650 5200 1650
Wire Wire Line
	4100 1050 4100 1650
Wire Wire Line
	4250 1550 5200 1550
Wire Wire Line
	4250 1050 4250 1550
Wire Wire Line
	4400 1450 5200 1450
Wire Wire Line
	4400 1050 4400 1450
Wire Wire Line
	4550 1350 5200 1350
Wire Wire Line
	4550 1050 4550 1350
Wire Wire Line
	4700 1250 4700 1050
Wire Wire Line
	4700 1250 5200 1250
$Comp
L Connector:Conn_01x40_Female J2
U 1 1 60166003
P 5400 2850
F 0 "J2" H 5428 2826 50  0000 L CNN
F 1 "Controls" H 5428 2735 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x40_P2.54mm_Vertical" H 5400 2850 50  0001 C CNN
F 3 "~" H 5400 2850 50  0001 C CNN
	1    5400 2850
	1    0    0    -1  
$EndComp
Text GLabel 4850 1050 1    50   Input ~ 0
~RES
Wire Wire Line
	4850 1050 4850 1150
Wire Wire Line
	4850 1150 5200 1150
Wire Wire Line
	1100 1950 3650 1950
Wire Wire Line
	3350 1050 3350 2150
Wire Wire Line
	3350 2150 5200 2150
Wire Wire Line
	3200 1050 3200 2250
Wire Wire Line
	3200 2250 5200 2250
$Comp
L Connector:Conn_01x40_Female J9
U 1 1 60200164
P 2850 5450
F 0 "J9" H 2878 5426 50  0000 L CNN
F 1 "I/O Bus" H 2878 5335 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x40_P2.54mm_Vertical" H 2850 5450 50  0001 C CNN
F 3 "~" H 2850 5450 50  0001 C CNN
	1    2850 5450
	1    0    0    -1  
$EndComp
Text Label 2450 3750 0    50   ~ 0
a0
Text Label 2450 3850 0    50   ~ 0
a1
Text Label 2450 3950 0    50   ~ 0
a2
Text Label 2450 4050 0    50   ~ 0
a3
Text Label 2450 4150 0    50   ~ 0
a4
Wire Wire Line
	2450 4150 2650 4150
Wire Wire Line
	2450 4050 2650 4050
Wire Wire Line
	2450 3950 2650 3950
Wire Wire Line
	2450 3850 2650 3850
Wire Wire Line
	2450 3750 2650 3750
Entry Wire Line
	2350 3650 2450 3750
Entry Wire Line
	2350 3750 2450 3850
Entry Wire Line
	2350 3850 2450 3950
Entry Wire Line
	2350 3950 2450 4050
Entry Wire Line
	2350 4050 2450 4150
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
Wire Wire Line
	2150 4950 2150 5050
Wire Wire Line
	2150 5050 2650 5050
Text GLabel 800  4950 1    50   Input ~ 0
~RD
Text GLabel 650  4950 1    50   Input ~ 0
~WR
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
	3050 2350 5200 2350
$Comp
L Device:R R6
U 1 1 604F21BB
P 2300 2600
F 0 "R6" H 2230 2554 50  0000 R CNN
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
~RD
Text GLabel 6400 6800 2    50   Input ~ 0
~WR
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
Text GLabel 2550 7450 0    50   Input ~ 0
GND
Text GLabel 2550 7350 0    50   Input ~ 0
+5V
Wire Wire Line
	2550 7350 2650 7350
Wire Wire Line
	2550 7450 2650 7450
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
Text GLabel 950  7150 3    50   Input ~ 0
6502_CLK
Wire Wire Line
	950  7150 950  6350
Wire Wire Line
	950  6350 2650 6350
Text GLabel 800  7150 3    50   Input ~ 0
R~W
Wire Wire Line
	800  7150 800  6250
Wire Wire Line
	800  6250 2650 6250
Text GLabel 650  7150 3    50   Input ~ 0
~6502_RES
Wire Wire Line
	650  7150 650  6150
Wire Wire Line
	650  6150 2650 6150
Text GLabel 6400 7550 2    50   Input ~ 0
SYNC
Wire Wire Line
	6400 7550 5600 7550
Wire Wire Line
	5600 7550 5600 6400
Wire Wire Line
	4850 2750 5200 2750
Text GLabel 4850 2850 0    50   Output ~ 0
RDY_M1F
Text GLabel 4850 2950 0    50   Output ~ 0
RDY_M2F
Text GLabel 4850 3050 0    50   Output ~ 0
WS_DISABLE
Text GLabel 4850 3150 0    50   Output ~ 0
DBG_WAIT
Text GLabel 4850 3250 0    50   Input ~ 0
6502_RDY
Wire Wire Line
	4850 2850 5200 2850
Wire Wire Line
	4850 2950 5200 2950
Wire Wire Line
	4850 3050 5200 3050
Wire Wire Line
	4850 3150 5200 3150
Wire Wire Line
	4850 3250 5200 3250
Text Label 4300 3350 0    50   ~ 0
d0
Text Label 4300 3450 0    50   ~ 0
d1
Text Label 4300 3550 0    50   ~ 0
d2
Text Label 4300 3650 0    50   ~ 0
d3
Text Label 4300 3750 0    50   ~ 0
d4
Text Label 4300 3850 0    50   ~ 0
d5
Text Label 4300 3950 0    50   ~ 0
d6
Text Label 4300 4050 0    50   ~ 0
d7
Wire Wire Line
	4300 3350 5200 3350
Wire Wire Line
	4300 3450 5200 3450
Wire Wire Line
	4300 3550 5200 3550
Wire Wire Line
	4300 3650 5200 3650
Wire Wire Line
	4300 3750 5200 3750
Wire Wire Line
	4300 3850 5200 3850
Wire Wire Line
	4300 3950 5200 3950
Wire Wire Line
	4300 4050 5200 4050
Entry Wire Line
	4200 3250 4300 3350
Entry Wire Line
	4200 3350 4300 3450
Entry Wire Line
	4200 3450 4300 3550
Entry Wire Line
	4200 3550 4300 3650
Entry Wire Line
	4200 3650 4300 3750
Entry Wire Line
	4200 3750 4300 3850
Entry Wire Line
	4200 3850 4300 3950
Entry Wire Line
	4200 3950 4300 4050
Text GLabel 4850 4850 0    50   Input ~ 0
GND
Text GLabel 4850 4750 0    50   Input ~ 0
+5V
Wire Wire Line
	4850 4750 5200 4750
Wire Wire Line
	4850 4850 5200 4850
Text GLabel 1100 7150 3    50   Input ~ 0
RAM1_~CS
Wire Wire Line
	1100 7150 1100 6450
Wire Wire Line
	1100 6450 2650 6450
Text GLabel 1250 7150 3    50   Input ~ 0
RAM2_~CS
Text GLabel 1400 7150 3    50   Input ~ 0
ROM_~CS
Wire Wire Line
	1250 7150 1250 6550
Wire Wire Line
	1250 6550 2650 6550
Wire Wire Line
	1400 7150 1400 6650
Wire Wire Line
	1400 6650 2650 6650
$Comp
L Device:R R2
U 1 1 60B17A68
P 6850 1100
F 0 "R2" H 6920 1146 50  0000 L CNN
F 1 "470" H 6920 1055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6780 1100 50  0001 C CNN
F 3 "~" H 6850 1100 50  0001 C CNN
	1    6850 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 60B19002
P 6850 1500
F 0 "D1" V 6889 1382 50  0000 R CNN
F 1 "PWR" V 6798 1382 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 6850 1500 50  0001 C CNN
F 3 "~" H 6850 1500 50  0001 C CNN
	1    6850 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6850 850  6850 950 
Wire Wire Line
	6850 1250 6850 1350
Wire Wire Line
	6850 1750 6850 1650
$Comp
L Connector:Conn_01x06_Male J7
U 1 1 5FB4D429
P 8800 5150
AR Path="/6014B4D9/5FB4D429" Ref="J7"  Part="1" 
AR Path="/5F8F4E1E/5FB4D429" Ref="J?"  Part="1" 
AR Path="/5F910E81/5FB4D429" Ref="J?"  Part="1" 
F 0 "J7" H 8900 5600 50  0000 C CNN
F 1 "UART A" H 8900 5500 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 8800 5150 50  0001 C CNN
F 3 "~" H 8800 5150 50  0001 C CNN
	1    8800 5150
	1    0    0    -1  
$EndComp
Text GLabel 9200 4850 2    50   Input ~ 0
GND
Text GLabel 9200 5250 2    50   Output ~ 0
UART_A_RxD
Wire Wire Line
	9200 5250 9000 5250
Text GLabel 9200 5350 2    50   Input ~ 0
UART_A_TxD
Wire Wire Line
	9200 5350 9000 5350
Wire Wire Line
	9000 4950 9100 4950
Wire Wire Line
	9100 4950 9100 4850
Wire Wire Line
	9100 4850 9200 4850
Text GLabel 9200 5000 2    50   Input ~ 0
UART_A_~RTS
Text GLabel 9200 5500 2    50   Output ~ 0
UART_A_~CTS
Wire Wire Line
	9200 5500 9100 5500
Wire Wire Line
	9100 5500 9100 5450
Wire Wire Line
	9100 5450 9000 5450
Wire Wire Line
	9100 5050 9100 5000
Wire Wire Line
	9100 5000 9200 5000
Wire Wire Line
	9000 5050 9100 5050
$Comp
L Connector:Conn_01x06_Male J8
U 1 1 5FB4D441
P 9900 5150
AR Path="/6014B4D9/5FB4D441" Ref="J8"  Part="1" 
AR Path="/5F8F4E1E/5FB4D441" Ref="J?"  Part="1" 
AR Path="/5F910E81/5FB4D441" Ref="J?"  Part="1" 
F 0 "J8" H 10000 5600 50  0000 C CNN
F 1 "UART B" H 10000 5500 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 9900 5150 50  0001 C CNN
F 3 "~" H 9900 5150 50  0001 C CNN
	1    9900 5150
	1    0    0    -1  
$EndComp
Text GLabel 10300 4850 2    50   Input ~ 0
GND
Text GLabel 10300 5250 2    50   Output ~ 0
UART_B_RxD
Wire Wire Line
	10300 5250 10100 5250
Text GLabel 10300 5350 2    50   Input ~ 0
UART_B_TxD
Wire Wire Line
	10300 5350 10100 5350
Wire Wire Line
	10100 4950 10200 4950
Wire Wire Line
	10200 4950 10200 4850
Wire Wire Line
	10200 4850 10300 4850
Text GLabel 10300 5000 2    50   Input ~ 0
UART_B_~RTS
Text GLabel 10300 5500 2    50   Output ~ 0
UART_B_~CTS
Wire Wire Line
	10300 5500 10200 5500
Wire Wire Line
	10200 5500 10200 5450
Wire Wire Line
	10200 5450 10100 5450
Wire Wire Line
	10200 5050 10200 5000
Wire Wire Line
	10200 5000 10300 5000
Wire Wire Line
	10100 5050 10200 5050
$Comp
L power:+5V #PWR?
U 1 1 5FC0FAA0
P 7600 750
AR Path="/5FC0FAA0" Ref="#PWR?"  Part="1" 
AR Path="/6014B4D9/5FC0FAA0" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 7600 600 50  0001 C CNN
F 1 "+5V" H 7615 923 50  0000 C CNN
F 2 "" H 7600 750 50  0001 C CNN
F 3 "" H 7600 750 50  0001 C CNN
	1    7600 750 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC0FAA6
P 7600 1850
AR Path="/5FC0FAA6" Ref="#PWR?"  Part="1" 
AR Path="/6014B4D9/5FC0FAA6" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 7600 1600 50  0001 C CNN
F 1 "GND" H 7605 1677 50  0000 C CNN
F 2 "" H 7600 1850 50  0001 C CNN
F 3 "" H 7600 1850 50  0001 C CNN
	1    7600 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 750  7600 850 
Wire Wire Line
	7600 1450 7600 1550
Connection ~ 7600 1550
Wire Wire Line
	7600 1550 7600 1750
Connection ~ 7600 1050
Wire Wire Line
	7600 1050 7600 1150
Text GLabel 7500 1050 0    50   Output ~ 0
+5V
Text GLabel 7500 1550 0    50   Output ~ 0
GND
Wire Wire Line
	7500 1550 7600 1550
Wire Wire Line
	7500 1050 7600 1050
$Comp
L Device:CP C?
U 1 1 5FC0FAB6
P 7600 1300
AR Path="/5FC0FAB6" Ref="C?"  Part="1" 
AR Path="/6014B4D9/5FC0FAB6" Ref="C10"  Part="1" 
F 0 "C10" H 7718 1346 50  0000 L CNN
F 1 "10uF" H 7718 1255 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 7638 1150 50  0001 C CNN
F 3 "~" H 7600 1300 50  0001 C CNN
	1    7600 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1750 7600 1750
Connection ~ 7600 1750
Wire Wire Line
	6850 850  7600 850 
Connection ~ 7600 850 
Wire Wire Line
	7600 850  7600 1050
Wire Wire Line
	7600 1850 7600 1750
$Comp
L Connector:Conn_01x06_Male J6
U 1 1 5FFB5039
P 7900 5150
AR Path="/6014B4D9/5FFB5039" Ref="J6"  Part="1" 
AR Path="/5F8F4E1E/5FFB5039" Ref="J?"  Part="1" 
F 0 "J6" H 8000 5600 50  0000 C CNN
F 1 "Debug UART" H 8000 5500 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 7900 5150 50  0001 C CNN
F 3 "~" H 7900 5150 50  0001 C CNN
	1    7900 5150
	1    0    0    -1  
$EndComp
Text GLabel 8200 4950 2    50   Input ~ 0
GND
Wire Wire Line
	8200 4950 8150 4950
Wire Wire Line
	8100 5050 8150 5050
Wire Wire Line
	8150 5050 8150 4950
Connection ~ 8150 4950
Wire Wire Line
	8150 4950 8100 4950
NoConn ~ 8100 5450
Wire Wire Line
	8200 5250 8100 5250
Wire Wire Line
	8200 5350 8100 5350
Text GLabel 8200 5350 2    50   Input ~ 0
DBG_TxD
Text GLabel 8200 5250 2    50   Output ~ 0
DBG_RxD
$Comp
L 6502:USB_B J4
U 1 1 5FFE872B
P 8450 3600
AR Path="/6014B4D9/5FFE872B" Ref="J4"  Part="1" 
AR Path="/5F8F4E1E/5FFE872B" Ref="J?"  Part="1" 
F 0 "J4" H 8450 4100 50  0000 C CNN
F 1 "Debug USB" H 8450 4000 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 8600 3550 50  0001 C CNN
F 3 "" H 8600 3550 50  0001 C CNN
	1    8450 3600
	1    0    0    -1  
$EndComp
NoConn ~ 8350 4000
Wire Wire Line
	8750 3700 8850 3700
Text GLabel 10250 3850 2    50   BiDi ~ 0
DBG_USBD-
Text GLabel 10250 3600 2    50   BiDi ~ 0
DBG_USBD+
$Comp
L Device:R R10
U 1 1 5FFE873E
P 10000 3850
AR Path="/6014B4D9/5FFE873E" Ref="R10"  Part="1" 
AR Path="/5F8F4E1E/5FFE873E" Ref="R?"  Part="1" 
F 0 "R10" V 10100 3850 50  0000 C CNN
F 1 "27" V 10000 3850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9930 3850 50  0001 C CNN
F 3 "~" H 10000 3850 50  0001 C CNN
	1    10000 3850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R9
U 1 1 5FFE8744
P 10000 3600
AR Path="/6014B4D9/5FFE8744" Ref="R9"  Part="1" 
AR Path="/5F8F4E1E/5FFE8744" Ref="R?"  Part="1" 
F 0 "R9" V 10100 3600 50  0000 C CNN
F 1 "27" V 10000 3600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9930 3600 50  0001 C CNN
F 3 "~" H 10000 3600 50  0001 C CNN
	1    10000 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10150 3850 10250 3850
Wire Wire Line
	10150 3600 10250 3600
Wire Wire Line
	8850 3700 8850 3850
$Comp
L Device:C_Small C11
U 1 1 5FFE874D
P 9300 4050
AR Path="/6014B4D9/5FFE874D" Ref="C11"  Part="1" 
AR Path="/5F8F4E1E/5FFE874D" Ref="C?"  Part="1" 
F 0 "C11" H 9392 4096 50  0000 L CNN
F 1 "47pF" H 9392 4005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9300 4050 50  0001 C CNN
F 3 "~" H 9300 4050 50  0001 C CNN
	1    9300 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5FFE8753
P 9650 4050
AR Path="/6014B4D9/5FFE8753" Ref="C12"  Part="1" 
AR Path="/5F8F4E1E/5FFE8753" Ref="C?"  Part="1" 
F 0 "C12" H 9742 4096 50  0000 L CNN
F 1 "47pF" H 9742 4005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9650 4050 50  0001 C CNN
F 3 "~" H 9650 4050 50  0001 C CNN
	1    9650 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3600 9300 3600
Wire Wire Line
	8850 3850 9650 3850
Text GLabel 10250 4250 2    50   Input ~ 0
GND
Wire Wire Line
	9300 3950 9300 3600
Connection ~ 9300 3600
Wire Wire Line
	9300 3600 9850 3600
Wire Wire Line
	9300 4150 9300 4250
Wire Wire Line
	9650 4250 9650 4150
Wire Wire Line
	9650 3950 9650 3850
Connection ~ 9650 3850
Wire Wire Line
	9650 3850 9850 3850
$Comp
L Connector:AVR-ISP-6 J3
U 1 1 600EABFA
P 7050 2900
AR Path="/6014B4D9/600EABFA" Ref="J3"  Part="1" 
AR Path="/5F8F4E1E/600EABFA" Ref="J?"  Part="1" 
F 0 "J3" H 6950 3000 50  0000 C CNN
F 1 "AVR ISP" H 6950 2900 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 6800 2950 50  0001 C CNN
F 3 " ~" H 5775 2350 50  0001 C CNN
	1    7050 2900
	1    0    0    -1  
$EndComp
Text GLabel 7050 3400 2    50   Input ~ 0
GND
Text GLabel 7050 2300 2    50   Input ~ 0
+5V
Text GLabel 7550 3000 2    50   Output ~ 0
~RES
Wire Wire Line
	7450 3000 7550 3000
Text Label 7600 2700 2    50   ~ 0
d6
Text Label 7600 2800 2    50   ~ 0
d5
Text Label 7600 2900 2    50   ~ 0
d7
Wire Wire Line
	7450 2900 7600 2900
Wire Wire Line
	7450 2800 7600 2800
Wire Wire Line
	7450 2700 7600 2700
Entry Wire Line
	7600 2800 7700 2700
Entry Wire Line
	7600 2700 7700 2600
Entry Wire Line
	7600 2900 7700 2800
Wire Wire Line
	6950 2300 6950 2400
Wire Wire Line
	6950 3300 6950 3400
Text GLabel 2150 4950 1    50   Input ~ 0
IOCS
Wire Wire Line
	7050 3400 6950 3400
Wire Wire Line
	6950 2300 7050 2300
Wire Wire Line
	10250 4250 9650 4250
Connection ~ 9300 4250
Connection ~ 9650 4250
Wire Wire Line
	9650 4250 9300 4250
NoConn ~ 8100 5150
NoConn ~ 9000 5150
NoConn ~ 10100 5150
Wire Wire Line
	8450 4000 8450 4250
$Comp
L Connector:Barrel_Jack J1
U 1 1 60416F76
P 8450 2650
F 0 "J1" H 8507 2975 50  0000 C CNN
F 1 "Power plug" H 8507 2884 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 8500 2610 50  0001 C CNN
F 3 "~" H 8500 2610 50  0001 C CNN
	1    8450 2650
	1    0    0    -1  
$EndComp
Text GLabel 9050 2550 2    50   Input ~ 0
+5V
Text GLabel 9050 2750 2    50   Input ~ 0
GND
Wire Wire Line
	8750 2550 8950 2550
$Comp
L power:PWR_FLAG #FLG01
U 1 1 60469558
P 8950 2550
F 0 "#FLG01" H 8950 2625 50  0001 C CNN
F 1 "PWR_FLAG" H 8950 2723 50  0000 C CNN
F 2 "" H 8950 2550 50  0001 C CNN
F 3 "~" H 8950 2550 50  0001 C CNN
	1    8950 2550
	1    0    0    -1  
$EndComp
Connection ~ 8950 2550
Wire Wire Line
	8950 2550 9050 2550
$Comp
L power:PWR_FLAG #FLG02
U 1 1 6046A445
P 8950 2750
F 0 "#FLG02" H 8950 2825 50  0001 C CNN
F 1 "PWR_FLAG" H 8950 2923 50  0000 C CNN
F 2 "" H 8950 2750 50  0001 C CNN
F 3 "~" H 8950 2750 50  0001 C CNN
	1    8950 2750
	-1   0    0    1   
$EndComp
Connection ~ 8950 2750
Wire Wire Line
	8950 2750 9050 2750
Wire Wire Line
	8750 2750 8950 2750
Text GLabel 4850 2750 0    50   Input ~ 0
DBG_CLK
Wire Wire Line
	8450 4250 9300 4250
$Comp
L Device:R R7
U 1 1 604AB578
P 9000 3400
F 0 "R7" V 8900 3400 50  0000 C CNN
F 1 "4K7" V 9000 3400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8930 3400 50  0001 C CNN
F 3 "~" H 9000 3400 50  0001 C CNN
	1    9000 3400
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 604AC544
P 9500 3400
F 0 "R8" V 9400 3400 50  0000 C CNN
F 1 "10K" V 9500 3400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9430 3400 50  0001 C CNN
F 3 "~" H 9500 3400 50  0001 C CNN
	1    9500 3400
	0    1    1    0   
$EndComp
Text GLabel 10250 3400 2    50   Input ~ 0
GND
Wire Wire Line
	9650 3400 10250 3400
Wire Wire Line
	9150 3400 9250 3400
Wire Wire Line
	8750 3400 8850 3400
Text GLabel 10250 3250 2    50   Input ~ 0
VBUS_SENSE
Wire Wire Line
	10250 3250 9250 3250
Wire Wire Line
	9250 3250 9250 3400
Connection ~ 9250 3400
Wire Wire Line
	9250 3400 9350 3400
Text GLabel 2450 3450 1    50   Input ~ 0
GND
Text GLabel 2550 3450 1    50   Input ~ 0
+5V
Wire Wire Line
	2550 3450 2550 3550
Wire Wire Line
	2450 3650 2650 3650
Wire Wire Line
	2450 3450 2450 3650
Wire Wire Line
	2550 3550 2650 3550
Text GLabel 1550 7150 3    50   Input ~ 0
~VIA2_IRQ
Text GLabel 1700 7150 3    50   Input ~ 0
~EXT_IRQ
Wire Wire Line
	1550 7150 1550 6750
Wire Wire Line
	1550 6750 2650 6750
Wire Wire Line
	1700 7150 1700 6850
Wire Wire Line
	1700 6850 2650 6850
Text GLabel 5000 850  1    50   Input ~ 0
GND
Text GLabel 5100 850  1    50   Input ~ 0
+5V
Wire Wire Line
	5100 850  5100 950 
Wire Wire Line
	5100 950  5200 950 
Wire Wire Line
	5000 1050 5200 1050
Wire Wire Line
	5000 850  5000 1050
$Comp
L Connector_Generic:Conn_02x12_Odd_Even J5
U 1 1 606B3BDC
P 6700 4500
F 0 "J5" H 6750 5217 50  0000 C CNN
F 1 "JPR" H 6750 5126 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x12_P2.54mm_Vertical" H 6700 4500 50  0001 C CNN
F 3 "~" H 6700 4500 50  0001 C CNN
	1    6700 4500
	1    0    0    -1  
$EndComp
Text GLabel 7200 4600 2    50   Input ~ 0
WS_DISABLE
Text GLabel 6400 3900 1    50   Input ~ 0
~PLD_WR
Text GLabel 6250 3900 1    50   Input ~ 0
~PLD_RD
Text GLabel 7100 3900 1    50   Output ~ 0
~WR
Text GLabel 7250 3900 1    50   Output ~ 0
~RD
Text GLabel 6300 4400 0    50   Input ~ 0
IO16
Text GLabel 7200 4400 2    50   Output ~ 0
6502_RDY
Text GLabel 7200 4500 2    50   Input ~ 0
DBG_WAIT
Text GLabel 6300 4500 0    50   Output ~ 0
IO15
Text GLabel 6300 4600 0    50   Output ~ 0
IO14
Text GLabel 6300 4700 0    50   Output ~ 0
IO13
Text GLabel 7200 4700 2    50   Input ~ 0
RDY_M2F
Wire Wire Line
	7200 4500 7000 4500
Wire Wire Line
	7200 4400 7000 4400
Wire Wire Line
	6300 4500 6500 4500
Wire Wire Line
	6300 4400 6500 4400
Wire Wire Line
	6400 3900 6400 4000
Wire Wire Line
	6400 4000 6500 4000
Wire Wire Line
	6250 3900 6250 4100
Wire Wire Line
	6250 4100 6500 4100
Wire Wire Line
	7100 3900 7100 4000
Wire Wire Line
	7100 4000 7000 4000
Wire Wire Line
	7250 3900 7250 4100
Wire Wire Line
	7250 4100 7000 4100
Wire Wire Line
	7200 4600 7000 4600
Wire Wire Line
	7200 4700 7000 4700
Wire Wire Line
	6300 4600 6500 4600
Wire Wire Line
	6300 4700 6500 4700
Text GLabel 6300 4800 0    50   Output ~ 0
IN12
Text GLabel 7200 4800 2    50   Input ~ 0
RDY_M1F
Wire Wire Line
	7200 4800 7000 4800
Wire Wire Line
	6300 4800 6500 4800
Text GLabel 6300 4200 0    50   Input ~ 0
DBG_USB_RxD
Text GLabel 7200 4200 2    50   Output ~ 0
DBG_RxD
Wire Wire Line
	6300 4200 6500 4200
Wire Wire Line
	7200 4200 7000 4200
Text GLabel 6300 4900 0    50   Input ~ 0
CLK_1
Text GLabel 6300 5000 0    50   Input ~ 0
CLK_2
Text GLabel 6300 5100 0    50   Input ~ 0
CLK_4
Wire Wire Line
	6300 4900 6500 4900
Wire Wire Line
	6300 5000 6500 5000
Wire Wire Line
	6300 5100 6500 5100
Text GLabel 7200 5000 2    50   Output ~ 0
CLK
Wire Wire Line
	7000 4900 7100 4900
Wire Wire Line
	7100 4900 7100 5000
Wire Wire Line
	7100 5100 7000 5100
Wire Wire Line
	7000 5000 7100 5000
Connection ~ 7100 5000
Wire Wire Line
	7100 5000 7100 5100
Wire Wire Line
	7200 5000 7100 5000
Text GLabel 6300 4300 0    50   Input ~ 0
BLINK_OUT
Wire Wire Line
	6300 4300 6500 4300
Text GLabel 7200 4300 2    50   Output ~ 0
BLINK_IN
Wire Wire Line
	7000 4300 7200 4300
Wire Bus Line
	7700 2600 7700 2800
Wire Bus Line
	2350 3650 2350 4050
Wire Bus Line
	4700 6700 5400 6700
Wire Bus Line
	2250 4150 2250 4850
Wire Bus Line
	4200 3250 4200 3950
Wire Bus Line
	3100 6700 4600 6700
$EndSCHEMATC
