EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 8
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
L Device:R R?
U 1 1 606ECA8F
P 1500 1700
AR Path="/606ECA8F" Ref="R?"  Part="1" 
AR Path="/606C06BC/606ECA8F" Ref="R?"  Part="1" 
AR Path="/606C0859/606ECA8F" Ref="R?"  Part="1" 
AR Path="/606C09B4/606ECA8F" Ref="R1"  Part="1" 
AR Path="/606EC428/606ECA8F" Ref="R?"  Part="1" 
F 0 "R1" H 1570 1746 50  0000 L CNN
F 1 "47K" H 1570 1655 50  0000 L CNN
F 2 "" V 1430 1700 50  0001 C CNN
F 3 "~" H 1500 1700 50  0001 C CNN
	1    1500 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 606ECA90
P 1500 2700
AR Path="/606ECA90" Ref="R?"  Part="1" 
AR Path="/606C06BC/606ECA90" Ref="R?"  Part="1" 
AR Path="/606C0859/606ECA90" Ref="R?"  Part="1" 
AR Path="/606C09B4/606ECA90" Ref="R3"  Part="1" 
AR Path="/606EC428/606ECA90" Ref="R?"  Part="1" 
F 0 "R3" H 1570 2746 50  0000 L CNN
F 1 "47K" H 1570 2655 50  0000 L CNN
F 2 "" V 1430 2700 50  0001 C CNN
F 3 "~" H 1500 2700 50  0001 C CNN
	1    1500 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV?
U 1 1 606ECA91
P 1500 2300
AR Path="/606ECA91" Ref="RV?"  Part="1" 
AR Path="/606C06BC/606ECA91" Ref="RV?"  Part="1" 
AR Path="/606C0859/606ECA91" Ref="RV?"  Part="1" 
AR Path="/606C09B4/606ECA91" Ref="RV1"  Part="1" 
AR Path="/606EC428/606ECA91" Ref="RV?"  Part="1" 
F 0 "RV1" H 1431 2346 50  0000 R CNN
F 1 "10K" H 1431 2255 50  0000 R CNN
F 2 "" H 1500 2300 50  0001 C CNN
F 3 "~" H 1500 2300 50  0001 C CNN
	1    1500 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 606ECA92
P 2050 1700
AR Path="/606ECA92" Ref="R?"  Part="1" 
AR Path="/606C06BC/606ECA92" Ref="R?"  Part="1" 
AR Path="/606C0859/606ECA92" Ref="R?"  Part="1" 
AR Path="/606C09B4/606ECA92" Ref="R2"  Part="1" 
AR Path="/606EC428/606ECA92" Ref="R?"  Part="1" 
F 0 "R2" H 2120 1746 50  0000 L CNN
F 1 "10K" H 2120 1655 50  0000 L CNN
F 2 "" V 1980 1700 50  0001 C CNN
F 3 "~" H 2050 1700 50  0001 C CNN
	1    2050 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 606ECA93
P 2050 2700
AR Path="/606ECA93" Ref="R?"  Part="1" 
AR Path="/606C06BC/606ECA93" Ref="R?"  Part="1" 
AR Path="/606C0859/606ECA93" Ref="R?"  Part="1" 
AR Path="/606C09B4/606ECA93" Ref="R4"  Part="1" 
AR Path="/606EC428/606ECA93" Ref="R?"  Part="1" 
F 0 "R4" H 2120 2746 50  0000 L CNN
F 1 "10K" H 2120 2655 50  0000 L CNN
F 2 "" V 1980 2700 50  0001 C CNN
F 3 "~" H 2050 2700 50  0001 C CNN
	1    2050 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 606ECA94
P 1500 3050
AR Path="/606ECA94" Ref="#PWR?"  Part="1" 
AR Path="/606C06BC/606ECA94" Ref="#PWR?"  Part="1" 
AR Path="/606C0859/606ECA94" Ref="#PWR?"  Part="1" 
AR Path="/606C09B4/606ECA94" Ref="#PWR02"  Part="1" 
AR Path="/606EC428/606ECA94" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 1500 2800 50  0001 C CNN
F 1 "GND" H 1505 2877 50  0000 C CNN
F 2 "" H 1500 3050 50  0001 C CNN
F 3 "" H 1500 3050 50  0001 C CNN
	1    1500 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 606ECA95
P 1500 1350
AR Path="/606ECA95" Ref="#PWR?"  Part="1" 
AR Path="/606C06BC/606ECA95" Ref="#PWR?"  Part="1" 
AR Path="/606C0859/606ECA95" Ref="#PWR?"  Part="1" 
AR Path="/606C09B4/606ECA95" Ref="#PWR01"  Part="1" 
AR Path="/606EC428/606ECA95" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 1500 1200 50  0001 C CNN
F 1 "+5V" H 1515 1523 50  0000 C CNN
F 2 "" H 1500 1350 50  0001 C CNN
F 3 "" H 1500 1350 50  0001 C CNN
	1    1500 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1350 1500 1450
Wire Wire Line
	1500 1450 2050 1450
Wire Wire Line
	2050 1450 2050 1550
Connection ~ 1500 1450
Wire Wire Line
	1500 1450 1500 1550
Wire Wire Line
	1500 1850 1500 2150
Wire Wire Line
	1500 2450 1500 2550
Wire Wire Line
	1500 2850 1500 2950
Wire Wire Line
	1500 2950 2050 2950
Wire Wire Line
	2050 2950 2050 2850
Connection ~ 1500 2950
Wire Wire Line
	1500 2950 1500 3050
$Comp
L Connector:TestPoint TP?
U 1 1 606ECA96
P 3850 2200
AR Path="/606ECA96" Ref="TP?"  Part="1" 
AR Path="/606C06BC/606ECA96" Ref="TP?"  Part="1" 
AR Path="/606C0859/606ECA96" Ref="TP?"  Part="1" 
AR Path="/606C09B4/606ECA96" Ref="TP2"  Part="1" 
AR Path="/606EC428/606ECA96" Ref="TP?"  Part="1" 
F 0 "TP2" H 3908 2318 50  0000 L CNN
F 1 "Vout" H 3908 2227 50  0000 L CNN
F 2 "" H 4050 2200 50  0001 C CNN
F 3 "~" H 4050 2200 50  0001 C CNN
	1    3850 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 606ECA97
P 2450 2450
AR Path="/606ECA97" Ref="TP?"  Part="1" 
AR Path="/606C06BC/606ECA97" Ref="TP?"  Part="1" 
AR Path="/606C0859/606ECA97" Ref="TP?"  Part="1" 
AR Path="/606C09B4/606ECA97" Ref="TP3"  Part="1" 
AR Path="/606EC428/606ECA97" Ref="TP?"  Part="1" 
F 0 "TP3" H 2392 2476 50  0000 R CNN
F 1 "V1" H 2392 2567 50  0000 R CNN
F 2 "" H 2650 2450 50  0001 C CNN
F 3 "~" H 2650 2450 50  0001 C CNN
	1    2450 2450
	-1   0    0    1   
$EndComp
$Comp
L Amplifier_Operational:LM358 U?
U 2 1 606ECA98
P 3400 2200
AR Path="/606C06BC/606ECA98" Ref="U?"  Part="2" 
AR Path="/606C0859/606ECA98" Ref="U?"  Part="2" 
AR Path="/606C09B4/606ECA98" Ref="U1"  Part="2" 
AR Path="/606EC428/606ECA98" Ref="U?"  Part="2" 
F 0 "U1" H 3400 2567 50  0000 C CNN
F 1 "LM358" H 3400 2476 50  0000 C CNN
F 2 "" H 3400 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 3400 2200 50  0001 C CNN
	2    3400 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2450 2450 2300
Wire Wire Line
	3700 2200 3750 2200
Wire Wire Line
	2050 1850 2050 2100
Wire Wire Line
	3000 2100 3100 2100
Connection ~ 3750 2200
Wire Wire Line
	3750 2200 3850 2200
Wire Wire Line
	2450 2300 3100 2300
Wire Wire Line
	1650 2300 2450 2300
Connection ~ 2450 2300
$Comp
L Device:R R?
U 1 1 606ECA99
P 2750 2100
AR Path="/606ECA99" Ref="R?"  Part="1" 
AR Path="/606C06BC/606ECA99" Ref="R?"  Part="1" 
AR Path="/606C0859/606ECA99" Ref="R?"  Part="1" 
AR Path="/606C09B4/606ECA99" Ref="R6"  Part="1" 
AR Path="/606EC428/606ECA99" Ref="R?"  Part="1" 
F 0 "R6" V 2543 2100 50  0000 C CNN
F 1 "1K" V 2634 2100 50  0000 C CNN
F 2 "" V 2680 2100 50  0001 C CNN
F 3 "~" H 2750 2100 50  0001 C CNN
	1    2750 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 606ECA9A
P 3350 1700
AR Path="/606ECA9A" Ref="R?"  Part="1" 
AR Path="/606C06BC/606ECA9A" Ref="R?"  Part="1" 
AR Path="/606C0859/606ECA9A" Ref="R?"  Part="1" 
AR Path="/606C09B4/606ECA9A" Ref="R5"  Part="1" 
AR Path="/606EC428/606ECA9A" Ref="R?"  Part="1" 
F 0 "R5" V 3143 1700 50  0000 C CNN
F 1 "10K" V 3234 1700 50  0000 C CNN
F 2 "" V 3280 1700 50  0001 C CNN
F 3 "~" H 3350 1700 50  0001 C CNN
	1    3350 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 1700 3200 1700
Wire Wire Line
	3000 1700 3000 2100
Wire Wire Line
	3500 1700 3750 1700
Wire Wire Line
	3750 1700 3750 2200
Wire Wire Line
	3000 2100 2900 2100
Connection ~ 3000 2100
Wire Wire Line
	2600 2100 2350 2100
Connection ~ 2050 2100
Wire Wire Line
	2050 2100 2050 2550
$Comp
L Connector:TestPoint TP?
U 1 1 606ECA9B
P 2350 2000
AR Path="/606ECA9B" Ref="TP?"  Part="1" 
AR Path="/606C06BC/606ECA9B" Ref="TP?"  Part="1" 
AR Path="/606C0859/606ECA9B" Ref="TP?"  Part="1" 
AR Path="/606C09B4/606ECA9B" Ref="TP1"  Part="1" 
AR Path="/606EC428/606ECA9B" Ref="TP?"  Part="1" 
F 0 "TP1" H 2408 2118 50  0000 L CNN
F 1 "V2" H 2408 2027 50  0000 L CNN
F 2 "" H 2550 2000 50  0001 C CNN
F 3 "~" H 2550 2000 50  0001 C CNN
	1    2350 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2000 2350 2100
Connection ~ 2350 2100
Wire Wire Line
	2350 2100 2050 2100
$EndSCHEMATC
