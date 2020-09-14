EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "DB6502 Hobby Computer"
Date "2020-09-09"
Rev "v002"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Based on Ben Eater's design"
Comment4 "Author: Dawid Buchwald"
$EndDescr
$Comp
L 6502:65C02S U?
U 1 1 5F5A65C1
P 2400 2150
F 0 "U?" H 2400 3315 50  0000 C CNN
F 1 "65C02S" H 2400 3224 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 2400 3200 50  0001 C CNN
F 3 "" H 2250 3100 50  0001 C CNN
	1    2400 2150
	1    0    0    -1  
$EndComp
Text GLabel 1650 1150 1    50   Input ~ 0
RDY
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
Wire Bus Line
	3200 2650 3300 2650
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
Text GLabel 3300 2650 2    50   Input ~ 0
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
CLK
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
L 6502:62256 U?
U 1 1 5F5BE432
P 4650 1900
F 0 "U?" H 4650 2815 50  0000 C CNN
F 1 "62256" H 4650 2724 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 4600 2700 50  0001 C CNN
F 3 "" H 4650 1900 50  0001 C CNN
	1    4650 1900
	1    0    0    -1  
$EndComp
Text GLabel 4050 2650 3    50   Input ~ 0
GND
Wire Wire Line
	4050 2650 4050 2550
Wire Wire Line
	4050 2550 4150 2550
Text GLabel 5250 1150 1    50   Input ~ 0
+5V
Wire Wire Line
	5250 1150 5250 1250
Wire Wire Line
	5250 1250 5150 1250
Text GLabel 5400 1150 1    50   Input ~ 0
~WE
Wire Wire Line
	5400 1150 5400 1350
Wire Wire Line
	5400 1350 5150 1350
Text GLabel 5550 1150 1    50   Input ~ 0
~OE
Text GLabel 5700 1150 1    50   Input ~ 0
RAM1_~CS
Wire Wire Line
	5700 1150 5700 2050
Wire Wire Line
	5700 2050 5150 2050
Wire Wire Line
	5550 1150 5550 1850
Wire Wire Line
	5550 1850 5150 1850
Text Label 3950 2250 0    50   ~ 0
d0
Text Label 3950 2350 0    50   ~ 0
d1
Text Label 3950 2450 0    50   ~ 0
d2
Entry Wire Line
	3850 2350 3950 2250
Entry Wire Line
	3850 2450 3950 2350
Entry Wire Line
	3850 2550 3950 2450
Text Label 5350 2550 2    50   ~ 0
d3
Text Label 5350 2450 2    50   ~ 0
d4
Text Label 5350 2350 2    50   ~ 0
d5
Text Label 5350 2250 2    50   ~ 0
d6
Text Label 5350 2150 2    50   ~ 0
d7
Wire Wire Line
	3950 2250 4150 2250
Wire Wire Line
	3950 2350 4150 2350
Wire Wire Line
	3950 2450 4150 2450
Wire Wire Line
	5150 2550 5350 2550
Wire Wire Line
	5150 2450 5350 2450
Wire Wire Line
	5150 2350 5350 2350
Wire Wire Line
	5150 2250 5350 2250
Wire Wire Line
	5150 2150 5350 2150
Entry Wire Line
	5350 2150 5450 2250
Entry Wire Line
	5350 2250 5450 2350
Entry Wire Line
	5350 2350 5450 2450
Entry Wire Line
	5350 2450 5450 2550
Entry Wire Line
	5350 2550 5450 2650
Wire Bus Line
	3850 2950 5450 2950
Text Label 3950 2150 0    50   ~ 0
a0
Text Label 3950 2050 0    50   ~ 0
a1
Text Label 3950 1950 0    50   ~ 0
a2
Text Label 3950 1850 0    50   ~ 0
a3
Text Label 3950 1750 0    50   ~ 0
a4
Text Label 3950 1650 0    50   ~ 0
a5
Text Label 3950 1550 0    50   ~ 0
a6
Text Label 3950 1450 0    50   ~ 0
a7
Text Label 3950 1350 0    50   ~ 0
a12
Text Label 3950 1250 0    50   ~ 0
a14
Text Label 5900 1450 2    50   ~ 0
a13
Text Label 5900 1550 2    50   ~ 0
a8
Text Label 5900 1650 2    50   ~ 0
a9
Text Label 5900 1750 2    50   ~ 0
a11
Text Label 5900 1950 2    50   ~ 0
a10
Wire Wire Line
	5150 1950 5900 1950
Wire Wire Line
	5150 1750 5900 1750
Wire Wire Line
	5150 1650 5900 1650
Wire Wire Line
	5150 1550 5900 1550
Wire Wire Line
	5150 1450 5900 1450
Wire Wire Line
	3950 2150 4150 2150
Wire Wire Line
	3950 2050 4150 2050
Wire Wire Line
	3950 1950 4150 1950
Wire Wire Line
	3950 1850 4150 1850
Wire Wire Line
	3950 1750 4150 1750
Wire Wire Line
	3950 1650 4150 1650
Wire Wire Line
	3950 1550 4150 1550
Wire Wire Line
	3950 1450 4150 1450
Wire Wire Line
	3950 1350 4150 1350
Wire Wire Line
	3950 1250 4150 1250
Entry Wire Line
	5900 1450 6000 1350
Entry Wire Line
	6000 1450 5900 1550
Entry Wire Line
	5900 1650 6000 1550
Entry Wire Line
	5900 1750 6000 1650
Entry Wire Line
	5900 1950 6000 1850
Entry Wire Line
	3850 1150 3950 1250
Entry Wire Line
	3850 1250 3950 1350
Entry Wire Line
	3850 1350 3950 1450
Entry Wire Line
	3850 1450 3950 1550
Entry Wire Line
	3850 1550 3950 1650
Entry Wire Line
	3850 1650 3950 1750
Entry Wire Line
	3850 1750 3950 1850
Entry Wire Line
	3850 1850 3950 1950
Entry Wire Line
	3850 1950 3950 2050
Entry Wire Line
	3850 2050 3950 2150
Wire Bus Line
	3850 650  6000 650 
$Comp
L 6502:62256 U?
U 1 1 5F5FD943
P 7000 1900
F 0 "U?" H 7000 2815 50  0000 C CNN
F 1 "62256" H 7000 2724 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 6950 2700 50  0001 C CNN
F 3 "" H 7000 1900 50  0001 C CNN
	1    7000 1900
	1    0    0    -1  
$EndComp
Text GLabel 6400 2650 3    50   Input ~ 0
GND
Wire Wire Line
	6400 2650 6400 2550
Wire Wire Line
	6400 2550 6500 2550
Text GLabel 7600 1150 1    50   Input ~ 0
+5V
Wire Wire Line
	7600 1150 7600 1250
Wire Wire Line
	7600 1250 7500 1250
Text GLabel 7750 1150 1    50   Input ~ 0
~WE
Wire Wire Line
	7750 1150 7750 1350
Wire Wire Line
	7750 1350 7500 1350
Text GLabel 7900 1150 1    50   Input ~ 0
~OE
Text GLabel 8050 1150 1    50   Input ~ 0
RAM2_~CS
Wire Wire Line
	8050 1150 8050 2050
Wire Wire Line
	8050 2050 7500 2050
Wire Wire Line
	7900 1150 7900 1850
Wire Wire Line
	7900 1850 7500 1850
Text Label 6300 2250 0    50   ~ 0
d0
Text Label 6300 2350 0    50   ~ 0
d1
Text Label 6300 2450 0    50   ~ 0
d2
Entry Wire Line
	6200 2350 6300 2250
Entry Wire Line
	6200 2450 6300 2350
Entry Wire Line
	6200 2550 6300 2450
Text Label 7700 2550 2    50   ~ 0
d3
Text Label 7700 2450 2    50   ~ 0
d4
Text Label 7700 2350 2    50   ~ 0
d5
Text Label 7700 2250 2    50   ~ 0
d6
Text Label 7700 2150 2    50   ~ 0
d7
Wire Wire Line
	6300 2250 6500 2250
Wire Wire Line
	6300 2350 6500 2350
Wire Wire Line
	6300 2450 6500 2450
Wire Wire Line
	7500 2550 7700 2550
Wire Wire Line
	7500 2450 7700 2450
Wire Wire Line
	7500 2350 7700 2350
Wire Wire Line
	7500 2250 7700 2250
Wire Wire Line
	7500 2150 7700 2150
Entry Wire Line
	7700 2150 7800 2250
Entry Wire Line
	7700 2250 7800 2350
Entry Wire Line
	7700 2350 7800 2450
Entry Wire Line
	7700 2450 7800 2550
Entry Wire Line
	7700 2550 7800 2650
Wire Bus Line
	6200 2950 7800 2950
Text Label 6300 2150 0    50   ~ 0
a0
Text Label 6300 2050 0    50   ~ 0
a1
Text Label 6300 1950 0    50   ~ 0
a2
Text Label 6300 1850 0    50   ~ 0
a3
Text Label 6300 1750 0    50   ~ 0
a4
Text Label 6300 1650 0    50   ~ 0
a5
Text Label 6300 1550 0    50   ~ 0
a6
Text Label 6300 1450 0    50   ~ 0
a7
Text Label 6300 1350 0    50   ~ 0
a12
Text Label 6300 1250 0    50   ~ 0
a14
Text Label 8250 1450 2    50   ~ 0
a13
Text Label 8250 1550 2    50   ~ 0
a8
Text Label 8250 1650 2    50   ~ 0
a9
Text Label 8250 1750 2    50   ~ 0
a11
Text Label 8250 1950 2    50   ~ 0
a10
Wire Wire Line
	7500 1950 8250 1950
Wire Wire Line
	7500 1750 8250 1750
Wire Wire Line
	7500 1650 8250 1650
Wire Wire Line
	7500 1550 8250 1550
Wire Wire Line
	7500 1450 8250 1450
Wire Wire Line
	6300 2150 6500 2150
Wire Wire Line
	6300 2050 6500 2050
Wire Wire Line
	6300 1950 6500 1950
Wire Wire Line
	6300 1850 6500 1850
Wire Wire Line
	6300 1750 6500 1750
Wire Wire Line
	6300 1650 6500 1650
Wire Wire Line
	6300 1550 6500 1550
Wire Wire Line
	6300 1450 6500 1450
Wire Wire Line
	6300 1350 6500 1350
Wire Wire Line
	6300 1250 6500 1250
Entry Wire Line
	8250 1450 8350 1350
Entry Wire Line
	8350 1450 8250 1550
Entry Wire Line
	8250 1650 8350 1550
Entry Wire Line
	8250 1750 8350 1650
Entry Wire Line
	8250 1950 8350 1850
Entry Wire Line
	6200 1150 6300 1250
Entry Wire Line
	6200 1250 6300 1350
Entry Wire Line
	6200 1350 6300 1450
Entry Wire Line
	6200 1450 6300 1550
Entry Wire Line
	6200 1550 6300 1650
Entry Wire Line
	6200 1650 6300 1750
Entry Wire Line
	6200 1750 6300 1850
Entry Wire Line
	6200 1850 6300 1950
Entry Wire Line
	6200 1950 6300 2050
Entry Wire Line
	6200 2050 6300 2150
Wire Bus Line
	6200 650  8350 650 
$Comp
L 6502:28C256 U?
U 1 1 5F605CEF
P 9400 1900
F 0 "U?" H 9400 2815 50  0000 C CNN
F 1 "28C256" H 9400 2724 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 9350 2700 50  0001 C CNN
F 3 "" H 9400 1900 50  0001 C CNN
	1    9400 1900
	1    0    0    -1  
$EndComp
Text GLabel 8800 2650 3    50   Input ~ 0
GND
Wire Wire Line
	8800 2650 8800 2550
Wire Wire Line
	8800 2550 8900 2550
Text GLabel 10000 1150 1    50   Input ~ 0
+5V
Wire Wire Line
	10000 1150 10000 1250
Wire Wire Line
	10000 1250 9900 1250
Text GLabel 10150 1150 1    50   Input ~ 0
~WE
Wire Wire Line
	10150 1150 10150 1350
Wire Wire Line
	10150 1350 9900 1350
Text GLabel 10300 1150 1    50   Input ~ 0
~OE
Text GLabel 10450 1150 1    50   Input ~ 0
ROM_~CS
Wire Wire Line
	10450 1150 10450 2050
Wire Wire Line
	10450 2050 9900 2050
Wire Wire Line
	10300 1150 10300 1850
Wire Wire Line
	10300 1850 9900 1850
Text Label 8700 2250 0    50   ~ 0
d0
Text Label 8700 2350 0    50   ~ 0
d1
Text Label 8700 2450 0    50   ~ 0
d2
Entry Wire Line
	8600 2350 8700 2250
Entry Wire Line
	8600 2450 8700 2350
Entry Wire Line
	8600 2550 8700 2450
Text Label 10100 2550 2    50   ~ 0
d3
Text Label 10100 2450 2    50   ~ 0
d4
Text Label 10100 2350 2    50   ~ 0
d5
Text Label 10100 2250 2    50   ~ 0
d6
Text Label 10100 2150 2    50   ~ 0
d7
Wire Wire Line
	8700 2250 8900 2250
Wire Wire Line
	8700 2350 8900 2350
Wire Wire Line
	8700 2450 8900 2450
Wire Wire Line
	9900 2550 10100 2550
Wire Wire Line
	9900 2450 10100 2450
Wire Wire Line
	9900 2350 10100 2350
Wire Wire Line
	9900 2250 10100 2250
Wire Wire Line
	9900 2150 10100 2150
Entry Wire Line
	10100 2150 10200 2250
Entry Wire Line
	10100 2250 10200 2350
Entry Wire Line
	10100 2350 10200 2450
Entry Wire Line
	10100 2450 10200 2550
Entry Wire Line
	10100 2550 10200 2650
Wire Bus Line
	8600 2950 10200 2950
Text Label 8700 2150 0    50   ~ 0
a0
Text Label 8700 2050 0    50   ~ 0
a1
Text Label 8700 1950 0    50   ~ 0
a2
Text Label 8700 1850 0    50   ~ 0
a3
Text Label 8700 1750 0    50   ~ 0
a4
Text Label 8700 1650 0    50   ~ 0
a5
Text Label 8700 1550 0    50   ~ 0
a6
Text Label 8700 1450 0    50   ~ 0
a7
Text Label 8700 1350 0    50   ~ 0
a12
Text Label 8700 1250 0    50   ~ 0
a14
Text Label 10650 1450 2    50   ~ 0
a13
Text Label 10650 1550 2    50   ~ 0
a8
Text Label 10650 1650 2    50   ~ 0
a9
Text Label 10650 1750 2    50   ~ 0
a11
Text Label 10650 1950 2    50   ~ 0
a10
Wire Wire Line
	9900 1950 10650 1950
Wire Wire Line
	9900 1750 10650 1750
Wire Wire Line
	9900 1650 10650 1650
Wire Wire Line
	9900 1550 10650 1550
Wire Wire Line
	9900 1450 10650 1450
Wire Wire Line
	8700 2150 8900 2150
Wire Wire Line
	8700 2050 8900 2050
Wire Wire Line
	8700 1950 8900 1950
Wire Wire Line
	8700 1850 8900 1850
Wire Wire Line
	8700 1750 8900 1750
Wire Wire Line
	8700 1650 8900 1650
Wire Wire Line
	8700 1550 8900 1550
Wire Wire Line
	8700 1450 8900 1450
Wire Wire Line
	8700 1350 8900 1350
Wire Wire Line
	8700 1250 8900 1250
Entry Wire Line
	10650 1450 10750 1350
Entry Wire Line
	10750 1450 10650 1550
Entry Wire Line
	10650 1650 10750 1550
Entry Wire Line
	10650 1750 10750 1650
Entry Wire Line
	10650 1950 10750 1850
Entry Wire Line
	8600 1150 8700 1250
Entry Wire Line
	8600 1250 8700 1350
Entry Wire Line
	8600 1350 8700 1450
Entry Wire Line
	8600 1450 8700 1550
Entry Wire Line
	8600 1550 8700 1650
Entry Wire Line
	8600 1650 8700 1750
Entry Wire Line
	8600 1750 8700 1850
Entry Wire Line
	8600 1850 8700 1950
Entry Wire Line
	8600 1950 8700 2050
Entry Wire Line
	8600 2050 8700 2150
Wire Bus Line
	8600 650  10750 650 
$Comp
L Device:CP C?
U 1 1 5F613640
P 3850 3600
F 0 "C?" H 3968 3646 50  0000 L CNN
F 1 "10uF" H 3968 3555 50  0000 L CNN
F 2 "" H 3888 3450 50  0001 C CNN
F 3 "~" H 3850 3600 50  0001 C CNN
	1    3850 3600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F614138
P 3850 3250
F 0 "#PWR?" H 3850 3100 50  0001 C CNN
F 1 "+5V" H 3865 3423 50  0000 C CNN
F 2 "" H 3850 3250 50  0001 C CNN
F 3 "" H 3850 3250 50  0001 C CNN
	1    3850 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6146F7
P 3850 3950
F 0 "#PWR?" H 3850 3700 50  0001 C CNN
F 1 "GND" H 3855 3777 50  0000 C CNN
F 2 "" H 3850 3950 50  0001 C CNN
F 3 "" H 3850 3950 50  0001 C CNN
	1    3850 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F614E58
P 4300 3600
F 0 "C?" H 4415 3646 50  0000 L CNN
F 1 "100nF" H 4415 3555 50  0000 L CNN
F 2 "" H 4338 3450 50  0001 C CNN
F 3 "~" H 4300 3600 50  0001 C CNN
	1    4300 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F6154C6
P 4800 3600
F 0 "C?" H 4915 3646 50  0000 L CNN
F 1 "100nF" H 4915 3555 50  0000 L CNN
F 2 "" H 4838 3450 50  0001 C CNN
F 3 "~" H 4800 3600 50  0001 C CNN
	1    4800 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F6157EC
P 5300 3600
F 0 "C?" H 5415 3646 50  0000 L CNN
F 1 "100nF" H 5415 3555 50  0000 L CNN
F 2 "" H 5338 3450 50  0001 C CNN
F 3 "~" H 5300 3600 50  0001 C CNN
	1    5300 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F61597C
P 5800 3600
F 0 "C?" H 5915 3646 50  0000 L CNN
F 1 "100nF" H 5915 3555 50  0000 L CNN
F 2 "" H 5838 3450 50  0001 C CNN
F 3 "~" H 5800 3600 50  0001 C CNN
	1    5800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3250 3850 3350
Wire Wire Line
	3850 3750 3850 3850
Wire Wire Line
	3850 3850 4300 3850
Wire Wire Line
	4300 3850 4300 3750
Connection ~ 3850 3850
Wire Wire Line
	3850 3850 3850 3950
Wire Wire Line
	3850 3350 4300 3350
Wire Wire Line
	4300 3350 4300 3450
Connection ~ 3850 3350
Wire Wire Line
	3850 3350 3850 3450
Wire Wire Line
	4300 3350 4800 3350
Wire Wire Line
	4800 3350 4800 3450
Connection ~ 4300 3350
Wire Wire Line
	4300 3850 4800 3850
Wire Wire Line
	4800 3850 4800 3750
Connection ~ 4300 3850
Wire Wire Line
	4800 3350 5300 3350
Wire Wire Line
	5300 3350 5300 3450
Connection ~ 4800 3350
Wire Wire Line
	4800 3850 5300 3850
Wire Wire Line
	5300 3850 5300 3750
Connection ~ 4800 3850
Wire Wire Line
	5300 3350 5800 3350
Wire Wire Line
	5800 3350 5800 3450
Connection ~ 5300 3350
Wire Wire Line
	5300 3850 5800 3850
Wire Wire Line
	5800 3850 5800 3750
Connection ~ 5300 3850
$Comp
L 6502:22V10C U?
U 1 1 5F680A6E
P 2400 5400
F 0 "U?" H 2400 6215 50  0000 C CNN
F 1 "22V10C" H 2400 6124 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W7.62mm_Socket" H 2400 4700 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1627189.pdf" H 2400 5400 50  0001 C CNN
	1    2400 5400
	1    0    0    -1  
$EndComp
Text GLabel 1800 4750 1    50   Input ~ 0
CLK
Text GLabel 1650 4750 1    50   Input ~ 0
R~W
Wire Wire Line
	1800 4750 1800 4850
Wire Wire Line
	1800 4850 1900 4850
Wire Wire Line
	1650 4750 1650 4950
Wire Wire Line
	1650 4950 1900 4950
Text Label 1700 5150 0    50   ~ 0
a15
Text Label 1700 5250 0    50   ~ 0
a14
Text Label 1700 5350 0    50   ~ 0
a13
Text Label 1700 5450 0    50   ~ 0
a12
Text Label 1700 5550 0    50   ~ 0
a11
Text Label 1700 5650 0    50   ~ 0
a10
Text Label 1700 5750 0    50   ~ 0
a09
Text Label 1700 5850 0    50   ~ 0
a08
Text GLabel 1500 4750 1    50   Input ~ 0
EXRAM
Wire Wire Line
	1700 5850 1900 5850
Wire Wire Line
	1700 5750 1900 5750
Wire Wire Line
	1700 5650 1900 5650
Wire Wire Line
	1700 5550 1900 5550
Wire Wire Line
	1700 5450 1900 5450
Wire Wire Line
	1700 5350 1900 5350
Wire Wire Line
	1700 5250 1900 5250
Wire Wire Line
	1700 5150 1900 5150
Entry Wire Line
	1600 5250 1700 5150
Entry Wire Line
	1600 5350 1700 5250
Entry Wire Line
	1600 5450 1700 5350
Entry Wire Line
	1600 5550 1700 5450
Entry Wire Line
	1600 5650 1700 5550
Entry Wire Line
	1600 5750 1700 5650
Entry Wire Line
	1600 5850 1700 5750
Entry Wire Line
	1600 5950 1700 5850
Text GLabel 3000 4750 1    50   Input ~ 0
+5V
Wire Wire Line
	2900 4850 3000 4850
Wire Wire Line
	3000 4850 3000 4750
Text GLabel 1800 6050 3    50   Input ~ 0
GND
Wire Wire Line
	1800 6050 1800 5950
Wire Wire Line
	1800 5950 1900 5950
Wire Wire Line
	1500 4750 1500 5050
Wire Wire Line
	1500 5050 1900 5050
Text GLabel 3150 4750 1    50   Output ~ 0
~WE
Text GLabel 3300 4750 1    50   Output ~ 0
~OE
Wire Wire Line
	3150 4750 3150 4950
Wire Wire Line
	3150 4950 2900 4950
Wire Wire Line
	3300 4750 3300 5050
Wire Wire Line
	3300 5050 2900 5050
Text GLabel 3450 4750 1    50   Output ~ 0
RAM1_~CS
Wire Wire Line
	3450 4750 3450 5150
Wire Wire Line
	3450 5150 2900 5150
Text GLabel 3600 4750 1    50   Output ~ 0
RAM2_~CS
Wire Wire Line
	3600 4750 3600 5250
Wire Wire Line
	3600 5250 2900 5250
Text GLabel 3750 4750 1    50   Output ~ 0
ROM_~CS
Wire Wire Line
	3750 4750 3750 5350
Wire Wire Line
	3750 5350 2900 5350
Text GLabel 3900 4750 1    50   Output ~ 0
IOCS
Wire Wire Line
	3900 4750 3900 5450
Wire Wire Line
	3900 5450 2900 5450
$Comp
L Device:C C?
U 1 1 5F7E5C18
P 6300 3600
F 0 "C?" H 6415 3646 50  0000 L CNN
F 1 "100nF" H 6415 3555 50  0000 L CNN
F 2 "" H 6338 3450 50  0001 C CNN
F 3 "~" H 6300 3600 50  0001 C CNN
	1    6300 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3850 6300 3850
Wire Wire Line
	6300 3850 6300 3750
Connection ~ 5800 3850
Wire Wire Line
	5800 3350 6300 3350
Wire Wire Line
	6300 3350 6300 3450
Connection ~ 5800 3350
Text GLabel 3750 3350 0    50   Output ~ 0
+5V
Text GLabel 3750 3850 0    50   Output ~ 0
GND
Wire Wire Line
	3750 3850 3850 3850
Wire Wire Line
	3750 3350 3850 3350
$Comp
L 74xx:74HCT574 U?
U 1 1 5F822D38
P 5050 5400
F 0 "U?" H 5050 5200 50  0000 C CNN
F 1 "74HCT574" H 5050 5100 50  0000 C CNN
F 2 "" H 5050 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT574" H 5050 5400 50  0001 C CNN
	1    5050 5400
	1    0    0    -1  
$EndComp
Text GLabel 5050 6400 3    50   Input ~ 0
GND
Wire Wire Line
	5050 6400 5050 6300
Text GLabel 5050 4500 1    50   Input ~ 0
+5V
Wire Wire Line
	5050 4500 5050 4600
Text GLabel 5650 5600 2    50   Output ~ 0
EXRAM
Wire Wire Line
	5650 5600 5550 5600
Text Label 4400 4900 0    50   ~ 0
d0
Text Label 4400 5000 0    50   ~ 0
d1
Text Label 4400 5100 0    50   ~ 0
d2
Text Label 4400 5200 0    50   ~ 0
d3
Text Label 4400 5300 0    50   ~ 0
d4
Text Label 4400 5400 0    50   ~ 0
d5
Text Label 4400 5500 0    50   ~ 0
d6
Text Label 4400 5600 0    50   ~ 0
d7
Entry Wire Line
	4300 5000 4400 4900
Entry Wire Line
	4300 5100 4400 5000
Entry Wire Line
	4300 5200 4400 5100
Entry Wire Line
	4300 5300 4400 5200
Entry Wire Line
	4300 5400 4400 5300
Entry Wire Line
	4300 5500 4400 5400
Entry Wire Line
	4300 5600 4400 5500
Entry Wire Line
	4300 5700 4400 5600
Wire Wire Line
	4400 5600 4550 5600
Wire Wire Line
	4400 5500 4550 5500
Wire Wire Line
	4400 5400 4550 5400
Wire Wire Line
	4400 5300 4550 5300
Wire Wire Line
	4400 5200 4550 5200
Wire Wire Line
	4400 5100 4550 5100
Wire Wire Line
	4400 5000 4550 5000
Wire Wire Line
	4400 4900 4550 4900
Wire Wire Line
	5050 6300 4450 6300
Wire Wire Line
	4450 6300 4450 5900
Wire Wire Line
	4450 5900 4550 5900
Connection ~ 5050 6300
Wire Wire Line
	5050 6300 5050 6200
Text Label 6300 5150 0    50   ~ 0
a7
Text Label 6300 5050 0    50   ~ 0
a6
Text Label 6300 4950 0    50   ~ 0
a5
Entry Wire Line
	6200 5050 6300 4950
Entry Wire Line
	6200 5150 6300 5050
Entry Wire Line
	6200 5250 6300 5150
Wire Wire Line
	6300 4950 6450 4950
Wire Wire Line
	6300 5050 6450 5050
Wire Wire Line
	6300 5150 6450 5150
$Comp
L 74xx:74LS138 U?
U 1 1 5F9A1F2C
P 6950 5250
F 0 "U?" H 6950 5250 50  0000 C CNN
F 1 "74AC138" H 6850 5150 50  0000 C CNN
F 2 "" H 6950 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 6950 5250 50  0001 C CNN
	1    6950 5250
	1    0    0    -1  
$EndComp
Text GLabel 6950 4550 1    50   Input ~ 0
+5V
Wire Wire Line
	6950 4550 6950 4650
Text GLabel 6950 6150 3    50   Input ~ 0
GND
Wire Wire Line
	6950 6150 6950 6050
Wire Wire Line
	6950 6050 6350 6050
Wire Wire Line
	6350 6050 6350 5650
Wire Wire Line
	6350 5650 6450 5650
Connection ~ 6950 6050
Wire Wire Line
	6950 6050 6950 5950
Wire Wire Line
	6350 5650 6350 5550
Wire Wire Line
	6350 5550 6450 5550
Connection ~ 6350 5650
Text GLabel 6350 5450 0    50   Input ~ 0
IOCS
Wire Wire Line
	6350 5450 6450 5450
Text GLabel 7550 4850 1    50   Output ~ 0
~LATCH
Wire Wire Line
	7450 4950 7550 4950
Wire Wire Line
	7550 4950 7550 4850
Text GLabel 7700 4850 1    50   Output ~ 0
~VIA1
Wire Wire Line
	7700 4850 7700 5050
Wire Wire Line
	7700 5050 7450 5050
Text GLabel 7850 4850 1    50   Output ~ 0
~VIA2
Wire Wire Line
	7850 4850 7850 5150
Wire Wire Line
	7850 5150 7450 5150
Text GLabel 8000 4850 1    50   Output ~ 0
~UART
Wire Wire Line
	8000 4850 8000 5250
Wire Wire Line
	8000 5250 7450 5250
Text GLabel 7550 5750 3    50   Output ~ 0
~IOCS3
Text GLabel 7700 5750 3    50   Output ~ 0
~IOCS2
Text GLabel 7850 5750 3    50   Output ~ 0
~IOCS1
Text GLabel 8000 5750 3    50   Output ~ 0
~IOCS0
Wire Wire Line
	7550 5750 7550 5650
Wire Wire Line
	7550 5650 7450 5650
Wire Wire Line
	7450 5550 7700 5550
Wire Wire Line
	7700 5550 7700 5750
Wire Wire Line
	7450 5450 7850 5450
Wire Wire Line
	7850 5450 7850 5750
Wire Wire Line
	7450 5350 8000 5350
Wire Wire Line
	8000 5350 8000 5750
$Comp
L Device:C C?
U 1 1 5FB28DB3
P 6800 3600
F 0 "C?" H 6915 3646 50  0000 L CNN
F 1 "100nF" H 6915 3555 50  0000 L CNN
F 2 "" H 6838 3450 50  0001 C CNN
F 3 "~" H 6800 3600 50  0001 C CNN
	1    6800 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FB29248
P 7300 3600
F 0 "C?" H 7415 3646 50  0000 L CNN
F 1 "100nF" H 7415 3555 50  0000 L CNN
F 2 "" H 7338 3450 50  0001 C CNN
F 3 "~" H 7300 3600 50  0001 C CNN
	1    7300 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3850 6800 3850
Wire Wire Line
	6800 3850 6800 3750
Connection ~ 6300 3850
Wire Wire Line
	6800 3850 7300 3850
Wire Wire Line
	7300 3850 7300 3750
Connection ~ 6800 3850
Wire Wire Line
	6300 3350 6800 3350
Wire Wire Line
	6800 3350 6800 3450
Connection ~ 6300 3350
Wire Wire Line
	6800 3350 7300 3350
Wire Wire Line
	7300 3350 7300 3450
Connection ~ 6800 3350
Wire Bus Line
	6200 5050 6200 5250
Wire Bus Line
	3850 2350 3850 2950
Wire Bus Line
	6200 2350 6200 2950
Wire Bus Line
	8600 2350 8600 2950
Wire Bus Line
	3200 2750 3200 3550
Wire Bus Line
	5450 2250 5450 2950
Wire Bus Line
	6000 650  6000 1850
Wire Bus Line
	7800 2250 7800 2950
Wire Bus Line
	8350 650  8350 1850
Wire Bus Line
	10200 2250 10200 2950
Wire Bus Line
	10750 650  10750 1850
Wire Bus Line
	3200 2050 3200 2650
Wire Bus Line
	1600 5250 1600 5950
Wire Bus Line
	4300 5000 4300 5700
Wire Bus Line
	3850 650  3850 2050
Wire Bus Line
	6200 650  6200 2050
Wire Bus Line
	8600 650  8600 2050
Wire Bus Line
	1600 2150 1600 3400
$EndSCHEMATC
