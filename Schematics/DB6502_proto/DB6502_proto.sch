EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
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
6502_RDY_IN
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
PHI2
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
$Sheet
S 8700 5950 750  350 
U 6014B4D9
F0 "ports" 50
F1 "ports.sch" 50
$EndSheet
$Comp
L 6502:65C02S U4
U 1 1 5F5A65C1
P 2400 2150
F 0 "U4" H 2400 3315 50  0000 C CNN
F 1 "65C02S" H 2400 3224 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 2400 3200 50  0001 C CNN
F 3 "" H 2250 3100 50  0001 C CNN
	1    2400 2150
	1    0    0    -1  
$EndComp
Wire Bus Line
	3200 2750 3300 2750
$Comp
L Device:C_Small C4
U 1 1 5FFF1E28
P 900 2150
F 0 "C4" H 992 2196 50  0000 L CNN
F 1 "0,1uF" H 992 2105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 900 2150 50  0001 C CNN
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
$Sheet
S 7800 5950 750  350 
U 5F910E81
F0 "serial" 50
F1 "serial.sch" 50
$EndSheet
Text GLabel 4250 2650 3    50   Input ~ 0
GND
Wire Wire Line
	4250 2650 4250 2550
Wire Wire Line
	4250 2550 4350 2550
Text GLabel 5450 900  1    50   Input ~ 0
+5V
Wire Wire Line
	5450 900  5450 1000
Wire Wire Line
	5450 1250 5350 1250
Text GLabel 5600 1150 1    50   Input ~ 0
~WR
Wire Wire Line
	5600 1150 5600 1350
Wire Wire Line
	5600 1350 5350 1350
Text GLabel 5750 1150 1    50   Input ~ 0
~RD
Text GLabel 5900 1150 1    50   Input ~ 0
RAM1_~CS
Wire Wire Line
	5900 1150 5900 2050
Wire Wire Line
	5900 2050 5350 2050
Wire Wire Line
	5750 1150 5750 1850
Wire Wire Line
	5750 1850 5350 1850
Text Label 4150 2250 0    50   ~ 0
d0
Text Label 4150 2350 0    50   ~ 0
d1
Text Label 4150 2450 0    50   ~ 0
d2
Entry Wire Line
	4050 2350 4150 2250
Entry Wire Line
	4050 2450 4150 2350
Entry Wire Line
	4050 2550 4150 2450
Text Label 5550 2550 2    50   ~ 0
d3
Text Label 5550 2450 2    50   ~ 0
d4
Text Label 5550 2350 2    50   ~ 0
d5
Text Label 5550 2250 2    50   ~ 0
d6
Text Label 5550 2150 2    50   ~ 0
d7
Wire Wire Line
	4150 2250 4350 2250
Wire Wire Line
	4150 2350 4350 2350
Wire Wire Line
	4150 2450 4350 2450
Wire Wire Line
	5350 2550 5550 2550
Wire Wire Line
	5350 2450 5550 2450
Wire Wire Line
	5350 2350 5550 2350
Wire Wire Line
	5350 2250 5550 2250
Wire Wire Line
	5350 2150 5550 2150
Entry Wire Line
	5550 2150 5650 2250
Entry Wire Line
	5550 2250 5650 2350
Entry Wire Line
	5550 2350 5650 2450
Entry Wire Line
	5550 2450 5650 2550
Entry Wire Line
	5550 2550 5650 2650
Wire Bus Line
	4050 2950 5650 2950
Text Label 4150 2150 0    50   ~ 0
a0
Text Label 4150 2050 0    50   ~ 0
a1
Text Label 4150 1950 0    50   ~ 0
a2
Text Label 4150 1850 0    50   ~ 0
a3
Text Label 4150 1750 0    50   ~ 0
a4
Text Label 4150 1650 0    50   ~ 0
a5
Text Label 4150 1550 0    50   ~ 0
a6
Text Label 4150 1450 0    50   ~ 0
a7
Text Label 4150 1350 0    50   ~ 0
a12
Text Label 4150 1250 0    50   ~ 0
a14
Text Label 6100 1450 2    50   ~ 0
a13
Text Label 6100 1550 2    50   ~ 0
a8
Text Label 6100 1650 2    50   ~ 0
a9
Text Label 6100 1750 2    50   ~ 0
a11
Text Label 6100 1950 2    50   ~ 0
a10
Wire Wire Line
	5350 1950 6100 1950
Wire Wire Line
	5350 1750 6100 1750
Wire Wire Line
	5350 1650 6100 1650
Wire Wire Line
	5350 1550 6100 1550
Wire Wire Line
	5350 1450 6100 1450
Wire Wire Line
	4150 2150 4350 2150
Wire Wire Line
	4150 2050 4350 2050
Wire Wire Line
	4150 1950 4350 1950
Wire Wire Line
	4150 1850 4350 1850
Wire Wire Line
	4150 1750 4350 1750
Wire Wire Line
	4150 1650 4350 1650
Wire Wire Line
	4150 1550 4350 1550
Wire Wire Line
	4150 1450 4350 1450
Wire Wire Line
	4150 1350 4350 1350
Wire Wire Line
	4150 1250 4350 1250
Entry Wire Line
	6100 1450 6200 1350
Entry Wire Line
	6200 1450 6100 1550
Entry Wire Line
	6100 1650 6200 1550
Entry Wire Line
	6100 1750 6200 1650
Entry Wire Line
	6100 1950 6200 1850
Entry Wire Line
	4050 1150 4150 1250
Entry Wire Line
	4050 1250 4150 1350
Entry Wire Line
	4050 1350 4150 1450
Entry Wire Line
	4050 1450 4150 1550
Entry Wire Line
	4050 1550 4150 1650
Entry Wire Line
	4050 1650 4150 1750
Entry Wire Line
	4050 1750 4150 1850
Entry Wire Line
	4050 1850 4150 1950
Entry Wire Line
	4050 1950 4150 2050
Entry Wire Line
	4050 2050 4150 2150
Wire Bus Line
	4050 650  6200 650 
Text GLabel 6600 2650 3    50   Input ~ 0
GND
Wire Wire Line
	6600 2650 6600 2550
Wire Wire Line
	6600 2550 6700 2550
Text GLabel 7800 900  1    50   Input ~ 0
+5V
Wire Wire Line
	7800 900  7800 1000
Wire Wire Line
	7800 1250 7700 1250
Text GLabel 7950 1150 1    50   Input ~ 0
~WR
Wire Wire Line
	7950 1150 7950 1350
Wire Wire Line
	7950 1350 7700 1350
Text GLabel 8100 1150 1    50   Input ~ 0
~RD
Text GLabel 8250 1150 1    50   Input ~ 0
RAM2_~CS
Wire Wire Line
	8250 1150 8250 2050
Wire Wire Line
	8250 2050 7700 2050
Wire Wire Line
	8100 1150 8100 1850
Wire Wire Line
	8100 1850 7700 1850
Text Label 6500 2250 0    50   ~ 0
d0
Text Label 6500 2350 0    50   ~ 0
d1
Text Label 6500 2450 0    50   ~ 0
d2
Entry Wire Line
	6400 2350 6500 2250
Entry Wire Line
	6400 2450 6500 2350
Entry Wire Line
	6400 2550 6500 2450
Text Label 7900 2550 2    50   ~ 0
d3
Text Label 7900 2450 2    50   ~ 0
d4
Text Label 7900 2350 2    50   ~ 0
d5
Text Label 7900 2250 2    50   ~ 0
d6
Text Label 7900 2150 2    50   ~ 0
d7
Wire Wire Line
	6500 2250 6700 2250
Wire Wire Line
	6500 2350 6700 2350
Wire Wire Line
	6500 2450 6700 2450
Wire Wire Line
	7700 2550 7900 2550
Wire Wire Line
	7700 2450 7900 2450
Wire Wire Line
	7700 2350 7900 2350
Wire Wire Line
	7700 2250 7900 2250
Wire Wire Line
	7700 2150 7900 2150
Entry Wire Line
	7900 2150 8000 2250
Entry Wire Line
	7900 2250 8000 2350
Entry Wire Line
	7900 2350 8000 2450
Entry Wire Line
	7900 2450 8000 2550
Entry Wire Line
	7900 2550 8000 2650
Wire Bus Line
	6400 2950 8000 2950
Text Label 6500 2150 0    50   ~ 0
a0
Text Label 6500 2050 0    50   ~ 0
a1
Text Label 6500 1950 0    50   ~ 0
a2
Text Label 6500 1850 0    50   ~ 0
a3
Text Label 6500 1750 0    50   ~ 0
a4
Text Label 6500 1650 0    50   ~ 0
a5
Text Label 6500 1550 0    50   ~ 0
a6
Text Label 6500 1450 0    50   ~ 0
a7
Text Label 6500 1350 0    50   ~ 0
a12
Text Label 6500 1250 0    50   ~ 0
a14
Text Label 8450 1450 2    50   ~ 0
a13
Text Label 8450 1550 2    50   ~ 0
a8
Text Label 8450 1650 2    50   ~ 0
a9
Text Label 8450 1750 2    50   ~ 0
a11
Text Label 8450 1950 2    50   ~ 0
a10
Wire Wire Line
	7700 1950 8450 1950
Wire Wire Line
	7700 1750 8450 1750
Wire Wire Line
	7700 1650 8450 1650
Wire Wire Line
	7700 1550 8450 1550
Wire Wire Line
	7700 1450 8450 1450
Wire Wire Line
	6500 2150 6700 2150
Wire Wire Line
	6500 2050 6700 2050
Wire Wire Line
	6500 1950 6700 1950
Wire Wire Line
	6500 1850 6700 1850
Wire Wire Line
	6500 1750 6700 1750
Wire Wire Line
	6500 1650 6700 1650
Wire Wire Line
	6500 1550 6700 1550
Wire Wire Line
	6500 1450 6700 1450
Wire Wire Line
	6500 1350 6700 1350
Wire Wire Line
	6500 1250 6700 1250
Entry Wire Line
	8450 1450 8550 1350
Entry Wire Line
	8550 1450 8450 1550
Entry Wire Line
	8450 1650 8550 1550
Entry Wire Line
	8450 1750 8550 1650
Entry Wire Line
	8450 1950 8550 1850
Entry Wire Line
	6400 1150 6500 1250
Entry Wire Line
	6400 1250 6500 1350
Entry Wire Line
	6400 1350 6500 1450
Entry Wire Line
	6400 1450 6500 1550
Entry Wire Line
	6400 1550 6500 1650
Entry Wire Line
	6400 1650 6500 1750
Entry Wire Line
	6400 1750 6500 1850
Entry Wire Line
	6400 1850 6500 1950
Entry Wire Line
	6400 1950 6500 2050
Entry Wire Line
	6400 2050 6500 2150
Wire Bus Line
	6400 650  8550 650 
Text GLabel 9000 2650 3    50   Input ~ 0
GND
Wire Wire Line
	9000 2650 9000 2550
Wire Wire Line
	9000 2550 9100 2550
Text GLabel 10200 900  1    50   Input ~ 0
+5V
Wire Wire Line
	10200 900  10200 1000
Wire Wire Line
	10200 1250 10100 1250
Text GLabel 10350 1150 1    50   Input ~ 0
~WR
Wire Wire Line
	10350 1150 10350 1350
Wire Wire Line
	10350 1350 10100 1350
Text GLabel 10500 1150 1    50   Input ~ 0
~RD
Text GLabel 10650 1150 1    50   Input ~ 0
ROM_~CS
Wire Wire Line
	10650 1150 10650 2050
Wire Wire Line
	10650 2050 10100 2050
Wire Wire Line
	10500 1150 10500 1850
Wire Wire Line
	10500 1850 10100 1850
Text Label 8900 2250 0    50   ~ 0
d0
Text Label 8900 2350 0    50   ~ 0
d1
Text Label 8900 2450 0    50   ~ 0
d2
Entry Wire Line
	8800 2350 8900 2250
Entry Wire Line
	8800 2450 8900 2350
Entry Wire Line
	8800 2550 8900 2450
Text Label 10300 2550 2    50   ~ 0
d3
Text Label 10300 2450 2    50   ~ 0
d4
Text Label 10300 2350 2    50   ~ 0
d5
Text Label 10300 2250 2    50   ~ 0
d6
Text Label 10300 2150 2    50   ~ 0
d7
Wire Wire Line
	8900 2250 9100 2250
Wire Wire Line
	8900 2350 9100 2350
Wire Wire Line
	8900 2450 9100 2450
Wire Wire Line
	10100 2550 10300 2550
Wire Wire Line
	10100 2450 10300 2450
Wire Wire Line
	10100 2350 10300 2350
Wire Wire Line
	10100 2250 10300 2250
Wire Wire Line
	10100 2150 10300 2150
Entry Wire Line
	10300 2150 10400 2250
Entry Wire Line
	10300 2250 10400 2350
Entry Wire Line
	10300 2350 10400 2450
Entry Wire Line
	10300 2450 10400 2550
Entry Wire Line
	10300 2550 10400 2650
Wire Bus Line
	8800 2950 10400 2950
Text Label 8900 2150 0    50   ~ 0
a0
Text Label 8900 2050 0    50   ~ 0
a1
Text Label 8900 1950 0    50   ~ 0
a2
Text Label 8900 1850 0    50   ~ 0
a3
Text Label 8900 1750 0    50   ~ 0
a4
Text Label 8900 1650 0    50   ~ 0
a5
Text Label 8900 1550 0    50   ~ 0
a6
Text Label 8900 1450 0    50   ~ 0
a7
Text Label 8900 1350 0    50   ~ 0
a12
Text Label 8900 1250 0    50   ~ 0
a14
Text Label 10850 1450 2    50   ~ 0
a13
Text Label 10850 1550 2    50   ~ 0
a8
Text Label 10850 1650 2    50   ~ 0
a9
Text Label 10850 1750 2    50   ~ 0
a11
Text Label 10850 1950 2    50   ~ 0
a10
Wire Wire Line
	10100 1950 10850 1950
Wire Wire Line
	10100 1750 10850 1750
Wire Wire Line
	10100 1650 10850 1650
Wire Wire Line
	10100 1550 10850 1550
Wire Wire Line
	10100 1450 10850 1450
Wire Wire Line
	8900 2150 9100 2150
Wire Wire Line
	8900 2050 9100 2050
Wire Wire Line
	8900 1950 9100 1950
Wire Wire Line
	8900 1850 9100 1850
Wire Wire Line
	8900 1750 9100 1750
Wire Wire Line
	8900 1650 9100 1650
Wire Wire Line
	8900 1550 9100 1550
Wire Wire Line
	8900 1450 9100 1450
Wire Wire Line
	8900 1350 9100 1350
Wire Wire Line
	8900 1250 9100 1250
Entry Wire Line
	10850 1450 10950 1350
Entry Wire Line
	10950 1450 10850 1550
Entry Wire Line
	10850 1650 10950 1550
Entry Wire Line
	10850 1750 10950 1650
Entry Wire Line
	10850 1950 10950 1850
Entry Wire Line
	8800 1150 8900 1250
Entry Wire Line
	8800 1250 8900 1350
Entry Wire Line
	8800 1350 8900 1450
Entry Wire Line
	8800 1450 8900 1550
Entry Wire Line
	8800 1550 8900 1650
Entry Wire Line
	8800 1650 8900 1750
Entry Wire Line
	8800 1750 8900 1850
Entry Wire Line
	8800 1850 8900 1950
Entry Wire Line
	8800 1950 8900 2050
Entry Wire Line
	8800 2050 8900 2150
Wire Bus Line
	8800 650  10950 650 
$Comp
L 6502:62256 U2
U 1 1 5FD9D8A1
P 7200 1900
AR Path="/5FD9D8A1" Ref="U2"  Part="1" 
AR Path="/5FE5FF2A/5FD9D8A1" Ref="U?"  Part="1" 
F 0 "U2" H 7200 2000 50  0000 C CNN
F 1 "71256" H 7200 1900 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm_Socket" H 7150 2700 50  0001 C CNN
F 3 "" H 7200 1900 50  0001 C CNN
	1    7200 1900
	1    0    0    -1  
$EndComp
$Comp
L 6502:62256 U1
U 1 1 5FD9D8A7
P 4850 1900
AR Path="/5FD9D8A7" Ref="U1"  Part="1" 
AR Path="/5FE5FF2A/5FD9D8A7" Ref="U?"  Part="1" 
F 0 "U1" H 4850 2000 50  0000 C CNN
F 1 "71256" H 4850 1900 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm_Socket" H 4800 2700 50  0001 C CNN
F 3 "" H 4850 1900 50  0001 C CNN
	1    4850 1900
	1    0    0    -1  
$EndComp
$Comp
L 6502:28C256 U3
U 1 1 5FD9D8AD
P 9600 1900
AR Path="/5FD9D8AD" Ref="U3"  Part="1" 
AR Path="/5FE5FF2A/5FD9D8AD" Ref="U?"  Part="1" 
F 0 "U3" H 9600 2000 50  0000 C CNN
F 1 "28C256" H 9600 1900 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 9550 2700 50  0001 C CNN
F 3 "" H 9600 1900 50  0001 C CNN
	1    9600 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5FD9D8B3
P 5250 1000
AR Path="/5FD9D8B3" Ref="C1"  Part="1" 
AR Path="/5FE5FF2A/5FD9D8B3" Ref="C?"  Part="1" 
F 0 "C1" V 5021 1000 50  0000 C CNN
F 1 "0,1uF" V 5112 1000 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5250 1000 50  0001 C CNN
F 3 "~" H 5250 1000 50  0001 C CNN
	1    5250 1000
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 1000 5450 1000
Connection ~ 5450 1000
Wire Wire Line
	5450 1000 5450 1250
Text GLabel 5050 1000 0    50   Input ~ 0
GND
Wire Wire Line
	5050 1000 5150 1000
$Comp
L Device:C_Small C2
U 1 1 5FD9D8BE
P 7600 1000
AR Path="/5FD9D8BE" Ref="C2"  Part="1" 
AR Path="/5FE5FF2A/5FD9D8BE" Ref="C?"  Part="1" 
F 0 "C2" V 7371 1000 50  0000 C CNN
F 1 "0,1uF" V 7462 1000 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7600 1000 50  0001 C CNN
F 3 "~" H 7600 1000 50  0001 C CNN
	1    7600 1000
	0    1    1    0   
$EndComp
Text GLabel 7400 1000 0    50   Input ~ 0
GND
Wire Wire Line
	7400 1000 7500 1000
$Comp
L Device:C_Small C3
U 1 1 5FD9D8C6
P 10000 1000
AR Path="/5FD9D8C6" Ref="C3"  Part="1" 
AR Path="/5FE5FF2A/5FD9D8C6" Ref="C?"  Part="1" 
F 0 "C3" V 9771 1000 50  0000 C CNN
F 1 "0,1uF" V 9862 1000 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 10000 1000 50  0001 C CNN
F 3 "~" H 10000 1000 50  0001 C CNN
	1    10000 1000
	0    1    1    0   
$EndComp
Text GLabel 9800 1000 0    50   Input ~ 0
GND
Wire Wire Line
	9800 1000 9900 1000
Wire Wire Line
	7700 1000 7800 1000
Connection ~ 7800 1000
Wire Wire Line
	7800 1000 7800 1250
Wire Wire Line
	10100 1000 10200 1000
Connection ~ 10200 1000
Wire Wire Line
	10200 1000 10200 1250
$Comp
L Connector:TestPoint TP1
U 1 1 60966778
P 4500 5150
F 0 "TP1" H 4500 5450 50  0000 L CNN
F 1 "TestPoint" H 4500 5350 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5005-5009_Compact" H 4700 5150 50  0001 C CNN
F 3 "~" H 4700 5150 50  0001 C CNN
	1    4500 5150
	1    0    0    -1  
$EndComp
Text GLabel 4500 5250 3    50   Input ~ 0
GND
Wire Wire Line
	4500 5250 4500 5150
$Sheet
S 9600 5950 750  350 
U 618DD0B9
F0 "control" 50
F1 "control.sch" 50
$EndSheet
Text GLabel 1900 4300 0    50   Input ~ 0
6502_RDY
$Comp
L Device:R R1
U 1 1 61F290B3
P 2350 4200
AR Path="/61F290B3" Ref="R1"  Part="1" 
AR Path="/618DD0B9/61F290B3" Ref="R?"  Part="1" 
F 0 "R1" V 2250 4200 50  0000 C CNN
F 1 "470" V 2350 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 2280 4200 50  0001 C CNN
F 3 "~" H 2350 4200 50  0001 C CNN
	1    2350 4200
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61F290B9
P 2350 4400
AR Path="/5F8F4E1E/61F290B9" Ref="C?"  Part="1" 
AR Path="/61F290B9" Ref="C5"  Part="1" 
AR Path="/618DD0B9/61F290B9" Ref="C?"  Part="1" 
F 0 "C5" V 2500 4400 50  0000 C CNN
F 1 "22pF" V 2600 4400 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 2350 4400 50  0001 C CNN
F 3 "~" H 2350 4400 50  0001 C CNN
	1    2350 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 4300 2100 4200
Wire Wire Line
	2100 4200 2200 4200
Wire Wire Line
	2100 4300 2100 4400
Wire Wire Line
	2100 4400 2250 4400
Connection ~ 2100 4300
Wire Wire Line
	2500 4200 2600 4200
Wire Wire Line
	2600 4200 2600 4300
Wire Wire Line
	2600 4400 2450 4400
Text GLabel 2800 4300 2    50   Output ~ 0
6502_RDY_IN
Connection ~ 2600 4300
Wire Wire Line
	2600 4300 2600 4400
Wire Wire Line
	1900 4300 2100 4300
Wire Wire Line
	2600 4300 2800 4300
Wire Bus Line
	4050 2350 4050 2950
Wire Bus Line
	6400 2350 6400 2950
Wire Bus Line
	8800 2350 8800 2950
Wire Bus Line
	10950 650  10950 1850
Wire Bus Line
	10400 2250 10400 2950
Wire Bus Line
	8550 650  8550 1850
Wire Bus Line
	8000 2250 8000 2950
Wire Bus Line
	6200 650  6200 1850
Wire Bus Line
	5650 2250 5650 2950
Wire Bus Line
	3200 2850 3200 3550
Wire Bus Line
	3200 2050 3200 2750
Wire Bus Line
	8800 650  8800 2050
Wire Bus Line
	6400 650  6400 2050
Wire Bus Line
	4050 650  4050 2050
Wire Bus Line
	1600 2150 1600 3400
$EndSCHEMATC
