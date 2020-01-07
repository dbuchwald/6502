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
$Comp
L 6502:WDC65C02S U?
U 1 1 5E135500
P 2200 3500
F 0 "U?" H 2225 4665 50  0000 C CNN
F 1 "WDC65C02S" H 2225 4574 50  0000 C CNN
F 2 "" H 2050 4450 50  0001 C CNN
F 3 "" H 2050 4450 50  0001 C CNN
	1    2200 3500
	1    0    0    -1  
$EndComp
Text GLabel 1600 2500 1    50   Input ~ 0
IRQ
Wire Wire Line
	1600 2500 1600 2900
Text GLabel 3000 2500 1    50   Input ~ 0
CLK
Wire Wire Line
	3000 2900 2750 2900
Text GLabel 2850 4650 3    50   Input ~ 0
GND
Text Label 1500 3400 0    50   ~ 0
a0
Text Label 1500 3500 0    50   ~ 0
a1
Text Label 1500 3600 0    50   ~ 0
a2
Text Label 1500 3700 0    50   ~ 0
a3
Text Label 1500 3800 0    50   ~ 0
a4
Text Label 1500 3900 0    50   ~ 0
a5
Text Label 1500 4000 0    50   ~ 0
a6
Text Label 1500 4100 0    50   ~ 0
a7
Text Label 1500 4200 0    50   ~ 0
a8
Text Label 1500 4300 0    50   ~ 0
a9
Text Label 1500 4400 0    50   ~ 0
a10
Text Label 1500 4500 0    50   ~ 0
a11
Text Label 2950 4400 2    50   ~ 0
a12
Text Label 2950 4300 2    50   ~ 0
a13
Text Label 2950 4200 2    50   ~ 0
a14
Text Label 2950 4100 2    50   ~ 0
a15
Text Label 2950 4000 2    50   ~ 0
d7
Text Label 2950 3900 2    50   ~ 0
d6
Text Label 2950 3800 2    50   ~ 0
d5
Text Label 2950 3700 2    50   ~ 0
d4
Text Label 2950 3600 2    50   ~ 0
d3
Text Label 2950 3500 2    50   ~ 0
d2
Text Label 2950 3400 2    50   ~ 0
d1
Text Label 2950 3300 2    50   ~ 0
d0
Wire Wire Line
	1700 3400 1500 3400
Wire Wire Line
	1700 3500 1500 3500
Wire Wire Line
	1700 3600 1500 3600
Wire Wire Line
	1700 3700 1500 3700
Wire Wire Line
	1700 3800 1500 3800
Wire Wire Line
	1700 3900 1500 3900
Wire Wire Line
	1700 4000 1500 4000
Wire Wire Line
	1700 4100 1500 4100
Wire Wire Line
	1700 4200 1500 4200
Wire Wire Line
	1700 4300 1500 4300
Wire Wire Line
	1700 4400 1500 4400
Wire Wire Line
	1700 4500 1500 4500
Wire Wire Line
	2750 4400 2950 4400
Wire Wire Line
	2750 4300 2950 4300
Wire Wire Line
	2750 4200 2950 4200
Wire Wire Line
	2750 4100 2950 4100
Wire Wire Line
	2750 4000 2950 4000
Wire Wire Line
	2750 3900 2950 3900
Wire Wire Line
	2750 3800 2950 3800
Wire Wire Line
	2750 3700 2950 3700
Wire Wire Line
	2750 3600 2950 3600
Wire Wire Line
	2750 3500 2950 3500
Wire Wire Line
	2750 3400 2950 3400
Wire Wire Line
	2750 3300 2950 3300
Text GLabel 3150 2500 1    50   Input ~ 0
R~W
Wire Wire Line
	3150 3200 2750 3200
NoConn ~ 2750 3000
NoConn ~ 2750 2800
NoConn ~ 2750 2700
NoConn ~ 1700 3200
NoConn ~ 1700 3000
NoConn ~ 1700 2800
$Comp
L Device:R R?
U 1 1 5E14A45B
P 1400 2700
F 0 "R?" V 1300 2700 50  0000 C CNN
F 1 "1K" V 1400 2700 50  0000 C CNN
F 2 "" V 1330 2700 50  0001 C CNN
F 3 "~" H 1400 2700 50  0001 C CNN
	1    1400 2700
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E14ABB7
P 1400 3100
F 0 "R?" V 1300 3100 50  0000 C CNN
F 1 "1K" V 1400 3100 50  0000 C CNN
F 2 "" V 1330 3100 50  0001 C CNN
F 3 "~" H 1400 3100 50  0001 C CNN
	1    1400 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	1700 3100 1550 3100
Wire Wire Line
	1700 2700 1550 2700
Wire Wire Line
	1250 3100 1150 3100
Wire Wire Line
	1150 3100 1150 2700
Wire Wire Line
	1150 2700 1250 2700
Wire Wire Line
	1150 2500 1150 2700
Connection ~ 1150 2700
Text GLabel 1150 2500 1    50   Input ~ 0
+5V
Text GLabel 2850 2500 1    50   Input ~ 0
~RES
Wire Wire Line
	2850 2600 2750 2600
Wire Wire Line
	2750 4500 2850 4500
Wire Wire Line
	2850 4500 2850 4650
Entry Wire Line
	1400 3500 1500 3400
Entry Wire Line
	1400 3600 1500 3500
Entry Wire Line
	1400 3700 1500 3600
Entry Wire Line
	1400 3800 1500 3700
Entry Wire Line
	1400 3900 1500 3800
Entry Wire Line
	1400 4000 1500 3900
Entry Wire Line
	1400 4100 1500 4000
Entry Wire Line
	1400 4200 1500 4100
Entry Wire Line
	1400 4300 1500 4200
Entry Wire Line
	1400 4400 1500 4300
Entry Wire Line
	1400 4500 1500 4400
Entry Wire Line
	1400 4600 1500 4500
Entry Wire Line
	2950 4400 3050 4500
Entry Wire Line
	2950 4300 3050 4400
Entry Wire Line
	2950 4200 3050 4300
Entry Wire Line
	2950 4100 3050 4200
Entry Wire Line
	2950 3300 3050 3400
Entry Wire Line
	2950 3400 3050 3500
Entry Wire Line
	2950 3500 3050 3600
Entry Wire Line
	2950 3600 3050 3700
Entry Wire Line
	2950 3700 3050 3800
Entry Wire Line
	2950 3800 3050 3900
Entry Wire Line
	2950 3900 3050 4000
Entry Wire Line
	2950 4000 3050 4100
NoConn ~ 1700 2600
$Comp
L power:+5V #PWR?
U 1 1 5E15AAC6
P 1300 1200
F 0 "#PWR?" H 1300 1050 50  0001 C CNN
F 1 "+5V" H 1315 1373 50  0000 C CNN
F 2 "" H 1300 1200 50  0001 C CNN
F 3 "" H 1300 1200 50  0001 C CNN
	1    1300 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E15AF3A
P 1300 1700
F 0 "#PWR?" H 1300 1450 50  0001 C CNN
F 1 "GND" H 1305 1527 50  0000 C CNN
F 2 "" H 1300 1700 50  0001 C CNN
F 3 "" H 1300 1700 50  0001 C CNN
	1    1300 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E15B54A
P 1300 1450
F 0 "C?" H 1415 1496 50  0000 L CNN
F 1 "0.1uF" H 1415 1405 50  0000 L CNN
F 2 "" H 1338 1300 50  0001 C CNN
F 3 "~" H 1300 1450 50  0001 C CNN
	1    1300 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1200 1300 1250
Wire Wire Line
	1300 1600 1300 1650
Text GLabel 1400 1250 2    50   Output ~ 0
+5V
Text GLabel 1400 1650 2    50   Output ~ 0
GND
Wire Wire Line
	1300 1650 1400 1650
Connection ~ 1300 1650
Wire Wire Line
	1300 1650 1300 1700
Wire Wire Line
	1300 1250 1400 1250
Connection ~ 1300 1250
Wire Wire Line
	1300 1250 1300 1300
$Comp
L Device:R R?
U 1 1 5E169531
P 2400 1150
F 0 "R?" V 2300 1150 50  0000 C CNN
F 1 "1K" V 2400 1150 50  0000 C CNN
F 2 "" V 2330 1150 50  0001 C CNN
F 3 "~" H 2400 1150 50  0001 C CNN
	1    2400 1150
	0    1    1    0   
$EndComp
Text GLabel 2150 1150 0    50   Input ~ 0
+5V
Wire Wire Line
	2150 1150 2250 1150
Text GLabel 3000 1150 2    50   Input ~ 0
~RES
Wire Wire Line
	2550 1150 2600 1150
$Comp
L Device:C C?
U 1 1 5E16B99D
P 2900 1450
F 0 "C?" H 3015 1496 50  0000 L CNN
F 1 "0.1uF" H 3015 1405 50  0000 L CNN
F 2 "" H 2938 1300 50  0001 C CNN
F 3 "~" H 2900 1450 50  0001 C CNN
	1    2900 1450
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5E16C019
P 2600 1450
F 0 "SW?" V 2650 1750 50  0000 R CNN
F 1 "RESET" V 2550 1800 50  0000 R CNN
F 2 "" H 2600 1650 50  0001 C CNN
F 3 "~" H 2600 1650 50  0001 C CNN
	1    2600 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2600 1250 2600 1150
Connection ~ 2600 1150
Wire Wire Line
	2600 1150 2900 1150
Wire Wire Line
	2900 1300 2900 1150
Connection ~ 2900 1150
Wire Wire Line
	2900 1150 3000 1150
Wire Wire Line
	2600 1650 2600 1750
Wire Wire Line
	2600 1750 2900 1750
Wire Wire Line
	2900 1750 2900 1600
Text GLabel 2150 1750 0    50   Input ~ 0
GND
Wire Wire Line
	2150 1750 2600 1750
Connection ~ 2600 1750
$Comp
L 6502:WDC65C22S U?
U 1 1 5E171BBD
P 4250 3500
F 0 "U?" H 4275 4665 50  0000 C CNN
F 1 "WDC65C22S" H 4275 4574 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 4350 3500 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c22.pdf" H 4350 3500 50  0001 C CNN
	1    4250 3500
	1    0    0    -1  
$EndComp
$Comp
L 6502:WDC65C22S U?
U 1 1 5E173F5E
P 6550 3500
F 0 "U?" H 6575 4665 50  0000 C CNN
F 1 "WDC65C22S" H 6575 4574 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 6650 3500 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c22.pdf" H 6650 3500 50  0001 C CNN
	1    6550 3500
	1    0    0    -1  
$EndComp
Text GLabel 3650 4600 3    50   Input ~ 0
+5V
Text GLabel 5950 4600 3    50   Input ~ 0
+5V
Wire Wire Line
	5950 4500 6050 4500
Text GLabel 4900 2500 1    50   Input ~ 0
~RES
Text GLabel 7200 2500 1    50   Input ~ 0
~RES
Wire Wire Line
	4800 3200 4900 3200
Wire Wire Line
	7100 3200 7200 3200
Text GLabel 5050 2500 1    50   Input ~ 0
CLK
Text GLabel 7350 2500 1    50   Input ~ 0
CLK
Text GLabel 5950 2500 1    50   Input ~ 0
GND
Text Label 7550 2800 2    50   ~ 0
a0
Text Label 7550 2900 2    50   ~ 0
a1
Text Label 7550 3000 2    50   ~ 0
a2
Text Label 7550 3100 2    50   ~ 0
a3
Wire Wire Line
	7100 2800 7550 2800
Wire Wire Line
	7100 2900 7550 2900
Wire Wire Line
	7100 3000 7550 3000
Wire Wire Line
	7100 3100 7550 3100
Text Label 5250 2800 2    50   ~ 0
a0
Text Label 5250 2900 2    50   ~ 0
a1
Text Label 5250 3000 2    50   ~ 0
a2
Text Label 5250 3100 2    50   ~ 0
a3
Wire Wire Line
	4800 3100 5250 3100
Wire Wire Line
	4800 3000 5250 3000
Wire Wire Line
	4800 2900 5250 2900
Wire Wire Line
	4800 2800 5250 2800
NoConn ~ 4800 2600
NoConn ~ 4800 2700
NoConn ~ 3750 4300
NoConn ~ 3750 4400
NoConn ~ 6050 4400
NoConn ~ 6050 4300
NoConn ~ 7100 2700
NoConn ~ 7100 2600
Entry Wire Line
	5250 2800 5350 2700
Entry Wire Line
	5250 2900 5350 2800
Entry Wire Line
	5250 3000 5350 2900
Entry Wire Line
	5250 3100 5350 3000
Entry Wire Line
	7550 2800 7650 2700
Entry Wire Line
	7550 2900 7650 2800
Entry Wire Line
	7550 3000 7650 2900
Entry Wire Line
	7550 3100 7650 3000
Text Label 5250 3300 2    50   ~ 0
d0
Text Label 7550 3300 2    50   ~ 0
d0
Text Label 5250 3400 2    50   ~ 0
d1
Text Label 7550 3400 2    50   ~ 0
d1
Text Label 5250 3500 2    50   ~ 0
d2
Text Label 7550 3500 2    50   ~ 0
d2
Text Label 5250 3600 2    50   ~ 0
d3
Text Label 7550 3600 2    50   ~ 0
d3
Text Label 5250 3700 2    50   ~ 0
d4
Text Label 7550 3700 2    50   ~ 0
d4
Text Label 5250 3800 2    50   ~ 0
d5
Text Label 7550 3800 2    50   ~ 0
d5
Text Label 5250 3900 2    50   ~ 0
d6
Text Label 7550 3900 2    50   ~ 0
d6
Text Label 5250 4000 2    50   ~ 0
d7
Text Label 7550 4000 2    50   ~ 0
d7
Wire Wire Line
	4800 3300 5250 3300
Wire Wire Line
	4800 3400 5250 3400
Wire Wire Line
	4800 3500 5250 3500
Wire Wire Line
	4800 3600 5250 3600
Wire Wire Line
	4800 3700 5250 3700
Wire Wire Line
	4800 3800 5250 3800
Wire Wire Line
	4800 3900 5250 3900
Wire Wire Line
	4800 4000 5250 4000
Wire Wire Line
	7100 4000 7550 4000
Wire Wire Line
	7100 3900 7550 3900
Wire Wire Line
	7100 3800 7550 3800
Wire Wire Line
	7100 3700 7550 3700
Wire Wire Line
	7100 3600 7550 3600
Wire Wire Line
	7100 3500 7550 3500
Wire Wire Line
	7100 3400 7550 3400
Wire Wire Line
	7100 3300 7550 3300
Entry Wire Line
	5250 3300 5350 3200
Entry Wire Line
	5250 3400 5350 3300
Entry Wire Line
	5250 3500 5350 3400
Entry Wire Line
	5250 3600 5350 3500
Entry Wire Line
	5250 3700 5350 3600
Entry Wire Line
	5250 3800 5350 3700
Entry Wire Line
	5250 3900 5350 3800
Entry Wire Line
	5250 4000 5350 3900
Entry Wire Line
	7550 3300 7650 3200
Entry Wire Line
	7550 3400 7650 3300
Entry Wire Line
	7550 3500 7650 3400
Entry Wire Line
	7550 3600 7650 3500
Entry Wire Line
	7550 3700 7650 3600
Entry Wire Line
	7550 3800 7650 3700
Entry Wire Line
	7550 3900 7650 3800
Entry Wire Line
	7550 4000 7650 3900
Text GLabel 5100 4600 3    50   Input ~ 0
R~W
Text GLabel 7400 4600 3    50   Input ~ 0
R~W
Text GLabel 5300 4600 3    50   Input ~ 0
~IOCS
Text GLabel 7600 4600 3    50   Input ~ 0
~IOCS
Text Label 5250 4200 2    50   ~ 0
a12
Wire Wire Line
	5250 4200 4800 4200
Text Label 7550 4200 2    50   ~ 0
a11
Wire Wire Line
	7550 4200 7100 4200
Entry Wire Line
	5250 4200 5350 4100
Entry Wire Line
	7550 4200 7650 4100
Text GLabel 3650 2500 1    50   Input ~ 0
GND
Text Label 3450 2700 0    50   ~ 0
v1pa0
Text Label 3450 2800 0    50   ~ 0
v1pa1
Text Label 3450 2900 0    50   ~ 0
v1pa2
Text Label 3450 3000 0    50   ~ 0
v1pa3
Text Label 3450 3100 0    50   ~ 0
v1pa4
Text Label 3450 3200 0    50   ~ 0
v1pa5
Text Label 3450 3300 0    50   ~ 0
v1pa6
Text Label 3450 3400 0    50   ~ 0
v1pa7
Text Label 3450 3500 0    50   ~ 0
v1pb0
Text Label 3450 3600 0    50   ~ 0
v1pb1
Text Label 3450 3700 0    50   ~ 0
v1pb2
Text Label 3450 3800 0    50   ~ 0
v1pb3
Text Label 3450 3900 0    50   ~ 0
v1pb4
Text Label 3450 4000 0    50   ~ 0
v1pb5
Text Label 3450 4100 0    50   ~ 0
v1pb6
Text Label 3450 4200 0    50   ~ 0
v1pb7
Text Label 5750 2700 0    50   ~ 0
v2pa0
Text Label 5750 2800 0    50   ~ 0
v2pa1
Text Label 5750 2900 0    50   ~ 0
v2pa2
Text Label 5750 3000 0    50   ~ 0
v2pa3
Text Label 5750 3100 0    50   ~ 0
v2pa4
Text Label 5750 3200 0    50   ~ 0
v2pa5
Text Label 5750 3300 0    50   ~ 0
v2pa6
Text Label 5750 3400 0    50   ~ 0
v2pa7
Text Label 5750 3500 0    50   ~ 0
v2pb0
Text Label 5750 3600 0    50   ~ 0
v2pb1
Text Label 5750 3700 0    50   ~ 0
v2pb2
Text Label 5750 3800 0    50   ~ 0
v2pb3
Text Label 5750 3900 0    50   ~ 0
v2pb4
Text Label 5750 4000 0    50   ~ 0
v2pb5
Text Label 5750 4100 0    50   ~ 0
v2pb6
Text Label 5750 4200 0    50   ~ 0
v2pb7
Wire Wire Line
	3650 4500 3750 4500
Wire Wire Line
	5750 2700 6050 2700
Wire Wire Line
	5750 2800 6050 2800
Wire Wire Line
	5750 2900 6050 2900
Wire Wire Line
	5750 3000 6050 3000
Wire Wire Line
	5750 3100 6050 3100
Wire Wire Line
	5750 3200 6050 3200
Wire Wire Line
	5750 3300 6050 3300
Wire Wire Line
	5750 3400 6050 3400
Wire Wire Line
	5750 3500 6050 3500
Wire Wire Line
	5750 3600 6050 3600
Wire Wire Line
	5750 3700 6050 3700
Wire Wire Line
	5750 3800 6050 3800
Wire Wire Line
	5750 3900 6050 3900
Wire Wire Line
	5750 4000 6050 4000
Wire Wire Line
	5750 4100 6050 4100
Wire Wire Line
	5750 4200 6050 4200
Wire Wire Line
	3450 2700 3750 2700
Wire Wire Line
	3450 2800 3750 2800
Wire Wire Line
	3450 2900 3750 2900
Wire Wire Line
	3450 3000 3750 3000
Wire Wire Line
	3450 3100 3750 3100
Wire Wire Line
	3450 3200 3750 3200
Wire Wire Line
	3450 3300 3750 3300
Wire Wire Line
	3450 3400 3750 3400
Wire Wire Line
	3450 3500 3750 3500
Wire Wire Line
	3450 3600 3750 3600
Wire Wire Line
	3450 3700 3750 3700
Wire Wire Line
	3450 3800 3750 3800
Wire Wire Line
	3450 3900 3750 3900
Wire Wire Line
	3450 4000 3750 4000
Wire Wire Line
	3450 4100 3750 4100
Wire Wire Line
	3450 4200 3750 4200
Wire Wire Line
	3650 2500 3650 2600
Wire Wire Line
	3650 2600 3750 2600
Wire Wire Line
	5950 2500 5950 2600
Wire Wire Line
	5950 2600 6050 2600
Entry Wire Line
	3350 2600 3450 2700
Entry Wire Line
	3350 2700 3450 2800
Entry Wire Line
	3350 2800 3450 2900
Entry Wire Line
	3350 2900 3450 3000
Entry Wire Line
	3350 3000 3450 3100
Entry Wire Line
	3350 3100 3450 3200
Entry Wire Line
	3350 3200 3450 3300
Entry Wire Line
	3350 3300 3450 3400
Entry Wire Line
	3350 3600 3450 3500
Entry Wire Line
	3350 3700 3450 3600
Entry Wire Line
	3350 3800 3450 3700
Entry Wire Line
	3350 3900 3450 3800
Entry Wire Line
	3350 4000 3450 3900
Entry Wire Line
	3350 4100 3450 4000
Entry Wire Line
	3350 4200 3450 4100
Entry Wire Line
	3350 4300 3450 4200
Entry Wire Line
	5650 2600 5750 2700
Entry Wire Line
	5650 2700 5750 2800
Entry Wire Line
	5650 2800 5750 2900
Entry Wire Line
	5650 2900 5750 3000
Entry Wire Line
	5650 3000 5750 3100
Entry Wire Line
	5650 3100 5750 3200
Entry Wire Line
	5650 3200 5750 3300
Entry Wire Line
	5650 3300 5750 3400
Entry Wire Line
	5650 3600 5750 3500
Entry Wire Line
	5650 3700 5750 3600
Entry Wire Line
	5650 3800 5750 3700
Entry Wire Line
	5650 3900 5750 3800
Entry Wire Line
	5650 4000 5750 3900
Entry Wire Line
	5650 4100 5750 4000
Entry Wire Line
	5650 4200 5750 4100
Entry Wire Line
	5650 4300 5750 4200
Text GLabel 4900 4600 3    50   Input ~ 0
~V1IRQ
Text GLabel 7200 4600 3    50   Input ~ 0
~V2IRQ
Wire Wire Line
	4800 4500 4900 4500
Wire Wire Line
	4900 4500 4900 4600
Wire Wire Line
	4800 4400 5100 4400
Wire Wire Line
	5100 4400 5100 4600
Wire Wire Line
	4800 4300 5300 4300
Wire Wire Line
	5300 4300 5300 4600
Wire Wire Line
	7100 4500 7200 4500
Wire Wire Line
	7200 4500 7200 4600
Wire Wire Line
	7100 4400 7400 4400
Wire Wire Line
	7400 4400 7400 4600
Wire Wire Line
	7100 4300 7600 4300
Wire Wire Line
	7600 4300 7600 4600
Wire Wire Line
	7200 2500 7200 3200
Wire Wire Line
	7350 4100 7350 2500
Wire Wire Line
	7100 4100 7350 4100
Wire Wire Line
	4900 2500 4900 3200
Wire Wire Line
	5050 4100 5050 2500
Wire Wire Line
	4800 4100 5050 4100
Wire Wire Line
	1150 3300 1150 3100
Wire Wire Line
	1150 3300 1700 3300
Connection ~ 1150 3100
Wire Wire Line
	1600 2900 1700 2900
Wire Wire Line
	3150 3200 3150 2500
Wire Wire Line
	3000 2900 3000 2500
Wire Wire Line
	2850 2600 2850 2500
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 5E1CCFB4
P 3750 1450
F 0 "X?" H 3500 1500 50  0000 R CNN
F 1 "8MHz" H 3500 1400 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 4200 1100 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 3650 1450 50  0001 C CNN
	1    3750 1450
	1    0    0    -1  
$EndComp
Text GLabel 3750 1850 3    50   Input ~ 0
GND
Text GLabel 3750 1050 1    50   Input ~ 0
+5V
Wire Wire Line
	3750 1750 3750 1850
Wire Wire Line
	3750 1150 3750 1050
Text GLabel 4150 1450 2    50   Output ~ 0
CLK
Wire Wire Line
	4050 1450 4150 1450
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 5E1E750E
P 5100 1450
F 0 "X?" H 4850 1500 50  0000 R CNN
F 1 "1.8432MHz" H 4850 1400 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 5550 1100 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 5000 1450 50  0001 C CNN
	1    5100 1450
	1    0    0    -1  
$EndComp
Text GLabel 5100 1050 1    50   Input ~ 0
+5V
Text GLabel 5100 1850 3    50   Input ~ 0
GND
Wire Wire Line
	5100 1850 5100 1750
Wire Wire Line
	5100 1050 5100 1150
Text GLabel 5500 1450 2    50   Output ~ 0
RS232CLK
Wire Wire Line
	5400 1450 5500 1450
Wire Wire Line
	3650 4500 3650 4600
Wire Wire Line
	5950 4600 5950 4500
$Comp
L 6502:WDC65C51N U?
U 1 1 5E222305
P 9100 3250
F 0 "U?" H 9100 4165 50  0000 C CNN
F 1 "WDC65C51N" H 9100 4074 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 9100 3250 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c51n.pdf" H 9100 3250 50  0001 C CNN
	1    9100 3250
	1    0    0    -1  
$EndComp
Text GLabel 9750 4000 3    50   Input ~ 0
+5V
Wire Wire Line
	9650 3900 9750 3900
Wire Wire Line
	9750 3900 9750 4000
Text GLabel 8450 2500 1    50   Input ~ 0
GND
Wire Wire Line
	8450 2500 8450 2600
Wire Wire Line
	8450 2600 8550 2600
NoConn ~ 8550 3200
NoConn ~ 9650 2800
NoConn ~ 8550 3300
NoConn ~ 8550 3600
NoConn ~ 8550 3000
Wire Wire Line
	9650 3800 9750 3800
Wire Wire Line
	9750 3800 9750 3900
Connection ~ 9750 3900
Wire Wire Line
	9650 3700 9750 3700
Wire Wire Line
	9750 3700 9750 3800
Connection ~ 9750 3800
Text GLabel 9750 2500 1    50   Input ~ 0
R~W
Wire Wire Line
	9750 2500 9750 2600
Wire Wire Line
	9750 2600 9650 2600
Text GLabel 9900 2500 1    50   Input ~ 0
CLK
Wire Wire Line
	9900 2500 9900 2700
Wire Wire Line
	9900 2700 9650 2700
Text Label 9800 3600 2    50   ~ 0
d0
Text Label 9800 3500 2    50   ~ 0
d1
Text Label 9800 3400 2    50   ~ 0
d2
Text Label 9800 3300 2    50   ~ 0
d3
Text Label 9800 3200 2    50   ~ 0
d4
Text Label 9800 3100 2    50   ~ 0
d5
Text Label 9800 3000 2    50   ~ 0
d6
Text Label 9800 2900 2    50   ~ 0
d7
Wire Wire Line
	9650 2900 9800 2900
Wire Wire Line
	9650 3000 9800 3000
Wire Wire Line
	9650 3100 9800 3100
Wire Wire Line
	9650 3200 9800 3200
Wire Wire Line
	9650 3300 9800 3300
Wire Wire Line
	9650 3400 9800 3400
Wire Wire Line
	9650 3500 9800 3500
Wire Wire Line
	9650 3600 9800 3600
Entry Wire Line
	9800 2900 9900 2800
Entry Wire Line
	9800 3000 9900 2900
Entry Wire Line
	9800 3100 9900 3000
Entry Wire Line
	9800 3200 9900 3100
Entry Wire Line
	9800 3300 9900 3200
Entry Wire Line
	9800 3400 9900 3300
Entry Wire Line
	9800 3500 9900 3400
Entry Wire Line
	9800 3600 9900 3500
Text Label 8350 2700 0    50   ~ 0
a10
Text GLabel 8150 2500 1    50   Input ~ 0
~IOCS
Wire Wire Line
	8150 2500 8150 2800
Wire Wire Line
	8150 2800 8550 2800
Wire Wire Line
	8550 2700 8350 2700
Entry Wire Line
	8250 2600 8350 2700
Text GLabel 8000 2500 1    50   Input ~ 0
~RES
Wire Wire Line
	8000 2500 8000 2900
Wire Wire Line
	8000 2900 8550 2900
Text GLabel 8450 3100 0    50   Input ~ 0
RS232CLK
Wire Wire Line
	8450 3100 8550 3100
Text Label 8350 3800 0    50   ~ 0
a0
Text Label 8350 3900 0    50   ~ 0
a1
Wire Wire Line
	8350 3900 8550 3900
Wire Wire Line
	8350 3800 8550 3800
Entry Wire Line
	8250 3900 8350 3800
Entry Wire Line
	8250 4000 8350 3900
Wire Bus Line
	8250 3900 8250 4000
Text GLabel 8450 3400 0    50   Input ~ 0
GND
Wire Wire Line
	8450 3400 8550 3400
Text GLabel 8450 3500 0    50   Output ~ 0
TxD
Wire Wire Line
	8550 3500 8450 3500
Text GLabel 8450 3650 0    50   Input ~ 0
RxD
Wire Wire Line
	8450 3650 8500 3650
Wire Wire Line
	8500 3650 8500 3700
Wire Wire Line
	8500 3700 8550 3700
Wire Bus Line
	3050 4200 3050 4500
Wire Bus Line
	5350 2700 5350 3000
Wire Bus Line
	7650 2700 7650 3000
Wire Bus Line
	3050 3400 3050 4100
Wire Bus Line
	5350 3200 5350 3900
Wire Bus Line
	7650 3200 7650 3900
Wire Bus Line
	3350 2600 3350 3300
Wire Bus Line
	3350 3600 3350 4300
Wire Bus Line
	5650 2600 5650 3300
Wire Bus Line
	5650 3600 5650 4300
Wire Bus Line
	9900 2800 9900 3500
Wire Bus Line
	1400 3500 1400 4600
$EndSCHEMATC
