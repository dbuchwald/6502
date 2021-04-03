EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 8
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
U 1 1 606E2C84
P 2050 1850
AR Path="/606E2C84" Ref="R?"  Part="1" 
AR Path="/606C06BC/606E2C84" Ref="R?"  Part="1" 
AR Path="/606C0859/606E2C84" Ref="R?"  Part="1" 
AR Path="/606C09B4/606E2C84" Ref="R2"  Part="1" 
AR Path="/606EC428/606E2C84" Ref="R2"  Part="1" 
F 0 "R2" H 2120 1896 50  0000 L CNN
F 1 "10K" H 2120 1805 50  0000 L CNN
F 2 "" V 1980 1850 50  0001 C CNN
F 3 "~" H 2050 1850 50  0001 C CNN
	1    2050 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 606E2C8A
P 2050 2350
AR Path="/606E2C8A" Ref="R?"  Part="1" 
AR Path="/606C06BC/606E2C8A" Ref="R?"  Part="1" 
AR Path="/606C0859/606E2C8A" Ref="R?"  Part="1" 
AR Path="/606C09B4/606E2C8A" Ref="R4"  Part="1" 
AR Path="/606EC428/606E2C8A" Ref="R4"  Part="1" 
F 0 "R4" H 2120 2396 50  0000 L CNN
F 1 "10K" H 2120 2305 50  0000 L CNN
F 2 "" V 1980 2350 50  0001 C CNN
F 3 "~" H 2050 2350 50  0001 C CNN
	1    2050 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 606E2C90
P 2050 2600
AR Path="/606E2C90" Ref="#PWR?"  Part="1" 
AR Path="/606C06BC/606E2C90" Ref="#PWR?"  Part="1" 
AR Path="/606C0859/606E2C90" Ref="#PWR?"  Part="1" 
AR Path="/606C09B4/606E2C90" Ref="#PWR02"  Part="1" 
AR Path="/606EC428/606E2C90" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 2050 2350 50  0001 C CNN
F 1 "GND" H 2055 2427 50  0000 C CNN
F 2 "" H 2050 2600 50  0001 C CNN
F 3 "" H 2050 2600 50  0001 C CNN
	1    2050 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 606E2C96
P 2050 1600
AR Path="/606E2C96" Ref="#PWR?"  Part="1" 
AR Path="/606C06BC/606E2C96" Ref="#PWR?"  Part="1" 
AR Path="/606C0859/606E2C96" Ref="#PWR?"  Part="1" 
AR Path="/606C09B4/606E2C96" Ref="#PWR01"  Part="1" 
AR Path="/606EC428/606E2C96" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 2050 1450 50  0001 C CNN
F 1 "+5V" H 2065 1773 50  0000 C CNN
F 2 "" H 2050 1600 50  0001 C CNN
F 3 "" H 2050 1600 50  0001 C CNN
	1    2050 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2000 2050 2100
$Comp
L Device:R R?
U 1 1 606E5437
P 2700 2100
AR Path="/606E5437" Ref="R?"  Part="1" 
AR Path="/606C06BC/606E5437" Ref="R?"  Part="1" 
AR Path="/606C0859/606E5437" Ref="R?"  Part="1" 
AR Path="/606C09B4/606E5437" Ref="R6"  Part="1" 
AR Path="/606EC428/606E5437" Ref="R6"  Part="1" 
F 0 "R6" V 2493 2100 50  0000 C CNN
F 1 "1K" V 2584 2100 50  0000 C CNN
F 2 "" V 2630 2100 50  0001 C CNN
F 3 "~" H 2700 2100 50  0001 C CNN
	1    2700 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 606E7E85
P 3100 2100
AR Path="/606E7E85" Ref="R?"  Part="1" 
AR Path="/606C06BC/606E7E85" Ref="R?"  Part="1" 
AR Path="/606C0859/606E7E85" Ref="R?"  Part="1" 
AR Path="/606C09B4/606E7E85" Ref="R5"  Part="1" 
AR Path="/606EC428/606E7E85" Ref="R5"  Part="1" 
F 0 "R5" V 2893 2100 50  0000 C CNN
F 1 "10K" V 2984 2100 50  0000 C CNN
F 2 "" V 3030 2100 50  0001 C CNN
F 3 "~" H 3100 2100 50  0001 C CNN
	1    3100 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 2100 3350 2100
Wire Wire Line
	2550 2100 2350 2100
Connection ~ 2050 2100
Wire Wire Line
	2050 2100 2050 2200
$Comp
L Connector:TestPoint TP?
U 1 1 606E9198
P 2350 2000
AR Path="/606E9198" Ref="TP?"  Part="1" 
AR Path="/606C06BC/606E9198" Ref="TP?"  Part="1" 
AR Path="/606C0859/606E9198" Ref="TP?"  Part="1" 
AR Path="/606C09B4/606E9198" Ref="TP1"  Part="1" 
AR Path="/606EC428/606E9198" Ref="TP1"  Part="1" 
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
$Comp
L power:+5V #PWR?
U 1 1 606ED3CC
P 3350 1600
AR Path="/606ED3CC" Ref="#PWR?"  Part="1" 
AR Path="/606C06BC/606ED3CC" Ref="#PWR?"  Part="1" 
AR Path="/606C0859/606ED3CC" Ref="#PWR?"  Part="1" 
AR Path="/606C09B4/606ED3CC" Ref="#PWR?"  Part="1" 
AR Path="/606EC428/606ED3CC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3350 1450 50  0001 C CNN
F 1 "+5V" H 3365 1773 50  0000 C CNN
F 2 "" H 3350 1600 50  0001 C CNN
F 3 "" H 3350 1600 50  0001 C CNN
	1    3350 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1600 3350 2100
Wire Wire Line
	2050 2500 2050 2600
Wire Wire Line
	2050 1600 2050 1700
Wire Wire Line
	2850 2100 2950 2100
$EndSCHEMATC
