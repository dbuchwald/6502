EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
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
U 1 1 603CB8B0
P 1400 1350
AR Path="/60398E8A/603CB8B0" Ref="X?"  Part="1" 
AR Path="/604066AD/603CB8B0" Ref="X?"  Part="1" 
AR Path="/60437255/603CB8B0" Ref="X?"  Part="1" 
AR Path="/603BFB32/603CB8B0" Ref="X1"  Part="1" 
F 0 "X1" H 1056 1396 50  0000 R CNN
F 1 "4MHz" H 1056 1305 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 1850 1000 50  0001 C CNN
F 3 "http://www.golledge.com/pdf/products/tcxos/gtxos14.pdf" H 1300 1350 50  0001 C CNN
	1    1400 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 603CB8B6
P 1400 1750
AR Path="/60398E8A/603CB8B6" Ref="#PWR?"  Part="1" 
AR Path="/604066AD/603CB8B6" Ref="#PWR?"  Part="1" 
AR Path="/60437255/603CB8B6" Ref="#PWR?"  Part="1" 
AR Path="/603BFB32/603CB8B6" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 1400 1500 50  0001 C CNN
F 1 "GND" H 1405 1577 50  0000 C CNN
F 2 "" H 1400 1750 50  0001 C CNN
F 3 "" H 1400 1750 50  0001 C CNN
	1    1400 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1750 1400 1650
$Comp
L power:+5V #PWR?
U 1 1 603CB8BD
P 1400 950
AR Path="/60398E8A/603CB8BD" Ref="#PWR?"  Part="1" 
AR Path="/604066AD/603CB8BD" Ref="#PWR?"  Part="1" 
AR Path="/60437255/603CB8BD" Ref="#PWR?"  Part="1" 
AR Path="/603BFB32/603CB8BD" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 1400 800 50  0001 C CNN
F 1 "+5V" H 1415 1123 50  0000 C CNN
F 2 "" H 1400 950 50  0001 C CNN
F 3 "" H 1400 950 50  0001 C CNN
	1    1400 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 950  1400 1050
$Comp
L 74xx:74HC04 U?
U 7 1 603CB8C4
P 1400 2900
AR Path="/60398E8A/603CB8C4" Ref="U?"  Part="7" 
AR Path="/604066AD/603CB8C4" Ref="U?"  Part="7" 
AR Path="/60437255/603CB8C4" Ref="U?"  Part="7" 
AR Path="/603BFB32/603CB8C4" Ref="U1"  Part="7" 
F 0 "U1" H 1630 2946 50  0000 L CNN
F 1 "74HC04" H 1630 2855 50  0000 L CNN
F 2 "" H 1400 2900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 1400 2900 50  0001 C CNN
	7    1400 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 603CB8CA
P 1400 2300
AR Path="/60398E8A/603CB8CA" Ref="#PWR?"  Part="1" 
AR Path="/604066AD/603CB8CA" Ref="#PWR?"  Part="1" 
AR Path="/60437255/603CB8CA" Ref="#PWR?"  Part="1" 
AR Path="/603BFB32/603CB8CA" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 1400 2150 50  0001 C CNN
F 1 "+5V" H 1415 2473 50  0000 C CNN
F 2 "" H 1400 2300 50  0001 C CNN
F 3 "" H 1400 2300 50  0001 C CNN
	1    1400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 2300 1400 2400
$Comp
L power:GND #PWR?
U 1 1 603CB8D1
P 1400 3500
AR Path="/60398E8A/603CB8D1" Ref="#PWR?"  Part="1" 
AR Path="/604066AD/603CB8D1" Ref="#PWR?"  Part="1" 
AR Path="/60437255/603CB8D1" Ref="#PWR?"  Part="1" 
AR Path="/603BFB32/603CB8D1" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 1400 3250 50  0001 C CNN
F 1 "GND" H 1405 3327 50  0000 C CNN
F 2 "" H 1400 3500 50  0001 C CNN
F 3 "" H 1400 3500 50  0001 C CNN
	1    1400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 3500 1400 3400
$Comp
L 74xx:74HC04 U?
U 1 1 603CB8D8
P 2100 1350
AR Path="/60398E8A/603CB8D8" Ref="U?"  Part="1" 
AR Path="/604066AD/603CB8D8" Ref="U?"  Part="1" 
AR Path="/60437255/603CB8D8" Ref="U?"  Part="1" 
AR Path="/603BFB32/603CB8D8" Ref="U1"  Part="1" 
F 0 "U1" H 2100 1667 50  0000 C CNN
F 1 "74HC04" H 2100 1576 50  0000 C CNN
F 2 "" H 2100 1350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2100 1350 50  0001 C CNN
	1    2100 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1350 1800 1350
$Comp
L 74xx:74HC04 U?
U 6 1 603CB8DF
P 3850 1350
AR Path="/60398E8A/603CB8DF" Ref="U?"  Part="6" 
AR Path="/604066AD/603CB8DF" Ref="U?"  Part="6" 
AR Path="/60437255/603CB8DF" Ref="U?"  Part="6" 
AR Path="/603BFB32/603CB8DF" Ref="U1"  Part="6" 
F 0 "U1" H 3850 1667 50  0000 C CNN
F 1 "74HC04" H 3850 1576 50  0000 C CNN
F 2 "" H 3850 1350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3850 1350 50  0001 C CNN
	6    3850 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 603CB8E5
P 2500 1250
AR Path="/60398E8A/603CB8E5" Ref="TP?"  Part="1" 
AR Path="/604066AD/603CB8E5" Ref="TP?"  Part="1" 
AR Path="/60437255/603CB8E5" Ref="TP?"  Part="1" 
AR Path="/603BFB32/603CB8E5" Ref="TP1"  Part="1" 
F 0 "TP1" H 2558 1368 50  0000 L CNN
F 1 "RDY out" H 2558 1277 50  0000 L CNN
F 2 "" H 2700 1250 50  0001 C CNN
F 3 "~" H 2700 1250 50  0001 C CNN
	1    2500 1250
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 603CB8EB
P 4250 1250
AR Path="/60398E8A/603CB8EB" Ref="TP?"  Part="1" 
AR Path="/604066AD/603CB8EB" Ref="TP?"  Part="1" 
AR Path="/60437255/603CB8EB" Ref="TP?"  Part="1" 
AR Path="/603BFB32/603CB8EB" Ref="TP2"  Part="1" 
F 0 "TP2" H 4308 1368 50  0000 L CNN
F 1 "Signal out" H 4308 1277 50  0000 L CNN
F 2 "" H 4450 1250 50  0001 C CNN
F 3 "~" H 4450 1250 50  0001 C CNN
	1    4250 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 1350 2500 1350
Wire Wire Line
	2500 1250 2500 1350
$Comp
L 74xx:74HC04 U?
U 2 1 603CB8F6
P 2600 2650
AR Path="/60398E8A/603CB8F6" Ref="U?"  Part="2" 
AR Path="/604066AD/603CB8F6" Ref="U?"  Part="2" 
AR Path="/60437255/603CB8F6" Ref="U?"  Part="2" 
AR Path="/603BFB32/603CB8F6" Ref="U1"  Part="2" 
F 0 "U1" H 2600 2967 50  0000 C CNN
F 1 "74HC04" H 2600 2876 50  0000 C CNN
F 2 "" H 2600 2650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2600 2650 50  0001 C CNN
	2    2600 2650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 3 1 603CB8FC
P 2600 3200
AR Path="/60398E8A/603CB8FC" Ref="U?"  Part="3" 
AR Path="/604066AD/603CB8FC" Ref="U?"  Part="3" 
AR Path="/60437255/603CB8FC" Ref="U?"  Part="3" 
AR Path="/603BFB32/603CB8FC" Ref="U1"  Part="3" 
F 0 "U1" H 2600 3517 50  0000 C CNN
F 1 "74HC04" H 2600 3426 50  0000 C CNN
F 2 "" H 2600 3200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2600 3200 50  0001 C CNN
	3    2600 3200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 4 1 603CB902
P 3600 2650
AR Path="/60398E8A/603CB902" Ref="U?"  Part="4" 
AR Path="/604066AD/603CB902" Ref="U?"  Part="4" 
AR Path="/60437255/603CB902" Ref="U?"  Part="4" 
AR Path="/603BFB32/603CB902" Ref="U1"  Part="4" 
F 0 "U1" H 3600 2967 50  0000 C CNN
F 1 "74HC04" H 3600 2876 50  0000 C CNN
F 2 "" H 3600 2650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3600 2650 50  0001 C CNN
	4    3600 2650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 5 1 603CB908
P 3600 3200
AR Path="/60398E8A/603CB908" Ref="U?"  Part="5" 
AR Path="/604066AD/603CB908" Ref="U?"  Part="5" 
AR Path="/60437255/603CB908" Ref="U?"  Part="5" 
AR Path="/603BFB32/603CB908" Ref="U1"  Part="5" 
F 0 "U1" H 3600 3517 50  0000 C CNN
F 1 "74HC04" H 3600 3426 50  0000 C CNN
F 2 "" H 3600 3200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3600 3200 50  0001 C CNN
	5    3600 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 603CB90E
P 2200 3300
AR Path="/60398E8A/603CB90E" Ref="#PWR?"  Part="1" 
AR Path="/604066AD/603CB90E" Ref="#PWR?"  Part="1" 
AR Path="/60437255/603CB90E" Ref="#PWR?"  Part="1" 
AR Path="/603BFB32/603CB90E" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 2200 3050 50  0001 C CNN
F 1 "GND" H 2205 3127 50  0000 C CNN
F 2 "" H 2200 3300 50  0001 C CNN
F 3 "" H 2200 3300 50  0001 C CNN
	1    2200 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 603CB914
P 3200 3300
AR Path="/60398E8A/603CB914" Ref="#PWR?"  Part="1" 
AR Path="/604066AD/603CB914" Ref="#PWR?"  Part="1" 
AR Path="/60437255/603CB914" Ref="#PWR?"  Part="1" 
AR Path="/603BFB32/603CB914" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 3200 3050 50  0001 C CNN
F 1 "GND" H 3205 3127 50  0000 C CNN
F 2 "" H 3200 3300 50  0001 C CNN
F 3 "" H 3200 3300 50  0001 C CNN
	1    3200 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2650 2300 2650
Wire Wire Line
	2200 3200 2300 3200
Connection ~ 2200 3200
Wire Wire Line
	2200 3200 2200 2650
NoConn ~ 2900 3200
NoConn ~ 2900 2650
Wire Wire Line
	3200 3300 3200 3200
Wire Wire Line
	3200 2650 3300 2650
Wire Wire Line
	3200 3200 3300 3200
Connection ~ 3200 3200
Wire Wire Line
	3200 3200 3200 2650
NoConn ~ 3900 3200
NoConn ~ 3900 2650
Wire Wire Line
	2200 3200 2200 3300
$Comp
L Device:R R?
U 1 1 603CB928
P 3150 1250
AR Path="/604066AD/603CB928" Ref="R?"  Part="1" 
AR Path="/60437255/603CB928" Ref="R?"  Part="1" 
AR Path="/603BFB32/603CB928" Ref="R1"  Part="1" 
F 0 "R1" V 2943 1250 50  0000 C CNN
F 1 "1K" V 3034 1250 50  0000 C CNN
F 2 "" V 3080 1250 50  0001 C CNN
F 3 "~" H 3150 1250 50  0001 C CNN
	1    3150 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	2500 1350 2900 1350
Connection ~ 2500 1350
$Comp
L Device:C_Small C?
U 1 1 603CB932
P 3150 1450
AR Path="/60437255/603CB932" Ref="C?"  Part="1" 
AR Path="/603BFB32/603CB932" Ref="C1"  Part="1" 
F 0 "C1" V 3000 1450 50  0000 C CNN
F 1 "22pF" V 2900 1450 50  0000 C CNN
F 2 "" H 3150 1450 50  0001 C CNN
F 3 "~" H 3150 1450 50  0001 C CNN
	1    3150 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2900 1350 2900 1250
Wire Wire Line
	2900 1250 3000 1250
Wire Wire Line
	2900 1350 2900 1450
Wire Wire Line
	2900 1450 3050 1450
Connection ~ 2900 1350
Wire Wire Line
	3250 1450 3400 1450
Wire Wire Line
	3400 1450 3400 1350
Wire Wire Line
	3400 1250 3300 1250
Connection ~ 3400 1350
Wire Wire Line
	3400 1350 3400 1250
Wire Wire Line
	3400 1350 3550 1350
Wire Wire Line
	4150 1350 4250 1350
Wire Wire Line
	4250 1350 4250 1250
$EndSCHEMATC
