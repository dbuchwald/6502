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
Text GLabel 2050 1300 0    50   Input ~ 0
~RES
Wire Wire Line
	2050 1300 2150 1300
Text GLabel 3750 1300 2    50   Output ~ 0
RESET
Wire Wire Line
	2850 1300 3750 1300
$Comp
L 74xx:74HC00 U1
U 1 1 5FE27A0C
P 2550 1300
F 0 "U1" H 2550 1625 50  0000 C CNN
F 1 "74HC00" H 2550 1534 50  0000 C CNN
F 2 "" H 2550 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 2550 1300 50  0001 C CNN
	1    2550 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1300 2150 1200
Wire Wire Line
	2150 1200 2250 1200
Wire Wire Line
	2150 1300 2150 1400
Wire Wire Line
	2150 1400 2250 1400
Connection ~ 2150 1300
$Comp
L 74xx:74HC00 U1
U 2 1 5FE31002
P 2550 1850
F 0 "U1" H 2550 2175 50  0000 C CNN
F 1 "74HC00" H 2550 2084 50  0000 C CNN
F 2 "" H 2550 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 2550 1850 50  0001 C CNN
	2    2550 1850
	1    0    0    -1  
$EndComp
Text GLabel 2050 1850 0    50   Input ~ 0
R~W
Wire Wire Line
	2050 1850 2150 1850
Wire Wire Line
	2150 1850 2150 1950
Wire Wire Line
	2150 1950 2250 1950
Wire Wire Line
	2150 1850 2150 1750
Wire Wire Line
	2150 1750 2250 1750
Connection ~ 2150 1850
Text GLabel 3750 1850 2    50   Output ~ 0
RDN
Wire Wire Line
	2850 1850 2950 1850
$Comp
L 74xx:74HC00 U1
U 3 1 5FE3C714
P 3350 2300
F 0 "U1" H 3350 2625 50  0000 C CNN
F 1 "74HC00" H 3350 2534 50  0000 C CNN
F 2 "" H 3350 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 3350 2300 50  0001 C CNN
	3    3350 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1850 2950 2200
Wire Wire Line
	2950 2200 3050 2200
Wire Wire Line
	2950 1850 3750 1850
Connection ~ 2950 1850
Text GLabel 3750 2300 2    50   Output ~ 0
WRN
Wire Wire Line
	3650 2300 3750 2300
Text GLabel 2050 2400 0    50   Input ~ 0
PHI2
Wire Wire Line
	2050 2400 3050 2400
$EndSCHEMATC
