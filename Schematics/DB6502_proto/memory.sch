EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
Title "DB6502 Hobby Computer Version 2"
Date "2020-10-30"
Rev "v003"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Open Source Hardware"
Comment4 "Author: Dawid Buchwald"
$EndDescr
Text GLabel 1100 2850 3    50   Input ~ 0
GND
Wire Wire Line
	1100 2850 1100 2750
Wire Wire Line
	1100 2750 1200 2750
Text GLabel 2300 1100 1    50   Input ~ 0
+5V
Wire Wire Line
	2300 1100 2300 1200
Wire Wire Line
	2300 1450 2200 1450
Text GLabel 2450 1350 1    50   Input ~ 0
~WE
Wire Wire Line
	2450 1350 2450 1550
Wire Wire Line
	2450 1550 2200 1550
Text GLabel 2600 1350 1    50   Input ~ 0
~OE
Text GLabel 2750 1350 1    50   Input ~ 0
RAM1_~CS
Wire Wire Line
	2750 1350 2750 2250
Wire Wire Line
	2750 2250 2200 2250
Wire Wire Line
	2600 1350 2600 2050
Wire Wire Line
	2600 2050 2200 2050
Text Label 1000 2450 0    50   ~ 0
d0
Text Label 1000 2550 0    50   ~ 0
d1
Text Label 1000 2650 0    50   ~ 0
d2
Entry Wire Line
	900  2550 1000 2450
Entry Wire Line
	900  2650 1000 2550
Entry Wire Line
	900  2750 1000 2650
Text Label 2400 2750 2    50   ~ 0
d3
Text Label 2400 2650 2    50   ~ 0
d4
Text Label 2400 2550 2    50   ~ 0
d5
Text Label 2400 2450 2    50   ~ 0
d6
Text Label 2400 2350 2    50   ~ 0
d7
Wire Wire Line
	1000 2450 1200 2450
Wire Wire Line
	1000 2550 1200 2550
Wire Wire Line
	1000 2650 1200 2650
Wire Wire Line
	2200 2750 2400 2750
Wire Wire Line
	2200 2650 2400 2650
Wire Wire Line
	2200 2550 2400 2550
Wire Wire Line
	2200 2450 2400 2450
Wire Wire Line
	2200 2350 2400 2350
Entry Wire Line
	2400 2350 2500 2450
Entry Wire Line
	2400 2450 2500 2550
Entry Wire Line
	2400 2550 2500 2650
Entry Wire Line
	2400 2650 2500 2750
Entry Wire Line
	2400 2750 2500 2850
Wire Bus Line
	900  3150 2500 3150
Text Label 1000 2350 0    50   ~ 0
a0
Text Label 1000 2250 0    50   ~ 0
a1
Text Label 1000 2150 0    50   ~ 0
a2
Text Label 1000 2050 0    50   ~ 0
a3
Text Label 1000 1950 0    50   ~ 0
a4
Text Label 1000 1850 0    50   ~ 0
a5
Text Label 1000 1750 0    50   ~ 0
a6
Text Label 1000 1650 0    50   ~ 0
a7
Text Label 1000 1550 0    50   ~ 0
a12
Text Label 1000 1450 0    50   ~ 0
a14
Text Label 2950 1650 2    50   ~ 0
a13
Text Label 2950 1750 2    50   ~ 0
a8
Text Label 2950 1850 2    50   ~ 0
a9
Text Label 2950 1950 2    50   ~ 0
a11
Text Label 2950 2150 2    50   ~ 0
a10
Wire Wire Line
	2200 2150 2950 2150
Wire Wire Line
	2200 1950 2950 1950
Wire Wire Line
	2200 1850 2950 1850
Wire Wire Line
	2200 1750 2950 1750
Wire Wire Line
	2200 1650 2950 1650
Wire Wire Line
	1000 2350 1200 2350
Wire Wire Line
	1000 2250 1200 2250
Wire Wire Line
	1000 2150 1200 2150
Wire Wire Line
	1000 2050 1200 2050
Wire Wire Line
	1000 1950 1200 1950
Wire Wire Line
	1000 1850 1200 1850
Wire Wire Line
	1000 1750 1200 1750
Wire Wire Line
	1000 1650 1200 1650
Wire Wire Line
	1000 1550 1200 1550
Wire Wire Line
	1000 1450 1200 1450
Entry Wire Line
	2950 1650 3050 1550
Entry Wire Line
	3050 1650 2950 1750
Entry Wire Line
	2950 1850 3050 1750
Entry Wire Line
	2950 1950 3050 1850
Entry Wire Line
	2950 2150 3050 2050
Entry Wire Line
	900  1350 1000 1450
Entry Wire Line
	900  1450 1000 1550
Entry Wire Line
	900  1550 1000 1650
Entry Wire Line
	900  1650 1000 1750
Entry Wire Line
	900  1750 1000 1850
Entry Wire Line
	900  1850 1000 1950
Entry Wire Line
	900  1950 1000 2050
Entry Wire Line
	900  2050 1000 2150
Entry Wire Line
	900  2150 1000 2250
Entry Wire Line
	900  2250 1000 2350
Wire Bus Line
	900  850  3050 850 
Text GLabel 3450 2850 3    50   Input ~ 0
GND
Wire Wire Line
	3450 2850 3450 2750
Wire Wire Line
	3450 2750 3550 2750
Text GLabel 4650 1100 1    50   Input ~ 0
+5V
Wire Wire Line
	4650 1100 4650 1200
Wire Wire Line
	4650 1450 4550 1450
Text GLabel 4800 1350 1    50   Input ~ 0
~WE
Wire Wire Line
	4800 1350 4800 1550
Wire Wire Line
	4800 1550 4550 1550
Text GLabel 4950 1350 1    50   Input ~ 0
~OE
Text GLabel 5100 1350 1    50   Input ~ 0
RAM2_~CS
Wire Wire Line
	5100 1350 5100 2250
Wire Wire Line
	5100 2250 4550 2250
Wire Wire Line
	4950 1350 4950 2050
Wire Wire Line
	4950 2050 4550 2050
Text Label 3350 2450 0    50   ~ 0
d0
Text Label 3350 2550 0    50   ~ 0
d1
Text Label 3350 2650 0    50   ~ 0
d2
Entry Wire Line
	3250 2550 3350 2450
Entry Wire Line
	3250 2650 3350 2550
Entry Wire Line
	3250 2750 3350 2650
Text Label 4750 2750 2    50   ~ 0
d3
Text Label 4750 2650 2    50   ~ 0
d4
Text Label 4750 2550 2    50   ~ 0
d5
Text Label 4750 2450 2    50   ~ 0
d6
Text Label 4750 2350 2    50   ~ 0
d7
Wire Wire Line
	3350 2450 3550 2450
Wire Wire Line
	3350 2550 3550 2550
Wire Wire Line
	3350 2650 3550 2650
Wire Wire Line
	4550 2750 4750 2750
Wire Wire Line
	4550 2650 4750 2650
Wire Wire Line
	4550 2550 4750 2550
Wire Wire Line
	4550 2450 4750 2450
Wire Wire Line
	4550 2350 4750 2350
Entry Wire Line
	4750 2350 4850 2450
Entry Wire Line
	4750 2450 4850 2550
Entry Wire Line
	4750 2550 4850 2650
Entry Wire Line
	4750 2650 4850 2750
Entry Wire Line
	4750 2750 4850 2850
Wire Bus Line
	3250 3150 4850 3150
Text Label 3350 2350 0    50   ~ 0
a0
Text Label 3350 2250 0    50   ~ 0
a1
Text Label 3350 2150 0    50   ~ 0
a2
Text Label 3350 2050 0    50   ~ 0
a3
Text Label 3350 1950 0    50   ~ 0
a4
Text Label 3350 1850 0    50   ~ 0
a5
Text Label 3350 1750 0    50   ~ 0
a6
Text Label 3350 1650 0    50   ~ 0
a7
Text Label 3350 1550 0    50   ~ 0
a12
Text Label 3350 1450 0    50   ~ 0
a14
Text Label 5300 1650 2    50   ~ 0
a13
Text Label 5300 1750 2    50   ~ 0
a8
Text Label 5300 1850 2    50   ~ 0
a9
Text Label 5300 1950 2    50   ~ 0
a11
Text Label 5300 2150 2    50   ~ 0
a10
Wire Wire Line
	4550 2150 5300 2150
Wire Wire Line
	4550 1950 5300 1950
Wire Wire Line
	4550 1850 5300 1850
Wire Wire Line
	4550 1750 5300 1750
Wire Wire Line
	4550 1650 5300 1650
Wire Wire Line
	3350 2350 3550 2350
Wire Wire Line
	3350 2250 3550 2250
Wire Wire Line
	3350 2150 3550 2150
Wire Wire Line
	3350 2050 3550 2050
Wire Wire Line
	3350 1950 3550 1950
Wire Wire Line
	3350 1850 3550 1850
Wire Wire Line
	3350 1750 3550 1750
Wire Wire Line
	3350 1650 3550 1650
Wire Wire Line
	3350 1550 3550 1550
Wire Wire Line
	3350 1450 3550 1450
Entry Wire Line
	5300 1650 5400 1550
Entry Wire Line
	5400 1650 5300 1750
Entry Wire Line
	5300 1850 5400 1750
Entry Wire Line
	5300 1950 5400 1850
Entry Wire Line
	5300 2150 5400 2050
Entry Wire Line
	3250 1350 3350 1450
Entry Wire Line
	3250 1450 3350 1550
Entry Wire Line
	3250 1550 3350 1650
Entry Wire Line
	3250 1650 3350 1750
Entry Wire Line
	3250 1750 3350 1850
Entry Wire Line
	3250 1850 3350 1950
Entry Wire Line
	3250 1950 3350 2050
Entry Wire Line
	3250 2050 3350 2150
Entry Wire Line
	3250 2150 3350 2250
Entry Wire Line
	3250 2250 3350 2350
Wire Bus Line
	3250 850  5400 850 
Text GLabel 5850 2850 3    50   Input ~ 0
GND
Wire Wire Line
	5850 2850 5850 2750
Wire Wire Line
	5850 2750 5950 2750
Text GLabel 7050 1100 1    50   Input ~ 0
+5V
Wire Wire Line
	7050 1100 7050 1200
Wire Wire Line
	7050 1450 6950 1450
Text GLabel 7200 1350 1    50   Input ~ 0
~WE
Wire Wire Line
	7200 1350 7200 1550
Wire Wire Line
	7200 1550 6950 1550
Text GLabel 7350 1350 1    50   Input ~ 0
~OE
Text GLabel 7500 1350 1    50   Input ~ 0
ROM_~CS
Wire Wire Line
	7500 1350 7500 2250
Wire Wire Line
	7500 2250 6950 2250
Wire Wire Line
	7350 1350 7350 2050
Wire Wire Line
	7350 2050 6950 2050
Text Label 5750 2450 0    50   ~ 0
d0
Text Label 5750 2550 0    50   ~ 0
d1
Text Label 5750 2650 0    50   ~ 0
d2
Entry Wire Line
	5650 2550 5750 2450
Entry Wire Line
	5650 2650 5750 2550
Entry Wire Line
	5650 2750 5750 2650
Text Label 7150 2750 2    50   ~ 0
d3
Text Label 7150 2650 2    50   ~ 0
d4
Text Label 7150 2550 2    50   ~ 0
d5
Text Label 7150 2450 2    50   ~ 0
d6
Text Label 7150 2350 2    50   ~ 0
d7
Wire Wire Line
	5750 2450 5950 2450
Wire Wire Line
	5750 2550 5950 2550
Wire Wire Line
	5750 2650 5950 2650
Wire Wire Line
	6950 2750 7150 2750
Wire Wire Line
	6950 2650 7150 2650
Wire Wire Line
	6950 2550 7150 2550
Wire Wire Line
	6950 2450 7150 2450
Wire Wire Line
	6950 2350 7150 2350
Entry Wire Line
	7150 2350 7250 2450
Entry Wire Line
	7150 2450 7250 2550
Entry Wire Line
	7150 2550 7250 2650
Entry Wire Line
	7150 2650 7250 2750
Entry Wire Line
	7150 2750 7250 2850
Wire Bus Line
	5650 3150 7250 3150
Text Label 5750 2350 0    50   ~ 0
a0
Text Label 5750 2250 0    50   ~ 0
a1
Text Label 5750 2150 0    50   ~ 0
a2
Text Label 5750 2050 0    50   ~ 0
a3
Text Label 5750 1950 0    50   ~ 0
a4
Text Label 5750 1850 0    50   ~ 0
a5
Text Label 5750 1750 0    50   ~ 0
a6
Text Label 5750 1650 0    50   ~ 0
a7
Text Label 5750 1550 0    50   ~ 0
a12
Text Label 5750 1450 0    50   ~ 0
a14
Text Label 7700 1650 2    50   ~ 0
a13
Text Label 7700 1750 2    50   ~ 0
a8
Text Label 7700 1850 2    50   ~ 0
a9
Text Label 7700 1950 2    50   ~ 0
a11
Text Label 7700 2150 2    50   ~ 0
a10
Wire Wire Line
	6950 2150 7700 2150
Wire Wire Line
	6950 1950 7700 1950
Wire Wire Line
	6950 1850 7700 1850
Wire Wire Line
	6950 1750 7700 1750
Wire Wire Line
	6950 1650 7700 1650
Wire Wire Line
	5750 2350 5950 2350
Wire Wire Line
	5750 2250 5950 2250
Wire Wire Line
	5750 2150 5950 2150
Wire Wire Line
	5750 2050 5950 2050
Wire Wire Line
	5750 1950 5950 1950
Wire Wire Line
	5750 1850 5950 1850
Wire Wire Line
	5750 1750 5950 1750
Wire Wire Line
	5750 1650 5950 1650
Wire Wire Line
	5750 1550 5950 1550
Wire Wire Line
	5750 1450 5950 1450
Entry Wire Line
	7700 1650 7800 1550
Entry Wire Line
	7800 1650 7700 1750
Entry Wire Line
	7700 1850 7800 1750
Entry Wire Line
	7700 1950 7800 1850
Entry Wire Line
	7700 2150 7800 2050
Entry Wire Line
	5650 1350 5750 1450
Entry Wire Line
	5650 1450 5750 1550
Entry Wire Line
	5650 1550 5750 1650
Entry Wire Line
	5650 1650 5750 1750
Entry Wire Line
	5650 1750 5750 1850
Entry Wire Line
	5650 1850 5750 1950
Entry Wire Line
	5650 1950 5750 2050
Entry Wire Line
	5650 2050 5750 2150
Entry Wire Line
	5650 2150 5750 2250
Entry Wire Line
	5650 2250 5750 2350
Wire Bus Line
	5650 850  7800 850 
$Comp
L 6502:62256 U?
U 1 1 5FECA009
P 4050 2100
AR Path="/5FECA009" Ref="U?"  Part="1" 
AR Path="/5FEB1407/5FECA009" Ref="U19"  Part="1" 
F 0 "U19" H 4050 2200 50  0000 C CNN
F 1 "62256" H 4050 2100 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 4000 2900 50  0001 C CNN
F 3 "" H 4050 2100 50  0001 C CNN
	1    4050 2100
	1    0    0    -1  
$EndComp
$Comp
L 6502:62256 U?
U 1 1 5FECA00F
P 1700 2100
AR Path="/5FECA00F" Ref="U?"  Part="1" 
AR Path="/5FEB1407/5FECA00F" Ref="U18"  Part="1" 
F 0 "U18" H 1700 2200 50  0000 C CNN
F 1 "62256" H 1700 2100 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 1650 2900 50  0001 C CNN
F 3 "" H 1700 2100 50  0001 C CNN
	1    1700 2100
	1    0    0    -1  
$EndComp
$Comp
L 6502:28C256 U?
U 1 1 5FECA015
P 6450 2100
AR Path="/5FECA015" Ref="U?"  Part="1" 
AR Path="/5FEB1407/5FECA015" Ref="U20"  Part="1" 
F 0 "U20" H 6450 2200 50  0000 C CNN
F 1 "28C256" H 6450 2100 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 6400 2900 50  0001 C CNN
F 3 "" H 6450 2100 50  0001 C CNN
	1    6450 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FECA01B
P 2100 1200
AR Path="/5FECA01B" Ref="C?"  Part="1" 
AR Path="/5FEB1407/5FECA01B" Ref="C40"  Part="1" 
F 0 "C40" V 1871 1200 50  0000 C CNN
F 1 "0,1uF" V 1962 1200 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2100 1200 50  0001 C CNN
F 3 "~" H 2100 1200 50  0001 C CNN
	1    2100 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 1200 2300 1200
Connection ~ 2300 1200
Wire Wire Line
	2300 1200 2300 1450
Text GLabel 1900 1200 0    50   Input ~ 0
GND
Wire Wire Line
	1900 1200 2000 1200
$Comp
L Device:C_Small C?
U 1 1 5FECA026
P 4450 1200
AR Path="/5FECA026" Ref="C?"  Part="1" 
AR Path="/5FEB1407/5FECA026" Ref="C41"  Part="1" 
F 0 "C41" V 4221 1200 50  0000 C CNN
F 1 "0,1uF" V 4312 1200 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4450 1200 50  0001 C CNN
F 3 "~" H 4450 1200 50  0001 C CNN
	1    4450 1200
	0    1    1    0   
$EndComp
Text GLabel 4250 1200 0    50   Input ~ 0
GND
Wire Wire Line
	4250 1200 4350 1200
$Comp
L Device:C_Small C?
U 1 1 5FECA02E
P 6850 1200
AR Path="/5FECA02E" Ref="C?"  Part="1" 
AR Path="/5FEB1407/5FECA02E" Ref="C42"  Part="1" 
F 0 "C42" V 6621 1200 50  0000 C CNN
F 1 "0,1uF" V 6712 1200 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6850 1200 50  0001 C CNN
F 3 "~" H 6850 1200 50  0001 C CNN
	1    6850 1200
	0    1    1    0   
$EndComp
Text GLabel 6650 1200 0    50   Input ~ 0
GND
Wire Wire Line
	6650 1200 6750 1200
Wire Wire Line
	4550 1200 4650 1200
Connection ~ 4650 1200
Wire Wire Line
	4650 1200 4650 1450
Wire Wire Line
	6950 1200 7050 1200
Connection ~ 7050 1200
Wire Wire Line
	7050 1200 7050 1450
Text GLabel 7900 2050 2    50   Input ~ 0
a[0..15]
Text GLabel 7350 2450 2    50   Input ~ 0
d[0..7]
Wire Bus Line
	7800 2050 7900 2050
Wire Bus Line
	7250 2450 7350 2450
Wire Bus Line
	900  2550 900  3150
Wire Bus Line
	3250 2550 3250 3150
Wire Bus Line
	5650 2550 5650 3150
Wire Bus Line
	7800 850  7800 2050
Wire Bus Line
	7250 2450 7250 3150
Wire Bus Line
	5400 850  5400 2050
Wire Bus Line
	4850 2450 4850 3150
Wire Bus Line
	3050 850  3050 2050
Wire Bus Line
	2500 2450 2500 3150
Wire Bus Line
	5650 850  5650 2250
Wire Bus Line
	3250 850  3250 2250
Wire Bus Line
	900  850  900  2250
$EndSCHEMATC
