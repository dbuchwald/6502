EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
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
L Oscillator:TCXO-14 X?
U 1 1 6044DF17
P 1400 1450
AR Path="/60398E8A/6044DF17" Ref="X?"  Part="1" 
AR Path="/604066AD/6044DF17" Ref="X?"  Part="1" 
AR Path="/60437255/6044DF17" Ref="X1"  Part="1" 
F 0 "X1" H 1056 1496 50  0000 R CNN
F 1 "4MHz" H 1056 1405 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 1850 1100 50  0001 C CNN
F 3 "http://www.golledge.com/pdf/products/tcxos/gtxos14.pdf" H 1300 1450 50  0001 C CNN
	1    1400 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6044DF1D
P 1400 1850
AR Path="/60398E8A/6044DF1D" Ref="#PWR?"  Part="1" 
AR Path="/604066AD/6044DF1D" Ref="#PWR?"  Part="1" 
AR Path="/60437255/6044DF1D" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 1400 1600 50  0001 C CNN
F 1 "GND" H 1405 1677 50  0000 C CNN
F 2 "" H 1400 1850 50  0001 C CNN
F 3 "" H 1400 1850 50  0001 C CNN
	1    1400 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1850 1400 1750
$Comp
L power:+5V #PWR?
U 1 1 6044DF24
P 1400 1050
AR Path="/60398E8A/6044DF24" Ref="#PWR?"  Part="1" 
AR Path="/604066AD/6044DF24" Ref="#PWR?"  Part="1" 
AR Path="/60437255/6044DF24" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 1400 900 50  0001 C CNN
F 1 "+5V" H 1415 1223 50  0000 C CNN
F 2 "" H 1400 1050 50  0001 C CNN
F 3 "" H 1400 1050 50  0001 C CNN
	1    1400 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1050 1400 1150
$Comp
L 74xx:74HC04 U?
U 7 1 6044DF2B
P 1400 3000
AR Path="/60398E8A/6044DF2B" Ref="U?"  Part="7" 
AR Path="/604066AD/6044DF2B" Ref="U?"  Part="7" 
AR Path="/60437255/6044DF2B" Ref="U1"  Part="7" 
F 0 "U1" H 1630 3046 50  0000 L CNN
F 1 "74HC04" H 1630 2955 50  0000 L CNN
F 2 "" H 1400 3000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 1400 3000 50  0001 C CNN
	7    1400 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6044DF31
P 1400 2400
AR Path="/60398E8A/6044DF31" Ref="#PWR?"  Part="1" 
AR Path="/604066AD/6044DF31" Ref="#PWR?"  Part="1" 
AR Path="/60437255/6044DF31" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 1400 2250 50  0001 C CNN
F 1 "+5V" H 1415 2573 50  0000 C CNN
F 2 "" H 1400 2400 50  0001 C CNN
F 3 "" H 1400 2400 50  0001 C CNN
	1    1400 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 2400 1400 2500
$Comp
L power:GND #PWR?
U 1 1 6044DF38
P 1400 3600
AR Path="/60398E8A/6044DF38" Ref="#PWR?"  Part="1" 
AR Path="/604066AD/6044DF38" Ref="#PWR?"  Part="1" 
AR Path="/60437255/6044DF38" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 1400 3350 50  0001 C CNN
F 1 "GND" H 1405 3427 50  0000 C CNN
F 2 "" H 1400 3600 50  0001 C CNN
F 3 "" H 1400 3600 50  0001 C CNN
	1    1400 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 3600 1400 3500
$Comp
L 74xx:74HC04 U?
U 1 1 6044DF3F
P 2100 1450
AR Path="/60398E8A/6044DF3F" Ref="U?"  Part="1" 
AR Path="/604066AD/6044DF3F" Ref="U?"  Part="1" 
AR Path="/60437255/6044DF3F" Ref="U1"  Part="1" 
F 0 "U1" H 2100 1767 50  0000 C CNN
F 1 "74HC04" H 2100 1676 50  0000 C CNN
F 2 "" H 2100 1450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2100 1450 50  0001 C CNN
	1    2100 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1450 1800 1450
$Comp
L 74xx:74HC04 U?
U 6 1 6044DF46
P 4150 1450
AR Path="/60398E8A/6044DF46" Ref="U?"  Part="6" 
AR Path="/604066AD/6044DF46" Ref="U?"  Part="6" 
AR Path="/60437255/6044DF46" Ref="U1"  Part="6" 
F 0 "U1" H 4150 1767 50  0000 C CNN
F 1 "74HC04" H 4150 1676 50  0000 C CNN
F 2 "" H 4150 1450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4150 1450 50  0001 C CNN
	6    4150 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 6044DF4C
P 2500 1350
AR Path="/60398E8A/6044DF4C" Ref="TP?"  Part="1" 
AR Path="/604066AD/6044DF4C" Ref="TP?"  Part="1" 
AR Path="/60437255/6044DF4C" Ref="TP1"  Part="1" 
F 0 "TP1" H 2558 1468 50  0000 L CNN
F 1 "RDY out" H 2558 1377 50  0000 L CNN
F 2 "" H 2700 1350 50  0001 C CNN
F 3 "~" H 2700 1350 50  0001 C CNN
	1    2500 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 6044DF52
P 3600 1350
AR Path="/60398E8A/6044DF52" Ref="TP?"  Part="1" 
AR Path="/604066AD/6044DF52" Ref="TP?"  Part="1" 
AR Path="/60437255/6044DF52" Ref="TP2"  Part="1" 
F 0 "TP2" H 3658 1468 50  0000 L CNN
F 1 "RDY in" H 3658 1377 50  0000 L CNN
F 2 "" H 3800 1350 50  0001 C CNN
F 3 "~" H 3800 1350 50  0001 C CNN
	1    3600 1350
	1    0    0    -1  
$EndComp
NoConn ~ 4450 1450
Wire Wire Line
	2400 1450 2500 1450
Wire Wire Line
	2500 1350 2500 1450
Wire Wire Line
	3600 1350 3600 1450
Wire Wire Line
	3600 1450 3850 1450
$Comp
L 74xx:74HC04 U?
U 2 1 6044DF5D
P 2600 2300
AR Path="/60398E8A/6044DF5D" Ref="U?"  Part="2" 
AR Path="/604066AD/6044DF5D" Ref="U?"  Part="2" 
AR Path="/60437255/6044DF5D" Ref="U1"  Part="2" 
F 0 "U1" H 2600 2617 50  0000 C CNN
F 1 "74HC04" H 2600 2526 50  0000 C CNN
F 2 "" H 2600 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2600 2300 50  0001 C CNN
	2    2600 2300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 3 1 6044DF63
P 2600 2850
AR Path="/60398E8A/6044DF63" Ref="U?"  Part="3" 
AR Path="/604066AD/6044DF63" Ref="U?"  Part="3" 
AR Path="/60437255/6044DF63" Ref="U1"  Part="3" 
F 0 "U1" H 2600 3167 50  0000 C CNN
F 1 "74HC04" H 2600 3076 50  0000 C CNN
F 2 "" H 2600 2850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2600 2850 50  0001 C CNN
	3    2600 2850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 4 1 6044DF69
P 3600 2300
AR Path="/60398E8A/6044DF69" Ref="U?"  Part="4" 
AR Path="/604066AD/6044DF69" Ref="U?"  Part="4" 
AR Path="/60437255/6044DF69" Ref="U1"  Part="4" 
F 0 "U1" H 3600 2617 50  0000 C CNN
F 1 "74HC04" H 3600 2526 50  0000 C CNN
F 2 "" H 3600 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3600 2300 50  0001 C CNN
	4    3600 2300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 5 1 6044DF6F
P 3600 2850
AR Path="/60398E8A/6044DF6F" Ref="U?"  Part="5" 
AR Path="/604066AD/6044DF6F" Ref="U?"  Part="5" 
AR Path="/60437255/6044DF6F" Ref="U1"  Part="5" 
F 0 "U1" H 3600 3167 50  0000 C CNN
F 1 "74HC04" H 3600 3076 50  0000 C CNN
F 2 "" H 3600 2850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3600 2850 50  0001 C CNN
	5    3600 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6044DF75
P 2200 2950
AR Path="/60398E8A/6044DF75" Ref="#PWR?"  Part="1" 
AR Path="/604066AD/6044DF75" Ref="#PWR?"  Part="1" 
AR Path="/60437255/6044DF75" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 2200 2700 50  0001 C CNN
F 1 "GND" H 2205 2777 50  0000 C CNN
F 2 "" H 2200 2950 50  0001 C CNN
F 3 "" H 2200 2950 50  0001 C CNN
	1    2200 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6044DF7B
P 3200 2950
AR Path="/60398E8A/6044DF7B" Ref="#PWR?"  Part="1" 
AR Path="/604066AD/6044DF7B" Ref="#PWR?"  Part="1" 
AR Path="/60437255/6044DF7B" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 3200 2700 50  0001 C CNN
F 1 "GND" H 3205 2777 50  0000 C CNN
F 2 "" H 3200 2950 50  0001 C CNN
F 3 "" H 3200 2950 50  0001 C CNN
	1    3200 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2300 2300 2300
Wire Wire Line
	2200 2850 2300 2850
Connection ~ 2200 2850
Wire Wire Line
	2200 2850 2200 2300
NoConn ~ 2900 2850
NoConn ~ 2900 2300
Wire Wire Line
	3200 2950 3200 2850
Wire Wire Line
	3200 2300 3300 2300
Wire Wire Line
	3200 2850 3300 2850
Connection ~ 3200 2850
Wire Wire Line
	3200 2850 3200 2300
NoConn ~ 3900 2850
NoConn ~ 3900 2300
Wire Wire Line
	2200 2850 2200 2950
$Comp
L Device:R R?
U 1 1 6044DF8F
P 3150 1350
AR Path="/604066AD/6044DF8F" Ref="R?"  Part="1" 
AR Path="/60437255/6044DF8F" Ref="R1"  Part="1" 
F 0 "R1" V 2943 1350 50  0000 C CNN
F 1 "470" V 3034 1350 50  0000 C CNN
F 2 "" V 3080 1350 50  0001 C CNN
F 3 "~" H 3150 1350 50  0001 C CNN
	1    3150 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	2500 1450 2900 1450
Connection ~ 2500 1450
Wire Wire Line
	3400 1450 3600 1450
Connection ~ 3600 1450
$Comp
L Device:C_Small C1
U 1 1 60450539
P 3150 1550
F 0 "C1" V 3000 1550 50  0000 C CNN
F 1 "22pF" V 2900 1550 50  0000 C CNN
F 2 "" H 3150 1550 50  0001 C CNN
F 3 "~" H 3150 1550 50  0001 C CNN
	1    3150 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2900 1450 2900 1350
Wire Wire Line
	2900 1350 3000 1350
Wire Wire Line
	2900 1450 2900 1550
Wire Wire Line
	2900 1550 3050 1550
Connection ~ 2900 1450
Wire Wire Line
	3250 1550 3400 1550
Wire Wire Line
	3400 1550 3400 1450
Wire Wire Line
	3400 1350 3300 1350
Connection ~ 3400 1450
Wire Wire Line
	3400 1450 3400 1350
$EndSCHEMATC
