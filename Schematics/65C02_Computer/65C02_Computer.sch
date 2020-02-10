EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "65C02 Hobby Computer"
Date "2020-02-03"
Rev "v001"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Based on Ben Eater's design"
Comment4 "Author: Dawid Buchwald"
$EndDescr
Text GLabel 1200 1000 1    50   Input ~ 0
~IRQ
Wire Wire Line
	1200 1000 1200 1400
Text GLabel 2550 1000 1    50   Input ~ 0
CLK
Wire Wire Line
	2550 1400 2300 1400
Text GLabel 2400 3150 3    50   Input ~ 0
GND
Text Label 1100 1900 0    50   ~ 0
a0
Text Label 1100 2000 0    50   ~ 0
a1
Text Label 1100 2100 0    50   ~ 0
a2
Text Label 1100 2200 0    50   ~ 0
a3
Text Label 1100 2300 0    50   ~ 0
a4
Text Label 1100 2400 0    50   ~ 0
a5
Text Label 1100 2500 0    50   ~ 0
a6
Text Label 1100 2600 0    50   ~ 0
a7
Text Label 1100 2700 0    50   ~ 0
a8
Text Label 1100 2800 0    50   ~ 0
a9
Text Label 1100 2900 0    50   ~ 0
a10
Text Label 1100 3000 0    50   ~ 0
a11
Text Label 2500 2900 2    50   ~ 0
a12
Text Label 2500 2800 2    50   ~ 0
a13
Text Label 2500 2700 2    50   ~ 0
a14
Text Label 2500 2600 2    50   ~ 0
a15
Text Label 2500 2500 2    50   ~ 0
d7
Text Label 2500 2400 2    50   ~ 0
d6
Text Label 2500 2300 2    50   ~ 0
d5
Text Label 2500 2200 2    50   ~ 0
d4
Text Label 2500 2100 2    50   ~ 0
d3
Text Label 2500 2000 2    50   ~ 0
d2
Text Label 2500 1900 2    50   ~ 0
d1
Text Label 2500 1800 2    50   ~ 0
d0
Wire Wire Line
	1300 1900 1100 1900
Wire Wire Line
	1300 2000 1100 2000
Wire Wire Line
	1300 2100 1100 2100
Wire Wire Line
	1300 2200 1100 2200
Wire Wire Line
	1300 2300 1100 2300
Wire Wire Line
	1300 2400 1100 2400
Wire Wire Line
	1300 2500 1100 2500
Wire Wire Line
	1300 2600 1100 2600
Wire Wire Line
	1300 2700 1100 2700
Wire Wire Line
	1300 2800 1100 2800
Wire Wire Line
	1300 2900 1100 2900
Wire Wire Line
	1300 3000 1100 3000
Wire Wire Line
	2300 2900 2500 2900
Wire Wire Line
	2300 2800 2500 2800
Wire Wire Line
	2300 2700 2500 2700
Wire Wire Line
	2300 2600 2500 2600
Wire Wire Line
	2300 2500 2500 2500
Wire Wire Line
	2300 2400 2500 2400
Wire Wire Line
	2300 2300 2500 2300
Wire Wire Line
	2300 2200 2500 2200
Wire Wire Line
	2300 2100 2500 2100
Wire Wire Line
	2300 2000 2500 2000
Wire Wire Line
	2300 1900 2500 1900
Wire Wire Line
	2300 1800 2500 1800
Text GLabel 2700 1000 1    50   Input ~ 0
R~W
Wire Wire Line
	2700 1700 2300 1700
NoConn ~ 2300 1200
NoConn ~ 1300 1700
NoConn ~ 1300 1500
NoConn ~ 1300 1300
Wire Wire Line
	1300 1600 1150 1600
Wire Wire Line
	1300 1200 1150 1200
Wire Wire Line
	850  1600 750  1600
Wire Wire Line
	750  1600 750  1200
Wire Wire Line
	750  1200 850  1200
Wire Wire Line
	750  1000 750  1200
Connection ~ 750  1200
Text GLabel 750  1000 1    50   Input ~ 0
+5V
Text GLabel 2400 1000 1    50   Input ~ 0
~RES
Wire Wire Line
	2400 1100 2300 1100
Wire Wire Line
	2300 3000 2400 3000
Wire Wire Line
	2400 3000 2400 3150
Entry Wire Line
	1000 2000 1100 1900
Entry Wire Line
	1000 2100 1100 2000
Entry Wire Line
	1000 2200 1100 2100
Entry Wire Line
	1000 2300 1100 2200
Entry Wire Line
	1000 2400 1100 2300
Entry Wire Line
	1000 2500 1100 2400
Entry Wire Line
	1000 2600 1100 2500
Entry Wire Line
	1000 2700 1100 2600
Entry Wire Line
	1000 2800 1100 2700
Entry Wire Line
	1000 2900 1100 2800
Entry Wire Line
	1000 3000 1100 2900
Entry Wire Line
	1000 3100 1100 3000
Entry Wire Line
	2500 2900 2600 3000
Entry Wire Line
	2500 2800 2600 2900
Entry Wire Line
	2500 2700 2600 2800
Entry Wire Line
	2500 2600 2600 2700
Entry Wire Line
	2500 1800 2600 1900
Entry Wire Line
	2500 1900 2600 2000
Entry Wire Line
	2500 2000 2600 2100
Entry Wire Line
	2500 2100 2600 2200
Entry Wire Line
	2500 2200 2600 2300
Entry Wire Line
	2500 2300 2600 2400
Entry Wire Line
	2500 2400 2600 2500
Entry Wire Line
	2500 2500 2600 2600
NoConn ~ 1300 1100
Wire Wire Line
	10150 3500 10150 3550
Text GLabel 10250 3150 2    50   Output ~ 0
+5V
Text GLabel 10250 3550 2    50   Output ~ 0
GND
Wire Wire Line
	10150 3550 10250 3550
Connection ~ 10150 3550
Wire Wire Line
	10150 3150 10250 3150
Connection ~ 10150 3150
Wire Wire Line
	10150 3150 10150 3200
Wire Wire Line
	750  1800 750  1600
Wire Wire Line
	750  1800 1300 1800
Connection ~ 750  1600
Wire Wire Line
	1200 1400 1300 1400
Wire Wire Line
	2700 1700 2700 1000
Wire Wire Line
	2550 1400 2550 1000
Wire Wire Line
	2400 1100 2400 1000
Text GLabel 3400 3700 3    50   Input ~ 0
GND
Text GLabel 3400 2900 1    50   Input ~ 0
+5V
Wire Wire Line
	3400 3600 3400 3700
Wire Wire Line
	3400 3000 3400 2900
Text GLabel 3800 3300 2    50   Output ~ 0
CLKOUT
Wire Wire Line
	3700 3300 3800 3300
Wire Wire Line
	4300 2000 4400 2000
Text Label 3400 1300 0    50   ~ 0
a15
Wire Wire Line
	3700 1400 3600 1400
Wire Wire Line
	3600 1400 3600 1300
Wire Wire Line
	3600 1200 3700 1200
Wire Wire Line
	3400 1300 3600 1300
Connection ~ 3600 1300
Wire Wire Line
	3600 1300 3600 1200
Text Label 3400 1900 0    50   ~ 0
a14
Text Label 3400 2100 0    50   ~ 0
a13
Wire Wire Line
	3700 1900 3400 1900
Wire Wire Line
	4300 1300 4400 1300
Text GLabel 4400 1500 0    50   Input ~ 0
CLK
Wire Wire Line
	4400 1500 4500 1500
Entry Wire Line
	3300 2000 3400 1900
Entry Wire Line
	3300 2200 3400 2100
Entry Wire Line
	3300 1400 3400 1300
Text GLabel 5200 2100 2    50   Output ~ 0
~IOCS
Wire Wire Line
	5100 2100 5200 2100
Text GLabel 5200 1400 2    50   Output ~ 0
~RAM_CS
Wire Wire Line
	5100 1400 5200 1400
Text GLabel 5200 1700 2    50   Output ~ 0
~ROM_CS
Wire Wire Line
	4400 2000 4400 1700
Wire Wire Line
	4400 1700 5200 1700
Connection ~ 4400 2000
Wire Wire Line
	4400 2000 4500 2000
Text GLabel 5200 1000 2    50   Output ~ 0
~ROM_OE
Wire Wire Line
	5200 1000 4400 1000
Wire Wire Line
	4400 1000 4400 1300
Connection ~ 4400 1300
Wire Wire Line
	4400 1300 4500 1300
$Comp
L 74xx:74HC02 U?
U 2 1 5E1744DD
P 4000 2000
F 0 "U?" H 4000 2325 50  0000 C CNN
F 1 "74HC02" H 4000 2234 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4000 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc02" H 4000 2000 50  0001 C CNN
	2    4000 2000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 3 1 5E171DC1
P 4800 2100
F 0 "U?" H 4800 2425 50  0000 C CNN
F 1 "74HC00" H 4800 2334 50  0000 C CNN
F 2 "" H 4800 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4800 2100 50  0001 C CNN
	3    4800 2100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 2 1 5E16FD0A
P 4800 1400
F 0 "U?" H 4800 1725 50  0000 C CNN
F 1 "74HC00" H 4800 1634 50  0000 C CNN
F 2 "" H 4800 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4800 1400 50  0001 C CNN
	2    4800 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 1 1 5E16D50B
P 4000 1300
F 0 "U?" H 4000 1625 50  0000 C CNN
F 1 "74HC00" H 4000 1534 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4000 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4000 1300 50  0001 C CNN
	1    4000 1300
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 5E1CCFB4
P 3400 3300
F 0 "X?" H 3150 3350 50  0000 R CNN
F 1 "1MHz" H 3150 3250 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 3850 2950 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 3300 3300 50  0001 C CNN
	1    3400 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E15B54A
P 10150 3350
F 0 "C?" H 10265 3396 50  0000 L CNN
F 1 "0.1uF" H 10265 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 10188 3200 50  0001 C CNN
F 3 "~" H 10150 3350 50  0001 C CNN
	1    10150 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5E15AF3A
P 6100 3600
F 0 "#PWR0101" H 6100 3350 50  0001 C CNN
F 1 "GND" H 6105 3427 50  0000 C CNN
F 2 "" H 6100 3600 50  0001 C CNN
F 3 "" H 6100 3600 50  0001 C CNN
	1    6100 3600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5E15AAC6
P 6100 3100
F 0 "#PWR0102" H 6100 2950 50  0001 C CNN
F 1 "+5V" H 6115 3273 50  0000 C CNN
F 2 "" H 6100 3100 50  0001 C CNN
F 3 "" H 6100 3100 50  0001 C CNN
	1    6100 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E14ABB7
P 1000 1600
F 0 "R?" V 900 1600 50  0000 C CNN
F 1 "3K3" V 1000 1600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 930 1600 50  0001 C CNN
F 3 "~" H 1000 1600 50  0001 C CNN
	1    1000 1600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E14A45B
P 1000 1200
F 0 "R?" V 900 1200 50  0000 C CNN
F 1 "3K3" V 1000 1200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 930 1200 50  0001 C CNN
F 3 "~" H 1000 1200 50  0001 C CNN
	1    1000 1200
	0    1    1    0   
$EndComp
$Comp
L 6502:65C02S U?
U 1 1 5E135500
P 1800 2000
F 0 "U?" H 1800 3150 50  0000 C CNN
F 1 "65C02S" H 1800 3050 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 1650 2950 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c02s.pdf" H 1650 2950 50  0001 C CNN
	1    1800 2000
	1    0    0    -1  
$EndComp
$Comp
L 6502:28C256 U?
U 1 1 5E3D4005
P 1550 5000
F 0 "U?" H 1550 5915 50  0000 C CNN
F 1 "28C256" H 1550 5824 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 1500 5800 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 1550 5000 50  0001 C CNN
	1    1550 5000
	1    0    0    -1  
$EndComp
Text GLabel 2150 4250 1    50   Input ~ 0
+5V
Text GLabel 2300 4250 1    50   Input ~ 0
~ROM_OE
Text GLabel 2450 4250 1    50   Input ~ 0
~ROM_CS
Wire Wire Line
	2150 4250 2150 4350
Wire Wire Line
	2150 4350 2050 4350
Wire Wire Line
	2050 4450 2150 4450
Wire Wire Line
	2150 4450 2150 4350
Connection ~ 2150 4350
Wire Wire Line
	2300 4250 2300 4950
Wire Wire Line
	2300 4950 2050 4950
Wire Wire Line
	2450 4250 2450 5150
Wire Wire Line
	2450 5150 2050 5150
Text Label 2200 5250 2    50   ~ 0
d7
Text Label 2200 5350 2    50   ~ 0
d6
Text Label 2200 5450 2    50   ~ 0
d5
Text Label 2200 5550 2    50   ~ 0
d4
Text Label 2200 5650 2    50   ~ 0
d3
Wire Wire Line
	2050 5650 2200 5650
Wire Wire Line
	2050 5550 2200 5550
Wire Wire Line
	2050 5450 2200 5450
Wire Wire Line
	2050 5350 2200 5350
Wire Wire Line
	2050 5250 2200 5250
Text GLabel 950  5750 3    50   Input ~ 0
GND
Wire Wire Line
	950  5750 950  5650
Wire Wire Line
	950  5650 1050 5650
Text Label 900  5550 0    50   ~ 0
d2
Text Label 900  5450 0    50   ~ 0
d1
Text Label 900  5350 0    50   ~ 0
d0
Wire Wire Line
	900  5350 1050 5350
Wire Wire Line
	900  5450 1050 5450
Wire Wire Line
	900  5550 1050 5550
Entry Wire Line
	2200 5250 2300 5350
Entry Wire Line
	2200 5350 2300 5450
Entry Wire Line
	2200 5450 2300 5550
Entry Wire Line
	2200 5550 2300 5650
Entry Wire Line
	2200 5650 2300 5750
Entry Wire Line
	800  5650 900  5550
Entry Wire Line
	800  5550 900  5450
Entry Wire Line
	800  5450 900  5350
Text Label 900  4350 0    50   ~ 0
a14
Text Label 900  4450 0    50   ~ 0
a12
Text Label 900  4550 0    50   ~ 0
a7
Text Label 900  4650 0    50   ~ 0
a6
Text Label 900  4750 0    50   ~ 0
a5
Text Label 900  4850 0    50   ~ 0
a4
Text Label 900  4950 0    50   ~ 0
a3
Text Label 900  5050 0    50   ~ 0
a2
Text Label 900  5150 0    50   ~ 0
a1
Text Label 900  5250 0    50   ~ 0
a0
Text Label 2600 4550 2    50   ~ 0
a13
Text Label 2600 4650 2    50   ~ 0
a8
Text Label 2600 4750 2    50   ~ 0
a9
Text Label 2600 4850 2    50   ~ 0
a11
Text Label 2600 5050 2    50   ~ 0
a10
Wire Wire Line
	2050 4550 2600 4550
Wire Wire Line
	2050 4650 2600 4650
Wire Wire Line
	2050 4750 2600 4750
Wire Wire Line
	2050 4850 2600 4850
Wire Wire Line
	2050 5050 2600 5050
Wire Wire Line
	1050 4350 900  4350
Wire Wire Line
	1050 4450 900  4450
Wire Wire Line
	1050 4550 900  4550
Wire Wire Line
	1050 4650 900  4650
Wire Wire Line
	1050 4750 900  4750
Wire Wire Line
	1050 4850 900  4850
Wire Wire Line
	1050 4950 900  4950
Wire Wire Line
	1050 5050 900  5050
Wire Wire Line
	1050 5150 900  5150
Wire Wire Line
	1050 5250 900  5250
Entry Wire Line
	800  4250 900  4350
Entry Wire Line
	800  4350 900  4450
Entry Wire Line
	800  4450 900  4550
Entry Wire Line
	800  4550 900  4650
Entry Wire Line
	800  4650 900  4750
Entry Wire Line
	800  4750 900  4850
Entry Wire Line
	800  4850 900  4950
Entry Wire Line
	800  4950 900  5050
Entry Wire Line
	800  5050 900  5150
Entry Wire Line
	800  5150 900  5250
Entry Wire Line
	2600 4550 2700 4650
Entry Wire Line
	2600 4650 2700 4750
Entry Wire Line
	2600 4750 2700 4850
Entry Wire Line
	2600 4850 2700 4950
Entry Wire Line
	2600 5050 2700 5150
$Comp
L 6502:62256 U?
U 1 1 5E37B16A
P 3850 5000
F 0 "U?" H 3850 5915 50  0000 C CNN
F 1 "62256" H 3850 5824 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 3800 5800 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 3850 5000 50  0001 C CNN
	1    3850 5000
	1    0    0    -1  
$EndComp
Text GLabel 4450 4250 1    50   Input ~ 0
+5V
Wire Wire Line
	4450 4250 4450 4350
Wire Wire Line
	4450 4350 4350 4350
Wire Wire Line
	4750 4250 4750 4950
Wire Wire Line
	4750 4950 4350 4950
Text Label 4500 5250 2    50   ~ 0
d7
Text Label 4500 5350 2    50   ~ 0
d6
Text Label 4500 5450 2    50   ~ 0
d5
Text Label 4500 5550 2    50   ~ 0
d4
Text Label 4500 5650 2    50   ~ 0
d3
Wire Wire Line
	4350 5650 4500 5650
Wire Wire Line
	4350 5550 4500 5550
Wire Wire Line
	4350 5450 4500 5450
Wire Wire Line
	4350 5350 4500 5350
Wire Wire Line
	4350 5250 4500 5250
Text GLabel 3250 5750 3    50   Input ~ 0
GND
Wire Wire Line
	3250 5750 3250 5650
Wire Wire Line
	3250 5650 3350 5650
Text Label 3200 5550 0    50   ~ 0
d2
Text Label 3200 5450 0    50   ~ 0
d1
Text Label 3200 5350 0    50   ~ 0
d0
Wire Wire Line
	3200 5350 3350 5350
Wire Wire Line
	3200 5450 3350 5450
Wire Wire Line
	3200 5550 3350 5550
Entry Wire Line
	4500 5250 4600 5350
Entry Wire Line
	4500 5350 4600 5450
Entry Wire Line
	4500 5450 4600 5550
Entry Wire Line
	4500 5550 4600 5650
Entry Wire Line
	4500 5650 4600 5750
Entry Wire Line
	3100 5650 3200 5550
Entry Wire Line
	3100 5550 3200 5450
Entry Wire Line
	3100 5450 3200 5350
Text Label 3200 4350 0    50   ~ 0
a14
Text Label 3200 4450 0    50   ~ 0
a12
Text Label 3200 4550 0    50   ~ 0
a7
Text Label 3200 4650 0    50   ~ 0
a6
Text Label 3200 4750 0    50   ~ 0
a5
Text Label 3200 4850 0    50   ~ 0
a4
Text Label 3200 4950 0    50   ~ 0
a3
Text Label 3200 5050 0    50   ~ 0
a2
Text Label 3200 5150 0    50   ~ 0
a1
Text Label 3200 5250 0    50   ~ 0
a0
Wire Wire Line
	3350 4350 3200 4350
Wire Wire Line
	3350 4450 3200 4450
Wire Wire Line
	3350 4550 3200 4550
Wire Wire Line
	3350 4650 3200 4650
Wire Wire Line
	3350 4750 3200 4750
Wire Wire Line
	3350 4850 3200 4850
Wire Wire Line
	3350 4950 3200 4950
Wire Wire Line
	3350 5050 3200 5050
Wire Wire Line
	3350 5150 3200 5150
Wire Wire Line
	3350 5250 3200 5250
Entry Wire Line
	3100 4250 3200 4350
Entry Wire Line
	3100 4350 3200 4450
Entry Wire Line
	3100 4450 3200 4550
Entry Wire Line
	3100 4550 3200 4650
Entry Wire Line
	3100 4650 3200 4750
Entry Wire Line
	3100 4750 3200 4850
Entry Wire Line
	3100 4850 3200 4950
Entry Wire Line
	3100 4950 3200 5050
Entry Wire Line
	3100 5050 3200 5150
Entry Wire Line
	3100 5150 3200 5250
Text GLabel 4750 4250 1    50   Input ~ 0
~RAM_CS
Entry Wire Line
	4900 5050 5000 5150
Entry Wire Line
	4900 4850 5000 4950
Entry Wire Line
	4900 4750 5000 4850
Entry Wire Line
	4900 4650 5000 4750
Entry Wire Line
	4900 4550 5000 4650
Wire Wire Line
	4350 5050 4900 5050
Text Label 4900 5050 2    50   ~ 0
a10
Wire Wire Line
	4350 4850 4900 4850
Text Label 4900 4850 2    50   ~ 0
a11
Wire Wire Line
	4350 4750 4900 4750
Text Label 4900 4750 2    50   ~ 0
a9
Wire Wire Line
	4350 4650 4900 4650
Text Label 4900 4650 2    50   ~ 0
a8
Wire Wire Line
	4350 4550 4900 4550
Text Label 4900 4550 2    50   ~ 0
a13
Wire Wire Line
	4750 4950 4750 5150
Wire Wire Line
	4750 5150 4350 5150
Connection ~ 4750 4950
Text GLabel 4600 4250 1    50   Input ~ 0
R~W
Wire Wire Line
	4600 4450 4600 4250
Wire Wire Line
	4350 4450 4600 4450
$Comp
L Timer:NE555 U?
U 1 1 5E17C676
P 7450 1700
F 0 "U?" H 7450 1750 50  0000 C CNN
F 1 "NE555" H 7450 1650 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 7450 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne555.pdf" H 7450 1700 50  0001 C CNN
	1    7450 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1900 6850 1900
Wire Wire Line
	7450 2100 7450 2400
Wire Wire Line
	7950 1700 8050 1700
Wire Wire Line
	8050 1700 8050 1900
Wire Wire Line
	8050 1900 7950 1900
$Comp
L Device:R R?
U 1 1 5E1F5B26
P 8050 1250
F 0 "R?" V 7950 1250 50  0000 C CNN
F 1 "47K" V 8050 1250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7980 1250 50  0001 C CNN
F 3 "~" H 8050 1250 50  0001 C CNN
	1    8050 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5E2337BD
P 8050 2150
F 0 "C?" H 8168 2196 50  0000 L CNN
F 1 "10uF" H 8168 2105 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 8088 2000 50  0001 C CNN
F 3 "~" H 8050 2150 50  0001 C CNN
	1    8050 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 2000 8050 1900
Connection ~ 8050 1900
Wire Wire Line
	8050 2300 8050 2400
Wire Wire Line
	8050 2400 7450 2400
Connection ~ 7450 2400
NoConn ~ 6950 1700
$Comp
L Switch:SW_Push SW?
U 1 1 5E2CBD4E
P 6550 1950
F 0 "SW?" V 6600 2250 50  0000 R CNN
F 1 "RESET" V 6500 2300 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 6550 2150 50  0001 C CNN
F 3 "~" H 6550 2150 50  0001 C CNN
	1    6550 1950
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E2ECA64
P 6700 2150
F 0 "C?" H 6815 2196 50  0000 L CNN
F 1 "0.1uF" H 6815 2105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 6738 2000 50  0001 C CNN
F 3 "~" H 6700 2150 50  0001 C CNN
	1    6700 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2150 6550 2400
Wire Wire Line
	6550 2400 6700 2400
Wire Wire Line
	6700 2300 6700 2400
Connection ~ 6700 2400
Wire Wire Line
	6700 2400 7450 2400
Wire Wire Line
	6700 2000 6700 1500
Wire Wire Line
	6700 1500 6950 1500
Wire Wire Line
	6550 1750 6550 1500
Wire Wire Line
	6550 1500 6700 1500
Connection ~ 6700 1500
$Comp
L Device:R R?
U 1 1 5E3A85D8
P 6700 1250
F 0 "R?" V 6600 1250 50  0000 C CNN
F 1 "1M" V 6700 1250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6630 1250 50  0001 C CNN
F 3 "~" H 6700 1250 50  0001 C CNN
	1    6700 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1500 6700 1400
Wire Wire Line
	6700 1100 6700 1000
Wire Wire Line
	6700 1000 6850 1000
Wire Wire Line
	7950 1500 8150 1500
Text GLabel 9050 1500 2    50   Output ~ 0
~RES
Wire Wire Line
	8850 1500 8950 1500
$Comp
L Device:R R?
U 1 1 5E552FBE
P 8950 1250
F 0 "R?" V 8850 1250 50  0000 C CNN
F 1 "1K" V 8950 1250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8880 1250 50  0001 C CNN
F 3 "~" H 8950 1250 50  0001 C CNN
	1    8950 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1000 6850 1900
Wire Wire Line
	8050 1700 8050 1400
Connection ~ 8050 1700
Wire Wire Line
	8050 1100 8050 1000
Wire Wire Line
	8050 1000 7450 1000
Wire Wire Line
	6850 1000 7450 1000
Connection ~ 6850 1000
Connection ~ 7450 1000
Wire Wire Line
	8950 1100 8950 1000
Wire Wire Line
	8950 1000 8050 1000
Connection ~ 8050 1000
Wire Wire Line
	8950 1400 8950 1500
Connection ~ 8950 1500
Wire Wire Line
	8950 1500 9050 1500
Wire Wire Line
	7450 1300 7450 1000
Text GLabel 6050 1000 0    50   Input ~ 0
+5V
Connection ~ 6550 2400
Wire Wire Line
	6050 1000 6150 1000
Connection ~ 6700 1000
Wire Wire Line
	6000 2400 6150 2400
Text GLabel 6000 2400 0    50   Input ~ 0
GND
$Comp
L Device:C C?
U 1 1 5E7C431C
P 6150 1700
F 0 "C?" H 6265 1746 50  0000 L CNN
F 1 "0.1uF" H 6265 1655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 6188 1550 50  0001 C CNN
F 3 "~" H 6150 1700 50  0001 C CNN
	1    6150 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1850 6150 2400
Connection ~ 6150 2400
Wire Wire Line
	6150 2400 6550 2400
Wire Wire Line
	6150 1550 6150 1000
Connection ~ 6150 1000
Wire Wire Line
	6150 1000 6700 1000
Text GLabel 2850 1000 1    50   Input ~ 0
+5V
Wire Wire Line
	2300 1500 2850 1500
Wire Wire Line
	2850 1500 2850 1300
$Comp
L 74xx:74HC00 U?
U 4 1 5E218D59
P 8550 1500
F 0 "U?" H 8550 1825 50  0000 C CNN
F 1 "74HC00" H 8550 1734 50  0000 C CNN
F 2 "" H 8550 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 8550 1500 50  0001 C CNN
	4    8550 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 1400 8150 1400
Wire Wire Line
	8150 1400 8150 1500
Wire Wire Line
	8150 1600 8250 1600
Connection ~ 8150 1500
Wire Wire Line
	8150 1500 8150 1600
$Comp
L 74xx:74LS21 U?
U 1 1 5E23A6D1
P 8450 5300
F 0 "U?" H 8450 5675 50  0000 C CNN
F 1 "74HC21" H 8450 5584 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8450 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 8450 5300 50  0001 C CNN
	1    8450 5300
	1    0    0    -1  
$EndComp
Text GLabel 8050 5050 1    50   Input ~ 0
~V1IRQ
Text GLabel 7900 5050 1    50   Input ~ 0
~V2IRQ
Text GLabel 7750 5050 1    50   Input ~ 0
~AIRQ
Wire Wire Line
	8050 5050 8050 5150
Wire Wire Line
	8050 5150 8150 5150
Wire Wire Line
	7900 5050 7900 5250
Wire Wire Line
	7900 5250 8150 5250
Wire Wire Line
	7750 5050 7750 5350
Wire Wire Line
	7750 5350 8150 5350
Wire Wire Line
	7600 5050 7600 5450
Wire Wire Line
	7600 5450 8150 5450
Text GLabel 8850 5300 2    50   Output ~ 0
~IRQ
Wire Wire Line
	8750 5300 8850 5300
Wire Wire Line
	2300 1300 2850 1300
Connection ~ 2850 1300
Wire Wire Line
	2850 1300 2850 1000
$Comp
L Device:C C?
U 1 1 5E3E0FFB
P 9700 3350
F 0 "C?" H 9815 3396 50  0000 L CNN
F 1 "0.1uF" H 9815 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 9738 3200 50  0001 C CNN
F 3 "~" H 9700 3350 50  0001 C CNN
	1    9700 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3E14F5
P 9250 3350
F 0 "C?" H 9365 3396 50  0000 L CNN
F 1 "0.1uF" H 9365 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 9288 3200 50  0001 C CNN
F 3 "~" H 9250 3350 50  0001 C CNN
	1    9250 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3E1910
P 8800 3350
F 0 "C?" H 8915 3396 50  0000 L CNN
F 1 "0.1uF" H 8915 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 8838 3200 50  0001 C CNN
F 3 "~" H 8800 3350 50  0001 C CNN
	1    8800 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3E1BD5
P 8350 3350
F 0 "C?" H 8465 3396 50  0000 L CNN
F 1 "0.1uF" H 8465 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 8388 3200 50  0001 C CNN
F 3 "~" H 8350 3350 50  0001 C CNN
	1    8350 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3E1DA8
P 7900 3350
F 0 "C?" H 8015 3396 50  0000 L CNN
F 1 "0.1uF" H 8015 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 7938 3200 50  0001 C CNN
F 3 "~" H 7900 3350 50  0001 C CNN
	1    7900 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3E2103
P 7450 3350
F 0 "C?" H 7565 3396 50  0000 L CNN
F 1 "0.1uF" H 7565 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 7488 3200 50  0001 C CNN
F 3 "~" H 7450 3350 50  0001 C CNN
	1    7450 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3E2489
P 7000 3350
F 0 "C?" H 7115 3396 50  0000 L CNN
F 1 "0.1uF" H 7115 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 7038 3200 50  0001 C CNN
F 3 "~" H 7000 3350 50  0001 C CNN
	1    7000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3500 7000 3550
Wire Wire Line
	7000 3550 7450 3550
Wire Wire Line
	7450 3500 7450 3550
Connection ~ 7450 3550
Wire Wire Line
	7450 3550 7900 3550
Wire Wire Line
	7900 3500 7900 3550
Connection ~ 7900 3550
Wire Wire Line
	7900 3550 8350 3550
Wire Wire Line
	8350 3500 8350 3550
Connection ~ 8350 3550
Wire Wire Line
	8350 3550 8800 3550
Wire Wire Line
	8800 3500 8800 3550
Connection ~ 8800 3550
Wire Wire Line
	8800 3550 9250 3550
Wire Wire Line
	9250 3500 9250 3550
Connection ~ 9250 3550
Wire Wire Line
	9250 3550 9700 3550
Wire Wire Line
	9700 3500 9700 3550
Connection ~ 9700 3550
Wire Wire Line
	9700 3550 10150 3550
Wire Wire Line
	7000 3200 7000 3150
Wire Wire Line
	7000 3150 7450 3150
Wire Wire Line
	7450 3200 7450 3150
Connection ~ 7450 3150
Wire Wire Line
	7450 3150 7900 3150
Wire Wire Line
	7900 3200 7900 3150
Connection ~ 7900 3150
Wire Wire Line
	7900 3150 8350 3150
Wire Wire Line
	8350 3200 8350 3150
Connection ~ 8350 3150
Wire Wire Line
	8350 3150 8800 3150
Wire Wire Line
	8800 3200 8800 3150
Connection ~ 8800 3150
Wire Wire Line
	8800 3150 9250 3150
Wire Wire Line
	9250 3200 9250 3150
Connection ~ 9250 3150
Wire Wire Line
	9250 3150 9700 3150
Wire Wire Line
	9700 3200 9700 3150
Connection ~ 9700 3150
Wire Wire Line
	9700 3150 10150 3150
Connection ~ 7000 3550
Connection ~ 7000 3150
$Comp
L Device:C C?
U 1 1 5E6FCC42
P 6550 3350
F 0 "C?" H 6665 3396 50  0000 L CNN
F 1 "0.1uF" H 6665 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 6588 3200 50  0001 C CNN
F 3 "~" H 6550 3350 50  0001 C CNN
	1    6550 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E6FCFF5
P 6100 3350
F 0 "C?" H 6215 3396 50  0000 L CNN
F 1 "0.1uF" H 6215 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 6138 3200 50  0001 C CNN
F 3 "~" H 6100 3350 50  0001 C CNN
	1    6100 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3500 6100 3550
Wire Wire Line
	6100 3550 6550 3550
Wire Wire Line
	6550 3500 6550 3550
Connection ~ 6550 3550
Wire Wire Line
	6550 3550 7000 3550
Wire Wire Line
	7000 3150 6550 3150
Wire Wire Line
	6100 3150 6100 3200
Wire Wire Line
	6550 3200 6550 3150
Connection ~ 6550 3150
Wire Wire Line
	6550 3150 6100 3150
Wire Wire Line
	6100 3150 6100 3100
Connection ~ 6100 3150
Wire Wire Line
	6100 3550 6100 3600
Connection ~ 6100 3550
Text Notes 7600 3650 0    50   ~ 0
Bypass capacitors, one per IC
Entry Wire Line
	3300 2300 3400 2200
Wire Wire Line
	3400 2100 3700 2100
Wire Wire Line
	3400 2200 4500 2200
Text Label 3400 2200 0    50   ~ 0
a15
$Sheet
S 10150 5250 750  1100
U 5F14295C
F0 "6502 Peripherals" 50
F1 "6502_IO.sch" 50
$EndSheet
$Comp
L Connector_Generic:Conn_02x16_Top_Bottom J?
U 1 1 6003736A
P 5850 5050
AR Path="/5F14295C/6003736A" Ref="J?"  Part="1" 
AR Path="/6003736A" Ref="J?"  Part="1" 
F 0 "J?" H 5900 5967 50  0000 C CNN
F 1 "Conn_02x16_Top_Bottom" H 5900 5876 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x16_P2.54mm_Vertical" H 5850 5050 50  0001 C CNN
F 3 "~" H 5850 5050 50  0001 C CNN
	1    5850 5050
	1    0    0    -1  
$EndComp
Text Label 5450 4350 0    50   ~ 0
a0
Text Label 5450 4450 0    50   ~ 0
a1
Text Label 5450 4550 0    50   ~ 0
a2
Text Label 5450 4650 0    50   ~ 0
a3
Text Label 5450 4750 0    50   ~ 0
a4
Text Label 5450 4850 0    50   ~ 0
a5
Text Label 5450 4950 0    50   ~ 0
a6
Text Label 5450 5050 0    50   ~ 0
a7
Text Label 5450 5150 0    50   ~ 0
a8
Text Label 5450 5250 0    50   ~ 0
a9
Text Label 5450 5350 0    50   ~ 0
a10
Text Label 5450 5450 0    50   ~ 0
a11
Text Label 5450 5550 0    50   ~ 0
a12
Text Label 5450 5650 0    50   ~ 0
a13
Text Label 5450 5750 0    50   ~ 0
a14
Text Label 5450 5850 0    50   ~ 0
a15
Wire Wire Line
	5450 4350 5650 4350
Wire Wire Line
	5450 4450 5650 4450
Wire Wire Line
	5450 4550 5650 4550
Wire Wire Line
	5450 4650 5650 4650
Wire Wire Line
	5450 4750 5650 4750
Wire Wire Line
	5450 4850 5650 4850
Wire Wire Line
	5450 4950 5650 4950
Wire Wire Line
	5450 5050 5650 5050
Wire Wire Line
	5450 5150 5650 5150
Wire Wire Line
	5450 5250 5650 5250
Wire Wire Line
	5450 5350 5650 5350
Wire Wire Line
	5450 5450 5650 5450
Wire Wire Line
	5450 5550 5650 5550
Wire Wire Line
	5450 5650 5650 5650
Wire Wire Line
	5450 5750 5650 5750
Wire Wire Line
	5450 5850 5650 5850
Entry Wire Line
	5350 4250 5450 4350
Entry Wire Line
	5350 4350 5450 4450
Entry Wire Line
	5350 4450 5450 4550
Entry Wire Line
	5350 4550 5450 4650
Entry Wire Line
	5350 4650 5450 4750
Entry Wire Line
	5350 4750 5450 4850
Entry Wire Line
	5350 4850 5450 4950
Entry Wire Line
	5350 4950 5450 5050
Entry Wire Line
	5350 5050 5450 5150
Entry Wire Line
	5350 5150 5450 5250
Entry Wire Line
	5350 5250 5450 5350
Entry Wire Line
	5350 5350 5450 5450
Entry Wire Line
	5350 5450 5450 5550
Entry Wire Line
	5350 5550 5450 5650
Entry Wire Line
	5350 5650 5450 5750
Entry Wire Line
	5350 5750 5450 5850
Text Label 6350 4350 2    50   ~ 0
d0
Text Label 6350 4450 2    50   ~ 0
d1
Text Label 6350 4550 2    50   ~ 0
d2
Text Label 6350 4650 2    50   ~ 0
d3
Text Label 6350 4750 2    50   ~ 0
d4
Text Label 6350 4850 2    50   ~ 0
d5
Text Label 6350 4950 2    50   ~ 0
d6
Text Label 6350 5050 2    50   ~ 0
d7
Wire Wire Line
	6150 4350 6350 4350
Wire Wire Line
	6150 4450 6350 4450
Wire Wire Line
	6150 4550 6350 4550
Wire Wire Line
	6150 4650 6350 4650
Wire Wire Line
	6150 4750 6350 4750
Wire Wire Line
	6150 4850 6350 4850
Wire Wire Line
	6150 4950 6350 4950
Wire Wire Line
	6150 5050 6350 5050
Entry Wire Line
	6350 4350 6450 4250
Entry Wire Line
	6350 4450 6450 4350
Entry Wire Line
	6350 4550 6450 4450
Entry Wire Line
	6350 4650 6450 4550
Entry Wire Line
	6350 4750 6450 4650
Entry Wire Line
	6350 4850 6450 4750
Entry Wire Line
	6350 4950 6450 4850
Entry Wire Line
	6350 5050 6450 4950
Text GLabel 6550 5050 1    50   Input ~ 0
CLK
Text GLabel 6700 5050 1    50   Input ~ 0
R~W
Text GLabel 6350 5850 2    50   Input ~ 0
+5V
Text GLabel 6350 5750 2    50   Input ~ 0
GND
Wire Wire Line
	6150 5850 6350 5850
Wire Wire Line
	6150 5750 6350 5750
Wire Wire Line
	6550 5050 6550 5150
Wire Wire Line
	6550 5150 6150 5150
Text GLabel 7000 5050 1    50   Input ~ 0
~RES
Text GLabel 6850 5050 1    50   Input ~ 0
~IOCS
Wire Wire Line
	6700 5050 6700 5250
Wire Wire Line
	6700 5250 6150 5250
Wire Wire Line
	6850 5050 6850 5350
Wire Wire Line
	6850 5350 6150 5350
Wire Wire Line
	7000 5050 7000 5450
Wire Wire Line
	7000 5450 6150 5450
Text GLabel 7150 5050 1    50   Output ~ 0
~IRQX
Wire Wire Line
	6150 5550 7150 5550
Wire Wire Line
	7150 5550 7150 5050
Text GLabel 7600 5050 1    50   Input ~ 0
~IRQX
Text GLabel 7450 5050 1    50   Input ~ 0
+5V
$Comp
L Device:R R?
U 1 1 5E451554
P 7450 5300
F 0 "R?" V 7350 5300 50  0000 C CNN
F 1 "3K3" V 7450 5300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7380 5300 50  0001 C CNN
F 3 "~" H 7450 5300 50  0001 C CNN
	1    7450 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 5050 7450 5150
Wire Wire Line
	7450 5450 7600 5450
Connection ~ 7600 5450
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5E49655D
P 4400 2750
F 0 "J?" H 4372 2632 50  0000 R CNN
F 1 "CLK Jumper" H 4372 2723 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4400 2750 50  0001 C CNN
F 3 "~" H 4400 2750 50  0001 C CNN
	1    4400 2750
	-1   0    0    1   
$EndComp
Text GLabel 4100 2650 0    50   Input ~ 0
CLKOUT
Text GLabel 4100 2750 0    50   Output ~ 0
CLK
Wire Wire Line
	4100 2650 4200 2650
Wire Wire Line
	4100 2750 4200 2750
Wire Bus Line
	3100 5450 3100 5650
Wire Bus Line
	800  5450 800  5650
Wire Bus Line
	2600 2700 2600 3000
Wire Bus Line
	3300 1400 3300 2300
Wire Bus Line
	5000 4650 5000 5150
Wire Bus Line
	4600 5350 4600 5750
Wire Bus Line
	2700 4650 2700 5150
Wire Bus Line
	2300 5350 2300 5750
Wire Bus Line
	2600 1900 2600 2600
Wire Bus Line
	6450 4250 6450 4950
Wire Bus Line
	3100 4250 3100 5150
Wire Bus Line
	800  4250 800  5150
Wire Bus Line
	1000 2000 1000 3100
Wire Bus Line
	5350 4250 5350 5750
$EndSCHEMATC
