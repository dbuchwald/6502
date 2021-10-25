EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "AVR Supervisor version 1"
Date "2020-11-03"
Rev "v003"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Open Source Hardware"
Comment4 "Author: Dawid Buchwald"
$EndDescr
$Comp
L 6502:FT230XS U?
U 1 1 5F9AD1D3
P 9750 1400
AR Path="/6014B4D9/5F9AD1D3" Ref="U?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD1D3" Ref="U?"  Part="1" 
AR Path="/5F9AD1D3" Ref="U1"  Part="1" 
F 0 "U1" H 9750 2015 50  0000 C CNN
F 1 "FT230XS" H 9750 1924 50  0000 C CNN
F 2 "Package_SO:SSOP-16_4.4x5.2mm_P0.65mm" H 9750 1900 50  0001 C CNN
F 3 "" H 9750 1400 50  0001 C CNN
	1    9750 1400
	1    0    0    -1  
$EndComp
Text GLabel 9100 1050 0    50   Output ~ 0
DBG_USB_RxD
Text GLabel 9100 1350 0    50   Input ~ 0
DBG_TxD
Wire Wire Line
	9100 1050 9200 1050
Text GLabel 9000 1450 0    50   Input ~ 0
GND
Text GLabel 9100 1850 0    50   BiDi ~ 0
DBG_USBD+
Text GLabel 10400 1750 2    50   BiDi ~ 0
DBG_USBD-
Text GLabel 10600 1250 1    50   Input ~ 0
GND
Wire Wire Line
	9000 1450 9100 1450
Text GLabel 11000 1250 1    50   Input ~ 0
+5V
Wire Wire Line
	9200 1550 9100 1550
Wire Wire Line
	9100 1550 9100 1450
Connection ~ 9100 1450
Wire Wire Line
	9100 1450 9200 1450
NoConn ~ 9200 1150
Wire Wire Line
	9100 1350 9200 1350
Wire Wire Line
	8500 1250 8500 1950
Wire Wire Line
	11000 1950 11000 1650
Wire Wire Line
	11000 1650 10300 1650
Wire Wire Line
	8500 1250 9200 1250
Wire Wire Line
	10300 1750 10400 1750
Wire Wire Line
	10300 1550 11000 1550
Wire Wire Line
	11000 1550 11000 1650
Connection ~ 11000 1650
Text GLabel 10450 1150 1    50   Output ~ 0
~DBG_RXLED
Text GLabel 9100 1650 0    50   Output ~ 0
~DBG_TXLED
Wire Wire Line
	9100 1850 9150 1850
Wire Wire Line
	9150 1850 9150 1750
Wire Wire Line
	9150 1750 9200 1750
Wire Wire Line
	9100 1650 9200 1650
Wire Wire Line
	10300 1250 10450 1250
NoConn ~ 10300 1150
$Comp
L 74xx:74LS04 U6
U 2 1 5F92D3FA
P 5250 6200
F 0 "U6" H 5250 6517 50  0000 C CNN
F 1 "74AC04" H 5250 6426 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5250 6200 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 5250 6200 50  0001 C CNN
	2    5250 6200
	1    0    0    -1  
$EndComp
Text GLabel 4850 6200 0    50   Input ~ 0
~DBG_BE
Wire Wire Line
	4850 6200 4950 6200
Wire Wire Line
	5550 6200 5650 6200
$Comp
L 74xx:74LS04 U6
U 7 1 5F946300
P 900 7000
F 0 "U6" H 900 7050 50  0000 C CNN
F 1 "74AC04" H 900 6950 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 900 7000 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 900 7000 50  0001 C CNN
	7    900  7000
	1    0    0    -1  
$EndComp
Text GLabel 800  7600 0    50   Input ~ 0
GND
Wire Wire Line
	800  7600 900  7600
Text GLabel 800  6400 0    50   Input ~ 0
+5V
Wire Wire Line
	800  6400 900  6400
$Comp
L 74xx:74LS04 U6
U 3 1 5F95A89B
P 5250 6750
F 0 "U6" H 5250 7067 50  0000 C CNN
F 1 "74AC04" H 5250 6976 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5250 6750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 5250 6750 50  0001 C CNN
	3    5250 6750
	1    0    0    -1  
$EndComp
Text GLabel 4850 6750 0    50   Input ~ 0
DBG_RES
Wire Wire Line
	4850 6750 4950 6750
Text GLabel 5650 6750 2    50   Output ~ 0
~DBG_RES
Wire Wire Line
	5650 6750 5550 6750
$Comp
L Device:C_Small C11
U 1 1 5FAB56CF
P 1250 7000
F 0 "C11" H 1342 7046 50  0000 L CNN
F 1 "0,1uF" H 1342 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1250 7000 50  0001 C CNN
F 3 "~" H 1250 7000 50  0001 C CNN
	1    1250 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 6900 1250 6400
Wire Wire Line
	1250 6400 900  6400
Connection ~ 900  6400
Wire Wire Line
	900  6400 900  6500
Wire Wire Line
	1250 7100 1250 7600
Wire Wire Line
	1250 7600 900  7600
Connection ~ 900  7600
Wire Wire Line
	900  7600 900  7500
$Comp
L 74xx:74LS08 U4
U 5 1 5FB0D0DC
P 1900 7000
F 0 "U4" H 1900 7050 50  0000 C CNN
F 1 "74AC08" H 1900 6950 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1900 7000 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 1900 7000 50  0001 C CNN
	5    1900 7000
	1    0    0    -1  
$EndComp
Text GLabel 1800 6400 0    50   Input ~ 0
+5V
Text GLabel 1800 7600 0    50   Input ~ 0
GND
Wire Wire Line
	1900 6500 1900 6400
Wire Wire Line
	1900 7500 1900 7600
Wire Wire Line
	2250 6900 2250 6400
Wire Wire Line
	2250 6400 1900 6400
Connection ~ 1900 6400
Wire Wire Line
	1900 6400 1800 6400
Wire Wire Line
	2250 7100 2250 7600
Wire Wire Line
	2250 7600 1900 7600
Connection ~ 1900 7600
Wire Wire Line
	1900 7600 1800 7600
$Comp
L Device:C_Small C2
U 1 1 5FC939BD
P 10800 1350
F 0 "C2" H 10708 1304 50  0000 R CNN
F 1 "0,1uF" H 10708 1395 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 10800 1350 50  0001 C CNN
F 3 "~" H 10800 1350 50  0001 C CNN
	1    10800 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 5750 4950 5750
$Comp
L 74xx:74LS08 U4
U 2 1 5FBB3E3E
P 5250 5650
F 0 "U4" H 5250 5975 50  0000 C CNN
F 1 "74AC08" H 5250 5884 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5250 5650 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 5250 5650 50  0001 C CNN
	2    5250 5650
	1    0    0    -1  
$EndComp
Text GLabel 4850 5750 0    50   Input ~ 0
~RES
Text GLabel 4750 5550 0    50   Input ~ 0
SR_OUT
Text GLabel 5650 5650 2    50   Output ~ 0
SR_LATCH
Wire Wire Line
	5550 5650 5650 5650
Wire Wire Line
	10450 1250 10450 1150
Wire Wire Line
	10300 1350 10600 1350
Wire Wire Line
	10600 1250 10600 1350
Connection ~ 10600 1350
Wire Wire Line
	10600 1350 10700 1350
Wire Wire Line
	11000 1250 11000 1350
Wire Wire Line
	10300 1450 11000 1450
Wire Wire Line
	10900 1350 11000 1350
Connection ~ 11000 1350
Wire Wire Line
	11000 1350 11000 1450
$Comp
L Device:C_Small C?
U 1 1 5FF0FFA6
P 8850 2150
AR Path="/6014B4D9/5FF0FFA6" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5FF0FFA6" Ref="C?"  Part="1" 
AR Path="/5F910E81/5FF0FFA6" Ref="C?"  Part="1" 
AR Path="/5FF0FFA6" Ref="C6"  Part="1" 
F 0 "C6" H 8965 2196 50  0000 L CNN
F 1 "0,1uF" H 8965 2105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 8888 2000 50  0001 C CNN
F 3 "~" H 8850 2150 50  0001 C CNN
	1    8850 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 1950 8850 2050
Text GLabel 8950 2350 2    50   Input ~ 0
GND
Wire Wire Line
	8850 2350 8850 2250
$Comp
L Device:R R?
U 1 1 5FF0FFAF
P 9750 2150
AR Path="/6014B4D9/5FF0FFAF" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FF0FFAF" Ref="R?"  Part="1" 
AR Path="/5F910E81/5FF0FFAF" Ref="R?"  Part="1" 
AR Path="/5FF0FFAF" Ref="R2"  Part="1" 
F 0 "R2" V 9850 2150 50  0000 C CNN
F 1 "470" V 9750 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 9680 2150 50  0001 C CNN
F 3 "~" H 9750 2150 50  0001 C CNN
	1    9750 2150
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5FF0FFB5
P 10150 2450
AR Path="/6014B4D9/5FF0FFB5" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5FF0FFB5" Ref="D?"  Part="1" 
AR Path="/5F910E81/5FF0FFB5" Ref="D?"  Part="1" 
AR Path="/5FF0FFB5" Ref="D2"  Part="1" 
F 0 "D2" H 10150 2350 50  0000 C CNN
F 1 "D_RX" H 10150 2550 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 10150 2450 50  0001 C CNN
F 3 "~" H 10150 2450 50  0001 C CNN
	1    10150 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5FF0FFBB
P 10150 2150
AR Path="/6014B4D9/5FF0FFBB" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5FF0FFBB" Ref="D?"  Part="1" 
AR Path="/5F910E81/5FF0FFBB" Ref="D?"  Part="1" 
AR Path="/5FF0FFBB" Ref="D1"  Part="1" 
F 0 "D1" H 10150 2050 50  0000 C CNN
F 1 "D_TX" H 10150 2250 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 10150 2150 50  0001 C CNN
F 3 "~" H 10150 2150 50  0001 C CNN
	1    10150 2150
	-1   0    0    1   
$EndComp
Text GLabel 10400 2450 2    50   Input ~ 0
~DBG_RXLED
Text GLabel 10400 2150 2    50   Input ~ 0
~DBG_TXLED
Wire Wire Line
	10400 2450 10300 2450
Wire Wire Line
	10400 2150 10300 2150
$Comp
L Device:R R?
U 1 1 5FF0FFC5
P 9750 2450
AR Path="/6014B4D9/5FF0FFC5" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FF0FFC5" Ref="R?"  Part="1" 
AR Path="/5F910E81/5FF0FFC5" Ref="R?"  Part="1" 
AR Path="/5FF0FFC5" Ref="R3"  Part="1" 
F 0 "R3" V 9850 2450 50  0000 C CNN
F 1 "470" V 9750 2450 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 9680 2450 50  0001 C CNN
F 3 "~" H 9750 2450 50  0001 C CNN
	1    9750 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9900 2150 10000 2150
Wire Wire Line
	9900 2450 10000 2450
Wire Wire Line
	9500 2150 9600 2150
Wire Wire Line
	9500 1950 9500 2150
Wire Wire Line
	9400 2450 9600 2450
Wire Wire Line
	9400 1950 9400 2450
Wire Wire Line
	8850 2350 8950 2350
Wire Wire Line
	8500 1950 8850 1950
Connection ~ 8850 1950
Wire Wire Line
	8850 1950 9400 1950
Connection ~ 9400 1950
Wire Wire Line
	9400 1950 9500 1950
Connection ~ 9500 1950
Wire Wire Line
	9500 1950 11000 1950
$Comp
L Device:C_Small C12
U 1 1 5FB0F869
P 2250 7000
F 0 "C12" H 2342 7046 50  0000 L CNN
F 1 "0,1uF" H 2342 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 2250 7000 50  0001 C CNN
F 3 "~" H 2250 7000 50  0001 C CNN
	1    2250 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5550 4850 5550
$Comp
L 74xx:74LS08 U4
U 1 1 6107F858
P 5250 5050
F 0 "U4" H 5250 5375 50  0000 C CNN
F 1 "74AC08" H 5250 5284 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5250 5050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 5250 5050 50  0001 C CNN
	1    5250 5050
	1    0    0    -1  
$EndComp
Text GLabel 4850 4950 0    50   Input ~ 0
~EXT_RES
Wire Wire Line
	4850 4950 4950 4950
Text GLabel 5650 5050 2    50   Output ~ 0
~RES
Text GLabel 4850 5150 0    50   Input ~ 0
~ISP_RES
Wire Wire Line
	4850 5150 4950 5150
Wire Wire Line
	5550 5050 5650 5050
NoConn ~ 10300 1050
$Comp
L 6502:USB_B J?
U 1 1 60F823CA
P 8650 3250
AR Path="/6014B4D9/60F823CA" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/60F823CA" Ref="J?"  Part="1" 
AR Path="/60F823CA" Ref="J3"  Part="1" 
F 0 "J3" H 8650 3750 50  0000 C CNN
F 1 "Debug USB" H 8650 3650 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 8800 3200 50  0001 C CNN
F 3 "" H 8800 3200 50  0001 C CNN
	1    8650 3250
	1    0    0    -1  
$EndComp
NoConn ~ 8550 3650
Wire Wire Line
	8950 3350 9050 3350
Text GLabel 10450 3500 2    50   BiDi ~ 0
DBG_USBD-
Text GLabel 10450 3250 2    50   BiDi ~ 0
DBG_USBD+
$Comp
L Device:R R?
U 1 1 60F823D4
P 10200 3500
AR Path="/6014B4D9/60F823D4" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/60F823D4" Ref="R?"  Part="1" 
AR Path="/60F823D4" Ref="R5"  Part="1" 
F 0 "R5" V 10300 3500 50  0000 C CNN
F 1 "27" V 10200 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 10130 3500 50  0001 C CNN
F 3 "~" H 10200 3500 50  0001 C CNN
	1    10200 3500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 60F823DA
P 10200 3250
AR Path="/6014B4D9/60F823DA" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/60F823DA" Ref="R?"  Part="1" 
AR Path="/60F823DA" Ref="R4"  Part="1" 
F 0 "R4" V 10300 3250 50  0000 C CNN
F 1 "27" V 10200 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 10130 3250 50  0001 C CNN
F 3 "~" H 10200 3250 50  0001 C CNN
	1    10200 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10350 3500 10450 3500
Wire Wire Line
	10350 3250 10450 3250
Wire Wire Line
	9050 3350 9050 3500
$Comp
L Device:C_Small C?
U 1 1 60F823E3
P 9500 3700
AR Path="/6014B4D9/60F823E3" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/60F823E3" Ref="C?"  Part="1" 
AR Path="/60F823E3" Ref="C9"  Part="1" 
F 0 "C9" H 9592 3746 50  0000 L CNN
F 1 "47pF" H 9592 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 9500 3700 50  0001 C CNN
F 3 "~" H 9500 3700 50  0001 C CNN
	1    9500 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60F823E9
P 9850 3700
AR Path="/6014B4D9/60F823E9" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/60F823E9" Ref="C?"  Part="1" 
AR Path="/60F823E9" Ref="C10"  Part="1" 
F 0 "C10" H 9942 3746 50  0000 L CNN
F 1 "47pF" H 9942 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 9850 3700 50  0001 C CNN
F 3 "~" H 9850 3700 50  0001 C CNN
	1    9850 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 3250 9500 3250
Wire Wire Line
	9050 3500 9850 3500
Text GLabel 10450 3900 2    50   Input ~ 0
GND
Wire Wire Line
	9500 3600 9500 3250
Connection ~ 9500 3250
Wire Wire Line
	9500 3250 10050 3250
Wire Wire Line
	9500 3800 9500 3900
Wire Wire Line
	9850 3900 9850 3800
Wire Wire Line
	9850 3600 9850 3500
Connection ~ 9850 3500
Wire Wire Line
	9850 3500 10050 3500
Wire Wire Line
	10450 3900 9850 3900
Connection ~ 9500 3900
Connection ~ 9850 3900
Wire Wire Line
	9850 3900 9500 3900
Wire Wire Line
	8650 3650 8650 3900
Wire Wire Line
	8650 3900 9150 3900
Text GLabel 10450 3050 2    50   Input ~ 0
+5V
Wire Wire Line
	8950 3050 9150 3050
$Comp
L Device:Ferrite_Bead_Small FB?
U 1 1 60F82417
P 9600 3050
AR Path="/6014B4D9/60F82417" Ref="FB?"  Part="1" 
AR Path="/5F8F4E1E/60F82417" Ref="FB?"  Part="1" 
AR Path="/60F82417" Ref="FB1"  Part="1" 
F 0 "FB1" V 9363 3050 50  0000 C CNN
F 1 "FB" V 9454 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 9530 3050 50  0001 C CNN
F 3 "~" H 9600 3050 50  0001 C CNN
	1    9600 3050
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60F8241D
P 9150 3700
AR Path="/6014B4D9/60F8241D" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/60F8241D" Ref="C?"  Part="1" 
AR Path="/60F8241D" Ref="C8"  Part="1" 
F 0 "C8" H 9242 3746 50  0000 L CNN
F 1 "10nF" H 9242 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 9150 3700 50  0001 C CNN
F 3 "~" H 9150 3700 50  0001 C CNN
	1    9150 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3800 9150 3900
Connection ~ 9150 3900
Wire Wire Line
	9150 3900 9500 3900
Wire Wire Line
	9150 3600 9150 3050
Connection ~ 9150 3050
Wire Wire Line
	9150 3050 9500 3050
Wire Wire Line
	9700 3050 10450 3050
Wire Wire Line
	2000 5050 2100 5050
Connection ~ 2200 850 
Wire Wire Line
	2000 850  2100 850 
Wire Wire Line
	1700 850  1800 850 
Text GLabel 1700 850  0    50   Input ~ 0
GND
$Comp
L Device:C_Small C1
U 1 1 5FB3967F
P 1900 850
F 0 "C1" V 1671 850 50  0000 C CNN
F 1 "0,1uF" V 1762 850 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1900 850 50  0001 C CNN
F 3 "~" H 1900 850 50  0001 C CNN
	1    1900 850 
	0    1    1    0   
$EndComp
Text GLabel 3300 2750 2    50   Input ~ 0
d[0..7]
$Comp
L MCU_Microchip_ATmega:ATmega644PA-PU U2
U 1 1 5F942C1A
P 2100 2950
F 0 "U2" H 2100 3050 50  0000 C CNN
F 1 "ATmega644PA-PU" H 2100 2950 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 2100 2950 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8272-8-bit-AVR-microcontroller-ATmega164A_PA-324A_PA-644A_PA-1284_P_datasheet.pdf" H 2100 2950 50  0001 C CNN
	1    2100 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  1650 650  1800
Connection ~ 650  1650
Wire Wire Line
	650  1450 650  1650
Wire Wire Line
	2100 850  2100 950 
Connection ~ 2100 850 
Wire Wire Line
	2200 850  2200 950 
Wire Wire Line
	2100 850  2200 850 
Wire Wire Line
	2300 850  2200 850 
Text GLabel 2300 850  2    50   Input ~ 0
+5V
Wire Wire Line
	2100 5050 2100 4950
Text GLabel 2000 5050 0    50   Input ~ 0
GND
Wire Wire Line
	2700 3950 2800 3950
Wire Wire Line
	2700 4050 2800 4050
Wire Wire Line
	2700 4150 2800 4150
Wire Wire Line
	2700 4250 2800 4250
Wire Wire Line
	2700 4350 2800 4350
Wire Wire Line
	2700 4450 2800 4450
Wire Wire Line
	2950 4550 2950 4750
Wire Wire Line
	2700 4550 2950 4550
Wire Wire Line
	2800 4650 2700 4650
Wire Wire Line
	2800 4750 2800 4650
Text GLabel 2950 4750 3    50   BiDi ~ 0
R~W
Text GLabel 2800 4750 3    50   Input ~ 0
SYNC
Text GLabel 2800 4450 2    50   Output ~ 0
DBG_CLK
Text GLabel 2800 4350 2    50   Output ~ 0
SR_OUT
Text GLabel 2800 4250 2    50   Output ~ 0
SR_CLK
Text GLabel 2800 4150 2    50   Output ~ 0
SR_DAT
Text GLabel 2800 4050 2    50   Output ~ 0
DBG_TxD
Text GLabel 2800 3950 2    50   Input ~ 0
DBG_RxD
Entry Wire Line
	3100 2550 3200 2650
Entry Wire Line
	3100 2450 3200 2550
Entry Wire Line
	3100 2350 3200 2450
Entry Wire Line
	3100 2250 3200 2350
Entry Wire Line
	3100 2150 3200 2250
Wire Wire Line
	2700 2550 3100 2550
Wire Wire Line
	2700 2450 3100 2450
Wire Wire Line
	2700 2350 3100 2350
Wire Wire Line
	2700 2250 3100 2250
Wire Wire Line
	2700 2150 3100 2150
Text Label 3100 2550 2    50   ~ 0
d4
Text Label 3100 2450 2    50   ~ 0
d3
Text Label 3100 2350 2    50   ~ 0
d2
Text Label 3100 2250 2    50   ~ 0
d1
Text Label 3100 2150 2    50   ~ 0
d0
Wire Wire Line
	1400 1250 1500 1250
Text GLabel 1400 1250 0    50   Input ~ 0
~RES
Wire Wire Line
	1400 1850 1500 1850
Wire Wire Line
	1100 1850 1200 1850
Wire Wire Line
	1100 1950 1100 1850
Text GLabel 1100 1950 3    50   Input ~ 0
GND
$Comp
L Device:C_Small C5
U 1 1 5F942BA9
P 1300 1850
F 0 "C5" V 1150 1850 50  0000 C CNN
F 1 "0,1uF" V 1050 1850 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1300 1850 50  0001 C CNN
F 3 "~" H 1300 1850 50  0001 C CNN
	1    1300 1850
	0    -1   -1   0   
$EndComp
Connection ~ 1100 1650
Wire Wire Line
	1100 1650 1500 1650
Connection ~ 1100 1450
Wire Wire Line
	1100 1450 1500 1450
Wire Wire Line
	950  1450 1100 1450
Wire Wire Line
	950  1650 1100 1650
Wire Wire Line
	650  1450 750  1450
Wire Wire Line
	650  1650 750  1650
Text GLabel 650  1800 3    50   Input ~ 0
GND
$Comp
L Device:C_Small C4
U 1 1 5F942B9A
P 850 1650
F 0 "C4" V 700 1650 50  0000 C CNN
F 1 "22pF" V 600 1650 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 850 1650 50  0001 C CNN
F 3 "~" H 850 1650 50  0001 C CNN
	1    850  1650
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5F942B94
P 850 1450
F 0 "C3" V 1079 1450 50  0000 C CNN
F 1 "22pF" V 988 1450 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 850 1450 50  0001 C CNN
F 3 "~" H 850 1450 50  0001 C CNN
	1    850  1450
	0    -1   -1   0   
$EndComp
$Comp
L Device:Crystal_Small Y1
U 1 1 5F942B8E
P 1100 1550
F 0 "Y1" V 1054 1638 50  0000 L CNN
F 1 "20MHz" V 1145 1638 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 1100 1550 50  0001 C CNN
F 3 "~" H 1100 1550 50  0001 C CNN
	1    1100 1550
	0    1    1    0   
$EndComp
Text GLabel 3650 3950 3    50   Input ~ 0
a[0..15]
Entry Wire Line
	3550 3750 3650 3850
Entry Wire Line
	3550 3650 3650 3750
Entry Wire Line
	3550 3550 3650 3650
Entry Wire Line
	3550 3450 3650 3550
Entry Wire Line
	3550 3350 3650 3450
Entry Wire Line
	3550 3250 3650 3350
Entry Wire Line
	3550 3150 3650 3250
Entry Wire Line
	3550 3050 3650 3150
Wire Wire Line
	2700 3750 3550 3750
Wire Wire Line
	2700 3650 3550 3650
Wire Wire Line
	2700 3550 3550 3550
Wire Wire Line
	2700 3450 3550 3450
Wire Wire Line
	2700 3350 3550 3350
Wire Wire Line
	2700 3250 3550 3250
Wire Wire Line
	2700 3150 3550 3150
Wire Wire Line
	2700 3050 3550 3050
Text Label 3550 3750 2    50   ~ 0
a15
Text Label 3550 3650 2    50   ~ 0
a14
Text Label 3550 3550 2    50   ~ 0
a13
Text Label 3550 3450 2    50   ~ 0
a12
Text Label 3550 3350 2    50   ~ 0
a11
Text Label 3550 3250 2    50   ~ 0
a10
Text Label 3550 3150 2    50   ~ 0
a9
Text Label 3550 3050 2    50   ~ 0
a8
Entry Wire Line
	3550 1950 3650 2050
Entry Wire Line
	3550 1850 3650 1950
Entry Wire Line
	3550 1750 3650 1850
Entry Wire Line
	3550 1650 3650 1750
Entry Wire Line
	3550 1550 3650 1650
Entry Wire Line
	3550 1450 3650 1550
Entry Wire Line
	3550 1350 3650 1450
Entry Wire Line
	3550 1250 3650 1350
Wire Wire Line
	2700 1950 3550 1950
Wire Wire Line
	2700 1850 3550 1850
Wire Wire Line
	2700 1750 3550 1750
Wire Wire Line
	2700 1650 3550 1650
Wire Wire Line
	2700 1550 3550 1550
Wire Wire Line
	2700 1450 3550 1450
Wire Wire Line
	2700 1350 3550 1350
Wire Wire Line
	2700 1250 3550 1250
Text Label 3550 1950 2    50   ~ 0
a7
Text Label 3550 1850 2    50   ~ 0
a6
Text Label 3550 1750 2    50   ~ 0
a5
Text Label 3550 1650 2    50   ~ 0
a4
Text Label 3550 1550 2    50   ~ 0
a3
Text Label 3550 1450 2    50   ~ 0
a2
Text Label 3550 1350 2    50   ~ 0
a1
Text Label 3550 1250 2    50   ~ 0
a0
Wire Wire Line
	5350 3500 5450 3500
Wire Wire Line
	5350 3600 5450 3600
Wire Wire Line
	5350 3700 5450 3700
Text GLabel 5450 3700 2    50   Output ~ 0
SR_QG
Text GLabel 5450 3600 2    50   Output ~ 0
SR_QF
Text GLabel 5450 3500 2    50   Output ~ 0
SR_QE
Wire Wire Line
	4450 4000 4450 3700
Connection ~ 4450 4000
Wire Wire Line
	4350 4000 4450 4000
Wire Wire Line
	4500 3400 4550 3400
Wire Wire Line
	4500 3450 4500 3400
Wire Wire Line
	4450 3450 4500 3450
Text GLabel 4450 3450 0    50   Input ~ 0
~RES
Wire Wire Line
	5750 3300 5750 3000
Wire Wire Line
	5350 3300 5750 3300
Wire Wire Line
	5600 3200 5600 3000
Wire Wire Line
	5350 3200 5600 3200
Wire Wire Line
	5350 3100 5450 3100
Wire Wire Line
	5450 3100 5450 3000
Wire Wire Line
	4950 2800 4950 2900
Connection ~ 4950 2800
Wire Wire Line
	4850 2800 4950 2800
Wire Wire Line
	4550 2800 4650 2800
Text GLabel 4550 2800 0    50   Input ~ 0
GND
$Comp
L Device:C_Small C7
U 1 1 5FB5019A
P 4750 2800
F 0 "C7" V 4521 2800 50  0000 C CNN
F 1 "0,1uF" V 4612 2800 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4750 2800 50  0001 C CNN
F 3 "~" H 4750 2800 50  0001 C CNN
	1    4750 2800
	0    1    1    0   
$EndComp
NoConn ~ 5350 4000
Wire Wire Line
	4450 3600 4550 3600
Text GLabel 4450 3600 0    50   Input ~ 0
SR_LATCH
Wire Wire Line
	4450 3300 4550 3300
Wire Wire Line
	5350 3800 5450 3800
Text GLabel 5450 3800 2    50   Output ~ 0
DBG_RES
Text GLabel 5750 3000 1    50   Output ~ 0
DBG_WAIT
Text GLabel 5600 3000 1    50   Output ~ 0
~DBG_BE
Text GLabel 5450 3000 1    50   Output ~ 0
CLKSEL
Wire Wire Line
	5050 2800 4950 2800
Text GLabel 5050 2800 2    50   Input ~ 0
+5V
Wire Wire Line
	4950 4300 4950 4200
Wire Wire Line
	4450 3700 4550 3700
Wire Wire Line
	4450 4300 4450 4000
Wire Wire Line
	4950 4300 4450 4300
Text GLabel 4350 4000 0    50   Input ~ 0
GND
Text GLabel 4450 3300 0    50   Input ~ 0
SR_CLK
Wire Wire Line
	4450 3100 4550 3100
Text GLabel 4450 3100 0    50   Input ~ 0
SR_DAT
$Comp
L 74xx:74HC595 U3
U 1 1 5F9C2188
P 4950 3500
F 0 "U3" H 4950 3500 50  0000 C CNN
F 1 "74HC595" H 4900 3200 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 4950 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 4950 3500 50  0001 C CNN
	1    4950 3500
	1    0    0    -1  
$EndComp
Wire Bus Line
	3200 2750 3300 2750
$Comp
L 4xxx:4066 U5
U 1 1 6128B06E
P 9700 5200
F 0 "U5" H 9700 5027 50  0000 C CNN
F 1 "4066" H 9700 4936 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 9700 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd4066b.pdf" H 9700 5200 50  0001 C CNN
	1    9700 5200
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4066 U5
U 2 1 6129530E
P 10700 5200
F 0 "U5" H 10700 5027 50  0000 C CNN
F 1 "4066" H 10700 4936 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10700 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd4066b.pdf" H 10700 5200 50  0001 C CNN
	2    10700 5200
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4066 U5
U 3 1 612992DD
P 9700 6050
F 0 "U5" H 9700 5877 50  0000 C CNN
F 1 "4066" H 9700 5786 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 9700 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd4066b.pdf" H 9700 6050 50  0001 C CNN
	3    9700 6050
	1    0    0    -1  
$EndComp
Text Label 10000 5200 0    50   ~ 0
d6
Text Label 11000 5200 0    50   ~ 0
d5
Text Label 10000 6050 0    50   ~ 0
d7
Text GLabel 10600 4800 0    50   Input ~ 0
~RES
Wire Wire Line
	10600 4800 10700 4800
Wire Wire Line
	10700 4800 10700 4900
Text GLabel 9600 4800 0    50   Input ~ 0
~RES
Wire Wire Line
	9600 4800 9700 4800
Wire Wire Line
	9700 4800 9700 4900
Text GLabel 9600 5650 0    50   Input ~ 0
~RES
Wire Wire Line
	9600 5650 9700 5650
Wire Wire Line
	9700 5650 9700 5750
$Comp
L 4xxx:4066 U5
U 4 1 612F1F90
P 10700 6050
F 0 "U5" H 10700 5877 50  0000 C CNN
F 1 "4066" H 10700 5786 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10700 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd4066b.pdf" H 10700 6050 50  0001 C CNN
	4    10700 6050
	1    0    0    -1  
$EndComp
Text GLabel 10600 5650 0    50   Input ~ 0
GND
Wire Wire Line
	10600 5650 10700 5650
Wire Wire Line
	10700 5650 10700 5750
NoConn ~ 10400 6050
NoConn ~ 11000 6050
$Comp
L 4xxx:4066 U5
U 5 1 61454493
P 3300 7000
F 0 "U5" H 3530 7046 50  0000 L CNN
F 1 "4066" H 3530 6955 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3300 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd4066b.pdf" H 3300 7000 50  0001 C CNN
	5    3300 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 61456ED1
P 2750 7000
F 0 "C13" H 2842 7046 50  0000 L CNN
F 1 "0,1uF" H 2842 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 2750 7000 50  0001 C CNN
F 3 "~" H 2750 7000 50  0001 C CNN
	1    2750 7000
	1    0    0    -1  
$EndComp
Text GLabel 3400 7600 2    50   Input ~ 0
GND
Text GLabel 3400 6400 2    50   Input ~ 0
+5V
Wire Wire Line
	3400 6400 3300 6400
Wire Wire Line
	3300 6400 3300 6500
Wire Wire Line
	3300 6400 2750 6400
Wire Wire Line
	2750 6400 2750 6900
Connection ~ 3300 6400
Wire Wire Line
	2750 7100 2750 7600
Wire Wire Line
	2750 7600 3300 7600
Wire Wire Line
	3300 7500 3300 7600
Connection ~ 3300 7600
Wire Wire Line
	3300 7600 3400 7600
Text GLabel 2800 2650 2    50   Input ~ 0
MOSI
Text GLabel 2800 2750 2    50   Output ~ 0
MISO
Text GLabel 2800 2850 2    50   Input ~ 0
SCK
Wire Wire Line
	2700 2650 2800 2650
Wire Wire Line
	2700 2750 2800 2750
Wire Wire Line
	2700 2850 2800 2850
Text GLabel 10300 5100 1    50   Output ~ 0
MOSI
Wire Wire Line
	10300 5100 10300 5200
Wire Wire Line
	10300 5200 10400 5200
Text GLabel 9300 5100 1    50   Input ~ 0
MISO
Wire Wire Line
	9300 5100 9300 5200
Wire Wire Line
	9300 5200 9400 5200
Text GLabel 9300 5950 1    50   Output ~ 0
SCK
Wire Wire Line
	9300 5950 9300 6050
Wire Wire Line
	9300 6050 9400 6050
$Comp
L Connector:AVR-ISP-6 J?
U 1 1 613A5886
P 4400 1550
AR Path="/6014B4D9/613A5886" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/613A5886" Ref="J?"  Part="1" 
AR Path="/613A5886" Ref="J1"  Part="1" 
F 0 "J1" H 4300 1650 50  0000 C CNN
F 1 "AVR ISP" H 4300 1550 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 4150 1600 50  0001 C CNN
F 3 " ~" H 3125 1000 50  0001 C CNN
	1    4400 1550
	1    0    0    -1  
$EndComp
Text GLabel 4400 2050 2    50   Input ~ 0
GND
Text GLabel 5000 1650 2    50   Output ~ 0
~ISP_RES
Wire Wire Line
	4300 1950 4300 2050
Wire Wire Line
	4400 2050 4300 2050
Wire Wire Line
	4900 1650 5000 1650
Text GLabel 5000 1250 1    50   Output ~ 0
MOSI
Text GLabel 4900 1250 1    50   Input ~ 0
MISO
Text GLabel 5100 1250 1    50   Output ~ 0
SCK
Wire Wire Line
	4800 1550 5100 1550
Wire Wire Line
	4800 1450 5000 1450
Wire Wire Line
	4800 1350 4900 1350
Wire Wire Line
	4900 1350 4900 1250
Wire Wire Line
	5000 1450 5000 1250
Wire Wire Line
	5100 1550 5100 1250
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 613CAA44
P 3000 5800
AR Path="/6014B4D9/613CAA44" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/613CAA44" Ref="J?"  Part="1" 
AR Path="/613CAA44" Ref="J4"  Part="1" 
F 0 "J4" H 3100 6250 50  0000 C CNN
F 1 "Debug UART" H 3100 6150 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 3000 5800 50  0001 C CNN
F 3 "~" H 3000 5800 50  0001 C CNN
	1    3000 5800
	1    0    0    -1  
$EndComp
Text GLabel 3300 5600 2    50   Input ~ 0
GND
Wire Wire Line
	3300 5600 3250 5600
Wire Wire Line
	3200 5700 3250 5700
Wire Wire Line
	3250 5700 3250 5600
Connection ~ 3250 5600
Wire Wire Line
	3250 5600 3200 5600
NoConn ~ 3200 6100
Wire Wire Line
	3300 5900 3200 5900
Wire Wire Line
	3300 6000 3200 6000
Text GLabel 3300 6000 2    50   Input ~ 0
DBG_TxD
Text GLabel 3300 5900 2    50   Output ~ 0
DBG_RxD
NoConn ~ 3200 5800
Text GLabel 4400 950  2    50   Input ~ 0
+5V
Wire Wire Line
	4400 950  4300 950 
Wire Wire Line
	4300 950  4300 1050
$Comp
L Device:R R?
U 1 1 6148B818
P 5150 1850
AR Path="/6014B4D9/6148B818" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/6148B818" Ref="R?"  Part="1" 
AR Path="/5F910E81/6148B818" Ref="R?"  Part="1" 
AR Path="/6148B818" Ref="R1"  Part="1" 
F 0 "R1" V 5250 1850 50  0000 C CNN
F 1 "4K7" V 5150 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 5080 1850 50  0001 C CNN
F 3 "~" H 5150 1850 50  0001 C CNN
	1    5150 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 1850 4900 1850
Wire Wire Line
	4900 1850 4900 1650
Wire Wire Line
	4900 1650 4800 1650
Connection ~ 4900 1650
Text GLabel 5400 1850 2    50   Input ~ 0
+5V
Wire Wire Line
	5400 1850 5300 1850
$Comp
L Device:R R?
U 1 1 614FFA9F
P 4550 5350
AR Path="/6014B4D9/614FFA9F" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/614FFA9F" Ref="R?"  Part="1" 
AR Path="/5F910E81/614FFA9F" Ref="R?"  Part="1" 
AR Path="/614FFA9F" Ref="R6"  Part="1" 
F 0 "R6" V 4650 5350 50  0000 C CNN
F 1 "4K7" V 4550 5350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 4480 5350 50  0001 C CNN
F 3 "~" H 4550 5350 50  0001 C CNN
	1    4550 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 5350 4850 5350
Wire Wire Line
	4850 5350 4850 5550
Connection ~ 4850 5550
Wire Wire Line
	4850 5550 4950 5550
Text GLabel 4300 5350 0    50   Input ~ 0
+5V
Wire Wire Line
	4300 5350 4400 5350
$Comp
L 74xx:74LS04 U?
U 5 1 6156378B
P 7400 5700
AR Path="/5F8F4E1E/6156378B" Ref="U?"  Part="5" 
AR Path="/6156378B" Ref="U6"  Part="5" 
F 0 "U6" H 7400 6017 50  0000 C CNN
F 1 "74AC04" H 7400 5926 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7400 5700 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 7400 5700 50  0001 C CNN
	5    7400 5700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U?
U 4 1 61563792
P 5850 7400
AR Path="/5F8F4E1E/61563792" Ref="U?"  Part="3" 
AR Path="/61563792" Ref="U4"  Part="4" 
AR Path="/5F910E81/61563792" Ref="U?"  Part="3" 
F 0 "U4" H 5850 7725 50  0000 C CNN
F 1 "74AC08" H 5850 7634 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5850 7400 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 5850 7400 50  0001 C CNN
	4    5850 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 5700 7100 5700
NoConn ~ 5000 7400
Text GLabel 5450 7500 0    50   Input ~ 0
GND
Wire Wire Line
	5450 7500 5550 7500
Text GLabel 5450 7300 0    50   Input ~ 0
GND
Wire Wire Line
	5450 7300 5550 7300
NoConn ~ 6150 7400
Text GLabel 5650 6200 2    50   Output ~ 0
DBG_BE
$Comp
L Connector_Generic:Conn_02x32_Odd_Even J2
U 1 1 61A291FE
P 6850 2650
F 0 "J2" H 6900 4367 50  0000 C CNN
F 1 "Supervisor port" H 6900 4276 50  0000 C CNN
F 2 "" H 6850 2650 50  0001 C CNN
F 3 "~" H 6850 2650 50  0001 C CNN
	1    6850 2650
	1    0    0    -1  
$EndComp
Text GLabel 6550 1150 0    50   Input ~ 0
+5V
Wire Wire Line
	6550 1150 6650 1150
Text GLabel 7250 1150 2    50   Input ~ 0
+5V
Wire Wire Line
	7250 1150 7150 1150
Text GLabel 6550 1250 0    50   Input ~ 0
GND
Wire Wire Line
	6550 1250 6650 1250
Text GLabel 7250 1250 2    50   Input ~ 0
GND
Wire Wire Line
	7250 1250 7150 1250
Text Label 6200 1350 0    50   ~ 0
a0
Text Label 6200 1450 0    50   ~ 0
a1
Text Label 6200 1550 0    50   ~ 0
a2
Text Label 6200 1650 0    50   ~ 0
a3
Text Label 6200 1750 0    50   ~ 0
a4
Text Label 6200 1850 0    50   ~ 0
a5
Text Label 6200 1950 0    50   ~ 0
a6
Text Label 6200 2050 0    50   ~ 0
a7
Text Label 6200 2150 0    50   ~ 0
a8
Text Label 6200 2250 0    50   ~ 0
a9
Text Label 6200 2350 0    50   ~ 0
a10
Text Label 6200 2450 0    50   ~ 0
a11
Text Label 6200 2550 0    50   ~ 0
a12
Text Label 6200 2650 0    50   ~ 0
a13
Text Label 6200 2750 0    50   ~ 0
a14
Text Label 6200 2850 0    50   ~ 0
a15
Text Label 7600 1350 2    50   ~ 0
d0
Text Label 7600 1450 2    50   ~ 0
d1
Text Label 7600 1550 2    50   ~ 0
d2
Text Label 7600 1650 2    50   ~ 0
d3
Text Label 7600 1750 2    50   ~ 0
d4
Text Label 7600 1850 2    50   ~ 0
d5
Text Label 7600 1950 2    50   ~ 0
d6
Text Label 7600 2050 2    50   ~ 0
d7
Wire Wire Line
	6200 1350 6650 1350
Wire Wire Line
	6200 1450 6650 1450
Wire Wire Line
	6200 1550 6650 1550
Wire Wire Line
	6200 1650 6650 1650
Wire Wire Line
	6200 1750 6650 1750
Wire Wire Line
	6200 1850 6650 1850
Wire Wire Line
	6200 1950 6650 1950
Wire Wire Line
	6200 2050 6650 2050
Wire Wire Line
	6200 2150 6650 2150
Wire Wire Line
	6200 2250 6650 2250
Wire Wire Line
	6200 2350 6650 2350
Wire Wire Line
	6200 2450 6650 2450
Wire Wire Line
	6200 2550 6650 2550
Wire Wire Line
	6200 2650 6650 2650
Wire Wire Line
	6200 2750 6650 2750
Wire Wire Line
	6200 2850 6650 2850
Wire Wire Line
	7150 1350 7600 1350
Wire Wire Line
	7150 1450 7600 1450
Wire Wire Line
	7150 1550 7600 1550
Wire Wire Line
	7150 1650 7600 1650
Wire Wire Line
	7150 1750 7600 1750
Wire Wire Line
	7150 1850 7600 1850
Wire Wire Line
	7150 1950 7600 1950
Wire Wire Line
	7150 2050 7600 2050
Text GLabel 8300 2950 3    50   Output ~ 0
~EXT_RES
Text GLabel 8000 2950 3    50   Input ~ 0
DBG_BE
Text GLabel 8150 2950 3    50   Input ~ 0
~DBG_RES
Wire Wire Line
	7150 2150 8300 2150
Wire Wire Line
	8300 2150 8300 2950
Wire Wire Line
	7150 2250 8150 2250
Wire Wire Line
	8150 2250 8150 2950
Wire Wire Line
	7150 2350 8000 2350
Wire Wire Line
	8000 2350 8000 2950
NoConn ~ 7150 2450
Text GLabel 7000 5700 0    50   Input ~ 0
CLKSEL
Text GLabel 7800 5700 2    50   Output ~ 0
~CLKSEL
Wire Wire Line
	7700 5700 7800 5700
Text GLabel 7850 2950 3    50   Input ~ 0
~CLKSEL
Wire Wire Line
	7850 2950 7850 2550
Wire Wire Line
	7850 2550 7150 2550
Text GLabel 7700 2950 3    50   Input ~ 0
DBG_CLK
Wire Wire Line
	7700 2950 7700 2650
Wire Wire Line
	7700 2650 7150 2650
Entry Wire Line
	6100 1250 6200 1350
Entry Wire Line
	6100 1350 6200 1450
Entry Wire Line
	6100 1450 6200 1550
Entry Wire Line
	6100 1550 6200 1650
Entry Wire Line
	6100 1650 6200 1750
Entry Wire Line
	6100 1750 6200 1850
Entry Wire Line
	6100 1850 6200 1950
Entry Wire Line
	6100 1950 6200 2050
Entry Wire Line
	6100 2050 6200 2150
Entry Wire Line
	6100 2150 6200 2250
Entry Wire Line
	6100 2250 6200 2350
Entry Wire Line
	6100 2350 6200 2450
Entry Wire Line
	6100 2450 6200 2550
Entry Wire Line
	6100 2550 6200 2650
Entry Wire Line
	6100 2650 6200 2750
Entry Wire Line
	6100 2750 6200 2850
Entry Wire Line
	7600 1350 7700 1250
Entry Wire Line
	7700 1350 7600 1450
Entry Wire Line
	7700 1450 7600 1550
Entry Wire Line
	7700 1550 7600 1650
Entry Wire Line
	7700 1650 7600 1750
Entry Wire Line
	7700 1750 7600 1850
Entry Wire Line
	7700 1850 7600 1950
Entry Wire Line
	7700 1950 7600 2050
Text GLabel 7550 2950 3    50   BiDi ~ 0
R~W
Wire Wire Line
	7550 2950 7550 2750
Wire Wire Line
	7550 2750 7150 2750
Text GLabel 7400 2950 3    50   Output ~ 0
SYNC
Wire Wire Line
	7400 2950 7400 2850
Wire Wire Line
	7400 2850 7150 2850
NoConn ~ 6650 2950
NoConn ~ 6650 3050
NoConn ~ 6650 3150
NoConn ~ 6650 3250
NoConn ~ 6650 3350
NoConn ~ 6650 3450
NoConn ~ 6650 3550
NoConn ~ 6650 3650
NoConn ~ 6650 3750
NoConn ~ 6650 3850
NoConn ~ 6650 3950
NoConn ~ 6650 4050
NoConn ~ 6650 4150
NoConn ~ 6650 4250
NoConn ~ 7150 4250
NoConn ~ 7150 4150
NoConn ~ 7150 4050
NoConn ~ 7150 3950
NoConn ~ 7150 3850
NoConn ~ 7150 3750
NoConn ~ 7150 3650
NoConn ~ 7150 3550
NoConn ~ 7150 3450
NoConn ~ 7150 3350
NoConn ~ 7150 3250
NoConn ~ 7150 3150
NoConn ~ 7150 3050
Wire Bus Line
	3200 2250 3200 2750
Wire Bus Line
	7700 1250 7700 1950
Wire Bus Line
	6100 1250 6100 2750
Wire Bus Line
	3650 1350 3650 3950
$EndSCHEMATC
