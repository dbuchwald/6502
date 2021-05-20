EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
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
L Oscillator:TCXO-14 X1
U 1 1 6039A82E
P 1550 1750
F 0 "X1" H 1206 1796 50  0000 R CNN
F 1 "4MHz" H 1206 1705 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 2000 1400 50  0001 C CNN
F 3 "http://www.golledge.com/pdf/products/tcxos/gtxos14.pdf" H 1450 1750 50  0001 C CNN
	1    1550 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 6039B74D
P 1550 2150
F 0 "#PWR02" H 1550 1900 50  0001 C CNN
F 1 "GND" H 1555 1977 50  0000 C CNN
F 2 "" H 1550 2150 50  0001 C CNN
F 3 "" H 1550 2150 50  0001 C CNN
	1    1550 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2150 1550 2050
$Comp
L power:+5V #PWR01
U 1 1 6039C19D
P 1550 1350
F 0 "#PWR01" H 1550 1200 50  0001 C CNN
F 1 "+5V" H 1565 1523 50  0000 C CNN
F 2 "" H 1550 1350 50  0001 C CNN
F 3 "" H 1550 1350 50  0001 C CNN
	1    1550 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1350 1550 1450
$Comp
L 74xx:74HC04 U1
U 7 1 6039C958
P 1550 3300
F 0 "U1" H 1780 3346 50  0000 L CNN
F 1 "74HC04" H 1780 3255 50  0000 L CNN
F 2 "" H 1550 3300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 1550 3300 50  0001 C CNN
	7    1550 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 603A0D6A
P 1550 2700
F 0 "#PWR03" H 1550 2550 50  0001 C CNN
F 1 "+5V" H 1565 2873 50  0000 C CNN
F 2 "" H 1550 2700 50  0001 C CNN
F 3 "" H 1550 2700 50  0001 C CNN
	1    1550 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2700 1550 2800
$Comp
L power:GND #PWR06
U 1 1 603A122B
P 1550 3900
F 0 "#PWR06" H 1550 3650 50  0001 C CNN
F 1 "GND" H 1555 3727 50  0000 C CNN
F 2 "" H 1550 3900 50  0001 C CNN
F 3 "" H 1550 3900 50  0001 C CNN
	1    1550 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3900 1550 3800
$Comp
L 74xx:74HC04 U1
U 1 1 603A1826
P 2250 1750
F 0 "U1" H 2250 2067 50  0000 C CNN
F 1 "74HC04" H 2250 1976 50  0000 C CNN
F 2 "" H 2250 1750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2250 1750 50  0001 C CNN
	1    2250 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1750 1950 1750
$Comp
L 74xx:74HC04 U1
U 6 1 603A4E30
P 4100 1750
F 0 "U1" H 4100 2067 50  0000 C CNN
F 1 "74HC04" H 4100 1976 50  0000 C CNN
F 2 "" H 4100 1750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4100 1750 50  0001 C CNN
	6    4100 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 603A9232
P 2650 1650
F 0 "TP1" H 2708 1768 50  0000 L CNN
F 1 "RDY out" H 2708 1677 50  0000 L CNN
F 2 "" H 2850 1650 50  0001 C CNN
F 3 "~" H 2850 1650 50  0001 C CNN
	1    2650 1650
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 603AA3A0
P 3550 1650
F 0 "TP2" H 3608 1768 50  0000 L CNN
F 1 "RDY in" H 3608 1677 50  0000 L CNN
F 2 "" H 3750 1650 50  0001 C CNN
F 3 "~" H 3750 1650 50  0001 C CNN
	1    3550 1650
	1    0    0    -1  
$EndComp
NoConn ~ 4400 1750
Wire Wire Line
	2550 1750 2650 1750
Wire Wire Line
	2650 1650 2650 1750
Connection ~ 2650 1750
Wire Wire Line
	2650 1750 3550 1750
Wire Wire Line
	3550 1650 3550 1750
Connection ~ 3550 1750
Wire Wire Line
	3550 1750 3800 1750
$Comp
L 74xx:74HC04 U1
U 2 1 603AB229
P 2750 3050
F 0 "U1" H 2750 3367 50  0000 C CNN
F 1 "74HC04" H 2750 3276 50  0000 C CNN
F 2 "" H 2750 3050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2750 3050 50  0001 C CNN
	2    2750 3050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U1
U 3 1 603AD6E2
P 2750 3600
F 0 "U1" H 2750 3917 50  0000 C CNN
F 1 "74HC04" H 2750 3826 50  0000 C CNN
F 2 "" H 2750 3600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2750 3600 50  0001 C CNN
	3    2750 3600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U1
U 4 1 603AE851
P 3750 3050
F 0 "U1" H 3750 3367 50  0000 C CNN
F 1 "74HC04" H 3750 3276 50  0000 C CNN
F 2 "" H 3750 3050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3750 3050 50  0001 C CNN
	4    3750 3050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U1
U 5 1 603AF205
P 3750 3600
F 0 "U1" H 3750 3917 50  0000 C CNN
F 1 "74HC04" H 3750 3826 50  0000 C CNN
F 2 "" H 3750 3600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3750 3600 50  0001 C CNN
	5    3750 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 603AFB4C
P 2350 3700
F 0 "#PWR04" H 2350 3450 50  0001 C CNN
F 1 "GND" H 2355 3527 50  0000 C CNN
F 2 "" H 2350 3700 50  0001 C CNN
F 3 "" H 2350 3700 50  0001 C CNN
	1    2350 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 603B001A
P 3350 3700
F 0 "#PWR05" H 3350 3450 50  0001 C CNN
F 1 "GND" H 3355 3527 50  0000 C CNN
F 2 "" H 3350 3700 50  0001 C CNN
F 3 "" H 3350 3700 50  0001 C CNN
	1    3350 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3050 2450 3050
Wire Wire Line
	2350 3600 2450 3600
Connection ~ 2350 3600
Wire Wire Line
	2350 3600 2350 3050
NoConn ~ 3050 3600
NoConn ~ 3050 3050
Wire Wire Line
	3350 3700 3350 3600
Wire Wire Line
	3350 3050 3450 3050
Wire Wire Line
	3350 3600 3450 3600
Connection ~ 3350 3600
Wire Wire Line
	3350 3600 3350 3050
NoConn ~ 4050 3600
NoConn ~ 4050 3050
Wire Wire Line
	2350 3600 2350 3700
$EndSCHEMATC