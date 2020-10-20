EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title "DB6502 Hobby Computer Version 2"
Date "2020-10-13"
Rev "v003"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Open Source Hardware"
Comment4 "Author: Dawid Buchwald"
$EndDescr
$Comp
L 6502:SC26C92 U17
U 1 1 5F92CA23
P 2400 2050
F 0 "U17" H 2400 2100 50  0000 C CNN
F 1 "SC26C92" H 2400 2000 50  0000 C CNN
F 2 "" H 2400 2050 50  0001 C CNN
F 3 "" H 2400 2050 50  0001 C CNN
	1    2400 2050
	1    0    0    -1  
$EndComp
Text GLabel 1050 1550 1    50   Input ~ 0
~WE
Wire Wire Line
	1050 1550 1050 1750
Wire Wire Line
	1050 1750 1600 1750
Text GLabel 900  1550 1    50   Input ~ 0
~OE
Wire Wire Line
	900  1550 900  1850
Wire Wire Line
	900  1850 1600 1850
Text Label 1450 1550 0    50   ~ 0
a3
Text Label 1900 1100 3    50   ~ 0
a2
Text Label 2100 1100 3    50   ~ 0
a1
Text Label 2300 1100 3    50   ~ 0
a0
NoConn ~ 2000 1250
NoConn ~ 2200 1250
Text GLabel 2500 950  1    50   Input ~ 0
+5V
Wire Wire Line
	1600 1550 1450 1550
Wire Wire Line
	1900 1250 1900 1100
Wire Wire Line
	2100 1250 2100 1100
Wire Wire Line
	2300 1250 2300 1100
Entry Wire Line
	1350 1450 1450 1550
Entry Wire Line
	1800 1000 1900 1100
Entry Wire Line
	2000 1000 2100 1100
Entry Wire Line
	2200 1000 2300 1100
Wire Bus Line
	1350 1450 1350 1000
Wire Bus Line
	1250 1000 1350 1000
Connection ~ 1350 1000
Text GLabel 1250 1000 0    50   Input ~ 0
a[0..15]
Wire Wire Line
	2500 950  2500 1050
$Comp
L Device:C_Small C24
U 1 1 5F932BB1
P 2700 1050
F 0 "C24" V 2471 1050 50  0000 C CNN
F 1 "0,1uF" V 2562 1050 50  0000 C CNN
F 2 "" H 2700 1050 50  0001 C CNN
F 3 "~" H 2700 1050 50  0001 C CNN
	1    2700 1050
	0    1    1    0   
$EndComp
Text GLabel 2900 1050 2    50   Input ~ 0
GND
Wire Wire Line
	2500 1050 2600 1050
Connection ~ 2500 1050
Wire Wire Line
	2500 1050 2500 1250
Wire Wire Line
	2800 1050 2900 1050
NoConn ~ 2600 1250
NoConn ~ 2700 1250
NoConn ~ 2800 1250
NoConn ~ 2900 1250
Text GLabel 3300 1650 2    50   Input ~ 0
UART_RES
Text GLabel 3300 1500 2    50   Input ~ 0
~UART_CS
Wire Wire Line
	3200 1650 3300 1650
Wire Wire Line
	3200 1550 3250 1550
Wire Wire Line
	3250 1550 3250 1500
Wire Wire Line
	3250 1500 3300 1500
Text GLabel 3300 1950 2    50   Input ~ 0
UART_A_RxD
Text GLabel 3300 2150 2    50   Output ~ 0
UART_A_TxD
Wire Wire Line
	3200 1950 3300 1950
Wire Wire Line
	3200 2150 3300 2150
Text Label 1900 3250 1    50   ~ 0
d1
Text Label 2000 3250 1    50   ~ 0
d3
Text Label 2100 3250 1    50   ~ 0
d5
Text Label 2200 3250 1    50   ~ 0
d7
Text Label 2600 3250 1    50   ~ 0
d6
Text Label 2700 3250 1    50   ~ 0
d4
Text Label 2800 3250 1    50   ~ 0
d2
Text Label 2900 3250 1    50   ~ 0
d0
Wire Wire Line
	1900 2850 1900 3250
Wire Wire Line
	2000 2850 2000 3250
Wire Wire Line
	2100 2850 2100 3250
Wire Wire Line
	2200 2850 2200 3250
Wire Wire Line
	2600 2850 2600 3250
Wire Wire Line
	2700 2850 2700 3250
Wire Wire Line
	2800 2850 2800 3250
Wire Wire Line
	2900 2850 2900 3250
Entry Wire Line
	1800 3350 1900 3250
Entry Wire Line
	1900 3350 2000 3250
Entry Wire Line
	2000 3350 2100 3250
Entry Wire Line
	2100 3350 2200 3250
Entry Wire Line
	2500 3350 2600 3250
Entry Wire Line
	2600 3350 2700 3250
Entry Wire Line
	2700 3350 2800 3250
Entry Wire Line
	2800 3350 2900 3250
Text GLabel 1700 3350 0    50   Input ~ 0
d[0..7]
Text GLabel 1750 2950 0    50   Input ~ 0
GND
Wire Wire Line
	2300 2850 2300 2950
Wire Wire Line
	2300 2950 1750 2950
Text GLabel 1750 3100 0    50   Input ~ 0
~UART_IRQ
Wire Wire Line
	1750 3100 2500 3100
Wire Wire Line
	2500 3100 2500 2850
Text GLabel 1500 1950 0    50   Input ~ 0
UART_B_RxD
Text GLabel 1500 2150 0    50   Output ~ 0
UART_B_TxD
Wire Wire Line
	1500 1950 1600 1950
Wire Wire Line
	1500 2150 1600 2150
$Comp
L Device:Crystal_Small Y2
U 1 1 5F93DD15
P 3950 1800
F 0 "Y2" V 3904 1888 50  0000 L CNN
F 1 "3,6864MHz" V 3995 1888 50  0000 L CNN
F 2 "" H 3950 1800 50  0001 C CNN
F 3 "~" H 3950 1800 50  0001 C CNN
	1    3950 1800
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C25
U 1 1 5F93E98E
P 3950 1500
F 0 "C25" H 3858 1454 50  0000 R CNN
F 1 "22pF" H 3858 1545 50  0000 R CNN
F 2 "" H 3950 1500 50  0001 C CNN
F 3 "~" H 3950 1500 50  0001 C CNN
	1    3950 1500
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C26
U 1 1 5F93F1BF
P 3950 2100
F 0 "C26" H 3858 2054 50  0000 R CNN
F 1 "22pF" H 3858 2145 50  0000 R CNN
F 2 "" H 3950 2100 50  0001 C CNN
F 3 "~" H 3950 2100 50  0001 C CNN
	1    3950 2100
	-1   0    0    1   
$EndComp
Text GLabel 3950 2300 3    50   Input ~ 0
GND
Text GLabel 3950 1300 1    50   Input ~ 0
GND
Wire Wire Line
	3950 1300 3950 1400
Wire Wire Line
	3950 1600 3950 1650
Wire Wire Line
	3950 1900 3950 1950
Wire Wire Line
	3950 2200 3950 2300
Wire Wire Line
	3200 1850 3850 1850
Wire Wire Line
	3850 1850 3850 1950
Wire Wire Line
	3850 1950 3950 1950
Connection ~ 3950 1950
Wire Wire Line
	3950 1950 3950 2000
Wire Wire Line
	3200 1750 3850 1750
Wire Wire Line
	3850 1750 3850 1650
Wire Wire Line
	3850 1650 3950 1650
Connection ~ 3950 1650
Wire Wire Line
	3950 1650 3950 1700
$Comp
L 6502:FT230XS U?
U 1 1 5F95BFD2
P 6150 1300
AR Path="/6014B4D9/5F95BFD2" Ref="U?"  Part="1" 
AR Path="/5F8F4E1E/5F95BFD2" Ref="U?"  Part="1" 
AR Path="/5F910E81/5F95BFD2" Ref="U18"  Part="1" 
F 0 "U18" H 6150 1915 50  0000 C CNN
F 1 "FT230XS" H 6150 1824 50  0000 C CNN
F 2 "Package_SO:SSOP-16_5.3x6.2mm_P0.65mm" H 6150 1800 50  0001 C CNN
F 3 "" H 6150 1300 50  0001 C CNN
	1    6150 1300
	1    0    0    -1  
$EndComp
Text GLabel 5500 950  0    50   Output ~ 0
UART_A_RxD
Text GLabel 5500 1250 0    50   Input ~ 0
UART_A_TxD
Wire Wire Line
	5500 950  5600 950 
Text GLabel 5400 1350 0    50   Input ~ 0
GND
Text GLabel 5500 1750 0    50   BiDi ~ 0
UART_A_USBD+
Text GLabel 6800 1650 2    50   BiDi ~ 0
UART_A_USBD-
Text GLabel 6800 1250 2    50   Input ~ 0
GND
Wire Wire Line
	6700 1250 6800 1250
Wire Wire Line
	5400 1350 5500 1350
Text GLabel 6800 1350 2    50   Input ~ 0
+5V
Wire Wire Line
	6800 1350 6700 1350
Wire Wire Line
	5600 1450 5500 1450
Wire Wire Line
	5500 1450 5500 1350
Connection ~ 5500 1350
Wire Wire Line
	5500 1350 5600 1350
NoConn ~ 5600 1050
Wire Wire Line
	5500 1250 5600 1250
Wire Wire Line
	4700 1150 4700 1850
Wire Wire Line
	4700 1850 5600 1850
Wire Wire Line
	7550 1850 7550 1550
Wire Wire Line
	7550 1550 6700 1550
Wire Wire Line
	4700 1150 5600 1150
Wire Wire Line
	6700 1650 6800 1650
Wire Wire Line
	6700 1450 7550 1450
Wire Wire Line
	7550 1450 7550 1550
Connection ~ 7550 1550
$Comp
L Device:C C?
U 1 1 5F95BFF2
P 5600 2100
AR Path="/6014B4D9/5F95BFF2" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F95BFF2" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F95BFF2" Ref="C27"  Part="1" 
F 0 "C27" H 5715 2146 50  0000 L CNN
F 1 "0,1uF" H 5715 2055 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5638 1950 50  0001 C CNN
F 3 "~" H 5600 2100 50  0001 C CNN
	1    5600 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1850 5600 1950
Connection ~ 5600 1850
Wire Wire Line
	5600 1850 6050 1850
Text GLabel 5600 2350 3    50   Input ~ 0
GND
Wire Wire Line
	5600 2350 5600 2250
Text GLabel 6800 1100 2    50   Output ~ 0
~UART_A_RXLED
Text GLabel 5500 1550 0    50   Output ~ 0
~UART_A_TXLED
Wire Wire Line
	5500 1750 5550 1750
Wire Wire Line
	5550 1750 5550 1650
Wire Wire Line
	5550 1650 5600 1650
Wire Wire Line
	5500 1550 5600 1550
NoConn ~ 6700 1050
NoConn ~ 6700 950 
$Comp
L Device:R R?
U 1 1 5F95C006
P 6050 2100
AR Path="/6014B4D9/5F95C006" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F95C006" Ref="R?"  Part="1" 
AR Path="/5F910E81/5F95C006" Ref="R13"  Part="1" 
F 0 "R13" H 6120 2146 50  0000 L CNN
F 1 "220" H 6120 2055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5980 2100 50  0001 C CNN
F 3 "~" H 6050 2100 50  0001 C CNN
	1    6050 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F95C00C
P 6350 2100
AR Path="/6014B4D9/5F95C00C" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F95C00C" Ref="R?"  Part="1" 
AR Path="/5F910E81/5F95C00C" Ref="R14"  Part="1" 
F 0 "R14" H 6420 2146 50  0000 L CNN
F 1 "220" H 6420 2055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6280 2100 50  0001 C CNN
F 3 "~" H 6350 2100 50  0001 C CNN
	1    6350 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 1850 6050 1950
Connection ~ 6050 1850
Wire Wire Line
	6050 1850 6350 1850
Wire Wire Line
	6350 1850 6350 1950
Connection ~ 6350 1850
Wire Wire Line
	6350 1850 7550 1850
$Comp
L Device:LED D?
U 1 1 5F95C018
P 6600 2900
AR Path="/6014B4D9/5F95C018" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5F95C018" Ref="D?"  Part="1" 
AR Path="/5F910E81/5F95C018" Ref="D5"  Part="1" 
F 0 "D5" H 6600 2700 50  0000 C CNN
F 1 "RX" H 6600 2800 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6600 2900 50  0001 C CNN
F 3 "~" H 6600 2900 50  0001 C CNN
	1    6600 2900
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5F95C01E
P 6600 2500
AR Path="/6014B4D9/5F95C01E" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5F95C01E" Ref="D?"  Part="1" 
AR Path="/5F910E81/5F95C01E" Ref="D4"  Part="1" 
F 0 "D4" H 6600 2300 50  0000 C CNN
F 1 "TX" H 6600 2400 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6600 2500 50  0001 C CNN
F 3 "~" H 6600 2500 50  0001 C CNN
	1    6600 2500
	-1   0    0    1   
$EndComp
Text GLabel 6850 2900 2    50   Input ~ 0
~UART_A_RXLED
Text GLabel 6850 2500 2    50   Input ~ 0
~UART_A_TXLED
Wire Wire Line
	6850 2900 6750 2900
Wire Wire Line
	6850 2500 6750 2500
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5F95C02A
P 4700 2450
AR Path="/6014B4D9/5F95C02A" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/5F95C02A" Ref="J?"  Part="1" 
AR Path="/5F910E81/5F95C02A" Ref="J7"  Part="1" 
F 0 "J7" H 4808 2831 50  0000 C CNN
F 1 "UART A" H 4808 2740 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 4700 2450 50  0001 C CNN
F 3 "~" H 4700 2450 50  0001 C CNN
	1    4700 2450
	1    0    0    -1  
$EndComp
Text GLabel 5000 2250 2    50   Input ~ 0
GND
Wire Wire Line
	5000 2250 4950 2250
Wire Wire Line
	4900 2350 4950 2350
Wire Wire Line
	4950 2350 4950 2250
Connection ~ 4950 2250
Wire Wire Line
	4950 2250 4900 2250
Text GLabel 5000 2450 2    50   Input ~ 0
+5V
Wire Wire Line
	5000 2450 4900 2450
NoConn ~ 4900 2750
Text GLabel 5000 2550 2    50   Output ~ 0
UART_A_RxD
Wire Wire Line
	5000 2550 4900 2550
Text GLabel 5000 2650 2    50   Input ~ 0
UART_A_TxD
Wire Wire Line
	5000 2650 4900 2650
$Comp
L Device:C_Small C?
U 1 1 5F95C03D
P 7750 1400
AR Path="/5F8F4E1E/5F95C03D" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F95C03D" Ref="C28"  Part="1" 
F 0 "C28" H 7658 1354 50  0000 R CNN
F 1 "0,1uF" H 7658 1445 50  0000 R CNN
F 2 "" H 7750 1400 50  0001 C CNN
F 3 "~" H 7750 1400 50  0001 C CNN
	1    7750 1400
	-1   0    0    1   
$EndComp
Text GLabel 7750 1200 1    50   Input ~ 0
+5V
Text GLabel 7750 1600 3    50   Input ~ 0
GND
Wire Wire Line
	7750 1600 7750 1500
Wire Wire Line
	7750 1300 7750 1200
Wire Wire Line
	6700 1150 6750 1150
Wire Wire Line
	6750 1150 6750 1100
Wire Wire Line
	6750 1100 6800 1100
Wire Wire Line
	6450 2500 6350 2500
Wire Wire Line
	6350 2250 6350 2500
Wire Wire Line
	6050 2900 6450 2900
Wire Wire Line
	6050 2250 6050 2900
$Comp
L 6502:USB_B J?
U 1 1 5F982914
P 8600 1350
AR Path="/6014B4D9/5F982914" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/5F982914" Ref="J?"  Part="1" 
AR Path="/5F910E81/5F982914" Ref="J8"  Part="1" 
F 0 "J8" H 8657 1817 50  0000 C CNN
F 1 "UART_A" H 8657 1726 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 8750 1300 50  0001 C CNN
F 3 "" H 8750 1300 50  0001 C CNN
	1    8600 1350
	1    0    0    -1  
$EndComp
NoConn ~ 8500 1750
Text GLabel 8600 2000 3    50   Input ~ 0
GND
Wire Wire Line
	8600 1850 8600 1750
$Comp
L Device:Ferrite_Bead_Small FB?
U 1 1 5F98291D
P 9450 1150
AR Path="/6014B4D9/5F98291D" Ref="FB?"  Part="1" 
AR Path="/5F8F4E1E/5F98291D" Ref="FB?"  Part="1" 
AR Path="/5F910E81/5F98291D" Ref="FB2"  Part="1" 
F 0 "FB2" V 9213 1150 50  0000 C CNN
F 1 "FB" V 9304 1150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9380 1150 50  0001 C CNN
F 3 "~" H 9450 1150 50  0001 C CNN
	1    9450 1150
	0    1    1    0   
$EndComp
Text GLabel 10400 1150 2    50   Input ~ 0
+5V
Wire Wire Line
	8900 1150 9100 1150
Wire Wire Line
	9550 1150 10150 1150
Wire Wire Line
	8900 1450 9000 1450
Text GLabel 10400 1600 2    50   BiDi ~ 0
UART_A_USBD-
Text GLabel 10400 1350 2    50   BiDi ~ 0
UART_A_USBD+
$Comp
L Device:R R?
U 1 1 5F982929
P 10150 1600
AR Path="/6014B4D9/5F982929" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F982929" Ref="R?"  Part="1" 
AR Path="/5F910E81/5F982929" Ref="R16"  Part="1" 
F 0 "R16" V 10250 1600 50  0000 C CNN
F 1 "27" V 10150 1600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10080 1600 50  0001 C CNN
F 3 "~" H 10150 1600 50  0001 C CNN
	1    10150 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F98292F
P 10150 1350
AR Path="/6014B4D9/5F98292F" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F98292F" Ref="R?"  Part="1" 
AR Path="/5F910E81/5F98292F" Ref="R15"  Part="1" 
F 0 "R15" V 10250 1350 50  0000 C CNN
F 1 "27" V 10150 1350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10080 1350 50  0001 C CNN
F 3 "~" H 10150 1350 50  0001 C CNN
	1    10150 1350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10300 1600 10400 1600
Wire Wire Line
	10300 1350 10400 1350
Wire Wire Line
	9000 1450 9000 1600
$Comp
L Device:C_Small C?
U 1 1 5F982938
P 9450 1800
AR Path="/6014B4D9/5F982938" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F982938" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F982938" Ref="C30"  Part="1" 
F 0 "C30" H 9542 1846 50  0000 L CNN
F 1 "47pF" H 9542 1755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9450 1800 50  0001 C CNN
F 3 "~" H 9450 1800 50  0001 C CNN
	1    9450 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F98293E
P 9800 1800
AR Path="/6014B4D9/5F98293E" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F98293E" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F98293E" Ref="C31"  Part="1" 
F 0 "C31" H 9892 1846 50  0000 L CNN
F 1 "47pF" H 9892 1755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9800 1800 50  0001 C CNN
F 3 "~" H 9800 1800 50  0001 C CNN
	1    9800 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 1350 9450 1350
Wire Wire Line
	9000 1600 9800 1600
Text GLabel 9450 2000 3    50   Input ~ 0
GND
Text GLabel 9800 2000 3    50   Input ~ 0
GND
Wire Wire Line
	9450 1700 9450 1350
Connection ~ 9450 1350
Wire Wire Line
	9450 1350 10000 1350
Wire Wire Line
	9450 1900 9450 2000
Wire Wire Line
	9800 2000 9800 1900
Wire Wire Line
	9800 1700 9800 1600
Connection ~ 9800 1600
Wire Wire Line
	9800 1600 10000 1600
$Comp
L Device:C_Small C?
U 1 1 5F982950
P 9100 1800
AR Path="/6014B4D9/5F982950" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F982950" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F982950" Ref="C29"  Part="1" 
F 0 "C29" H 9192 1846 50  0000 L CNN
F 1 "10nF" H 9192 1755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9100 1800 50  0001 C CNN
F 3 "~" H 9100 1800 50  0001 C CNN
	1    9100 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 1700 9100 1150
Connection ~ 9100 1150
Wire Wire Line
	9100 1150 9350 1150
Text GLabel 9100 2000 3    50   Input ~ 0
GND
Wire Wire Line
	9100 2000 9100 1900
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F98295B
P 10150 1150
AR Path="/6014B4D9/5F98295B" Ref="#FLG?"  Part="1" 
AR Path="/5F8F4E1E/5F98295B" Ref="#FLG?"  Part="1" 
AR Path="/5F910E81/5F98295B" Ref="#FLG02"  Part="1" 
F 0 "#FLG02" H 10150 1225 50  0001 C CNN
F 1 "PWR_FLAG" H 10150 1323 50  0000 C CNN
F 2 "" H 10150 1150 50  0001 C CNN
F 3 "~" H 10150 1150 50  0001 C CNN
	1    10150 1150
	1    0    0    -1  
$EndComp
Connection ~ 10150 1150
Wire Wire Line
	10150 1150 10400 1150
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F982963
P 8600 1850
AR Path="/6014B4D9/5F982963" Ref="#FLG?"  Part="1" 
AR Path="/5F8F4E1E/5F982963" Ref="#FLG?"  Part="1" 
AR Path="/5F910E81/5F982963" Ref="#FLG01"  Part="1" 
F 0 "#FLG01" H 8600 1925 50  0001 C CNN
F 1 "PWR_FLAG" V 8600 1977 50  0000 L CNN
F 2 "" H 8600 1850 50  0001 C CNN
F 3 "~" H 8600 1850 50  0001 C CNN
	1    8600 1850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8600 2000 8600 1850
Connection ~ 8600 1850
$Comp
L 74xx:74LS04 U?
U 6 1 5F9A15C7
P 2350 3900
AR Path="/5F8F4E1E/5F9A15C7" Ref="U?"  Part="6" 
AR Path="/5F910E81/5F9A15C7" Ref="U4"  Part="6" 
F 0 "U4" H 2350 4217 50  0000 C CNN
F 1 "74AC04" H 2350 4126 50  0000 C CNN
F 2 "" H 2350 3900 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 2350 3900 50  0001 C CNN
	6    2350 3900
	1    0    0    -1  
$EndComp
Text GLabel 2750 3900 2    50   Output ~ 0
UART_RES
Text GLabel 1850 3900 0    50   Input ~ 0
~6502_RES
Wire Wire Line
	1850 3900 2050 3900
Wire Wire Line
	2650 3900 2750 3900
Wire Bus Line
	1350 1000 2200 1000
Wire Bus Line
	1700 3350 2800 3350
$EndSCHEMATC
