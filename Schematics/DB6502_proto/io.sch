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
L 6502:SC26C92 U19
U 1 1 5F92CA23
P 2400 2050
F 0 "U19" H 2400 2100 50  0000 C CNN
F 1 "SC26C92" H 2400 2000 50  0000 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 2400 2050 50  0001 C CNN
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
Text Label 1900 900  3    50   ~ 0
a2
Text Label 2100 900  3    50   ~ 0
a1
Text Label 2300 900  3    50   ~ 0
a0
NoConn ~ 2200 1250
Text GLabel 2500 950  1    50   Input ~ 0
+5V
Wire Wire Line
	1600 1550 1450 1550
Wire Wire Line
	1900 1250 1900 900 
Wire Wire Line
	2100 1250 2100 900 
Wire Wire Line
	2300 1250 2300 900 
Entry Wire Line
	1350 1450 1450 1550
Entry Wire Line
	1800 800  1900 900 
Entry Wire Line
	2000 800  2100 900 
Entry Wire Line
	2200 800  2300 900 
Wire Bus Line
	1350 1450 1350 800 
Wire Bus Line
	1250 800  1350 800 
Connection ~ 1350 800 
Text GLabel 1250 800  0    50   Input ~ 0
a[0..15]
Wire Wire Line
	2500 950  2500 1050
$Comp
L Device:C_Small C28
U 1 1 5F932BB1
P 2700 1050
F 0 "C28" V 2471 1050 50  0000 C CNN
F 1 "0,1uF" V 2562 1050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2700 1050 50  0001 C CNN
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
~UART_CE
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
F 2 "Crystal:Crystal_HC49-U_Vertical" H 3950 1800 50  0001 C CNN
F 3 "~" H 3950 1800 50  0001 C CNN
	1    3950 1800
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C32
U 1 1 5F93E98E
P 3950 1500
F 0 "C32" H 3858 1454 50  0000 R CNN
F 1 "22pF" H 3858 1545 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3950 1500 50  0001 C CNN
F 3 "~" H 3950 1500 50  0001 C CNN
	1    3950 1500
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C33
U 1 1 5F93F1BF
P 3950 2100
F 0 "C33" H 3858 2054 50  0000 R CNN
F 1 "22pF" H 3858 2145 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3950 2100 50  0001 C CNN
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
P 6150 1400
AR Path="/6014B4D9/5F95BFD2" Ref="U?"  Part="1" 
AR Path="/5F8F4E1E/5F95BFD2" Ref="U?"  Part="1" 
AR Path="/5F910E81/5F95BFD2" Ref="U20"  Part="1" 
F 0 "U20" H 6150 2015 50  0000 C CNN
F 1 "FT230XS" H 6150 1924 50  0000 C CNN
F 2 "Package_SO:SSOP-16_5.3x6.2mm_P0.65mm" H 6150 1900 50  0001 C CNN
F 3 "" H 6150 1400 50  0001 C CNN
	1    6150 1400
	1    0    0    -1  
$EndComp
Text GLabel 5500 1000 0    50   Output ~ 0
UART_A_RxD_USB
Text GLabel 5500 1350 0    50   Input ~ 0
UART_A_TxD
Text GLabel 5500 1450 0    50   Input ~ 0
GND
Text GLabel 5500 1900 0    50   BiDi ~ 0
UART_A_USBD+
Text GLabel 6800 1850 2    50   BiDi ~ 0
UART_A_USBD-
Text GLabel 7000 1250 1    50   Input ~ 0
GND
Text GLabel 7400 1250 1    50   Input ~ 0
+5V
Wire Wire Line
	5500 1350 5600 1350
Wire Wire Line
	4750 1250 4750 2050
Wire Wire Line
	4750 2050 4900 2050
Wire Wire Line
	7500 2050 7500 1650
Wire Wire Line
	7500 1650 6700 1650
Wire Wire Line
	4750 1250 5600 1250
Wire Wire Line
	6700 1550 7500 1550
Wire Wire Line
	7500 1550 7500 1650
Connection ~ 7500 1650
$Comp
L Device:C C?
U 1 1 5F95BFF2
P 4900 2300
AR Path="/6014B4D9/5F95BFF2" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F95BFF2" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F95BFF2" Ref="C34"  Part="1" 
F 0 "C34" H 5015 2346 50  0000 L CNN
F 1 "0,1uF" H 5015 2255 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4938 2150 50  0001 C CNN
F 3 "~" H 4900 2300 50  0001 C CNN
	1    4900 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2050 4900 2150
Connection ~ 4900 2050
Wire Wire Line
	4900 2050 5450 2050
Text GLabel 5000 2550 2    50   Input ~ 0
GND
Wire Wire Line
	4900 2550 4900 2450
Text GLabel 6850 1150 1    50   Output ~ 0
~UART_A_RXLED
Text GLabel 5400 1750 0    50   Output ~ 0
~UART_A_TXLED
Wire Wire Line
	5500 1900 5550 1900
Wire Wire Line
	5550 1900 5550 1750
Wire Wire Line
	5550 1750 5600 1750
NoConn ~ 6700 1150
NoConn ~ 6700 1050
$Comp
L Device:R R?
U 1 1 5F95C00C
P 5800 2250
AR Path="/6014B4D9/5F95C00C" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F95C00C" Ref="R?"  Part="1" 
AR Path="/5F910E81/5F95C00C" Ref="R16"  Part="1" 
F 0 "R16" V 5900 2250 50  0000 C CNN
F 1 "220" V 5800 2250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5730 2250 50  0001 C CNN
F 3 "~" H 5800 2250 50  0001 C CNN
	1    5800 2250
	0    -1   -1   0   
$EndComp
Connection ~ 5450 2050
Wire Wire Line
	5450 2050 5550 2050
Connection ~ 5550 2050
Wire Wire Line
	5550 2050 7500 2050
$Comp
L Device:LED D?
U 1 1 5F95C018
P 6200 2550
AR Path="/6014B4D9/5F95C018" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5F95C018" Ref="D?"  Part="1" 
AR Path="/5F910E81/5F95C018" Ref="D5"  Part="1" 
F 0 "D5" H 6200 2450 50  0000 C CNN
F 1 "A_RX" H 6200 2650 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6200 2550 50  0001 C CNN
F 3 "~" H 6200 2550 50  0001 C CNN
	1    6200 2550
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5F95C01E
P 6200 2250
AR Path="/6014B4D9/5F95C01E" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5F95C01E" Ref="D?"  Part="1" 
AR Path="/5F910E81/5F95C01E" Ref="D4"  Part="1" 
F 0 "D4" H 6200 2150 50  0000 C CNN
F 1 "A_TX" H 6200 2350 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6200 2250 50  0001 C CNN
F 3 "~" H 6200 2250 50  0001 C CNN
	1    6200 2250
	-1   0    0    1   
$EndComp
Text GLabel 6450 2550 2    50   Input ~ 0
~UART_A_RXLED
Text GLabel 6450 2250 2    50   Input ~ 0
~UART_A_TXLED
Wire Wire Line
	6450 2550 6350 2550
Wire Wire Line
	6450 2250 6350 2250
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5F95C02A
P 8250 4100
AR Path="/6014B4D9/5F95C02A" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/5F95C02A" Ref="J?"  Part="1" 
AR Path="/5F910E81/5F95C02A" Ref="J8"  Part="1" 
F 0 "J8" H 8350 4550 50  0000 C CNN
F 1 "UART A" H 8350 4450 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 8250 4100 50  0001 C CNN
F 3 "~" H 8250 4100 50  0001 C CNN
	1    8250 4100
	1    0    0    -1  
$EndComp
Text GLabel 8650 3800 2    50   Input ~ 0
GND
Text GLabel 8650 4100 2    50   Input ~ 0
+5V
Wire Wire Line
	8650 4100 8450 4100
Text GLabel 8650 4200 2    50   Output ~ 0
UART_A_RxD
Wire Wire Line
	8650 4200 8450 4200
Text GLabel 8650 4300 2    50   Input ~ 0
UART_A_TxD
Wire Wire Line
	8650 4300 8450 4300
$Comp
L Device:C_Small C?
U 1 1 5F95C03D
P 7200 1350
AR Path="/5F8F4E1E/5F95C03D" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F95C03D" Ref="C36"  Part="1" 
F 0 "C36" H 7108 1304 50  0000 R CNN
F 1 "0,1uF" H 7108 1395 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7200 1350 50  0001 C CNN
F 3 "~" H 7200 1350 50  0001 C CNN
	1    7200 1350
	0    1    1    0   
$EndComp
$Comp
L 6502:USB_B J?
U 1 1 5F982914
P 8350 1350
AR Path="/6014B4D9/5F982914" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/5F982914" Ref="J?"  Part="1" 
AR Path="/5F910E81/5F982914" Ref="J9"  Part="1" 
F 0 "J9" H 8407 1817 50  0000 C CNN
F 1 "UART_A" H 8407 1726 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 8500 1300 50  0001 C CNN
F 3 "" H 8500 1300 50  0001 C CNN
	1    8350 1350
	1    0    0    -1  
$EndComp
NoConn ~ 8250 1750
Text GLabel 8350 2000 3    50   Input ~ 0
GND
Wire Wire Line
	8350 1850 8350 1750
$Comp
L Device:Ferrite_Bead_Small FB?
U 1 1 5F98291D
P 9200 1150
AR Path="/6014B4D9/5F98291D" Ref="FB?"  Part="1" 
AR Path="/5F8F4E1E/5F98291D" Ref="FB?"  Part="1" 
AR Path="/5F910E81/5F98291D" Ref="FB2"  Part="1" 
F 0 "FB2" V 8963 1150 50  0000 C CNN
F 1 "FB" V 9054 1150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9130 1150 50  0001 C CNN
F 3 "~" H 9200 1150 50  0001 C CNN
	1    9200 1150
	0    1    1    0   
$EndComp
Text GLabel 10150 1150 2    50   Input ~ 0
+5V
Wire Wire Line
	8650 1150 8850 1150
Wire Wire Line
	9300 1150 9900 1150
Wire Wire Line
	8650 1450 8750 1450
Text GLabel 10150 1600 2    50   BiDi ~ 0
UART_A_USBD-
Text GLabel 10150 1350 2    50   BiDi ~ 0
UART_A_USBD+
$Comp
L Device:R R?
U 1 1 5F982929
P 9900 1600
AR Path="/6014B4D9/5F982929" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F982929" Ref="R?"  Part="1" 
AR Path="/5F910E81/5F982929" Ref="R21"  Part="1" 
F 0 "R21" V 10000 1600 50  0000 C CNN
F 1 "27" V 9900 1600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9830 1600 50  0001 C CNN
F 3 "~" H 9900 1600 50  0001 C CNN
	1    9900 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F98292F
P 9900 1350
AR Path="/6014B4D9/5F98292F" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F98292F" Ref="R?"  Part="1" 
AR Path="/5F910E81/5F98292F" Ref="R20"  Part="1" 
F 0 "R20" V 10000 1350 50  0000 C CNN
F 1 "27" V 9900 1350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9830 1350 50  0001 C CNN
F 3 "~" H 9900 1350 50  0001 C CNN
	1    9900 1350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10050 1600 10150 1600
Wire Wire Line
	10050 1350 10150 1350
Wire Wire Line
	8750 1450 8750 1600
$Comp
L Device:C_Small C?
U 1 1 5F982938
P 9200 1800
AR Path="/6014B4D9/5F982938" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F982938" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F982938" Ref="C40"  Part="1" 
F 0 "C40" H 9292 1846 50  0000 L CNN
F 1 "47pF" H 9292 1755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9200 1800 50  0001 C CNN
F 3 "~" H 9200 1800 50  0001 C CNN
	1    9200 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F98293E
P 9550 1800
AR Path="/6014B4D9/5F98293E" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F98293E" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F98293E" Ref="C42"  Part="1" 
F 0 "C42" H 9642 1846 50  0000 L CNN
F 1 "47pF" H 9642 1755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9550 1800 50  0001 C CNN
F 3 "~" H 9550 1800 50  0001 C CNN
	1    9550 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 1350 9200 1350
Wire Wire Line
	8750 1600 9550 1600
Text GLabel 9200 2000 3    50   Input ~ 0
GND
Text GLabel 9550 2000 3    50   Input ~ 0
GND
Wire Wire Line
	9200 1700 9200 1350
Connection ~ 9200 1350
Wire Wire Line
	9200 1350 9750 1350
Wire Wire Line
	9200 1900 9200 2000
Wire Wire Line
	9550 2000 9550 1900
Wire Wire Line
	9550 1700 9550 1600
Connection ~ 9550 1600
Wire Wire Line
	9550 1600 9750 1600
$Comp
L Device:C_Small C?
U 1 1 5F982950
P 8850 1800
AR Path="/6014B4D9/5F982950" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F982950" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F982950" Ref="C38"  Part="1" 
F 0 "C38" H 8942 1846 50  0000 L CNN
F 1 "10nF" H 8942 1755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8850 1800 50  0001 C CNN
F 3 "~" H 8850 1800 50  0001 C CNN
	1    8850 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 1700 8850 1150
Connection ~ 8850 1150
Wire Wire Line
	8850 1150 9100 1150
Text GLabel 8850 2000 3    50   Input ~ 0
GND
Wire Wire Line
	8850 2000 8850 1900
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F98295B
P 9900 1150
AR Path="/6014B4D9/5F98295B" Ref="#FLG?"  Part="1" 
AR Path="/5F8F4E1E/5F98295B" Ref="#FLG?"  Part="1" 
AR Path="/5F910E81/5F98295B" Ref="#FLG02"  Part="1" 
F 0 "#FLG02" H 9900 1225 50  0001 C CNN
F 1 "PWR_FLAG" H 9900 1323 50  0000 C CNN
F 2 "" H 9900 1150 50  0001 C CNN
F 3 "~" H 9900 1150 50  0001 C CNN
	1    9900 1150
	1    0    0    -1  
$EndComp
Connection ~ 9900 1150
Wire Wire Line
	9900 1150 10150 1150
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F982963
P 8350 1850
AR Path="/6014B4D9/5F982963" Ref="#FLG?"  Part="1" 
AR Path="/5F8F4E1E/5F982963" Ref="#FLG?"  Part="1" 
AR Path="/5F910E81/5F982963" Ref="#FLG01"  Part="1" 
F 0 "#FLG01" H 8350 1925 50  0001 C CNN
F 1 "PWR_FLAG" V 8350 1977 50  0000 L CNN
F 2 "" H 8350 1850 50  0001 C CNN
F 3 "~" H 8350 1850 50  0001 C CNN
	1    8350 1850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8350 2000 8350 1850
Connection ~ 8350 1850
$Comp
L 74xx:74LS04 U?
U 6 1 5F9A15C7
P 1850 3850
AR Path="/5F8F4E1E/5F9A15C7" Ref="U?"  Part="6" 
AR Path="/5F910E81/5F9A15C7" Ref="U6"  Part="6" 
F 0 "U6" H 1850 4167 50  0000 C CNN
F 1 "74AC04" H 1850 4076 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 1850 3850 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 1850 3850 50  0001 C CNN
	6    1850 3850
	1    0    0    -1  
$EndComp
Text GLabel 2250 3850 2    50   Output ~ 0
UART_RES
Text GLabel 1350 3850 0    50   Input ~ 0
~6502_RES
Wire Wire Line
	1350 3850 1550 3850
Wire Wire Line
	2150 3850 2250 3850
NoConn ~ 3200 2350
NoConn ~ 1600 2350
NoConn ~ 1600 2450
NoConn ~ 1600 2550
NoConn ~ 3200 2550
NoConn ~ 3200 2450
Text GLabel 3300 2300 2    50   Output ~ 0
UART_A_~RTS
Wire Wire Line
	3200 2250 3250 2250
Wire Wire Line
	3250 2250 3250 2300
Wire Wire Line
	3250 2300 3300 2300
Text GLabel 1500 2300 0    50   Output ~ 0
UART_B_~RTS
Wire Wire Line
	1500 2300 1550 2300
Wire Wire Line
	1550 2300 1550 2250
Wire Wire Line
	1550 2250 1600 2250
Text GLabel 1200 1550 1    50   Input ~ 0
UART_A_~CTS
Wire Wire Line
	1200 1550 1200 1650
Wire Wire Line
	1200 1650 1600 1650
Text GLabel 3300 1150 2    50   Input ~ 0
UART_B_~CTS
Wire Wire Line
	3300 1150 2000 1150
Wire Wire Line
	2000 1150 2000 1250
Wire Wire Line
	8450 3900 8550 3900
Wire Wire Line
	8550 3900 8550 3800
Wire Wire Line
	8550 3800 8650 3800
Text GLabel 8650 3950 2    50   Input ~ 0
UART_A_~RTS
Text GLabel 8650 4450 2    50   Output ~ 0
UART_A_~CTS
Wire Wire Line
	8650 4450 8550 4450
Wire Wire Line
	8550 4450 8550 4400
Wire Wire Line
	8550 4400 8450 4400
Wire Wire Line
	8550 4000 8550 3950
Wire Wire Line
	8550 3950 8650 3950
Wire Wire Line
	8450 4000 8550 4000
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5F9E48ED
P 9350 4100
AR Path="/6014B4D9/5F9E48ED" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/5F9E48ED" Ref="J?"  Part="1" 
AR Path="/5F910E81/5F9E48ED" Ref="J11"  Part="1" 
F 0 "J11" H 9450 4550 50  0000 C CNN
F 1 "UART B" H 9450 4450 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 9350 4100 50  0001 C CNN
F 3 "~" H 9350 4100 50  0001 C CNN
	1    9350 4100
	1    0    0    -1  
$EndComp
Text GLabel 9750 3800 2    50   Input ~ 0
GND
Text GLabel 9750 4100 2    50   Input ~ 0
+5V
Wire Wire Line
	9750 4100 9550 4100
Text GLabel 9750 4200 2    50   Output ~ 0
UART_B_RxD
Wire Wire Line
	9750 4200 9550 4200
Text GLabel 9750 4300 2    50   Input ~ 0
UART_B_TxD
Wire Wire Line
	9750 4300 9550 4300
Wire Wire Line
	9550 3900 9650 3900
Wire Wire Line
	9650 3900 9650 3800
Wire Wire Line
	9650 3800 9750 3800
Text GLabel 9750 3950 2    50   Input ~ 0
UART_B_~RTS
Text GLabel 9750 4450 2    50   Output ~ 0
UART_B_~CTS
Wire Wire Line
	9750 4450 9650 4450
Wire Wire Line
	9650 4450 9650 4400
Wire Wire Line
	9650 4400 9550 4400
Wire Wire Line
	9650 4000 9650 3950
Wire Wire Line
	9650 3950 9750 3950
Wire Wire Line
	9550 4000 9650 4000
Wire Wire Line
	5500 1450 5600 1450
Wire Wire Line
	5400 1750 5500 1750
Wire Wire Line
	5500 1750 5500 1650
Wire Wire Line
	5500 1650 5600 1650
Text GLabel 5400 1600 0    50   Input ~ 0
UART_A_~RTS
Wire Wire Line
	5400 1600 5450 1600
Wire Wire Line
	5450 1600 5450 1550
Wire Wire Line
	5450 1550 5600 1550
Text GLabel 5500 1150 0    50   Output ~ 0
UART_A_~CTS~_USB
Wire Wire Line
	5600 1150 5500 1150
Wire Wire Line
	5600 1050 5550 1050
Wire Wire Line
	5550 1050 5550 1000
Wire Wire Line
	5550 1000 5500 1000
Wire Wire Line
	6850 1250 6850 1150
Wire Wire Line
	6700 1250 6850 1250
Wire Wire Line
	7000 1250 7000 1350
Wire Wire Line
	6700 1350 7000 1350
Wire Wire Line
	7400 1450 7400 1350
Wire Wire Line
	6700 1450 7400 1450
Wire Wire Line
	7300 1350 7400 1350
Connection ~ 7400 1350
Wire Wire Line
	7400 1350 7400 1250
Wire Wire Line
	7100 1350 7000 1350
Connection ~ 7000 1350
$Comp
L Device:R R?
U 1 1 5FA78290
P 5800 2550
AR Path="/6014B4D9/5FA78290" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FA78290" Ref="R?"  Part="1" 
AR Path="/5F910E81/5FA78290" Ref="R17"  Part="1" 
F 0 "R17" V 5900 2550 50  0000 C CNN
F 1 "220" V 5800 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5730 2550 50  0001 C CNN
F 3 "~" H 5800 2550 50  0001 C CNN
	1    5800 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 2250 6050 2250
Wire Wire Line
	5950 2550 6050 2550
Wire Wire Line
	5550 2250 5650 2250
Wire Wire Line
	5550 2050 5550 2250
Wire Wire Line
	5450 2550 5650 2550
Wire Wire Line
	5450 2050 5450 2550
Wire Wire Line
	4900 2550 5000 2550
Wire Wire Line
	6800 1850 6750 1850
Wire Wire Line
	6750 1850 6750 1750
Wire Wire Line
	6750 1750 6700 1750
Text GLabel 1450 4300 0    50   Input ~ 0
~UART
Text GLabel 1450 4500 0    50   Input ~ 0
~6502_CLK
Wire Wire Line
	1450 4500 1550 4500
Wire Wire Line
	1450 4300 1550 4300
Text GLabel 2250 4400 2    50   Output ~ 0
~UART_CE
$Comp
L 74xx:74LS32 U?
U 2 1 5FAF5A36
P 1850 4400
AR Path="/5FAF5A36" Ref="U?"  Part="2" 
AR Path="/5F910E81/5FAF5A36" Ref="U2"  Part="2" 
F 0 "U2" H 1850 4725 50  0000 C CNN
F 1 "74AC32" H 1850 4634 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 1850 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1850 4400 50  0001 C CNN
	2    1850 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 4400 2250 4400
$Comp
L Jumper:Jumper_3_Open JP2
U 1 1 5F988276
P 6650 3050
F 0 "JP2" H 6650 3287 50  0000 C CNN
F 1 "USB/RS232 CH0 ~CTS" H 6650 3189 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6650 3050 50  0001 C CNN
F 3 "~" H 6650 3050 50  0001 C CNN
	1    6650 3050
	1    0    0    -1  
$EndComp
Text GLabel 6550 3300 0    50   Output ~ 0
UART_A_~CTS
Wire Wire Line
	6650 3200 6650 3300
Wire Wire Line
	6550 3300 6650 3300
Text GLabel 6300 3050 0    50   Input ~ 0
UART_A_~CTS~_USB
Wire Wire Line
	6300 3050 6400 3050
Text GLabel 7000 3050 2    50   Input ~ 0
UART_A_~CTS~_232
Wire Wire Line
	6900 3050 7000 3050
$Comp
L Jumper:Jumper_3_Open JP3
U 1 1 5F9AA8A3
P 6650 3700
F 0 "JP3" H 6650 3924 50  0000 C CNN
F 1 "USB/RS232 CH0 RxD" H 6650 3833 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6650 3700 50  0001 C CNN
F 3 "~" H 6650 3700 50  0001 C CNN
	1    6650 3700
	1    0    0    -1  
$EndComp
Text GLabel 6550 3950 0    50   Output ~ 0
UART_A_RxD
Wire Wire Line
	6650 3850 6650 3950
Wire Wire Line
	6550 3950 6650 3950
Text GLabel 6300 3700 0    50   Input ~ 0
UART_A_RxD_USB
Wire Wire Line
	6300 3700 6400 3700
Text GLabel 7000 3700 2    50   Input ~ 0
UART_A_RxD_232
Wire Wire Line
	6900 3700 7000 3700
$Comp
L Jumper:Jumper_2_Open JP4
U 1 1 5F9B2318
P 9300 2850
F 0 "JP4" H 9300 3097 50  0000 C CNN
F 1 "USB CH1 ~CTS" H 9300 2999 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9300 2850 50  0001 C CNN
F 3 "~" H 9300 2850 50  0001 C CNN
	1    9300 2850
	1    0    0    -1  
$EndComp
Text GLabel 9600 2850 2    50   Output ~ 0
UART_B_~CTS
Wire Wire Line
	9500 2850 9600 2850
Text GLabel 9000 2850 0    50   Input ~ 0
UART_B_~CTS~_USB
Wire Wire Line
	9000 2850 9100 2850
$Comp
L Jumper:Jumper_2_Open JP5
U 1 1 5F9C18BA
P 9300 3250
F 0 "JP5" H 9300 3485 50  0000 C CNN
F 1 "USB CH1 RxD" H 9300 3394 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9300 3250 50  0001 C CNN
F 3 "~" H 9300 3250 50  0001 C CNN
	1    9300 3250
	1    0    0    -1  
$EndComp
Text GLabel 9600 3250 2    50   Output ~ 0
UART_B_RxD
Wire Wire Line
	9500 3250 9600 3250
Text GLabel 9000 3250 0    50   Input ~ 0
UART_B_RxD_USB
Wire Wire Line
	9000 3250 9100 3250
$Comp
L Interface_UART:MAX232 U18
U 1 1 5F9EBE64
P 2200 6300
F 0 "U18" H 2200 6600 50  0000 C CNN
F 1 "MAX232" H 2200 6500 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 2250 5250 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 2200 6400 50  0001 C CNN
	1    2200 6300
	1    0    0    -1  
$EndComp
Text GLabel 2100 5000 0    50   Input ~ 0
+5V
Wire Wire Line
	2200 5000 2200 5100
Text GLabel 2100 7600 0    50   Input ~ 0
GND
Wire Wire Line
	2100 7600 2200 7600
Wire Wire Line
	2200 7600 2200 7500
Wire Wire Line
	2100 5000 2200 5000
$Comp
L Device:CP_Small C26
U 1 1 5FA0BA80
P 1200 5550
F 0 "C26" H 1288 5596 50  0000 L CNN
F 1 "10uF" H 1288 5505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 1200 5550 50  0001 C CNN
F 3 "~" H 1200 5550 50  0001 C CNN
	1    1200 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 5700 1200 5700
Wire Wire Line
	1200 5700 1200 5650
Wire Wire Line
	1200 5450 1200 5400
Wire Wire Line
	1200 5400 1400 5400
$Comp
L Device:CP_Small C29
U 1 1 5FA2B0E8
P 3100 5550
F 0 "C29" H 3188 5596 50  0000 L CNN
F 1 "10uF" H 3188 5505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 3100 5550 50  0001 C CNN
F 3 "~" H 3100 5550 50  0001 C CNN
	1    3100 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5650 3100 5700
Wire Wire Line
	3100 5700 3000 5700
Wire Wire Line
	3000 5400 3100 5400
Wire Wire Line
	3100 5400 3100 5450
$Comp
L Device:CP_Small C30
U 1 1 5FA453BA
P 3200 5900
F 0 "C30" V 3300 6000 50  0000 C CNN
F 1 "10uF" V 3300 5750 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 3200 5900 50  0001 C CNN
F 3 "~" H 3200 5900 50  0001 C CNN
	1    3200 5900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 5900 3000 5900
$Comp
L Device:CP_Small C31
U 1 1 5FA4E5C0
P 3200 6200
F 0 "C31" V 3100 6100 50  0000 C CNN
F 1 "10uF" V 3100 6350 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 3200 6200 50  0001 C CNN
F 3 "~" H 3200 6200 50  0001 C CNN
	1    3200 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 6200 3100 6200
Text GLabel 3600 6050 2    50   Input ~ 0
GND
Wire Wire Line
	3300 6200 3500 6200
Wire Wire Line
	3500 6200 3500 6050
Wire Wire Line
	3500 5900 3300 5900
Wire Wire Line
	3500 6050 3600 6050
Connection ~ 3500 6050
Wire Wire Line
	3500 6050 3500 5900
Text GLabel 1300 6400 0    50   Input ~ 0
UART_A_TxD
Wire Wire Line
	1300 6400 1400 6400
Text GLabel 1300 6600 0    50   Input ~ 0
UART_A_~RTS
Wire Wire Line
	1300 6600 1400 6600
Wire Wire Line
	1300 6800 1400 6800
Text GLabel 1300 6800 0    50   Output ~ 0
UART_A_RxD_232
Text GLabel 1300 7000 0    50   Output ~ 0
UART_A_~CTS~_232
Wire Wire Line
	1300 7000 1400 7000
Text Label 3000 6400 0    50   ~ 0
232_TxD
Text Label 3000 6600 0    50   ~ 0
232_~RTS
Text Label 3000 6800 0    50   ~ 0
232_RxD
Text Label 3000 7000 0    50   ~ 0
232_~CTS
$Comp
L Device:CP_Small C27
U 1 1 5FB9DD34
P 2400 5000
F 0 "C27" V 2550 5000 50  0000 C CNN
F 1 "10uF" V 2250 5000 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 2400 5000 50  0001 C CNN
F 3 "~" H 2400 5000 50  0001 C CNN
	1    2400 5000
	0    -1   -1   0   
$EndComp
Text GLabel 2600 5000 2    50   Input ~ 0
GND
Wire Wire Line
	2600 5000 2500 5000
Wire Wire Line
	2300 5000 2200 5000
Connection ~ 2200 5000
$Comp
L Connector:DB9_Male_MountingHoles J7
U 1 1 5FD1CD9F
P 4100 6750
F 0 "J7" H 4280 6796 50  0000 L CNN
F 1 "DB9_Male" H 4280 6705 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Male_Horizontal_P2.77x2.84mm_EdgePinOffset7.70mm_Housed_MountingHolesOffset9.12mm" H 4100 6750 50  0001 C CNN
F 3 " ~" H 4100 6750 50  0001 C CNN
	1    4100 6750
	1    0    0    -1  
$EndComp
Text GLabel 3700 6350 0    50   Input ~ 0
GND
Wire Wire Line
	3700 6350 3800 6350
Wire Wire Line
	3800 7150 3700 7150
Wire Wire Line
	3700 7150 3700 7050
Wire Wire Line
	3700 7050 3800 7050
Wire Wire Line
	3700 7050 3700 6550
Wire Wire Line
	3700 6550 3800 6550
Connection ~ 3700 7050
NoConn ~ 3800 6450
Wire Wire Line
	3350 6800 3000 6800
Wire Wire Line
	3450 6400 3450 6750
Wire Wire Line
	3450 6750 3800 6750
Wire Wire Line
	3000 6400 3450 6400
Wire Wire Line
	3350 6800 3350 6950
Wire Wire Line
	3350 6950 3800 6950
Wire Wire Line
	3550 7000 3550 6650
Wire Wire Line
	3550 6650 3800 6650
Wire Wire Line
	3000 7000 3550 7000
Wire Wire Line
	3400 6600 3400 6850
Wire Wire Line
	3400 6850 3800 6850
Wire Wire Line
	3000 6600 3400 6600
$Comp
L 6502:FT230XS U?
U 1 1 5FF88878
P 6250 5000
AR Path="/6014B4D9/5FF88878" Ref="U?"  Part="1" 
AR Path="/5F8F4E1E/5FF88878" Ref="U?"  Part="1" 
AR Path="/5F910E81/5FF88878" Ref="U21"  Part="1" 
F 0 "U21" H 6250 5615 50  0000 C CNN
F 1 "FT230XS" H 6250 5524 50  0000 C CNN
F 2 "Package_SO:SSOP-16_5.3x6.2mm_P0.65mm" H 6250 5500 50  0001 C CNN
F 3 "" H 6250 5000 50  0001 C CNN
	1    6250 5000
	1    0    0    -1  
$EndComp
Text GLabel 5600 4600 0    50   Output ~ 0
UART_B_RxD_USB
Text GLabel 5600 4950 0    50   Input ~ 0
UART_B_TxD
Text GLabel 5600 5050 0    50   Input ~ 0
GND
Text GLabel 5600 5500 0    50   BiDi ~ 0
UART_B_USBD+
Text GLabel 6900 5450 2    50   BiDi ~ 0
UART_B_USBD-
Text GLabel 7100 4850 1    50   Input ~ 0
GND
Text GLabel 7500 4850 1    50   Input ~ 0
+5V
Wire Wire Line
	5600 4950 5700 4950
Wire Wire Line
	4850 4850 4850 5650
Wire Wire Line
	4850 5650 5000 5650
Wire Wire Line
	7600 5650 7600 5250
Wire Wire Line
	7600 5250 6800 5250
Wire Wire Line
	4850 4850 5700 4850
Wire Wire Line
	6800 5150 7600 5150
Wire Wire Line
	7600 5150 7600 5250
Connection ~ 7600 5250
$Comp
L Device:C C?
U 1 1 5FF88892
P 5000 5900
AR Path="/6014B4D9/5FF88892" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5FF88892" Ref="C?"  Part="1" 
AR Path="/5F910E81/5FF88892" Ref="C35"  Part="1" 
F 0 "C35" H 5115 5946 50  0000 L CNN
F 1 "0,1uF" H 5115 5855 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5038 5750 50  0001 C CNN
F 3 "~" H 5000 5900 50  0001 C CNN
	1    5000 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 5650 5000 5750
Connection ~ 5000 5650
Wire Wire Line
	5000 5650 5550 5650
Text GLabel 5100 6150 2    50   Input ~ 0
GND
Wire Wire Line
	5000 6150 5000 6050
Text GLabel 6950 4750 1    50   Output ~ 0
~UART_B_RXLED
Text GLabel 5500 5350 0    50   Output ~ 0
~UART_B_TXLED
Wire Wire Line
	5600 5500 5650 5500
Wire Wire Line
	5650 5500 5650 5350
Wire Wire Line
	5650 5350 5700 5350
NoConn ~ 6800 4750
NoConn ~ 6800 4650
$Comp
L Device:R R?
U 1 1 5FF888A8
P 5900 5850
AR Path="/6014B4D9/5FF888A8" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FF888A8" Ref="R?"  Part="1" 
AR Path="/5F910E81/5FF888A8" Ref="R18"  Part="1" 
F 0 "R18" V 6000 5850 50  0000 C CNN
F 1 "220" V 5900 5850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5830 5850 50  0001 C CNN
F 3 "~" H 5900 5850 50  0001 C CNN
	1    5900 5850
	0    -1   -1   0   
$EndComp
Connection ~ 5550 5650
Wire Wire Line
	5550 5650 5650 5650
Connection ~ 5650 5650
Wire Wire Line
	5650 5650 7600 5650
$Comp
L Device:LED D?
U 1 1 5FF888B6
P 6300 6150
AR Path="/6014B4D9/5FF888B6" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5FF888B6" Ref="D?"  Part="1" 
AR Path="/5F910E81/5FF888B6" Ref="D7"  Part="1" 
F 0 "D7" H 6300 6050 50  0000 C CNN
F 1 "B_RX" H 6300 6250 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6300 6150 50  0001 C CNN
F 3 "~" H 6300 6150 50  0001 C CNN
	1    6300 6150
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5FF888C0
P 6300 5850
AR Path="/6014B4D9/5FF888C0" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5FF888C0" Ref="D?"  Part="1" 
AR Path="/5F910E81/5FF888C0" Ref="D6"  Part="1" 
F 0 "D6" H 6300 5750 50  0000 C CNN
F 1 "B_TX" H 6300 5950 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6300 5850 50  0001 C CNN
F 3 "~" H 6300 5850 50  0001 C CNN
	1    6300 5850
	-1   0    0    1   
$EndComp
Text GLabel 6550 6150 2    50   Input ~ 0
~UART_B_RXLED
Text GLabel 6550 5850 2    50   Input ~ 0
~UART_B_TXLED
Wire Wire Line
	6550 6150 6450 6150
Wire Wire Line
	6550 5850 6450 5850
$Comp
L Device:C_Small C?
U 1 1 5FF888CE
P 7300 4950
AR Path="/5F8F4E1E/5FF888CE" Ref="C?"  Part="1" 
AR Path="/5F910E81/5FF888CE" Ref="C37"  Part="1" 
F 0 "C37" H 7208 4904 50  0000 R CNN
F 1 "0,1uF" H 7208 4995 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7300 4950 50  0001 C CNN
F 3 "~" H 7300 4950 50  0001 C CNN
	1    7300 4950
	0    1    1    0   
$EndComp
$Comp
L 6502:USB_B J?
U 1 1 5FF888D8
P 8400 5300
AR Path="/6014B4D9/5FF888D8" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/5FF888D8" Ref="J?"  Part="1" 
AR Path="/5F910E81/5FF888D8" Ref="J10"  Part="1" 
F 0 "J10" H 8457 5767 50  0000 C CNN
F 1 "UART_B" H 8457 5676 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 8550 5250 50  0001 C CNN
F 3 "" H 8550 5250 50  0001 C CNN
	1    8400 5300
	1    0    0    -1  
$EndComp
NoConn ~ 8300 5700
Text GLabel 8400 5950 3    50   Input ~ 0
GND
$Comp
L Device:Ferrite_Bead_Small FB?
U 1 1 5FF888E5
P 9250 5100
AR Path="/6014B4D9/5FF888E5" Ref="FB?"  Part="1" 
AR Path="/5F8F4E1E/5FF888E5" Ref="FB?"  Part="1" 
AR Path="/5F910E81/5FF888E5" Ref="FB3"  Part="1" 
F 0 "FB3" V 9013 5100 50  0000 C CNN
F 1 "FB" V 9104 5100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9180 5100 50  0001 C CNN
F 3 "~" H 9250 5100 50  0001 C CNN
	1    9250 5100
	0    1    1    0   
$EndComp
Text GLabel 10200 5100 2    50   Input ~ 0
+5V
Wire Wire Line
	8700 5100 8900 5100
Wire Wire Line
	8700 5400 8800 5400
Text GLabel 10200 5550 2    50   BiDi ~ 0
UART_B_USBD-
Text GLabel 10200 5300 2    50   BiDi ~ 0
UART_B_USBD+
$Comp
L Device:R R?
U 1 1 5FF888F5
P 9950 5550
AR Path="/6014B4D9/5FF888F5" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FF888F5" Ref="R?"  Part="1" 
AR Path="/5F910E81/5FF888F5" Ref="R23"  Part="1" 
F 0 "R23" V 10050 5550 50  0000 C CNN
F 1 "27" V 9950 5550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9880 5550 50  0001 C CNN
F 3 "~" H 9950 5550 50  0001 C CNN
	1    9950 5550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5FF888FF
P 9950 5300
AR Path="/6014B4D9/5FF888FF" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FF888FF" Ref="R?"  Part="1" 
AR Path="/5F910E81/5FF888FF" Ref="R22"  Part="1" 
F 0 "R22" V 10050 5300 50  0000 C CNN
F 1 "27" V 9950 5300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9880 5300 50  0001 C CNN
F 3 "~" H 9950 5300 50  0001 C CNN
	1    9950 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10100 5550 10200 5550
Wire Wire Line
	10100 5300 10200 5300
Wire Wire Line
	8800 5400 8800 5550
$Comp
L Device:C_Small C?
U 1 1 5FF8890C
P 9250 5750
AR Path="/6014B4D9/5FF8890C" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5FF8890C" Ref="C?"  Part="1" 
AR Path="/5F910E81/5FF8890C" Ref="C41"  Part="1" 
F 0 "C41" H 9342 5796 50  0000 L CNN
F 1 "47pF" H 9342 5705 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9250 5750 50  0001 C CNN
F 3 "~" H 9250 5750 50  0001 C CNN
	1    9250 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FF88916
P 9600 5750
AR Path="/6014B4D9/5FF88916" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5FF88916" Ref="C?"  Part="1" 
AR Path="/5F910E81/5FF88916" Ref="C43"  Part="1" 
F 0 "C43" H 9692 5796 50  0000 L CNN
F 1 "47pF" H 9692 5705 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9600 5750 50  0001 C CNN
F 3 "~" H 9600 5750 50  0001 C CNN
	1    9600 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5300 9250 5300
Wire Wire Line
	8800 5550 9600 5550
Text GLabel 9250 5950 3    50   Input ~ 0
GND
Text GLabel 9600 5950 3    50   Input ~ 0
GND
Wire Wire Line
	9250 5650 9250 5300
Connection ~ 9250 5300
Wire Wire Line
	9250 5300 9800 5300
Wire Wire Line
	9250 5850 9250 5950
Wire Wire Line
	9600 5950 9600 5850
Wire Wire Line
	9600 5650 9600 5550
Connection ~ 9600 5550
Wire Wire Line
	9600 5550 9800 5550
$Comp
L Device:C_Small C?
U 1 1 5FF8892C
P 8900 5750
AR Path="/6014B4D9/5FF8892C" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5FF8892C" Ref="C?"  Part="1" 
AR Path="/5F910E81/5FF8892C" Ref="C39"  Part="1" 
F 0 "C39" H 8992 5796 50  0000 L CNN
F 1 "10nF" H 8992 5705 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8900 5750 50  0001 C CNN
F 3 "~" H 8900 5750 50  0001 C CNN
	1    8900 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 5650 8900 5100
Connection ~ 8900 5100
Wire Wire Line
	8900 5100 9150 5100
Text GLabel 8900 5950 3    50   Input ~ 0
GND
Wire Wire Line
	8900 5950 8900 5850
Wire Wire Line
	5600 5050 5700 5050
Wire Wire Line
	5500 5350 5600 5350
Wire Wire Line
	5600 5350 5600 5250
Wire Wire Line
	5600 5250 5700 5250
Text GLabel 5500 5200 0    50   Input ~ 0
UART_B_~RTS
Wire Wire Line
	5500 5200 5550 5200
Wire Wire Line
	5550 5200 5550 5150
Wire Wire Line
	5550 5150 5700 5150
Text GLabel 5600 4750 0    50   Output ~ 0
UART_B_~CTS~_USB
Wire Wire Line
	5700 4750 5600 4750
Wire Wire Line
	5700 4650 5650 4650
Wire Wire Line
	5650 4650 5650 4600
Wire Wire Line
	5650 4600 5600 4600
Wire Wire Line
	6950 4850 6950 4750
Wire Wire Line
	6800 4850 6950 4850
Wire Wire Line
	7100 4850 7100 4950
Wire Wire Line
	6800 4950 7100 4950
Wire Wire Line
	7500 5050 7500 4950
Wire Wire Line
	6800 5050 7500 5050
Wire Wire Line
	7400 4950 7500 4950
Connection ~ 7500 4950
Wire Wire Line
	7500 4950 7500 4850
Wire Wire Line
	7200 4950 7100 4950
Connection ~ 7100 4950
$Comp
L Device:R R?
U 1 1 5FF8896B
P 5900 6150
AR Path="/6014B4D9/5FF8896B" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FF8896B" Ref="R?"  Part="1" 
AR Path="/5F910E81/5FF8896B" Ref="R19"  Part="1" 
F 0 "R19" V 6000 6150 50  0000 C CNN
F 1 "220" V 5900 6150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5830 6150 50  0001 C CNN
F 3 "~" H 5900 6150 50  0001 C CNN
	1    5900 6150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 5850 6150 5850
Wire Wire Line
	6050 6150 6150 6150
Wire Wire Line
	5650 5850 5750 5850
Wire Wire Line
	5650 5650 5650 5850
Wire Wire Line
	5550 6150 5750 6150
Wire Wire Line
	5550 5650 5550 6150
Wire Wire Line
	5000 6150 5100 6150
Wire Wire Line
	6900 5450 6850 5450
Wire Wire Line
	6850 5450 6850 5350
Wire Wire Line
	6850 5350 6800 5350
Wire Wire Line
	8400 5700 8400 5950
Wire Wire Line
	9350 5100 10200 5100
NoConn ~ 4100 7350
Wire Bus Line
	1350 800  2200 800 
Wire Bus Line
	1700 3350 2800 3350
$EndSCHEMATC
