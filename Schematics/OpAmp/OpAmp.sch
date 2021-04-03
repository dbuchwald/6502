EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 8
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
L Device:R R1
U 1 1 6062031E
P 2100 1450
F 0 "R1" H 2170 1496 50  0000 L CNN
F 1 "47K" H 2170 1405 50  0000 L CNN
F 2 "" V 2030 1450 50  0001 C CNN
F 3 "~" H 2100 1450 50  0001 C CNN
	1    2100 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 6062080E
P 2100 2350
F 0 "R3" H 2170 2396 50  0000 L CNN
F 1 "47K" H 2170 2305 50  0000 L CNN
F 2 "" V 2030 2350 50  0001 C CNN
F 3 "~" H 2100 2350 50  0001 C CNN
	1    2100 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 60620C89
P 2100 1850
F 0 "RV1" H 2031 1896 50  0000 R CNN
F 1 "10K" H 2031 1805 50  0000 R CNN
F 2 "" H 2100 1850 50  0001 C CNN
F 3 "~" H 2100 1850 50  0001 C CNN
	1    2100 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 60622A66
P 2650 1450
F 0 "R2" H 2720 1496 50  0000 L CNN
F 1 "10K" H 2720 1405 50  0000 L CNN
F 2 "" V 2580 1450 50  0001 C CNN
F 3 "~" H 2650 1450 50  0001 C CNN
	1    2650 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 60623276
P 2650 2350
F 0 "R4" H 2720 2396 50  0000 L CNN
F 1 "10K" H 2720 2305 50  0000 L CNN
F 2 "" V 2580 2350 50  0001 C CNN
F 3 "~" H 2650 2350 50  0001 C CNN
	1    2650 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 606236D8
P 2100 2700
F 0 "#PWR02" H 2100 2450 50  0001 C CNN
F 1 "GND" H 2105 2527 50  0000 C CNN
F 2 "" H 2100 2700 50  0001 C CNN
F 3 "" H 2100 2700 50  0001 C CNN
	1    2100 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 60623E25
P 2100 1100
F 0 "#PWR01" H 2100 950 50  0001 C CNN
F 1 "+5V" H 2115 1273 50  0000 C CNN
F 2 "" H 2100 1100 50  0001 C CNN
F 3 "" H 2100 1100 50  0001 C CNN
	1    2100 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1100 2100 1200
Wire Wire Line
	2100 1200 2650 1200
Wire Wire Line
	2650 1200 2650 1300
Connection ~ 2100 1200
Wire Wire Line
	2100 1200 2100 1300
Wire Wire Line
	2100 1600 2100 1700
Wire Wire Line
	2100 2000 2100 2200
Wire Wire Line
	2100 2500 2100 2600
Wire Wire Line
	2100 2600 2650 2600
Wire Wire Line
	2650 2600 2650 2500
Connection ~ 2100 2600
Wire Wire Line
	2100 2600 2100 2700
Wire Wire Line
	2650 1600 2650 2100
Connection ~ 2650 2100
Wire Wire Line
	2650 2100 2650 2200
$Comp
L Connector:TestPoint TP2
U 1 1 6068F0FD
P 3000 2100
F 0 "TP2" H 3058 2218 50  0000 L CNN
F 1 "V2" H 3058 2127 50  0000 L CNN
F 2 "" H 3200 2100 50  0001 C CNN
F 3 "~" H 3200 2100 50  0001 C CNN
	1    3000 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 2100 3000 2100
Wire Wire Line
	2250 1850 3000 1850
$Comp
L Connector:TestPoint TP1
U 1 1 606A938E
P 3000 1850
F 0 "TP1" H 3058 1968 50  0000 L CNN
F 1 "V1" H 3058 1877 50  0000 L CNN
F 2 "" H 3200 1850 50  0001 C CNN
F 3 "~" H 3200 1850 50  0001 C CNN
	1    3000 1850
	1    0    0    -1  
$EndComp
$Sheet
S 7100 1550 500  150 
U 606C06BC
F0 "Comparator" 50
F1 "comparator.sch" 50
$EndSheet
$Sheet
S 7100 2050 500  150 
U 606C0859
F0 "Follower" 50
F1 "follower.sch" 50
$EndSheet
$Sheet
S 7100 2550 500  150 
U 606C09B4
F0 "Noninverting wrong" 50
F1 "noninverting_wrong.sch" 50
$EndSheet
$Sheet
S 7100 3050 500  150 
U 606C0B0F
F0 "Inverting wrong" 50
F1 "Inverting_wrong.sch" 50
$EndSheet
$Sheet
S 8400 2550 500  150 
U 606EC428
F0 "Noninverting 2 wrong" 50
F1 "noninverting_2_wrong.sch" 50
$EndSheet
$Sheet
S 7100 3550 500  150 
U 606F3FF3
F0 "Noninverting right" 50
F1 "noninverting_right.sch" 50
$EndSheet
$Sheet
S 7100 4000 500  150 
U 606F408E
F0 "Inverting right" 50
F1 "inverting_right.sch" 50
$EndSheet
$EndSCHEMATC
