EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Address decoder (basic extended)"
Date "2020-01-02"
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
	6600 4150 6800 4150
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
NoConn ~ 6100 4950
NoConn ~ 6100 5050
NoConn ~ 6100 5150
NoConn ~ 6100 5250
NoConn ~ 6100 5350
NoConn ~ 6100 5450
NoConn ~ 6100 5550
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
Text Label 4850 4150 0    50   ~ 0
a14
Entry Wire Line
	4750 4050 4850 3950
Wire Wire Line
	4850 4150 5200 4150
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
a12
Wire Wire Line
	7100 3700 7850 3700
Connection ~ 4750 4450
Wire Bus Line
	4750 4450 6000 4450
Wire Bus Line
	3800 4450 4750 4450
Wire Wire Line
	5100 3250 5100 3150
Wire Wire Line
	5100 3350 5200 3350
Wire Wire Line
	5200 3150 5100 3150
$Comp
L 74xx:74HC00 U1
U 1 1 5E0E6448
P 5500 3250
F 0 "U1" H 5500 3575 50  0000 C CNN
F 1 "74HC00" H 5500 3484 50  0000 C CNN
F 2 "" H 5500 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5500 3250 50  0001 C CNN
	1    5500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3250 5100 3250
Wire Wire Line
	5800 3250 5900 3250
Wire Wire Line
	6600 3350 7200 3350
Wire Wire Line
	5900 3450 6000 3450
Text GLabel 5900 3450 0    50   Input ~ 0
CLK
$Comp
L 74xx:74HC00 U1
U 2 1 5E0D5C1A
P 6300 3350
F 0 "U1" H 6300 3675 50  0000 C CNN
F 1 "74HC00" H 6300 3584 50  0000 C CNN
F 2 "" H 6300 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 6300 3350 50  0001 C CNN
	2    6300 3350
	1    0    0    -1  
$EndComp
Entry Wire Line
	4750 3350 4850 3250
Text Label 4850 3250 0    50   ~ 0
a15
Wire Wire Line
	7200 3350 7850 3350
Wire Wire Line
	7200 3350 7200 3250
Wire Wire Line
	7200 3250 7850 3250
Wire Wire Line
	5900 3250 5900 2900
Connection ~ 5900 3250
Wire Wire Line
	5900 3250 6000 3250
$Comp
L 74xx:7402 U2
U 4 1 5E130222
P 5500 4050
F 0 "U2" H 5500 4375 50  0000 C CNN
F 1 "7402" H 5500 4284 50  0000 C CNN
F 2 "" H 5500 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn7402" H 5500 4050 50  0001 C CNN
	4    5500 4050
	1    0    0    -1  
$EndComp
Text Label 4850 3950 0    50   ~ 0
a13
Wire Wire Line
	5200 3950 4850 3950
Wire Wire Line
	4850 4250 6000 4250
Wire Wire Line
	5800 4050 5900 4050
Connection ~ 7200 3350
Connection ~ 5100 3250
Wire Wire Line
	5100 3250 5100 3350
Wire Wire Line
	5900 2900 7850 2900
Entry Wire Line
	4750 4250 4850 4150
Wire Wire Line
	5900 4050 5900 3650
Wire Wire Line
	5900 3650 6650 3650
Wire Wire Line
	6650 3650 6650 2800
Connection ~ 5900 4050
Wire Wire Line
	5900 4050 6000 4050
Wire Wire Line
	6650 2800 7850 2800
$Comp
L Connector:Conn_01x06_Female J6
U 1 1 5E0FB26B
P 8050 4800
F 0 "J6" H 7400 5150 50  0000 L CNN
F 1 "VIA1 select" H 7650 5150 50  0000 L CNN
F 2 "" H 8050 4800 50  0001 C CNN
F 3 "~" H 8050 4800 50  0001 C CNN
	1    8050 4800
	1    0    0    -1  
$EndComp
Text Label 7400 4600 0    50   ~ 0
VIA2_CS1
Text Label 7400 4700 0    50   ~ 0
VIA2_~CS2
Text Label 7400 4800 0    50   ~ 0
VIA2_RS3
Text Label 7400 4900 0    50   ~ 0
VIA2_RS2
Text Label 7400 5000 0    50   ~ 0
VIA2_RS1
Text Label 7400 5100 0    50   ~ 0
VIA2_RS0
Text Label 7100 4600 0    50   ~ 0
a11
Wire Wire Line
	7100 4600 7850 4600
Text Label 7100 4800 0    50   ~ 0
a3
Text Label 7100 4900 0    50   ~ 0
a2
Text Label 7100 5000 0    50   ~ 0
a1
Text Label 7100 5100 0    50   ~ 0
a0
Wire Wire Line
	7100 5100 7850 5100
Wire Wire Line
	7100 5000 7850 5000
Wire Wire Line
	7100 4900 7850 4900
Wire Wire Line
	7100 4800 7850 4800
Entry Wire Line
	7000 5000 7100 5100
Entry Wire Line
	7000 4900 7100 5000
Entry Wire Line
	7000 4800 7100 4900
Entry Wire Line
	7000 4700 7100 4800
Entry Wire Line
	7000 4500 7100 4600
Connection ~ 7000 4450
Wire Wire Line
	7300 4700 7300 4350
Wire Wire Line
	7300 4350 6800 4350
Wire Wire Line
	6800 4350 6800 4150
Wire Wire Line
	7300 4700 7850 4700
Wire Bus Line
	7000 3800 7000 4450
Wire Bus Line
	4750 3350 4750 4450
Wire Bus Line
	6000 4450 6000 5450
Wire Bus Line
	7000 4450 7000 5000
Wire Bus Line
	3800 2900 3800 4450
Connection ~ 6800 4150
$EndSCHEMATC
