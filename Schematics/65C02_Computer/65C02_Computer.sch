EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 6502:WDC65C02S U?
U 1 1 5E135500
P 2000 2400
F 0 "U?" H 2025 3565 50  0000 C CNN
F 1 "WDC65C02S" H 2025 3474 50  0000 C CNN
F 2 "" H 1850 3350 50  0001 C CNN
F 3 "" H 1850 3350 50  0001 C CNN
	1    2000 2400
	1    0    0    -1  
$EndComp
Text GLabel 1300 1800 0    50   Input ~ 0
IRQ
Wire Wire Line
	1300 1800 1500 1800
Text GLabel 2750 1800 2    50   Input ~ 0
CLK
Wire Wire Line
	2750 1800 2550 1800
Text GLabel 2750 3400 2    50   Input ~ 0
GND
Wire Wire Line
	2750 3400 2550 3400
Text GLabel 1300 2200 0    50   Input ~ 0
+5V
Wire Wire Line
	1300 2200 1500 2200
Text Label 1300 2300 0    50   ~ 0
a0
Text Label 1300 2400 0    50   ~ 0
a1
Text Label 1300 2500 0    50   ~ 0
a2
Text Label 1300 2600 0    50   ~ 0
a3
Text Label 1300 2700 0    50   ~ 0
a4
Text Label 1300 2800 0    50   ~ 0
a5
Text Label 1300 2900 0    50   ~ 0
a6
Text Label 1300 3000 0    50   ~ 0
a7
Text Label 1300 3100 0    50   ~ 0
a8
Text Label 1300 3200 0    50   ~ 0
a9
Text Label 1300 3300 0    50   ~ 0
a10
Text Label 1300 3400 0    50   ~ 0
a11
Text Label 2750 3300 2    50   ~ 0
a12
Text Label 2750 3200 2    50   ~ 0
a13
Text Label 2750 3100 2    50   ~ 0
a14
Text Label 2750 3000 2    50   ~ 0
a15
Text Label 2750 2900 2    50   ~ 0
d7
Text Label 2750 2800 2    50   ~ 0
d6
Text Label 2750 2700 2    50   ~ 0
d5
Text Label 2750 2600 2    50   ~ 0
d4
Text Label 2750 2500 2    50   ~ 0
d3
Text Label 2750 2400 2    50   ~ 0
d2
Text Label 2750 2300 2    50   ~ 0
d1
Text Label 2750 2200 2    50   ~ 0
d0
Wire Wire Line
	1500 2300 1300 2300
Wire Wire Line
	1500 2400 1300 2400
Wire Wire Line
	1500 2500 1300 2500
Wire Wire Line
	1500 2600 1300 2600
Wire Wire Line
	1500 2700 1300 2700
Wire Wire Line
	1500 2800 1300 2800
Wire Wire Line
	1500 2900 1300 2900
Wire Wire Line
	1500 3000 1300 3000
Wire Wire Line
	1500 3100 1300 3100
Wire Wire Line
	1500 3200 1300 3200
Wire Wire Line
	1500 3300 1300 3300
Wire Wire Line
	1500 3400 1300 3400
Wire Wire Line
	2550 3300 2750 3300
Wire Wire Line
	2550 3200 2750 3200
Wire Wire Line
	2550 3100 2750 3100
Wire Wire Line
	2550 3000 2750 3000
Wire Wire Line
	2550 2900 2750 2900
Wire Wire Line
	2550 2800 2750 2800
Wire Wire Line
	2550 2700 2750 2700
Wire Wire Line
	2550 2600 2750 2600
Wire Wire Line
	2550 2500 2750 2500
Wire Wire Line
	2550 2400 2750 2400
Wire Wire Line
	2550 2300 2750 2300
Wire Wire Line
	2550 2200 2750 2200
Text GLabel 2750 2100 2    50   Input ~ 0
R~W
Wire Wire Line
	2750 2100 2550 2100
NoConn ~ 2550 1900
NoConn ~ 2550 1700
NoConn ~ 2550 1600
NoConn ~ 1500 2100
NoConn ~ 1500 1900
NoConn ~ 1500 1700
$EndSCHEMATC
