EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "65C02 Hobby Computer"
Date "2020-01-07"
Rev "v001"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Based on Ben Eater's design"
Comment4 "Author: Dawid Buchwald"
$EndDescr
Text GLabel 1150 2500 1    50   Input ~ 0
~IRQ
Wire Wire Line
	1150 2500 1150 2900
Text GLabel 2500 2500 1    50   Input ~ 0
CLK
Wire Wire Line
	2500 2900 2250 2900
Text GLabel 2350 4650 3    50   Input ~ 0
GND
Text Label 1050 3400 0    50   ~ 0
a0
Text Label 1050 3500 0    50   ~ 0
a1
Text Label 1050 3600 0    50   ~ 0
a2
Text Label 1050 3700 0    50   ~ 0
a3
Text Label 1050 3800 0    50   ~ 0
a4
Text Label 1050 3900 0    50   ~ 0
a5
Text Label 1050 4000 0    50   ~ 0
a6
Text Label 1050 4100 0    50   ~ 0
a7
Text Label 1050 4200 0    50   ~ 0
a8
Text Label 1050 4300 0    50   ~ 0
a9
Text Label 1050 4400 0    50   ~ 0
a10
Text Label 1050 4500 0    50   ~ 0
a11
Text Label 2450 4400 2    50   ~ 0
a12
Text Label 2450 4300 2    50   ~ 0
a13
Text Label 2450 4200 2    50   ~ 0
a14
Text Label 2450 4100 2    50   ~ 0
a15
Text Label 2450 4000 2    50   ~ 0
d7
Text Label 2450 3900 2    50   ~ 0
d6
Text Label 2450 3800 2    50   ~ 0
d5
Text Label 2450 3700 2    50   ~ 0
d4
Text Label 2450 3600 2    50   ~ 0
d3
Text Label 2450 3500 2    50   ~ 0
d2
Text Label 2450 3400 2    50   ~ 0
d1
Text Label 2450 3300 2    50   ~ 0
d0
Wire Wire Line
	1250 3400 1050 3400
Wire Wire Line
	1250 3500 1050 3500
Wire Wire Line
	1250 3600 1050 3600
Wire Wire Line
	1250 3700 1050 3700
Wire Wire Line
	1250 3800 1050 3800
Wire Wire Line
	1250 3900 1050 3900
Wire Wire Line
	1250 4000 1050 4000
Wire Wire Line
	1250 4100 1050 4100
Wire Wire Line
	1250 4200 1050 4200
Wire Wire Line
	1250 4300 1050 4300
Wire Wire Line
	1250 4400 1050 4400
Wire Wire Line
	1250 4500 1050 4500
Wire Wire Line
	2250 4400 2450 4400
Wire Wire Line
	2250 4300 2450 4300
Wire Wire Line
	2250 4200 2450 4200
Wire Wire Line
	2250 4100 2450 4100
Wire Wire Line
	2250 4000 2450 4000
Wire Wire Line
	2250 3900 2450 3900
Wire Wire Line
	2250 3800 2450 3800
Wire Wire Line
	2250 3700 2450 3700
Wire Wire Line
	2250 3600 2450 3600
Wire Wire Line
	2250 3500 2450 3500
Wire Wire Line
	2250 3400 2450 3400
Wire Wire Line
	2250 3300 2450 3300
Text GLabel 2650 2500 1    50   Input ~ 0
R~W
Wire Wire Line
	2650 3200 2250 3200
NoConn ~ 2250 2700
NoConn ~ 1250 3200
NoConn ~ 1250 3000
NoConn ~ 1250 2800
Wire Wire Line
	1250 3100 1100 3100
Wire Wire Line
	1250 2700 1100 2700
Wire Wire Line
	800  3100 700  3100
Wire Wire Line
	700  3100 700  2700
Wire Wire Line
	700  2700 800  2700
Wire Wire Line
	700  2500 700  2700
Connection ~ 700  2700
Text GLabel 700  2500 1    50   Input ~ 0
+5V
Text GLabel 2350 2500 1    50   Input ~ 0
~RES
Wire Wire Line
	2350 2600 2250 2600
Wire Wire Line
	2250 4500 2350 4500
Wire Wire Line
	2350 4500 2350 4650
Entry Wire Line
	950  3500 1050 3400
Entry Wire Line
	950  3600 1050 3500
Entry Wire Line
	950  3700 1050 3600
Entry Wire Line
	950  3800 1050 3700
Entry Wire Line
	950  3900 1050 3800
Entry Wire Line
	950  4000 1050 3900
Entry Wire Line
	950  4100 1050 4000
Entry Wire Line
	950  4200 1050 4100
Entry Wire Line
	950  4300 1050 4200
Entry Wire Line
	950  4400 1050 4300
Entry Wire Line
	950  4500 1050 4400
Entry Wire Line
	950  4600 1050 4500
Entry Wire Line
	2450 4400 2550 4500
Entry Wire Line
	2450 4300 2550 4400
Entry Wire Line
	2450 4200 2550 4300
Entry Wire Line
	2450 4100 2550 4200
Entry Wire Line
	2450 3300 2550 3400
Entry Wire Line
	2450 3400 2550 3500
Entry Wire Line
	2450 3500 2550 3600
Entry Wire Line
	2450 3600 2550 3700
Entry Wire Line
	2450 3700 2550 3800
Entry Wire Line
	2450 3800 2550 3900
Entry Wire Line
	2450 3900 2550 4000
Entry Wire Line
	2450 4000 2550 4100
NoConn ~ 1250 2600
Wire Wire Line
	9150 5600 9150 5650
Text GLabel 9250 5250 2    50   Output ~ 0
+5V
Text GLabel 9250 5650 2    50   Output ~ 0
GND
Wire Wire Line
	9150 5650 9250 5650
Connection ~ 9150 5650
Wire Wire Line
	9150 5250 9250 5250
Connection ~ 9150 5250
Wire Wire Line
	9150 5250 9150 5300
Text GLabel 3200 4600 3    50   Input ~ 0
+5V
Text GLabel 5500 4600 3    50   Input ~ 0
+5V
Wire Wire Line
	5500 4500 5600 4500
Text GLabel 4400 2500 1    50   Input ~ 0
~RES
Text GLabel 6700 2500 1    50   Input ~ 0
~RES
Wire Wire Line
	4300 3200 4400 3200
Wire Wire Line
	6600 3200 6700 3200
Text GLabel 4550 2500 1    50   Input ~ 0
CLK
Text GLabel 6850 2500 1    50   Input ~ 0
CLK
Text GLabel 5500 2500 1    50   Input ~ 0
GND
Text Label 7050 2800 2    50   ~ 0
a0
Text Label 7050 2900 2    50   ~ 0
a1
Text Label 7050 3000 2    50   ~ 0
a2
Text Label 7050 3100 2    50   ~ 0
a3
Wire Wire Line
	6600 2800 7050 2800
Wire Wire Line
	6600 2900 7050 2900
Wire Wire Line
	6600 3000 7050 3000
Wire Wire Line
	6600 3100 7050 3100
Text Label 4750 2800 2    50   ~ 0
a0
Text Label 4750 2900 2    50   ~ 0
a1
Text Label 4750 3000 2    50   ~ 0
a2
Text Label 4750 3100 2    50   ~ 0
a3
Wire Wire Line
	4300 3100 4750 3100
Wire Wire Line
	4300 3000 4750 3000
Wire Wire Line
	4300 2900 4750 2900
Wire Wire Line
	4300 2800 4750 2800
NoConn ~ 4300 2600
NoConn ~ 4300 2700
NoConn ~ 3300 4300
NoConn ~ 3300 4400
NoConn ~ 5600 4400
NoConn ~ 5600 4300
NoConn ~ 6600 2700
NoConn ~ 6600 2600
Entry Wire Line
	4750 2800 4850 2700
Entry Wire Line
	4750 2900 4850 2800
Entry Wire Line
	4750 3000 4850 2900
Entry Wire Line
	4750 3100 4850 3000
Entry Wire Line
	7050 2800 7150 2700
Entry Wire Line
	7050 2900 7150 2800
Entry Wire Line
	7050 3000 7150 2900
Entry Wire Line
	7050 3100 7150 3000
Text Label 4750 3300 2    50   ~ 0
d0
Text Label 7050 3300 2    50   ~ 0
d0
Text Label 4750 3400 2    50   ~ 0
d1
Text Label 7050 3400 2    50   ~ 0
d1
Text Label 4750 3500 2    50   ~ 0
d2
Text Label 7050 3500 2    50   ~ 0
d2
Text Label 4750 3600 2    50   ~ 0
d3
Text Label 7050 3600 2    50   ~ 0
d3
Text Label 4750 3700 2    50   ~ 0
d4
Text Label 7050 3700 2    50   ~ 0
d4
Text Label 4750 3800 2    50   ~ 0
d5
Text Label 7050 3800 2    50   ~ 0
d5
Text Label 4750 3900 2    50   ~ 0
d6
Text Label 7050 3900 2    50   ~ 0
d6
Text Label 4750 4000 2    50   ~ 0
d7
Text Label 7050 4000 2    50   ~ 0
d7
Wire Wire Line
	4300 3300 4750 3300
Wire Wire Line
	4300 3400 4750 3400
Wire Wire Line
	4300 3500 4750 3500
Wire Wire Line
	4300 3600 4750 3600
Wire Wire Line
	4300 3700 4750 3700
Wire Wire Line
	4300 3800 4750 3800
Wire Wire Line
	4300 3900 4750 3900
Wire Wire Line
	4300 4000 4750 4000
Wire Wire Line
	6600 4000 7050 4000
Wire Wire Line
	6600 3900 7050 3900
Wire Wire Line
	6600 3800 7050 3800
Wire Wire Line
	6600 3700 7050 3700
Wire Wire Line
	6600 3600 7050 3600
Wire Wire Line
	6600 3500 7050 3500
Wire Wire Line
	6600 3400 7050 3400
Wire Wire Line
	6600 3300 7050 3300
Entry Wire Line
	4750 3300 4850 3200
Entry Wire Line
	4750 3400 4850 3300
Entry Wire Line
	4750 3500 4850 3400
Entry Wire Line
	4750 3600 4850 3500
Entry Wire Line
	4750 3700 4850 3600
Entry Wire Line
	4750 3800 4850 3700
Entry Wire Line
	4750 3900 4850 3800
Entry Wire Line
	4750 4000 4850 3900
Entry Wire Line
	7050 3300 7150 3200
Entry Wire Line
	7050 3400 7150 3300
Entry Wire Line
	7050 3500 7150 3400
Entry Wire Line
	7050 3600 7150 3500
Entry Wire Line
	7050 3700 7150 3600
Entry Wire Line
	7050 3800 7150 3700
Entry Wire Line
	7050 3900 7150 3800
Entry Wire Line
	7050 4000 7150 3900
Text GLabel 4550 4600 3    50   Input ~ 0
R~W
Text GLabel 6850 4600 3    50   Input ~ 0
R~W
Text GLabel 4700 4600 3    50   Input ~ 0
~IOCS
Text GLabel 7000 4600 3    50   Input ~ 0
~IOCS
Text Label 4750 4200 2    50   ~ 0
a12
Wire Wire Line
	4750 4200 4300 4200
Text Label 7050 4200 2    50   ~ 0
a11
Wire Wire Line
	7050 4200 6600 4200
Entry Wire Line
	4750 4200 4850 4100
Entry Wire Line
	7050 4200 7150 4100
Text GLabel 3200 2500 1    50   Input ~ 0
GND
Text Label 3000 2700 0    50   ~ 0
v1pa0
Text Label 3000 2800 0    50   ~ 0
v1pa1
Text Label 3000 2900 0    50   ~ 0
v1pa2
Text Label 3000 3000 0    50   ~ 0
v1pa3
Text Label 3000 3100 0    50   ~ 0
v1pa4
Text Label 3000 3200 0    50   ~ 0
v1pa5
Text Label 3000 3300 0    50   ~ 0
v1pa6
Text Label 3000 3400 0    50   ~ 0
v1pa7
Text Label 3000 3500 0    50   ~ 0
v1pb0
Text Label 3000 3600 0    50   ~ 0
v1pb1
Text Label 3000 3700 0    50   ~ 0
v1pb2
Text Label 3000 3800 0    50   ~ 0
v1pb3
Text Label 3000 3900 0    50   ~ 0
v1pb4
Text Label 3000 4000 0    50   ~ 0
v1pb5
Text Label 3000 4100 0    50   ~ 0
v1pb6
Text Label 3000 4200 0    50   ~ 0
v1pb7
Text Label 5300 2700 0    50   ~ 0
v2pa0
Text Label 5300 2800 0    50   ~ 0
v2pa1
Text Label 5300 2900 0    50   ~ 0
v2pa2
Text Label 5300 3000 0    50   ~ 0
v2pa3
Text Label 5300 3100 0    50   ~ 0
v2pa4
Text Label 5300 3200 0    50   ~ 0
v2pa5
Text Label 5300 3300 0    50   ~ 0
v2pa6
Text Label 5300 3400 0    50   ~ 0
v2pa7
Text Label 5300 3500 0    50   ~ 0
v2pb0
Text Label 5300 3600 0    50   ~ 0
v2pb1
Text Label 5300 3700 0    50   ~ 0
v2pb2
Text Label 5300 3800 0    50   ~ 0
v2pb3
Text Label 5300 3900 0    50   ~ 0
v2pb4
Text Label 5300 4000 0    50   ~ 0
v2pb5
Text Label 5300 4100 0    50   ~ 0
v2pb6
Text Label 5300 4200 0    50   ~ 0
v2pb7
Wire Wire Line
	3200 4500 3300 4500
Wire Wire Line
	5300 2700 5600 2700
Wire Wire Line
	5300 2800 5600 2800
Wire Wire Line
	5300 2900 5600 2900
Wire Wire Line
	5300 3000 5600 3000
Wire Wire Line
	5300 3100 5600 3100
Wire Wire Line
	5300 3200 5600 3200
Wire Wire Line
	5300 3300 5600 3300
Wire Wire Line
	5300 3400 5600 3400
Wire Wire Line
	5300 3500 5600 3500
Wire Wire Line
	5300 3600 5600 3600
Wire Wire Line
	5300 3700 5600 3700
Wire Wire Line
	5300 3800 5600 3800
Wire Wire Line
	5300 3900 5600 3900
Wire Wire Line
	5300 4000 5600 4000
Wire Wire Line
	5300 4100 5600 4100
Wire Wire Line
	5300 4200 5600 4200
Wire Wire Line
	3000 2700 3300 2700
Wire Wire Line
	3000 2800 3300 2800
Wire Wire Line
	3000 2900 3300 2900
Wire Wire Line
	3000 3000 3300 3000
Wire Wire Line
	3000 3100 3300 3100
Wire Wire Line
	3000 3200 3300 3200
Wire Wire Line
	3000 3300 3300 3300
Wire Wire Line
	3000 3400 3300 3400
Wire Wire Line
	3000 3500 3300 3500
Wire Wire Line
	3000 3600 3300 3600
Wire Wire Line
	3000 3700 3300 3700
Wire Wire Line
	3000 3800 3300 3800
Wire Wire Line
	3000 3900 3300 3900
Wire Wire Line
	3000 4000 3300 4000
Wire Wire Line
	3000 4100 3300 4100
Wire Wire Line
	3000 4200 3300 4200
Wire Wire Line
	3200 2500 3200 2600
Wire Wire Line
	3200 2600 3300 2600
Wire Wire Line
	5500 2500 5500 2600
Wire Wire Line
	5500 2600 5600 2600
Entry Wire Line
	2900 2600 3000 2700
Entry Wire Line
	2900 2700 3000 2800
Entry Wire Line
	2900 2800 3000 2900
Entry Wire Line
	2900 2900 3000 3000
Entry Wire Line
	2900 3000 3000 3100
Entry Wire Line
	2900 3100 3000 3200
Entry Wire Line
	2900 3200 3000 3300
Entry Wire Line
	2900 3300 3000 3400
Entry Wire Line
	2900 3600 3000 3500
Entry Wire Line
	2900 3700 3000 3600
Entry Wire Line
	2900 3800 3000 3700
Entry Wire Line
	2900 3900 3000 3800
Entry Wire Line
	2900 4000 3000 3900
Entry Wire Line
	2900 4100 3000 4000
Entry Wire Line
	2900 4200 3000 4100
Entry Wire Line
	2900 4300 3000 4200
Entry Wire Line
	5200 2600 5300 2700
Entry Wire Line
	5200 2700 5300 2800
Entry Wire Line
	5200 2800 5300 2900
Entry Wire Line
	5200 2900 5300 3000
Entry Wire Line
	5200 3000 5300 3100
Entry Wire Line
	5200 3100 5300 3200
Entry Wire Line
	5200 3200 5300 3300
Entry Wire Line
	5200 3300 5300 3400
Entry Wire Line
	5200 3600 5300 3500
Entry Wire Line
	5200 3700 5300 3600
Entry Wire Line
	5200 3800 5300 3700
Entry Wire Line
	5200 3900 5300 3800
Entry Wire Line
	5200 4000 5300 3900
Entry Wire Line
	5200 4100 5300 4000
Entry Wire Line
	5200 4200 5300 4100
Entry Wire Line
	5200 4300 5300 4200
Text GLabel 4400 4600 3    50   Output ~ 0
~V1IRQ
Text GLabel 6700 4600 3    50   Output ~ 0
~V2IRQ
Wire Wire Line
	4300 4500 4400 4500
Wire Wire Line
	4400 4500 4400 4600
Wire Wire Line
	4300 4400 4550 4400
Wire Wire Line
	4550 4400 4550 4600
Wire Wire Line
	4300 4300 4700 4300
Wire Wire Line
	4700 4300 4700 4600
Wire Wire Line
	6600 4500 6700 4500
Wire Wire Line
	6700 4500 6700 4600
Wire Wire Line
	6600 4400 6850 4400
Wire Wire Line
	6850 4400 6850 4600
Wire Wire Line
	6600 4300 7000 4300
Wire Wire Line
	7000 4300 7000 4600
Wire Wire Line
	6700 2500 6700 3200
Wire Wire Line
	6850 4100 6850 2500
Wire Wire Line
	6600 4100 6850 4100
Wire Wire Line
	4400 2500 4400 3200
Wire Wire Line
	4550 4100 4550 2500
Wire Wire Line
	4300 4100 4550 4100
Wire Wire Line
	700  3300 700  3100
Wire Wire Line
	700  3300 1250 3300
Connection ~ 700  3100
Wire Wire Line
	1150 2900 1250 2900
Wire Wire Line
	2650 3200 2650 2500
Wire Wire Line
	2500 2900 2500 2500
Wire Wire Line
	2350 2600 2350 2500
Text GLabel 1200 1750 3    50   Input ~ 0
GND
Text GLabel 1200 950  1    50   Input ~ 0
+5V
Wire Wire Line
	1200 1650 1200 1750
Wire Wire Line
	1200 1050 1200 950 
Text GLabel 1600 1350 2    50   Output ~ 0
CLK
Wire Wire Line
	1500 1350 1600 1350
Text GLabel 2550 950  1    50   Input ~ 0
+5V
Text GLabel 2550 1750 3    50   Input ~ 0
GND
Wire Wire Line
	2550 1750 2550 1650
Wire Wire Line
	2550 950  2550 1050
Text GLabel 2950 1350 2    50   Output ~ 0
RS232CLK
Wire Wire Line
	2850 1350 2950 1350
Wire Wire Line
	3200 4500 3200 4600
Wire Wire Line
	5500 4600 5500 4500
Text GLabel 9150 4400 3    50   Input ~ 0
+5V
Wire Wire Line
	9050 4300 9150 4300
Wire Wire Line
	9150 4300 9150 4400
Text GLabel 7950 2900 1    50   Input ~ 0
GND
Wire Wire Line
	7950 2900 7950 3000
Wire Wire Line
	7950 3000 8050 3000
NoConn ~ 8050 3600
NoConn ~ 8050 3700
NoConn ~ 8050 4000
NoConn ~ 8050 3400
Wire Wire Line
	9050 4200 9150 4200
Wire Wire Line
	9150 4200 9150 4300
Connection ~ 9150 4300
Wire Wire Line
	9050 4100 9150 4100
Wire Wire Line
	9150 4100 9150 4200
Connection ~ 9150 4200
Text GLabel 9150 2900 1    50   Input ~ 0
R~W
Wire Wire Line
	9150 2900 9150 3000
Wire Wire Line
	9150 3000 9050 3000
Text GLabel 9300 2900 1    50   Input ~ 0
CLK
Wire Wire Line
	9300 2900 9300 3100
Wire Wire Line
	9300 3100 9050 3100
Text Label 9600 4000 2    50   ~ 0
d0
Text Label 9600 3900 2    50   ~ 0
d1
Text Label 9600 3800 2    50   ~ 0
d2
Text Label 9600 3700 2    50   ~ 0
d3
Text Label 9600 3600 2    50   ~ 0
d4
Text Label 9600 3500 2    50   ~ 0
d5
Text Label 9600 3400 2    50   ~ 0
d6
Text Label 9600 3300 2    50   ~ 0
d7
Wire Wire Line
	9050 3300 9600 3300
Wire Wire Line
	9050 3400 9600 3400
Wire Wire Line
	9050 3500 9600 3500
Wire Wire Line
	9050 3600 9600 3600
Wire Wire Line
	9050 3700 9600 3700
Wire Wire Line
	9050 3800 9600 3800
Wire Wire Line
	9050 3900 9600 3900
Wire Wire Line
	9050 4000 9600 4000
Entry Wire Line
	9600 3300 9700 3200
Entry Wire Line
	9600 3400 9700 3300
Entry Wire Line
	9600 3500 9700 3400
Entry Wire Line
	9600 3600 9700 3500
Entry Wire Line
	9600 3700 9700 3600
Entry Wire Line
	9600 3800 9700 3700
Entry Wire Line
	9600 3900 9700 3800
Entry Wire Line
	9600 4000 9700 3900
Text Label 7900 3100 0    50   ~ 0
a10
Text GLabel 7650 2900 1    50   Input ~ 0
~IOCS
Wire Wire Line
	7650 2900 7650 3200
Wire Wire Line
	7650 3200 8050 3200
Wire Wire Line
	8050 3100 7900 3100
Entry Wire Line
	7800 3000 7900 3100
Text GLabel 7500 2900 1    50   Input ~ 0
~RES
Wire Wire Line
	7500 2900 7500 3300
Wire Wire Line
	7500 3300 8050 3300
Text GLabel 7950 3500 0    50   Input ~ 0
RS232CLK
Wire Wire Line
	7950 3500 8050 3500
Text Label 7900 4200 0    50   ~ 0
a0
Text Label 7900 4300 0    50   ~ 0
a1
Wire Wire Line
	7900 4300 8050 4300
Wire Wire Line
	7900 4200 8050 4200
Entry Wire Line
	7800 4300 7900 4200
Entry Wire Line
	7800 4400 7900 4300
Wire Bus Line
	7800 4300 7800 4400
Text GLabel 7950 3800 0    50   Input ~ 0
GND
Wire Wire Line
	7950 3800 8050 3800
Text GLabel 7950 3900 0    50   Output ~ 0
TxD
Wire Wire Line
	8050 3900 7950 3900
Text GLabel 7950 4050 0    50   Input ~ 0
RxD
Wire Wire Line
	7950 4050 8000 4050
Wire Wire Line
	8000 4050 8000 4100
Wire Wire Line
	8000 4100 8050 4100
Wire Wire Line
	4550 1800 4650 1800
Text Label 3650 1100 0    50   ~ 0
a15
Wire Wire Line
	3950 1200 3850 1200
Wire Wire Line
	3850 1200 3850 1100
Wire Wire Line
	3850 1000 3950 1000
Wire Wire Line
	3650 1100 3850 1100
Connection ~ 3850 1100
Wire Wire Line
	3850 1100 3850 1000
Text Label 3650 1700 0    50   ~ 0
a14
Text Label 3650 1900 0    50   ~ 0
a13
Wire Wire Line
	3950 1900 3850 1900
Wire Wire Line
	3950 1700 3650 1700
Wire Wire Line
	4550 1100 4650 1100
Text GLabel 4650 1300 0    50   Input ~ 0
CLK
Wire Wire Line
	4650 1300 4750 1300
Entry Wire Line
	3550 1800 3650 1700
Entry Wire Line
	3550 2000 3650 1900
Entry Wire Line
	3550 1200 3650 1100
Text GLabel 5450 1900 2    50   Output ~ 0
~IOCS
Wire Wire Line
	5350 1900 5450 1900
Text GLabel 5450 1200 2    50   Output ~ 0
~RAM_CS
Wire Wire Line
	5350 1200 5450 1200
Text GLabel 5450 1500 2    50   Output ~ 0
~ROM_CS
Wire Wire Line
	4650 1800 4650 1500
Wire Wire Line
	4650 1500 5450 1500
Connection ~ 4650 1800
Wire Wire Line
	4650 1800 4750 1800
Text GLabel 5450 800  2    50   Output ~ 0
~ROM_OE
Wire Wire Line
	5450 800  4650 800 
Wire Wire Line
	4650 800  4650 1100
Connection ~ 4650 1100
Wire Wire Line
	4650 1100 4750 1100
Wire Bus Line
	7800 2900 7800 3000
Wire Bus Line
	7150 4100 7150 4000
$Comp
L 74xx:74HC02 U?
U 2 1 5E1744DD
P 4250 1800
F 0 "U?" H 4250 2125 50  0000 C CNN
F 1 "74HC02" H 4250 2034 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4250 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc02" H 4250 1800 50  0001 C CNN
	2    4250 1800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 3 1 5E171DC1
P 5050 1900
F 0 "U?" H 5050 2225 50  0000 C CNN
F 1 "74HC00" H 5050 2134 50  0000 C CNN
F 2 "" H 5050 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5050 1900 50  0001 C CNN
	3    5050 1900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 2 1 5E16FD0A
P 5050 1200
F 0 "U?" H 5050 1525 50  0000 C CNN
F 1 "74HC00" H 5050 1434 50  0000 C CNN
F 2 "" H 5050 1200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5050 1200 50  0001 C CNN
	2    5050 1200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 1 1 5E16D50B
P 4250 1100
F 0 "U?" H 4250 1425 50  0000 C CNN
F 1 "74HC00" H 4250 1334 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4250 1100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4250 1100 50  0001 C CNN
	1    4250 1100
	1    0    0    -1  
$EndComp
$Comp
L 6502:65C51N U?
U 1 1 5E222305
P 8550 3650
F 0 "U?" H 8550 4550 50  0000 C CNN
F 1 "65C51N" H 8550 4450 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 8550 3650 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c51n.pdf" H 8550 3650 50  0001 C CNN
	1    8550 3650
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 5E1E750E
P 2550 1350
F 0 "X?" H 2300 1400 50  0000 R CNN
F 1 "1.8432MHz" H 2300 1300 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 3000 1000 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 2450 1350 50  0001 C CNN
	1    2550 1350
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 5E1CCFB4
P 1200 1350
F 0 "X?" H 950 1400 50  0000 R CNN
F 1 "8MHz" H 950 1300 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 1650 1000 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 1100 1350 50  0001 C CNN
	1    1200 1350
	1    0    0    -1  
$EndComp
$Comp
L 6502:65C22S U?
U 1 1 5E173F5E
P 6100 3500
F 0 "U?" H 6100 4650 50  0000 C CNN
F 1 "65C22S" H 6100 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 6200 3500 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c22.pdf" H 6200 3500 50  0001 C CNN
	1    6100 3500
	1    0    0    -1  
$EndComp
$Comp
L 6502:65C22S U?
U 1 1 5E171BBD
P 3800 3500
F 0 "U?" H 3800 4650 50  0000 C CNN
F 1 "65C22S" H 3800 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 3900 3500 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c22.pdf" H 3900 3500 50  0001 C CNN
	1    3800 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E15B54A
P 9150 5450
F 0 "C?" H 9265 5496 50  0000 L CNN
F 1 "0.1uF" H 9265 5405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 9188 5300 50  0001 C CNN
F 3 "~" H 9150 5450 50  0001 C CNN
	1    9150 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5E15AF3A
P 5100 5700
F 0 "#PWR0101" H 5100 5450 50  0001 C CNN
F 1 "GND" H 5105 5527 50  0000 C CNN
F 2 "" H 5100 5700 50  0001 C CNN
F 3 "" H 5100 5700 50  0001 C CNN
	1    5100 5700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5E15AAC6
P 5100 5200
F 0 "#PWR0102" H 5100 5050 50  0001 C CNN
F 1 "+5V" H 5115 5373 50  0000 C CNN
F 2 "" H 5100 5200 50  0001 C CNN
F 3 "" H 5100 5200 50  0001 C CNN
	1    5100 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E14ABB7
P 950 3100
F 0 "R?" V 850 3100 50  0000 C CNN
F 1 "1K" V 950 3100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 880 3100 50  0001 C CNN
F 3 "~" H 950 3100 50  0001 C CNN
	1    950  3100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E14A45B
P 950 2700
F 0 "R?" V 850 2700 50  0000 C CNN
F 1 "1K" V 950 2700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 880 2700 50  0001 C CNN
F 3 "~" H 950 2700 50  0001 C CNN
	1    950  2700
	0    1    1    0   
$EndComp
$Comp
L 6502:65C02S U?
U 1 1 5E135500
P 1750 3500
F 0 "U?" H 1750 4650 50  0000 C CNN
F 1 "65C02S" H 1750 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 1600 4450 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c02s.pdf" H 1600 4450 50  0001 C CNN
	1    1750 3500
	1    0    0    -1  
$EndComp
Wire Bus Line
	4850 4100 4850 4000
$Comp
L 6502:28C256 U?
U 1 1 5E3D4005
P 1450 6100
F 0 "U?" H 1450 7015 50  0000 C CNN
F 1 "28C256" H 1450 6924 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 1400 6900 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 1450 6100 50  0001 C CNN
	1    1450 6100
	1    0    0    -1  
$EndComp
Text GLabel 2050 5350 1    50   Input ~ 0
+5V
Text GLabel 2200 5350 1    50   Input ~ 0
~ROM_OE
Text GLabel 2350 5350 1    50   Input ~ 0
~ROM_CS
Wire Wire Line
	2050 5350 2050 5450
Wire Wire Line
	2050 5450 1950 5450
Wire Wire Line
	1950 5550 2050 5550
Wire Wire Line
	2050 5550 2050 5450
Connection ~ 2050 5450
Wire Wire Line
	2200 5350 2200 6050
Wire Wire Line
	2200 6050 1950 6050
Wire Wire Line
	2350 5350 2350 6250
Wire Wire Line
	2350 6250 1950 6250
Text Label 2100 6350 2    50   ~ 0
d7
Text Label 2100 6450 2    50   ~ 0
d6
Text Label 2100 6550 2    50   ~ 0
d5
Text Label 2100 6650 2    50   ~ 0
d4
Text Label 2100 6750 2    50   ~ 0
d3
Wire Wire Line
	1950 6750 2100 6750
Wire Wire Line
	1950 6650 2100 6650
Wire Wire Line
	1950 6550 2100 6550
Wire Wire Line
	1950 6450 2100 6450
Wire Wire Line
	1950 6350 2100 6350
Text GLabel 850  6850 3    50   Input ~ 0
GND
Wire Wire Line
	850  6850 850  6750
Wire Wire Line
	850  6750 950  6750
Text Label 800  6650 0    50   ~ 0
d2
Text Label 800  6550 0    50   ~ 0
d1
Text Label 800  6450 0    50   ~ 0
d0
Wire Wire Line
	800  6450 950  6450
Wire Wire Line
	800  6550 950  6550
Wire Wire Line
	800  6650 950  6650
Entry Wire Line
	2100 6350 2200 6450
Entry Wire Line
	2100 6450 2200 6550
Entry Wire Line
	2100 6550 2200 6650
Entry Wire Line
	2100 6650 2200 6750
Entry Wire Line
	2100 6750 2200 6850
Entry Wire Line
	700  6750 800  6650
Entry Wire Line
	700  6650 800  6550
Entry Wire Line
	700  6550 800  6450
Text Label 800  5450 0    50   ~ 0
a14
Text Label 800  5550 0    50   ~ 0
a12
Text Label 800  5650 0    50   ~ 0
a7
Text Label 800  5750 0    50   ~ 0
a6
Text Label 800  5850 0    50   ~ 0
a5
Text Label 800  5950 0    50   ~ 0
a4
Text Label 800  6050 0    50   ~ 0
a3
Text Label 800  6150 0    50   ~ 0
a2
Text Label 800  6250 0    50   ~ 0
a1
Text Label 800  6350 0    50   ~ 0
a0
Text Label 2500 5650 2    50   ~ 0
a13
Text Label 2500 5750 2    50   ~ 0
a8
Text Label 2500 5850 2    50   ~ 0
a9
Text Label 2500 5950 2    50   ~ 0
a11
Text Label 2500 6150 2    50   ~ 0
a10
Wire Wire Line
	1950 5650 2500 5650
Wire Wire Line
	1950 5750 2500 5750
Wire Wire Line
	1950 5850 2500 5850
Wire Wire Line
	1950 5950 2500 5950
Wire Wire Line
	1950 6150 2500 6150
Wire Wire Line
	950  5450 800  5450
Wire Wire Line
	950  5550 800  5550
Wire Wire Line
	950  5650 800  5650
Wire Wire Line
	950  5750 800  5750
Wire Wire Line
	950  5850 800  5850
Wire Wire Line
	950  5950 800  5950
Wire Wire Line
	950  6050 800  6050
Wire Wire Line
	950  6150 800  6150
Wire Wire Line
	950  6250 800  6250
Wire Wire Line
	950  6350 800  6350
Entry Wire Line
	700  5350 800  5450
Entry Wire Line
	700  5450 800  5550
Entry Wire Line
	700  5550 800  5650
Entry Wire Line
	700  5650 800  5750
Entry Wire Line
	700  5750 800  5850
Entry Wire Line
	700  5850 800  5950
Entry Wire Line
	700  5950 800  6050
Entry Wire Line
	700  6050 800  6150
Entry Wire Line
	700  6150 800  6250
Entry Wire Line
	700  6250 800  6350
Entry Wire Line
	2500 5650 2600 5750
Entry Wire Line
	2500 5750 2600 5850
Entry Wire Line
	2500 5850 2600 5950
Entry Wire Line
	2500 5950 2600 6050
Entry Wire Line
	2500 6150 2600 6250
$Comp
L 6502:62256 U?
U 1 1 5E37B16A
P 3500 6100
F 0 "U?" H 3500 7015 50  0000 C CNN
F 1 "62256" H 3500 6924 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 3450 6900 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 3500 6100 50  0001 C CNN
	1    3500 6100
	1    0    0    -1  
$EndComp
Text GLabel 4100 5350 1    50   Input ~ 0
+5V
Wire Wire Line
	4100 5350 4100 5450
Wire Wire Line
	4100 5450 4000 5450
Wire Wire Line
	4400 5350 4400 6050
Wire Wire Line
	4400 6050 4000 6050
Text Label 4150 6350 2    50   ~ 0
d7
Text Label 4150 6450 2    50   ~ 0
d6
Text Label 4150 6550 2    50   ~ 0
d5
Text Label 4150 6650 2    50   ~ 0
d4
Text Label 4150 6750 2    50   ~ 0
d3
Wire Wire Line
	4000 6750 4150 6750
Wire Wire Line
	4000 6650 4150 6650
Wire Wire Line
	4000 6550 4150 6550
Wire Wire Line
	4000 6450 4150 6450
Wire Wire Line
	4000 6350 4150 6350
Text GLabel 2900 6850 3    50   Input ~ 0
GND
Wire Wire Line
	2900 6850 2900 6750
Wire Wire Line
	2900 6750 3000 6750
Text Label 2850 6650 0    50   ~ 0
d2
Text Label 2850 6550 0    50   ~ 0
d1
Text Label 2850 6450 0    50   ~ 0
d0
Wire Wire Line
	2850 6450 3000 6450
Wire Wire Line
	2850 6550 3000 6550
Wire Wire Line
	2850 6650 3000 6650
Entry Wire Line
	4150 6350 4250 6450
Entry Wire Line
	4150 6450 4250 6550
Entry Wire Line
	4150 6550 4250 6650
Entry Wire Line
	4150 6650 4250 6750
Entry Wire Line
	4150 6750 4250 6850
Entry Wire Line
	2750 6750 2850 6650
Entry Wire Line
	2750 6650 2850 6550
Entry Wire Line
	2750 6550 2850 6450
Text Label 2850 5450 0    50   ~ 0
a14
Text Label 2850 5550 0    50   ~ 0
a12
Text Label 2850 5650 0    50   ~ 0
a7
Text Label 2850 5750 0    50   ~ 0
a6
Text Label 2850 5850 0    50   ~ 0
a5
Text Label 2850 5950 0    50   ~ 0
a4
Text Label 2850 6050 0    50   ~ 0
a3
Text Label 2850 6150 0    50   ~ 0
a2
Text Label 2850 6250 0    50   ~ 0
a1
Text Label 2850 6350 0    50   ~ 0
a0
Wire Wire Line
	3000 5450 2850 5450
Wire Wire Line
	3000 5550 2850 5550
Wire Wire Line
	3000 5650 2850 5650
Wire Wire Line
	3000 5750 2850 5750
Wire Wire Line
	3000 5850 2850 5850
Wire Wire Line
	3000 5950 2850 5950
Wire Wire Line
	3000 6050 2850 6050
Wire Wire Line
	3000 6150 2850 6150
Wire Wire Line
	3000 6250 2850 6250
Wire Wire Line
	3000 6350 2850 6350
Entry Wire Line
	2750 5350 2850 5450
Entry Wire Line
	2750 5450 2850 5550
Entry Wire Line
	2750 5550 2850 5650
Entry Wire Line
	2750 5650 2850 5750
Entry Wire Line
	2750 5750 2850 5850
Entry Wire Line
	2750 5850 2850 5950
Entry Wire Line
	2750 5950 2850 6050
Entry Wire Line
	2750 6050 2850 6150
Entry Wire Line
	2750 6150 2850 6250
Entry Wire Line
	2750 6250 2850 6350
Text GLabel 4400 5350 1    50   Input ~ 0
~RAM_CS
Entry Wire Line
	4550 6150 4650 6250
Entry Wire Line
	4550 5950 4650 6050
Entry Wire Line
	4550 5850 4650 5950
Entry Wire Line
	4550 5750 4650 5850
Entry Wire Line
	4550 5650 4650 5750
Wire Wire Line
	4000 6150 4550 6150
Text Label 4550 6150 2    50   ~ 0
a10
Wire Wire Line
	4000 5950 4550 5950
Text Label 4550 5950 2    50   ~ 0
a11
Wire Wire Line
	4000 5850 4550 5850
Text Label 4550 5850 2    50   ~ 0
a9
Wire Wire Line
	4000 5750 4550 5750
Text Label 4550 5750 2    50   ~ 0
a8
Wire Wire Line
	4000 5650 4550 5650
Text Label 4550 5650 2    50   ~ 0
a13
Wire Wire Line
	4400 6050 4400 6250
Wire Wire Line
	4400 6250 4000 6250
Connection ~ 4400 6050
Text GLabel 4250 5350 1    50   Input ~ 0
R~W
Wire Wire Line
	4250 5550 4250 5350
Wire Wire Line
	4000 5550 4250 5550
$Comp
L Timer:NE555 U?
U 1 1 5E17C676
P 7500 1400
F 0 "U?" H 7500 1450 50  0000 C CNN
F 1 "NE555" H 7500 1350 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 7500 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne555.pdf" H 7500 1400 50  0001 C CNN
	1    7500 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1600 6900 1600
Wire Wire Line
	7500 1800 7500 2100
Wire Wire Line
	8000 1400 8100 1400
Wire Wire Line
	8100 1400 8100 1600
Wire Wire Line
	8100 1600 8000 1600
$Comp
L Device:R R?
U 1 1 5E1F5B26
P 8100 950
F 0 "R?" V 8000 950 50  0000 C CNN
F 1 "47K" V 8100 950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8030 950 50  0001 C CNN
F 3 "~" H 8100 950 50  0001 C CNN
	1    8100 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5E2337BD
P 8100 1850
F 0 "C?" H 8218 1896 50  0000 L CNN
F 1 "10uF" H 8218 1805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 8138 1700 50  0001 C CNN
F 3 "~" H 8100 1850 50  0001 C CNN
	1    8100 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 1700 8100 1600
Connection ~ 8100 1600
Wire Wire Line
	8100 2000 8100 2100
Wire Wire Line
	8100 2100 7500 2100
Connection ~ 7500 2100
NoConn ~ 7000 1400
$Comp
L Switch:SW_Push SW?
U 1 1 5E2CBD4E
P 6600 1650
F 0 "SW?" V 6650 1950 50  0000 R CNN
F 1 "RESET" V 6550 2000 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 6600 1850 50  0001 C CNN
F 3 "~" H 6600 1850 50  0001 C CNN
	1    6600 1650
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E2ECA64
P 6750 1850
F 0 "C?" H 6865 1896 50  0000 L CNN
F 1 "0.1uF" H 6865 1805 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 6788 1700 50  0001 C CNN
F 3 "~" H 6750 1850 50  0001 C CNN
	1    6750 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1850 6600 2100
Wire Wire Line
	6600 2100 6750 2100
Wire Wire Line
	6750 2000 6750 2100
Connection ~ 6750 2100
Wire Wire Line
	6750 2100 7500 2100
Wire Wire Line
	6750 1700 6750 1200
Wire Wire Line
	6750 1200 7000 1200
Wire Wire Line
	6600 1450 6600 1200
Wire Wire Line
	6600 1200 6750 1200
Connection ~ 6750 1200
$Comp
L Device:R R?
U 1 1 5E3A85D8
P 6750 950
F 0 "R?" V 6650 950 50  0000 C CNN
F 1 "1M" V 6750 950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6680 950 50  0001 C CNN
F 3 "~" H 6750 950 50  0001 C CNN
	1    6750 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1200 6750 1100
Wire Wire Line
	6750 800  6750 700 
Wire Wire Line
	6750 700  6900 700 
Wire Wire Line
	8000 1200 8200 1200
Text GLabel 9100 1200 2    50   Output ~ 0
~RES
Wire Wire Line
	8900 1200 9000 1200
$Comp
L Device:R R?
U 1 1 5E552FBE
P 9000 950
F 0 "R?" V 8900 950 50  0000 C CNN
F 1 "1K" V 9000 950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8930 950 50  0001 C CNN
F 3 "~" H 9000 950 50  0001 C CNN
	1    9000 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 700  6900 1600
Wire Wire Line
	8100 1400 8100 1100
Connection ~ 8100 1400
Wire Wire Line
	8100 800  8100 700 
Wire Wire Line
	8100 700  7500 700 
Wire Wire Line
	6900 700  7500 700 
Connection ~ 6900 700 
Connection ~ 7500 700 
Wire Wire Line
	9000 800  9000 700 
Wire Wire Line
	9000 700  8100 700 
Connection ~ 8100 700 
Wire Wire Line
	9000 1100 9000 1200
Connection ~ 9000 1200
Wire Wire Line
	9000 1200 9100 1200
Wire Wire Line
	7500 1000 7500 700 
Text GLabel 6100 700  0    50   Input ~ 0
+5V
Connection ~ 6600 2100
Wire Wire Line
	6100 700  6200 700 
Connection ~ 6750 700 
Wire Wire Line
	6050 2100 6200 2100
Text GLabel 6050 2100 0    50   Input ~ 0
GND
$Comp
L Device:C C?
U 1 1 5E7C431C
P 6200 1400
F 0 "C?" H 6315 1446 50  0000 L CNN
F 1 "0.1uF" H 6315 1355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 6238 1250 50  0001 C CNN
F 3 "~" H 6200 1400 50  0001 C CNN
	1    6200 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1550 6200 2100
Connection ~ 6200 2100
Wire Wire Line
	6200 2100 6600 2100
Wire Wire Line
	6200 1250 6200 700 
Connection ~ 6200 700 
Wire Wire Line
	6200 700  6750 700 
Text GLabel 2800 2500 1    50   Input ~ 0
+5V
Wire Wire Line
	2250 3000 2800 3000
Wire Wire Line
	2800 3000 2800 2800
$Comp
L 74xx:74HC00 U?
U 4 1 5E218D59
P 8600 1200
F 0 "U?" H 8600 1525 50  0000 C CNN
F 1 "74HC00" H 8600 1434 50  0000 C CNN
F 2 "" H 8600 1200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 8600 1200 50  0001 C CNN
	4    8600 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 1100 8200 1100
Wire Wire Line
	8200 1100 8200 1200
Wire Wire Line
	8200 1300 8300 1300
Connection ~ 8200 1200
Wire Wire Line
	8200 1200 8200 1300
Wire Wire Line
	3850 1900 3850 2000
Wire Wire Line
	3850 2000 4750 2000
Connection ~ 3850 1900
Wire Wire Line
	3850 1900 3650 1900
$Comp
L 74xx:74LS21 U?
U 1 1 5E23A6D1
P 10400 1350
F 0 "U?" H 10400 1725 50  0000 C CNN
F 1 "74HC21" H 10400 1634 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 10400 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 10400 1350 50  0001 C CNN
	1    10400 1350
	1    0    0    -1  
$EndComp
Text GLabel 9450 2900 1    50   Output ~ 0
~AIRQ
Wire Wire Line
	9050 3200 9450 3200
Wire Wire Line
	9450 3200 9450 2900
Text GLabel 10000 1100 1    50   Input ~ 0
~V1IRQ
Text GLabel 9850 1100 1    50   Input ~ 0
~V2IRQ
Text GLabel 9700 1100 1    50   Input ~ 0
~AIRQ
Text GLabel 9550 1100 1    50   Input ~ 0
+5V
Wire Wire Line
	10000 1100 10000 1200
Wire Wire Line
	10000 1200 10100 1200
Wire Wire Line
	9850 1100 9850 1300
Wire Wire Line
	9850 1300 10100 1300
Wire Wire Line
	9700 1100 9700 1400
Wire Wire Line
	9700 1400 10100 1400
Wire Wire Line
	9550 1100 9550 1500
Wire Wire Line
	9550 1500 10100 1500
Text GLabel 10800 1350 2    50   Output ~ 0
~IRQ
Wire Wire Line
	10700 1350 10800 1350
Wire Wire Line
	2250 2800 2800 2800
Connection ~ 2800 2800
Wire Wire Line
	2800 2800 2800 2500
$Comp
L Device:C C?
U 1 1 5E3E0FFB
P 8700 5450
F 0 "C?" H 8815 5496 50  0000 L CNN
F 1 "0.1uF" H 8815 5405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 8738 5300 50  0001 C CNN
F 3 "~" H 8700 5450 50  0001 C CNN
	1    8700 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3E14F5
P 8250 5450
F 0 "C?" H 8365 5496 50  0000 L CNN
F 1 "0.1uF" H 8365 5405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 8288 5300 50  0001 C CNN
F 3 "~" H 8250 5450 50  0001 C CNN
	1    8250 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3E1910
P 7800 5450
F 0 "C?" H 7915 5496 50  0000 L CNN
F 1 "0.1uF" H 7915 5405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 7838 5300 50  0001 C CNN
F 3 "~" H 7800 5450 50  0001 C CNN
	1    7800 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3E1BD5
P 7350 5450
F 0 "C?" H 7465 5496 50  0000 L CNN
F 1 "0.1uF" H 7465 5405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 7388 5300 50  0001 C CNN
F 3 "~" H 7350 5450 50  0001 C CNN
	1    7350 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3E1DA8
P 6900 5450
F 0 "C?" H 7015 5496 50  0000 L CNN
F 1 "0.1uF" H 7015 5405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 6938 5300 50  0001 C CNN
F 3 "~" H 6900 5450 50  0001 C CNN
	1    6900 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3E2103
P 6450 5450
F 0 "C?" H 6565 5496 50  0000 L CNN
F 1 "0.1uF" H 6565 5405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 6488 5300 50  0001 C CNN
F 3 "~" H 6450 5450 50  0001 C CNN
	1    6450 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3E2489
P 6000 5450
F 0 "C?" H 6115 5496 50  0000 L CNN
F 1 "0.1uF" H 6115 5405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 6038 5300 50  0001 C CNN
F 3 "~" H 6000 5450 50  0001 C CNN
	1    6000 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5600 6000 5650
Wire Wire Line
	6000 5650 6450 5650
Wire Wire Line
	6450 5600 6450 5650
Connection ~ 6450 5650
Wire Wire Line
	6450 5650 6900 5650
Wire Wire Line
	6900 5600 6900 5650
Connection ~ 6900 5650
Wire Wire Line
	6900 5650 7350 5650
Wire Wire Line
	7350 5600 7350 5650
Connection ~ 7350 5650
Wire Wire Line
	7350 5650 7800 5650
Wire Wire Line
	7800 5600 7800 5650
Connection ~ 7800 5650
Wire Wire Line
	7800 5650 8250 5650
Wire Wire Line
	8250 5600 8250 5650
Connection ~ 8250 5650
Wire Wire Line
	8250 5650 8700 5650
Wire Wire Line
	8700 5600 8700 5650
Connection ~ 8700 5650
Wire Wire Line
	8700 5650 9150 5650
Wire Wire Line
	6000 5300 6000 5250
Wire Wire Line
	6000 5250 6450 5250
Wire Wire Line
	6450 5300 6450 5250
Connection ~ 6450 5250
Wire Wire Line
	6450 5250 6900 5250
Wire Wire Line
	6900 5300 6900 5250
Connection ~ 6900 5250
Wire Wire Line
	6900 5250 7350 5250
Wire Wire Line
	7350 5300 7350 5250
Connection ~ 7350 5250
Wire Wire Line
	7350 5250 7800 5250
Wire Wire Line
	7800 5300 7800 5250
Connection ~ 7800 5250
Wire Wire Line
	7800 5250 8250 5250
Wire Wire Line
	8250 5300 8250 5250
Connection ~ 8250 5250
Wire Wire Line
	8250 5250 8700 5250
Wire Wire Line
	8700 5300 8700 5250
Connection ~ 8700 5250
Wire Wire Line
	8700 5250 9150 5250
Connection ~ 6000 5650
Connection ~ 6000 5250
$Comp
L Device:C C?
U 1 1 5E6FCC42
P 5550 5450
F 0 "C?" H 5665 5496 50  0000 L CNN
F 1 "0.1uF" H 5665 5405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 5588 5300 50  0001 C CNN
F 3 "~" H 5550 5450 50  0001 C CNN
	1    5550 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E6FCFF5
P 5100 5450
F 0 "C?" H 5215 5496 50  0000 L CNN
F 1 "0.1uF" H 5215 5405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 5138 5300 50  0001 C CNN
F 3 "~" H 5100 5450 50  0001 C CNN
	1    5100 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 5600 5100 5650
Wire Wire Line
	5100 5650 5550 5650
Wire Wire Line
	5550 5600 5550 5650
Connection ~ 5550 5650
Wire Wire Line
	5550 5650 6000 5650
Wire Wire Line
	6000 5250 5550 5250
Wire Wire Line
	5100 5250 5100 5300
Wire Wire Line
	5550 5300 5550 5250
Connection ~ 5550 5250
Wire Wire Line
	5550 5250 5100 5250
Wire Wire Line
	5100 5250 5100 5200
Connection ~ 5100 5250
Wire Wire Line
	5100 5650 5100 5700
Connection ~ 5100 5650
Wire Bus Line
	2750 6550 2750 6750
Wire Bus Line
	700  6550 700  6750
Wire Bus Line
	3550 1200 3550 2000
Wire Bus Line
	2550 4200 2550 4500
Wire Bus Line
	4850 2700 4850 3000
Wire Bus Line
	7150 2700 7150 3000
Wire Bus Line
	4650 5750 4650 6250
Wire Bus Line
	4250 6450 4250 6850
Wire Bus Line
	2600 5750 2600 6250
Wire Bus Line
	2200 6450 2200 6850
Wire Bus Line
	2550 3400 2550 4100
Wire Bus Line
	4850 3200 4850 3900
Wire Bus Line
	7150 3200 7150 3900
Wire Bus Line
	2900 2600 2900 3300
Wire Bus Line
	2900 3600 2900 4300
Wire Bus Line
	5200 2600 5200 3300
Wire Bus Line
	5200 3600 5200 4300
Wire Bus Line
	9700 3200 9700 3900
Wire Bus Line
	2750 5350 2750 6250
Wire Bus Line
	700  5350 700  6250
Wire Bus Line
	950  3500 950  4600
Text Notes 6600 5750 0    50   ~ 0
Bypass capacitors, one per IC
$EndSCHEMATC
