EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
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
L 74xx:74LS32 U?
U 1 1 60BA0A0A
P 3650 2350
AR Path="/60BA0A0A" Ref="U?"  Part="1" 
AR Path="/60B96DC5/60BA0A0A" Ref="U2"  Part="1" 
F 0 "U2" H 3650 2675 50  0000 C CNN
F 1 "74HC32" H 3650 2584 50  0000 C CNN
F 2 "" H 3650 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3650 2350 50  0001 C CNN
	1    3650 2350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 1 1 60BA0A10
P 2850 2050
AR Path="/60BA0A10" Ref="U?"  Part="1" 
AR Path="/60B96DC5/60BA0A10" Ref="U1"  Part="1" 
F 0 "U1" H 2850 2367 50  0000 C CNN
F 1 "74HC04" H 2850 2276 50  0000 C CNN
F 2 "" H 2850 2050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2850 2050 50  0001 C CNN
	1    2850 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2050 3250 2050
Text GLabel 2350 2050 0    50   Input ~ 0
R~W
Wire Wire Line
	2350 2050 2550 2050
$Comp
L 74xx:74HC04 U?
U 2 1 60BA0A19
P 2850 3250
AR Path="/60BA0A19" Ref="U?"  Part="2" 
AR Path="/60B96DC5/60BA0A19" Ref="U1"  Part="2" 
F 0 "U1" H 2850 3567 50  0000 C CNN
F 1 "74HC04" H 2850 3476 50  0000 C CNN
F 2 "" H 2850 3250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2850 3250 50  0001 C CNN
	2    2850 3250
	1    0    0    -1  
$EndComp
Text GLabel 2350 3000 0    50   Input ~ 0
~PHI2
Wire Wire Line
	2450 3250 2550 3250
$Comp
L 74xx:74LS08 U?
U 1 1 60BA0A21
P 2850 2650
AR Path="/60BA0A21" Ref="U?"  Part="1" 
AR Path="/60B96DC5/60BA0A21" Ref="U3"  Part="1" 
F 0 "U3" H 2850 2975 50  0000 C CNN
F 1 "74HC08" H 2850 2884 50  0000 C CNN
F 2 "" H 2850 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2850 2650 50  0001 C CNN
	1    2850 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3250 3250 3250
Text GLabel 2350 2550 0    50   Input ~ 0
RDY
Wire Wire Line
	2350 2550 2550 2550
Wire Wire Line
	3150 2650 3250 2650
Wire Wire Line
	3250 2650 3250 2450
Wire Wire Line
	3250 2450 3350 2450
Wire Wire Line
	3250 2050 3250 2250
Wire Wire Line
	3250 2250 3350 2250
Text GLabel 4050 2350 2    50   Output ~ 0
RDN
Wire Wire Line
	3950 2350 4050 2350
Wire Wire Line
	2550 2750 2450 2750
Wire Wire Line
	2450 2750 2450 3000
Wire Wire Line
	2350 3000 2450 3000
Wire Wire Line
	2450 3250 2450 3000
Connection ~ 2450 3000
Text GLabel 3250 3250 2    50   Output ~ 0
PHI2
$EndSCHEMATC
