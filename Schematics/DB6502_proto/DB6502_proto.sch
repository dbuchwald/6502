EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "DB6502 Hobby Computer Version 2"
Date "2020-10-13"
Rev "v003"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Open Source Hardware"
Comment4 "Author: Dawid Buchwald"
$EndDescr
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
L Device:CP C4
U 1 1 5F613640
P 6800 5800
F 0 "C4" H 6918 5846 50  0000 L CNN
F 1 "10uF" H 6918 5755 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 6838 5650 50  0001 C CNN
F 3 "~" H 6800 5800 50  0001 C CNN
	1    6800 5800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5F614138
P 6800 5450
F 0 "#PWR01" H 6800 5300 50  0001 C CNN
F 1 "+5V" H 6815 5623 50  0000 C CNN
F 2 "" H 6800 5450 50  0001 C CNN
F 3 "" H 6800 5450 50  0001 C CNN
	1    6800 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F6146F7
P 6800 6150
F 0 "#PWR02" H 6800 5900 50  0001 C CNN
F 1 "GND" H 6805 5977 50  0000 C CNN
F 2 "" H 6800 6150 50  0001 C CNN
F 3 "" H 6800 6150 50  0001 C CNN
	1    6800 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5F614E58
P 7250 5800
F 0 "C5" H 7365 5846 50  0000 L CNN
F 1 "100nF" H 7365 5755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7288 5650 50  0001 C CNN
F 3 "~" H 7250 5800 50  0001 C CNN
	1    7250 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5F6154C6
P 7750 5800
F 0 "C6" H 7865 5846 50  0000 L CNN
F 1 "100nF" H 7865 5755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7788 5650 50  0001 C CNN
F 3 "~" H 7750 5800 50  0001 C CNN
	1    7750 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5F6157EC
P 8250 5800
F 0 "C7" H 8365 5846 50  0000 L CNN
F 1 "100nF" H 8365 5755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8288 5650 50  0001 C CNN
F 3 "~" H 8250 5800 50  0001 C CNN
	1    8250 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5F61597C
P 8750 5800
F 0 "C8" H 8865 5846 50  0000 L CNN
F 1 "100nF" H 8865 5755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8788 5650 50  0001 C CNN
F 3 "~" H 8750 5800 50  0001 C CNN
	1    8750 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 5450 6800 5550
Wire Wire Line
	6800 5950 6800 6050
Wire Wire Line
	6800 6050 7250 6050
Wire Wire Line
	7250 6050 7250 5950
Connection ~ 6800 6050
Wire Wire Line
	6800 6050 6800 6150
Wire Wire Line
	6800 5550 7250 5550
Wire Wire Line
	7250 5550 7250 5650
Connection ~ 6800 5550
Wire Wire Line
	6800 5550 6800 5650
Wire Wire Line
	7250 5550 7750 5550
Wire Wire Line
	7750 5550 7750 5650
Connection ~ 7250 5550
Wire Wire Line
	7250 6050 7750 6050
Wire Wire Line
	7750 6050 7750 5950
Connection ~ 7250 6050
Wire Wire Line
	7750 5550 8250 5550
Wire Wire Line
	8250 5550 8250 5650
Connection ~ 7750 5550
Wire Wire Line
	7750 6050 8250 6050
Wire Wire Line
	8250 6050 8250 5950
Connection ~ 7750 6050
Wire Wire Line
	8250 5550 8750 5550
Wire Wire Line
	8750 5550 8750 5650
Connection ~ 8250 5550
Wire Wire Line
	8250 6050 8750 6050
Wire Wire Line
	8750 6050 8750 5950
Connection ~ 8250 6050
$Comp
L 6502:22V10C U8
U 1 1 5F680A6E
P 9450 4100
F 0 "U8" H 9450 4915 50  0000 C CNN
F 1 "22V10C" H 9450 4824 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W7.62mm_Socket" H 9450 3400 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1627189.pdf" H 9450 4100 50  0001 C CNN
	1    9450 4100
	1    0    0    -1  
$EndComp
Text GLabel 8850 3450 1    50   Input ~ 0
CLK
Text GLabel 8700 3450 1    50   Input ~ 0
R~W
Wire Wire Line
	8850 3450 8850 3550
Wire Wire Line
	8850 3550 8950 3550
Wire Wire Line
	8700 3450 8700 3650
Wire Wire Line
	8700 3650 8950 3650
Text Label 8750 3850 0    50   ~ 0
a15
Text Label 8750 3950 0    50   ~ 0
a14
Text Label 8750 4050 0    50   ~ 0
a13
Text Label 8750 4150 0    50   ~ 0
a12
Text Label 8750 4250 0    50   ~ 0
a11
Text Label 8750 4350 0    50   ~ 0
a10
Text Label 8750 4450 0    50   ~ 0
a9
Text Label 8750 4550 0    50   ~ 0
a8
Text GLabel 8550 3450 1    50   Input ~ 0
EXRAM
Wire Wire Line
	8750 4550 8950 4550
Wire Wire Line
	8750 4450 8950 4450
Wire Wire Line
	8750 4350 8950 4350
Wire Wire Line
	8750 4250 8950 4250
Wire Wire Line
	8750 4150 8950 4150
Wire Wire Line
	8750 4050 8950 4050
Wire Wire Line
	8750 3950 8950 3950
Wire Wire Line
	8750 3850 8950 3850
Entry Wire Line
	8650 3950 8750 3850
Entry Wire Line
	8650 4050 8750 3950
Entry Wire Line
	8650 4150 8750 4050
Entry Wire Line
	8650 4250 8750 4150
Entry Wire Line
	8650 4350 8750 4250
Entry Wire Line
	8650 4450 8750 4350
Entry Wire Line
	8650 4550 8750 4450
Entry Wire Line
	8650 4650 8750 4550
Text GLabel 10050 3450 1    50   Input ~ 0
+5V
Wire Wire Line
	9950 3550 10050 3550
Wire Wire Line
	10050 3550 10050 3450
Text GLabel 8850 4750 3    50   Input ~ 0
GND
Wire Wire Line
	8850 4750 8850 4650
Wire Wire Line
	8850 4650 8950 4650
Wire Wire Line
	8550 3450 8550 3750
Wire Wire Line
	8550 3750 8950 3750
Text GLabel 10200 3450 1    50   Output ~ 0
~WE
Text GLabel 10350 3450 1    50   Output ~ 0
~OE
Wire Wire Line
	10200 3450 10200 3650
Wire Wire Line
	10200 3650 9950 3650
Wire Wire Line
	10350 3450 10350 3750
Wire Wire Line
	10350 3750 9950 3750
Text GLabel 10500 3450 1    50   Output ~ 0
RAM1_~CS
Wire Wire Line
	10500 3450 10500 3850
Wire Wire Line
	10500 3850 9950 3850
Text GLabel 10650 3450 1    50   Output ~ 0
RAM2_~CS
Wire Wire Line
	10650 3450 10650 3950
Wire Wire Line
	10650 3950 9950 3950
Text GLabel 10800 3450 1    50   Output ~ 0
ROM_~CS
Wire Wire Line
	10800 3450 10800 4050
Wire Wire Line
	10800 4050 9950 4050
Text GLabel 10950 3450 1    50   Output ~ 0
IOCS
Wire Wire Line
	10950 3450 10950 4150
Wire Wire Line
	10950 4150 9950 4150
$Comp
L Device:C C9
U 1 1 5F7E5C18
P 9250 5800
F 0 "C9" H 9365 5846 50  0000 L CNN
F 1 "100nF" H 9365 5755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9288 5650 50  0001 C CNN
F 3 "~" H 9250 5800 50  0001 C CNN
	1    9250 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 6050 9250 6050
Wire Wire Line
	9250 6050 9250 5950
Connection ~ 8750 6050
Wire Wire Line
	8750 5550 9250 5550
Wire Wire Line
	9250 5550 9250 5650
Connection ~ 8750 5550
Text GLabel 6700 5550 0    50   Output ~ 0
+5V
Text GLabel 6700 6050 0    50   Output ~ 0
GND
Wire Wire Line
	6700 6050 6800 6050
Wire Wire Line
	6700 5550 6800 5550
Text Label 6600 3850 0    50   ~ 0
a7
Text Label 6600 3750 0    50   ~ 0
a6
Text Label 6600 3650 0    50   ~ 0
a5
Entry Wire Line
	6500 3750 6600 3650
Entry Wire Line
	6500 3850 6600 3750
Entry Wire Line
	6500 3950 6600 3850
Wire Wire Line
	6600 3650 6750 3650
Wire Wire Line
	6600 3750 6750 3750
Wire Wire Line
	6600 3850 6750 3850
Text GLabel 7250 3250 1    50   Input ~ 0
+5V
Wire Wire Line
	7250 3250 7250 3350
Text GLabel 7250 4850 3    50   Input ~ 0
GND
Wire Wire Line
	7250 4850 7250 4750
Wire Wire Line
	7250 4750 6650 4750
Wire Wire Line
	6650 4750 6650 4350
Wire Wire Line
	6650 4350 6750 4350
Connection ~ 7250 4750
Wire Wire Line
	7250 4750 7250 4650
Wire Wire Line
	6650 4350 6650 4250
Wire Wire Line
	6650 4250 6750 4250
Connection ~ 6650 4350
Wire Wire Line
	6650 4150 6750 4150
Text GLabel 7850 3550 1    50   Output ~ 0
~LATCH
Wire Wire Line
	7750 3650 7850 3650
Wire Wire Line
	7850 3650 7850 3550
Text GLabel 8000 3550 1    50   Output ~ 0
~VIA1
Wire Wire Line
	8000 3550 8000 3750
Wire Wire Line
	8000 3750 7750 3750
Text GLabel 8150 3550 1    50   Output ~ 0
~VIA2
Wire Wire Line
	8150 3550 8150 3850
Wire Wire Line
	8150 3850 7750 3850
Text GLabel 8300 3550 1    50   Output ~ 0
~UART
Wire Wire Line
	8300 3550 8300 3950
Wire Wire Line
	8300 3950 7750 3950
Text GLabel 7850 4450 3    50   Output ~ 0
~IOCS3
Text GLabel 8000 4450 3    50   Output ~ 0
~IOCS2
Text GLabel 8150 4450 3    50   Output ~ 0
~IOCS1
Text GLabel 8300 4450 3    50   Output ~ 0
~IOCS0
Wire Wire Line
	7850 4450 7850 4350
Wire Wire Line
	7850 4350 7750 4350
Wire Wire Line
	7750 4250 8000 4250
Wire Wire Line
	8000 4250 8000 4450
Wire Wire Line
	7750 4150 8150 4150
Wire Wire Line
	8150 4150 8150 4450
Wire Wire Line
	7750 4050 8300 4050
Wire Wire Line
	8300 4050 8300 4450
$Comp
L Device:C C10
U 1 1 5FB28DB3
P 9750 5800
F 0 "C10" H 9865 5846 50  0000 L CNN
F 1 "100nF" H 9865 5755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9788 5650 50  0001 C CNN
F 3 "~" H 9750 5800 50  0001 C CNN
	1    9750 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5FB29248
P 10250 5800
F 0 "C11" H 10365 5846 50  0000 L CNN
F 1 "100nF" H 10365 5755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 10288 5650 50  0001 C CNN
F 3 "~" H 10250 5800 50  0001 C CNN
	1    10250 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 6050 9750 6050
Wire Wire Line
	9750 6050 9750 5950
Connection ~ 9250 6050
Wire Wire Line
	9750 6050 10250 6050
Wire Wire Line
	10250 6050 10250 5950
Connection ~ 9750 6050
Wire Wire Line
	9250 5550 9750 5550
Wire Wire Line
	9750 5550 9750 5650
Connection ~ 9250 5550
Wire Wire Line
	9750 5550 10250 5550
Wire Wire Line
	10250 5550 10250 5650
Connection ~ 9750 5550
Text GLabel 10050 4650 2    50   Input ~ 0
IN12
Text GLabel 10050 4550 2    50   BiDi ~ 0
IO13
Text GLabel 10050 4450 2    50   BiDi ~ 0
IO14
Text GLabel 10050 4350 2    50   BiDi ~ 0
IO15
Text GLabel 10050 4250 2    50   BiDi ~ 0
IO16
Wire Wire Line
	9950 4250 10050 4250
Wire Wire Line
	9950 4350 10050 4350
Wire Wire Line
	9950 4450 10050 4450
Wire Wire Line
	9950 4550 10050 4550
Wire Wire Line
	9950 4650 10050 4650
$Sheet
S 700  6650 750  350 
U 6014B4D9
F0 "ports" 50
F1 "ports.sch" 50
$EndSheet
$Comp
L Device:C C12
U 1 1 6041E333
P 10700 5800
F 0 "C12" H 10815 5846 50  0000 L CNN
F 1 "100nF" H 10815 5755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 10738 5650 50  0001 C CNN
F 3 "~" H 10700 5800 50  0001 C CNN
	1    10700 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 5550 10700 5550
Wire Wire Line
	10700 5550 10700 5650
Connection ~ 10250 5550
Wire Wire Line
	10250 6050 10700 6050
Wire Wire Line
	10700 6050 10700 5950
Connection ~ 10250 6050
$Comp
L Switch:SW_Push SW1
U 1 1 605A5693
P 2100 4900
F 0 "SW1" V 2054 5048 50  0000 L CNN
F 1 "Reset" V 2145 5048 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 2100 5100 50  0001 C CNN
F 3 "~" H 2100 5100 50  0001 C CNN
	1    2100 4900
	0    1    1    0   
$EndComp
Text GLabel 1600 5250 3    50   Input ~ 0
GND
Wire Wire Line
	1600 5250 1600 5200
Wire Wire Line
	1600 5200 2100 5200
Wire Wire Line
	2100 5200 2100 5100
Connection ~ 1600 5200
Wire Wire Line
	1600 5200 1600 5150
Wire Wire Line
	2100 4700 2100 4600
Wire Wire Line
	2100 4600 2000 4600
Text GLabel 1600 3950 1    50   Input ~ 0
+5V
Wire Wire Line
	1600 3950 1600 4050
Text GLabel 2200 4600 2    50   Output ~ 0
~RES
Wire Wire Line
	2200 4600 2100 4600
Connection ~ 2100 4600
$Comp
L 74xx:74LS138 U6
U 1 1 5F9A1F2C
P 7250 3950
F 0 "U6" H 7250 3950 50  0000 C CNN
F 1 "74AC138" H 7150 3850 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 7250 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 7250 3950 50  0001 C CNN
	1    7250 3950
	1    0    0    -1  
$EndComp
$Comp
L 6502:DS1813 U1
U 1 1 605A4648
P 1600 4600
F 0 "U1" H 1372 4646 50  0000 R CNN
F 1 "DS1813" H 1372 4555 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 1600 4200 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DS1813.pdf" H 1600 4600 50  0001 C CNN
	1    1600 4600
	1    0    0    -1  
$EndComp
$Comp
L 6502:65C02S U2
U 1 1 5F5A65C1
P 2400 2150
F 0 "U2" H 2400 3315 50  0000 C CNN
F 1 "65C02S" H 2400 3224 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 2400 3200 50  0001 C CNN
F 3 "" H 2250 3100 50  0001 C CNN
	1    2400 2150
	1    0    0    -1  
$EndComp
$Comp
L 6502:62256 U5
U 1 1 5F5FD943
P 7000 1900
F 0 "U5" H 7000 2815 50  0000 C CNN
F 1 "62256" H 7000 2724 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 6950 2700 50  0001 C CNN
F 3 "" H 7000 1900 50  0001 C CNN
	1    7000 1900
	1    0    0    -1  
$EndComp
$Comp
L 6502:62256 U3
U 1 1 5F5BE432
P 4650 1900
F 0 "U3" H 4650 2815 50  0000 C CNN
F 1 "62256" H 4650 2724 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 4600 2700 50  0001 C CNN
F 3 "" H 4650 1900 50  0001 C CNN
	1    4650 1900
	1    0    0    -1  
$EndComp
$Comp
L 6502:28C256 U7
U 1 1 5F605CEF
P 9400 1900
F 0 "U7" H 9400 2815 50  0000 C CNN
F 1 "28C256" H 9400 2724 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 9350 2700 50  0001 C CNN
F 3 "" H 9400 1900 50  0001 C CNN
	1    9400 1900
	1    0    0    -1  
$EndComp
Wire Bus Line
	3200 2750 3300 2750
$Sheet
S 1700 6650 700  350 
U 5F8F4E1E
F0 "supervisor" 50
F1 "supervisor.sch" 50
$EndSheet
Text GLabel 6650 4150 0    50   Input ~ 0
IOCS
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 5F9BC711
P 3550 4550
F 0 "X?" H 3206 4596 50  0000 R CNN
F 1 "8MHz" H 3206 4505 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 4000 4200 50  0001 C CNN
F 3 "" H 3450 4550 50  0001 C CNN
	1    3550 4550
	1    0    0    -1  
$EndComp
Text GLabel 3550 4150 1    50   Input ~ 0
+5V
Text GLabel 3550 4950 3    50   Input ~ 0
GND
Text GLabel 3950 4550 2    50   Output ~ 0
6502_CLK
Wire Wire Line
	3550 4150 3550 4250
Wire Wire Line
	3550 4950 3550 4850
Wire Wire Line
	3850 4550 3950 4550
Wire Bus Line
	6500 3750 6500 3950
Wire Bus Line
	3850 2350 3850 2950
Wire Bus Line
	6200 2350 6200 2950
Wire Bus Line
	8600 2350 8600 2950
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
	3200 2850 3200 3550
Wire Bus Line
	3200 2050 3200 2750
Wire Bus Line
	8650 3950 8650 4650
Wire Bus Line
	3850 650  3850 2050
Wire Bus Line
	6200 650  6200 2050
Wire Bus Line
	8600 650  8600 2050
Wire Bus Line
	1600 2150 1600 3400
$EndSCHEMATC
