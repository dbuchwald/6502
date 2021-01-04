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
P 2550 2300
F 0 "U1" H 2550 2625 50  0000 C CNN
F 1 "74HC00" H 2550 2534 50  0000 C CNN
F 2 "" H 2550 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 2550 2300 50  0001 C CNN
	2    2550 2300
	1    0    0    -1  
$EndComp
Text GLabel 2050 2300 0    50   Input ~ 0
R~W
Wire Wire Line
	2050 2300 2150 2300
Wire Wire Line
	2150 2300 2150 2400
Wire Wire Line
	2150 2400 2250 2400
Wire Wire Line
	2150 2300 2150 2200
Wire Wire Line
	2150 2200 2250 2200
Connection ~ 2150 2300
Text GLabel 3750 1750 2    50   Output ~ 0
RDN
$Comp
L 74xx:74HC00 U1
U 4 1 5FE3C714
P 3350 2400
F 0 "U1" H 3350 2725 50  0000 C CNN
F 1 "74HC00" H 3350 2634 50  0000 C CNN
F 2 "" H 3350 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 3350 2400 50  0001 C CNN
	4    3350 2400
	1    0    0    -1  
$EndComp
Text GLabel 3750 2400 2    50   Output ~ 0
WRN
Wire Wire Line
	3650 2400 3750 2400
Text GLabel 2050 2500 0    50   Input ~ 0
PHI2
Wire Wire Line
	2050 2500 3050 2500
$Comp
L 74xx:74HC00 U1
U 3 1 5FE4F41A
P 3350 1750
F 0 "U1" H 3350 2075 50  0000 C CNN
F 1 "74HC00" H 3350 1984 50  0000 C CNN
F 2 "" H 3350 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 3350 1750 50  0001 C CNN
	3    3350 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1750 3650 1750
Wire Wire Line
	2850 2300 3050 2300
Wire Wire Line
	2050 1850 3050 1850
Text GLabel 2050 1850 0    50   Input ~ 0
R~W
Text GLabel 2050 1650 0    50   Input ~ 0
PHI2
Wire Wire Line
	2050 1650 3050 1650
$Comp
L 74xx:74LS32 U3
U 1 1 5FE8D741
P 7200 1900
F 0 "U3" H 7200 2225 50  0000 C CNN
F 1 "74HC32" H 7200 2134 50  0000 C CNN
F 2 "" H 7200 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7200 1900 50  0001 C CNN
	1    7200 1900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U2
U 1 1 5FE93B55
P 6400 1600
F 0 "U2" H 6400 1917 50  0000 C CNN
F 1 "74HC04" H 6400 1826 50  0000 C CNN
F 2 "" H 6400 1600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6400 1600 50  0001 C CNN
	1    6400 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1600 6800 1600
Text GLabel 5300 1600 0    50   Input ~ 0
R~W
Wire Wire Line
	5300 1600 6100 1600
$Comp
L 74xx:74HC04 U2
U 2 1 5FE98581
P 5700 2100
F 0 "U2" H 5700 2417 50  0000 C CNN
F 1 "74HC04" H 5700 2326 50  0000 C CNN
F 2 "" H 5700 2100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5700 2100 50  0001 C CNN
	2    5700 2100
	1    0    0    -1  
$EndComp
Text GLabel 5300 2100 0    50   Input ~ 0
PHI2
Wire Wire Line
	5300 2100 5400 2100
$Comp
L 74xx:74LS08 U4
U 1 1 5FE9F846
P 6400 2200
F 0 "U4" H 6400 2525 50  0000 C CNN
F 1 "74HC08" H 6400 2434 50  0000 C CNN
F 2 "" H 6400 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6400 2200 50  0001 C CNN
	1    6400 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2100 6100 2100
Text GLabel 5300 2300 0    50   Input ~ 0
RDY
Wire Wire Line
	5300 2300 6100 2300
Wire Wire Line
	6700 2200 6800 2200
Wire Wire Line
	6800 2200 6800 2000
Wire Wire Line
	6800 2000 6900 2000
Wire Wire Line
	6800 1600 6800 1800
Wire Wire Line
	6800 1800 6900 1800
Text GLabel 7600 1900 2    50   Output ~ 0
RDN
Wire Wire Line
	7500 1900 7600 1900
$EndSCHEMATC
