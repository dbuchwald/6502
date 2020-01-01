EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Address decoder (basic v2)"
Date "2019-12-30"
Rev "v01"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Based on Ben Eater's design"
Comment4 "Author: Dawid Buchwald"
$EndDescr
$Comp
L Connector:Conn_01x16_Female J1
U 1 1 5E0A5C24
P 3300 3600
F 0 "J1" H 3192 2575 50  0000 C CNN
F 1 "Address bus" H 3192 2666 50  0000 C CNN
F 2 "" H 3300 3600 50  0001 C CNN
F 3 "~" H 3300 3600 50  0001 C CNN
	1    3300 3600
	-1   0    0    1   
$EndComp
Text Label 3700 2800 2    50   ~ 0
a15
Text Label 3700 2900 2    50   ~ 0
a14
Text Label 3700 3000 2    50   ~ 0
a13
Text Label 3700 3100 2    50   ~ 0
a12
Text Label 3700 3200 2    50   ~ 0
a11
Text Label 3700 3300 2    50   ~ 0
a10
Text Label 3700 3400 2    50   ~ 0
a9
Text Label 3700 3500 2    50   ~ 0
a8
Text Label 3700 3600 2    50   ~ 0
a7
Text Label 3700 3700 2    50   ~ 0
a6
Text Label 3700 3800 2    50   ~ 0
a5
Text Label 3700 3900 2    50   ~ 0
a4
Text Label 3700 4000 2    50   ~ 0
a3
Text Label 3700 4100 2    50   ~ 0
a2
Text Label 3700 4200 2    50   ~ 0
a1
Text Label 3700 4300 2    50   ~ 0
a0
Wire Wire Line
	3500 2800 3700 2800
Wire Wire Line
	3500 2900 3700 2900
Wire Wire Line
	3500 3000 3700 3000
Wire Wire Line
	3500 3100 3700 3100
Wire Wire Line
	3500 3200 3700 3200
Wire Wire Line
	3500 3300 3700 3300
Wire Wire Line
	3500 3400 3700 3400
Wire Wire Line
	3500 3500 3700 3500
Wire Wire Line
	3500 3600 3700 3600
Wire Wire Line
	3500 3700 3700 3700
Wire Wire Line
	3500 3800 3700 3800
Wire Wire Line
	3500 3900 3700 3900
Wire Wire Line
	3500 4000 3700 4000
Wire Wire Line
	3500 4100 3700 4100
Wire Wire Line
	3500 4200 3700 4200
Wire Wire Line
	3500 4300 3700 4300
$Comp
L Connector:Conn_01x01_Female J2
U 1 1 5E0ACEDC
P 3300 4650
F 0 "J2" H 3192 4425 50  0000 C CNN
F 1 "Clock" H 3192 4516 50  0000 C CNN
F 2 "" H 3300 4650 50  0001 C CNN
F 3 "~" H 3300 4650 50  0001 C CNN
	1    3300 4650
	-1   0    0    1   
$EndComp
Text GLabel 3550 4650 2    50   Output ~ 0
CLK
Wire Wire Line
	3500 4650 3550 4650
Entry Wire Line
	3700 2800 3800 2900
Entry Wire Line
	3700 2900 3800 3000
Entry Wire Line
	3700 3000 3800 3100
Entry Wire Line
	3700 3100 3800 3200
Entry Wire Line
	3700 3200 3800 3300
Entry Wire Line
	3700 3300 3800 3400
Entry Wire Line
	3700 3400 3800 3500
Entry Wire Line
	3700 3500 3800 3600
Entry Wire Line
	3700 3600 3800 3700
Entry Wire Line
	3700 3700 3800 3800
Entry Wire Line
	3700 3800 3800 3900
Entry Wire Line
	3700 3900 3800 4000
Entry Wire Line
	3700 4000 3800 4100
Entry Wire Line
	3700 4100 3800 4200
Entry Wire Line
	3700 4200 3800 4300
Entry Wire Line
	3700 4300 3800 4400
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 5E0AEF81
P 8050 2800
F 0 "J3" H 7400 2950 50  0000 L CNN
F 1 "ROM select" H 7650 2950 50  0000 L CNN
F 2 "" H 8050 2800 50  0001 C CNN
F 3 "~" H 8050 2800 50  0001 C CNN
	1    8050 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 5E0BA00E
P 8050 3250
F 0 "J4" H 7400 3400 50  0000 L CNN
F 1 "RAM select" H 7650 3400 50  0000 L CNN
F 2 "" H 8050 3250 50  0001 C CNN
F 3 "~" H 8050 3250 50  0001 C CNN
	1    8050 3250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Female J5
U 1 1 5E0BA96B
P 8050 3900
F 0 "J5" H 7400 4250 50  0000 L CNN
F 1 "VIA1 select" H 7650 4250 50  0000 L CNN
F 2 "" H 8050 3900 50  0001 C CNN
F 3 "~" H 8050 3900 50  0001 C CNN
	1    8050 3900
	1    0    0    -1  
$EndComp
Text Label 7400 2800 0    50   ~ 0
ROM_~CS
Text Label 7400 2900 0    50   ~ 0
ROM_~OE
Text Label 7400 3250 0    50   ~ 0
RAM_~CS
Text Label 7400 3350 0    50   ~ 0
RAM_~OE
Text Label 7400 3700 0    50   ~ 0
VIA1_CS1
Text Label 7400 3800 0    50   ~ 0
VIA1_~CS2
Text Label 7400 3900 0    50   ~ 0
VIA1_RS3
Text Label 7400 4000 0    50   ~ 0
VIA1_RS2
Text Label 7400 4100 0    50   ~ 0
VIA1_RS1
Text Label 7400 4200 0    50   ~ 0
VIA1_RS0
Text Label 4850 3400 0    50   ~ 0
a15
Wire Wire Line
	7200 2900 7850 2900
$Comp
L 74xx:74HC00 U1
U 1 1 5E0C758B
P 5500 2800
F 0 "U1" H 5500 3125 50  0000 C CNN
F 1 "74HC00" H 5500 3034 50  0000 C CNN
F 2 "" H 5500 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5500 2800 50  0001 C CNN
	1    5500 2800
	1    0    0    -1  
$EndComp
Entry Wire Line
	4750 3500 4850 3400
$Comp
L 74xx:74HC00 U1
U 2 1 5E0D5C1A
P 6300 3500
F 0 "U1" H 6300 3825 50  0000 C CNN
F 1 "74HC00" H 6300 3734 50  0000 C CNN
F 2 "" H 6300 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 6300 3500 50  0001 C CNN
	2    6300 3500
	1    0    0    -1  
$EndComp
Text Label 7100 3900 0    50   ~ 0
a3
Text Label 7100 4000 0    50   ~ 0
a2
Text Label 7100 4100 0    50   ~ 0
a1
Text Label 7100 4200 0    50   ~ 0
a0
Entry Wire Line
	7000 4000 7100 3900
Entry Wire Line
	7000 4100 7100 4000
Entry Wire Line
	7000 4200 7100 4100
Entry Wire Line
	7000 4300 7100 4200
Wire Wire Line
	7100 4200 7850 4200
Wire Wire Line
	7100 4100 7850 4100
Wire Wire Line
	7100 4000 7850 4000
Wire Wire Line
	7100 3900 7850 3900
Text GLabel 5900 3600 0    50   Input ~ 0
CLK
Wire Wire Line
	5900 3600 6000 3600
Wire Wire Line
	6600 3500 6650 3500
Text Label 4850 4250 0    50   ~ 0
a15
$Comp
L 74xx:74HC00 U1
U 3 1 5E0E594E
P 6300 4150
F 0 "U1" H 6300 4475 50  0000 C CNN
F 1 "74HC00" H 6300 4384 50  0000 C CNN
F 2 "" H 6300 4150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 6300 4150 50  0001 C CNN
	3    6300 4150
	1    0    0    -1  
$EndComp
Entry Wire Line
	4750 4350 4850 4250
Wire Wire Line
	4850 4250 6000 4250
Wire Wire Line
	6000 4050 5800 4050
Wire Wire Line
	6600 4150 6800 4150
Wire Bus Line
	3800 4450 4750 4450
Connection ~ 4750 4450
Wire Bus Line
	4750 4450 6000 4450
Text Label 6100 4750 0    50   ~ 0
a12
Text Label 6100 4850 0    50   ~ 0
a11
Text Label 6100 4950 0    50   ~ 0
a10
Text Label 6100 5050 0    50   ~ 0
a9
Text Label 6100 5150 0    50   ~ 0
a8
Text Label 6100 5250 0    50   ~ 0
a7
Text Label 6100 5350 0    50   ~ 0
a6
Text Label 6100 5450 0    50   ~ 0
a5
Text Label 6100 5550 0    50   ~ 0
a4
NoConn ~ 6100 4750
NoConn ~ 6100 4850
NoConn ~ 6100 4950
NoConn ~ 6100 5050
NoConn ~ 6100 5150
NoConn ~ 6100 5250
NoConn ~ 6100 5350
NoConn ~ 6100 5450
NoConn ~ 6100 5550
Entry Wire Line
	6000 4750 6100 4850
Entry Wire Line
	6000 4650 6100 4750
Entry Wire Line
	6000 4850 6100 4950
Entry Wire Line
	6000 4950 6100 5050
Entry Wire Line
	6000 5050 6100 5150
Entry Wire Line
	6000 5150 6100 5250
Entry Wire Line
	6000 5250 6100 5350
Entry Wire Line
	6000 5350 6100 5450
Entry Wire Line
	6000 5450 6100 5550
Connection ~ 6000 4450
Wire Bus Line
	6000 4450 7000 4450
Wire Wire Line
	7200 3250 7200 3350
Wire Wire Line
	7200 3250 7850 3250
Wire Wire Line
	7200 3350 7850 3350
Wire Wire Line
	7200 3350 6650 3350
Wire Wire Line
	6650 3350 6650 3500
Connection ~ 7200 3350
$Comp
L 74xx:74HC04 U?
U 1 1 5E0E0C1E
P 5500 3400
F 0 "U?" H 5500 3717 50  0000 C CNN
F 1 "74HC04" H 5500 3626 50  0000 C CNN
F 2 "" H 5500 3400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5500 3400 50  0001 C CNN
	1    5500 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2800 7200 2800
Wire Wire Line
	5800 3400 6000 3400
Wire Wire Line
	4850 3400 5200 3400
Wire Wire Line
	7200 2900 7200 2800
Connection ~ 7200 2800
Wire Wire Line
	7200 2800 7850 2800
Text Label 4850 2700 0    50   ~ 0
a15
Text Label 4850 2900 0    50   ~ 0
a14
Wire Wire Line
	4850 2900 5200 2900
Wire Wire Line
	4850 2700 5200 2700
Entry Wire Line
	4750 2800 4850 2700
Entry Wire Line
	4750 3000 4850 2900
$Comp
L 74xx:74HC04 U?
U 6 1 5E1086B3
P 5500 4050
F 0 "U?" H 5500 4367 50  0000 C CNN
F 1 "74HC04" H 5500 4276 50  0000 C CNN
F 2 "" H 5500 4050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5500 4050 50  0001 C CNN
	6    5500 4050
	1    0    0    -1  
$EndComp
Text Label 4850 4050 0    50   ~ 0
a14
Entry Wire Line
	4750 4150 4850 4050
Wire Wire Line
	4850 4050 5200 4050
Wire Wire Line
	6800 4150 6800 3550
Wire Wire Line
	7300 3800 7850 3800
Wire Wire Line
	6800 3550 7300 3550
Wire Wire Line
	7300 3550 7300 3800
Entry Wire Line
	7000 3800 7100 3700
Text Label 7100 3700 0    50   ~ 0
a13
Wire Bus Line
	6000 4450 6000 5450
Wire Bus Line
	7000 3800 7000 4450
Wire Bus Line
	4750 2800 4750 4450
Wire Bus Line
	3800 2900 3800 4450
Wire Wire Line
	7100 3700 7850 3700
$EndSCHEMATC
