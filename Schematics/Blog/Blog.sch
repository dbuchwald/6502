EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
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
$Comp
L 74xx:74HC04 U5
U 1 1 60071BB0
P 5700 3050
F 0 "U5" H 5700 3367 50  0000 C CNN
F 1 "74HC04" H 5700 3276 50  0000 C CNN
F 2 "" H 5700 3050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5700 3050 50  0001 C CNN
	1    5700 3050
	1    0    0    -1  
$EndComp
Text GLabel 5300 3050 0    50   Input ~ 0
PHI2
Wire Wire Line
	5300 3050 5400 3050
Text GLabel 6100 3050 2    50   Output ~ 0
PHI1
Wire Wire Line
	6000 3050 6100 3050
$Comp
L 74xx:74HC04 U5
U 2 1 600761BC
P 5700 3950
F 0 "U5" H 5700 4267 50  0000 C CNN
F 1 "74HC04" H 5700 4176 50  0000 C CNN
F 2 "" H 5700 3950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5700 3950 50  0001 C CNN
	2    5700 3950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U8
U 2 1 60077BC4
P 6500 3950
F 0 "U8" H 6500 4267 50  0000 C CNN
F 1 "74HC04" H 6500 4176 50  0000 C CNN
F 2 "" H 6500 3950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6500 3950 50  0001 C CNN
	2    6500 3950
	1    0    0    -1  
$EndComp
Text GLabel 5300 3950 0    50   Input ~ 0
X_OUT
Text GLabel 6900 3500 2    50   Output ~ 0
PHI1
Text GLabel 6900 3950 2    50   Output ~ 0
PHI2
Wire Wire Line
	6800 3950 6900 3950
Wire Wire Line
	6000 3950 6100 3950
Wire Wire Line
	6100 3950 6100 3500
Wire Wire Line
	6100 3500 6900 3500
Connection ~ 6100 3950
Wire Wire Line
	6100 3950 6200 3950
Wire Wire Line
	5300 3950 5400 3950
$Comp
L 74xx:74LS32 U10
U 1 1 6007D280
P 6050 4900
F 0 "U10" H 6050 5225 50  0000 C CNN
F 1 "74AC32" H 6050 5134 50  0000 C CNN
F 2 "" H 6050 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6050 4900 50  0001 C CNN
	1    6050 4900
	1    0    0    -1  
$EndComp
Text GLabel 5650 4800 0    50   Input ~ 0
~ROM_CS
Wire Wire Line
	5650 4800 5750 4800
$Comp
L 74xx:74HC74 U11
U 1 1 60083237
P 6050 5650
F 0 "U11" H 6050 5169 50  0000 C CNN
F 1 "74HC74" H 6050 5260 50  0000 C CNN
F 2 "" H 6050 5650 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6050 5650 50  0001 C CNN
	1    6050 5650
	-1   0    0    1   
$EndComp
NoConn ~ 5750 5750
Wire Wire Line
	5750 5550 5650 5550
Wire Wire Line
	5650 5550 5650 5000
Wire Wire Line
	5650 5000 5750 5000
Text GLabel 6550 4900 2    50   Output ~ 0
RDY
Wire Wire Line
	6350 4900 6450 4900
Wire Wire Line
	6450 4900 6450 5750
Wire Wire Line
	6450 5750 6350 5750
Connection ~ 6450 4900
Wire Wire Line
	6450 4900 6550 4900
Text GLabel 6550 5650 2    50   Input ~ 0
PHI1
Wire Wire Line
	6550 5650 6350 5650
NoConn ~ 6050 5350
NoConn ~ 6050 5950
NoConn ~ 2000 4800
NoConn ~ 2000 4200
NoConn ~ 3000 4200
NoConn ~ 3000 4800
Text GLabel 1400 4900 0    50   Input ~ 0
PHI1
Wire Wire Line
	1400 4900 1600 4900
Wire Wire Line
	1600 4900 1600 4500
Wire Wire Line
	1600 4500 1700 4500
Wire Wire Line
	1600 4900 2600 4900
Wire Wire Line
	2600 4900 2600 4500
Wire Wire Line
	2600 4500 2700 4500
Connection ~ 1600 4900
Wire Wire Line
	2300 4400 2700 4400
NoConn ~ 3300 4400
Wire Wire Line
	2300 3600 2700 3600
Wire Wire Line
	3300 4600 3400 4600
Wire Wire Line
	3400 4600 3400 3950
Wire Wire Line
	3400 3950 1500 3950
Wire Wire Line
	1500 3950 1500 3500
Wire Wire Line
	1500 3500 1700 3500
Wire Wire Line
	1700 3700 1600 3700
Wire Wire Line
	1600 3700 1600 3850
Wire Wire Line
	1600 3850 2400 3850
Wire Wire Line
	2400 3850 2400 4600
Wire Wire Line
	2400 4600 2300 4600
Text GLabel 2600 3400 0    50   Input ~ 0
~ROM_CS
Wire Wire Line
	2600 3400 2700 3400
Text GLabel 3500 3500 2    50   Output ~ 0
RDY
Wire Wire Line
	3500 3500 3400 3500
Wire Wire Line
	3400 3500 3400 3100
Wire Wire Line
	3400 3100 1400 3100
Wire Wire Line
	1400 3100 1400 4400
Wire Wire Line
	1400 4400 1700 4400
Connection ~ 3400 3500
Wire Wire Line
	3400 3500 3300 3500
$Comp
L 74xx:74LS08 U7
U 1 1 600AC9A9
P 2000 3600
F 0 "U7" H 2000 3925 50  0000 C CNN
F 1 "74AC08" H 2000 3834 50  0000 C CNN
F 2 "" H 2000 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2000 3600 50  0001 C CNN
	1    2000 3600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U6
U 1 1 6009810A
P 3000 3500
F 0 "U6" H 3000 3825 50  0000 C CNN
F 1 "74AC32" H 3000 3734 50  0000 C CNN
F 2 "" H 3000 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3000 3500 50  0001 C CNN
	1    3000 3500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC74 U9
U 1 1 6008BFC0
P 2000 4500
F 0 "U9" H 2000 4981 50  0000 C CNN
F 1 "74AC74" H 2000 4890 50  0000 C CNN
F 2 "" H 2000 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2000 4500 50  0001 C CNN
	1    2000 4500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC74 U9
U 2 1 6008CC30
P 3000 4500
F 0 "U9" H 3000 4981 50  0000 C CNN
F 1 "74AC74" H 3000 4890 50  0000 C CNN
F 2 "" H 3000 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3000 4500 50  0001 C CNN
	2    3000 4500
	1    0    0    -1  
$EndComp
NoConn ~ 1900 7500
NoConn ~ 1900 6900
NoConn ~ 2900 6900
NoConn ~ 2900 7500
Text GLabel 1300 7600 0    50   Input ~ 0
PHI1
Wire Wire Line
	1300 7600 1500 7600
Wire Wire Line
	1500 7600 1500 7200
Wire Wire Line
	1500 7200 1600 7200
Wire Wire Line
	1500 7600 2500 7600
Wire Wire Line
	2500 7600 2500 7200
Wire Wire Line
	2500 7200 2600 7200
Connection ~ 1500 7600
Wire Wire Line
	2200 7100 2600 7100
NoConn ~ 3200 7100
Wire Wire Line
	2200 6300 2600 6300
Wire Wire Line
	3200 7300 3300 7300
Wire Wire Line
	3300 7300 3300 6650
Wire Wire Line
	3300 6650 1400 6650
Wire Wire Line
	1400 6650 1400 6200
Wire Wire Line
	1400 6200 1600 6200
Wire Wire Line
	1600 6400 1500 6400
Wire Wire Line
	1500 6400 1500 6550
Wire Wire Line
	1500 6550 2300 6550
Wire Wire Line
	2300 6550 2300 7300
Wire Wire Line
	2300 7300 2200 7300
Text GLabel 2500 6100 0    50   Input ~ 0
~ROM_CS
Wire Wire Line
	2500 6100 2600 6100
Wire Wire Line
	1300 7100 1600 7100
$Comp
L 74xx:74HC74 U14
U 2 1 600C4743
P 2900 7200
F 0 "U14" H 2900 7681 50  0000 C CNN
F 1 "74AC74" H 2900 7590 50  0000 C CNN
F 2 "" H 2900 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2900 7200 50  0001 C CNN
	2    2900 7200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC74 U14
U 1 1 600C4739
P 1900 7200
F 0 "U14" H 1900 7681 50  0000 C CNN
F 1 "74AC74" H 1900 7590 50  0000 C CNN
F 2 "" H 1900 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1900 7200 50  0001 C CNN
	1    1900 7200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U12
U 1 1 600C472F
P 2900 6200
F 0 "U12" H 2900 6525 50  0000 C CNN
F 1 "74AC32" H 2900 6434 50  0000 C CNN
F 2 "" H 2900 6200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2900 6200 50  0001 C CNN
	1    2900 6200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U13
U 1 1 600C4725
P 1900 6300
F 0 "U13" H 1900 6625 50  0000 C CNN
F 1 "74AC08" H 1900 6534 50  0000 C CNN
F 2 "" H 1900 6300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 1900 6300 50  0001 C CNN
	1    1900 6300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U6
U 2 1 600FF2B5
P 2900 5650
F 0 "U6" H 2900 5975 50  0000 C CNN
F 1 "74AC32" H 2900 5884 50  0000 C CNN
F 2 "" H 2900 5650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2900 5650 50  0001 C CNN
	2    2900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 6400 1500 5750
Wire Wire Line
	1500 5750 2600 5750
Connection ~ 1500 6400
Text GLabel 2500 5550 0    50   Input ~ 0
~UART_CS
Wire Wire Line
	2500 5550 2600 5550
$Comp
L 74xx:74LS08 U7
U 2 1 6010D5D4
P 3700 5750
F 0 "U7" H 3700 6075 50  0000 C CNN
F 1 "74AC08" H 3700 5984 50  0000 C CNN
F 2 "" H 3700 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3700 5750 50  0001 C CNN
	2    3700 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 6200 3300 6200
Wire Wire Line
	3300 6200 3300 5850
Wire Wire Line
	3300 5850 3400 5850
Wire Wire Line
	3200 5650 3400 5650
Text GLabel 4200 5750 2    50   Output ~ 0
RDY
Wire Wire Line
	4000 5750 4100 5750
Wire Wire Line
	4100 5750 4100 5250
Wire Wire Line
	4100 5250 1300 5250
Wire Wire Line
	1300 5250 1300 7100
Connection ~ 4100 5750
Wire Wire Line
	4100 5750 4200 5750
$Sheet
S 5450 6900 500  150 
U 60398E8A
F0 "RDY input" 50
F1 "RDY input.sch" 50
$EndSheet
$EndSCHEMATC
