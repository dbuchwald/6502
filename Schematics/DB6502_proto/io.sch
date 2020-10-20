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
L 6502:SC26C92 U18
U 1 1 5F92CA23
P 2400 2050
F 0 "U18" H 2400 2100 50  0000 C CNN
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
L Device:C_Small C25
U 1 1 5F932BB1
P 2700 1050
F 0 "C25" V 2471 1050 50  0000 C CNN
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
F 2 "" H 3950 1800 50  0001 C CNN
F 3 "~" H 3950 1800 50  0001 C CNN
	1    3950 1800
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C26
U 1 1 5F93E98E
P 3950 1500
F 0 "C26" H 3858 1454 50  0000 R CNN
F 1 "22pF" H 3858 1545 50  0000 R CNN
F 2 "" H 3950 1500 50  0001 C CNN
F 3 "~" H 3950 1500 50  0001 C CNN
	1    3950 1500
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C27
U 1 1 5F93F1BF
P 3950 2100
F 0 "C27" H 3858 2054 50  0000 R CNN
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
AR Path="/5F910E81/5F95BFD2" Ref="U19"  Part="1" 
F 0 "U19" H 6150 1915 50  0000 C CNN
F 1 "FT230XS" H 6150 1824 50  0000 C CNN
F 2 "Package_SO:SSOP-16_5.3x6.2mm_P0.65mm" H 6150 1800 50  0001 C CNN
F 3 "" H 6150 1300 50  0001 C CNN
	1    6150 1300
	1    0    0    -1  
$EndComp
Text GLabel 5500 900  0    50   Output ~ 0
UART_A_RxD
Text GLabel 5500 1250 0    50   Input ~ 0
UART_A_TxD
Text GLabel 5500 1350 0    50   Input ~ 0
GND
Text GLabel 5500 1800 0    50   BiDi ~ 0
UART_A_USBD+
Text GLabel 6800 1750 2    50   BiDi ~ 0
UART_A_USBD-
Text GLabel 7000 1150 1    50   Input ~ 0
GND
Text GLabel 7400 1150 1    50   Input ~ 0
+5V
Wire Wire Line
	5500 1250 5600 1250
Wire Wire Line
	4750 1150 4750 1950
Wire Wire Line
	4750 1950 4900 1950
Wire Wire Line
	7500 1950 7500 1550
Wire Wire Line
	7500 1550 6700 1550
Wire Wire Line
	4750 1150 5600 1150
Wire Wire Line
	6700 1450 7500 1450
Wire Wire Line
	7500 1450 7500 1550
Connection ~ 7500 1550
$Comp
L Device:C C?
U 1 1 5F95BFF2
P 4900 2200
AR Path="/6014B4D9/5F95BFF2" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F95BFF2" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F95BFF2" Ref="C28"  Part="1" 
F 0 "C28" H 5015 2246 50  0000 L CNN
F 1 "0,1uF" H 5015 2155 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4938 2050 50  0001 C CNN
F 3 "~" H 4900 2200 50  0001 C CNN
	1    4900 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1950 4900 2050
Connection ~ 4900 1950
Wire Wire Line
	4900 1950 5450 1950
Text GLabel 5000 2450 2    50   Input ~ 0
GND
Wire Wire Line
	4900 2450 4900 2350
Text GLabel 6850 1050 1    50   Output ~ 0
~UART_A_RXLED
Text GLabel 5400 1650 0    50   Output ~ 0
~UART_A_TXLED
Wire Wire Line
	5500 1800 5550 1800
Wire Wire Line
	5550 1800 5550 1650
Wire Wire Line
	5550 1650 5600 1650
NoConn ~ 6700 1050
NoConn ~ 6700 950 
$Comp
L Device:R R?
U 1 1 5F95C00C
P 5800 2150
AR Path="/6014B4D9/5F95C00C" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F95C00C" Ref="R?"  Part="1" 
AR Path="/5F910E81/5F95C00C" Ref="R14"  Part="1" 
F 0 "R14" V 5900 2150 50  0000 C CNN
F 1 "220" V 5800 2150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5730 2150 50  0001 C CNN
F 3 "~" H 5800 2150 50  0001 C CNN
	1    5800 2150
	0    -1   -1   0   
$EndComp
Connection ~ 5450 1950
Wire Wire Line
	5450 1950 5550 1950
Connection ~ 5550 1950
Wire Wire Line
	5550 1950 7500 1950
$Comp
L Device:LED D?
U 1 1 5F95C018
P 6200 2450
AR Path="/6014B4D9/5F95C018" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5F95C018" Ref="D?"  Part="1" 
AR Path="/5F910E81/5F95C018" Ref="D5"  Part="1" 
F 0 "D5" H 6200 2350 50  0000 C CNN
F 1 "RX" H 6200 2550 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6200 2450 50  0001 C CNN
F 3 "~" H 6200 2450 50  0001 C CNN
	1    6200 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5F95C01E
P 6200 2150
AR Path="/6014B4D9/5F95C01E" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5F95C01E" Ref="D?"  Part="1" 
AR Path="/5F910E81/5F95C01E" Ref="D4"  Part="1" 
F 0 "D4" H 6200 2050 50  0000 C CNN
F 1 "TX" H 6200 2250 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6200 2150 50  0001 C CNN
F 3 "~" H 6200 2150 50  0001 C CNN
	1    6200 2150
	-1   0    0    1   
$EndComp
Text GLabel 6450 2450 2    50   Input ~ 0
~UART_A_RXLED
Text GLabel 6450 2150 2    50   Input ~ 0
~UART_A_TXLED
Wire Wire Line
	6450 2450 6350 2450
Wire Wire Line
	6450 2150 6350 2150
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5F95C02A
P 4100 4350
AR Path="/6014B4D9/5F95C02A" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/5F95C02A" Ref="J?"  Part="1" 
AR Path="/5F910E81/5F95C02A" Ref="J7"  Part="1" 
F 0 "J7" H 4200 4800 50  0000 C CNN
F 1 "UART A" H 4200 4700 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 4100 4350 50  0001 C CNN
F 3 "~" H 4100 4350 50  0001 C CNN
	1    4100 4350
	1    0    0    -1  
$EndComp
Text GLabel 4500 4050 2    50   Input ~ 0
GND
Text GLabel 4500 4350 2    50   Input ~ 0
+5V
Wire Wire Line
	4500 4350 4300 4350
Text GLabel 4500 4450 2    50   Output ~ 0
UART_A_RxD
Wire Wire Line
	4500 4450 4300 4450
Text GLabel 4500 4550 2    50   Input ~ 0
UART_A_TxD
Wire Wire Line
	4500 4550 4300 4550
$Comp
L Device:C_Small C?
U 1 1 5F95C03D
P 7200 1250
AR Path="/5F8F4E1E/5F95C03D" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F95C03D" Ref="C29"  Part="1" 
F 0 "C29" H 7108 1204 50  0000 R CNN
F 1 "0,1uF" H 7108 1295 50  0000 R CNN
F 2 "" H 7200 1250 50  0001 C CNN
F 3 "~" H 7200 1250 50  0001 C CNN
	1    7200 1250
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
AR Path="/5F910E81/5F982929" Ref="R17"  Part="1" 
F 0 "R17" V 10000 1600 50  0000 C CNN
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
AR Path="/5F910E81/5F98292F" Ref="R16"  Part="1" 
F 0 "R16" V 10000 1350 50  0000 C CNN
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
AR Path="/5F910E81/5F982938" Ref="C31"  Part="1" 
F 0 "C31" H 9292 1846 50  0000 L CNN
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
AR Path="/5F910E81/5F98293E" Ref="C32"  Part="1" 
F 0 "C32" H 9642 1846 50  0000 L CNN
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
AR Path="/5F910E81/5F982950" Ref="C30"  Part="1" 
F 0 "C30" H 8942 1846 50  0000 L CNN
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
P 4400 3050
AR Path="/5F8F4E1E/5F9A15C7" Ref="U?"  Part="6" 
AR Path="/5F910E81/5F9A15C7" Ref="U5"  Part="6" 
F 0 "U5" H 4400 3367 50  0000 C CNN
F 1 "74AC04" H 4400 3276 50  0000 C CNN
F 2 "" H 4400 3050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 4400 3050 50  0001 C CNN
	6    4400 3050
	1    0    0    -1  
$EndComp
Text GLabel 4800 3050 2    50   Output ~ 0
UART_RES
Text GLabel 3900 3050 0    50   Input ~ 0
~6502_RES
Wire Wire Line
	3900 3050 4100 3050
Wire Wire Line
	4700 3050 4800 3050
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
	4300 4150 4400 4150
Wire Wire Line
	4400 4150 4400 4050
Wire Wire Line
	4400 4050 4500 4050
Text GLabel 4500 4200 2    50   Input ~ 0
UART_A_~RTS
Text GLabel 4500 4700 2    50   Output ~ 0
UART_A_~CTS
Wire Wire Line
	4500 4700 4400 4700
Wire Wire Line
	4400 4700 4400 4650
Wire Wire Line
	4400 4650 4300 4650
Wire Wire Line
	4400 4250 4400 4200
Wire Wire Line
	4400 4200 4500 4200
Wire Wire Line
	4300 4250 4400 4250
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5F9E48ED
P 5200 4350
AR Path="/6014B4D9/5F9E48ED" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/5F9E48ED" Ref="J?"  Part="1" 
AR Path="/5F910E81/5F9E48ED" Ref="J8"  Part="1" 
F 0 "J8" H 5300 4800 50  0000 C CNN
F 1 "UART B" H 5300 4700 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 5200 4350 50  0001 C CNN
F 3 "~" H 5200 4350 50  0001 C CNN
	1    5200 4350
	1    0    0    -1  
$EndComp
Text GLabel 5600 4050 2    50   Input ~ 0
GND
Text GLabel 5600 4350 2    50   Input ~ 0
+5V
Wire Wire Line
	5600 4350 5400 4350
Text GLabel 5600 4450 2    50   Output ~ 0
UART_B_RxD
Wire Wire Line
	5600 4450 5400 4450
Text GLabel 5600 4550 2    50   Input ~ 0
UART_B_TxD
Wire Wire Line
	5600 4550 5400 4550
Wire Wire Line
	5400 4150 5500 4150
Wire Wire Line
	5500 4150 5500 4050
Wire Wire Line
	5500 4050 5600 4050
Text GLabel 5600 4200 2    50   Input ~ 0
UART_B_~RTS
Text GLabel 5600 4700 2    50   Output ~ 0
UART_B_~CTS
Wire Wire Line
	5600 4700 5500 4700
Wire Wire Line
	5500 4700 5500 4650
Wire Wire Line
	5500 4650 5400 4650
Wire Wire Line
	5500 4250 5500 4200
Wire Wire Line
	5500 4200 5600 4200
Wire Wire Line
	5400 4250 5500 4250
Wire Wire Line
	5500 1350 5600 1350
Wire Wire Line
	5400 1650 5500 1650
Wire Wire Line
	5500 1650 5500 1550
Wire Wire Line
	5500 1550 5600 1550
Text GLabel 5400 1500 0    50   Input ~ 0
UART_A_~RTS
Wire Wire Line
	5400 1500 5450 1500
Wire Wire Line
	5450 1500 5450 1450
Wire Wire Line
	5450 1450 5600 1450
Text GLabel 5500 1050 0    50   Output ~ 0
UART_A_~CTS
Wire Wire Line
	5600 1050 5500 1050
Wire Wire Line
	5600 950  5550 950 
Wire Wire Line
	5550 950  5550 900 
Wire Wire Line
	5550 900  5500 900 
Wire Wire Line
	6850 1150 6850 1050
Wire Wire Line
	6700 1150 6850 1150
Wire Wire Line
	7000 1150 7000 1250
Wire Wire Line
	6700 1250 7000 1250
Wire Wire Line
	7400 1350 7400 1250
Wire Wire Line
	6700 1350 7400 1350
Wire Wire Line
	7300 1250 7400 1250
Connection ~ 7400 1250
Wire Wire Line
	7400 1250 7400 1150
Wire Wire Line
	7100 1250 7000 1250
Connection ~ 7000 1250
$Comp
L Device:R R?
U 1 1 5FA78290
P 5800 2450
AR Path="/6014B4D9/5FA78290" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FA78290" Ref="R?"  Part="1" 
AR Path="/5F910E81/5FA78290" Ref="R15"  Part="1" 
F 0 "R15" V 5900 2450 50  0000 C CNN
F 1 "220" V 5800 2450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5730 2450 50  0001 C CNN
F 3 "~" H 5800 2450 50  0001 C CNN
	1    5800 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 2150 6050 2150
Wire Wire Line
	5950 2450 6050 2450
Wire Wire Line
	5550 2150 5650 2150
Wire Wire Line
	5550 1950 5550 2150
Wire Wire Line
	5450 2450 5650 2450
Wire Wire Line
	5450 1950 5450 2450
Wire Wire Line
	4900 2450 5000 2450
Wire Wire Line
	6800 1750 6750 1750
Wire Wire Line
	6750 1750 6750 1650
Wire Wire Line
	6750 1650 6700 1650
Text GLabel 4000 3500 0    50   Input ~ 0
~UART
Text GLabel 4000 3700 0    50   Input ~ 0
~6502_CLK
Wire Wire Line
	4000 3700 4100 3700
Wire Wire Line
	4000 3500 4100 3500
Text GLabel 4800 3600 2    50   Output ~ 0
~UART_CE
$Comp
L 74xx:74LS32 U?
U 2 1 5FAF5A36
P 4400 3600
AR Path="/5FAF5A36" Ref="U?"  Part="2" 
AR Path="/5F910E81/5FAF5A36" Ref="U2"  Part="2" 
F 0 "U2" H 4400 3925 50  0000 C CNN
F 1 "74AC32" H 4400 3834 50  0000 C CNN
F 2 "" H 4400 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4400 3600 50  0001 C CNN
	2    4400 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3600 4800 3600
Wire Bus Line
	1350 800  2200 800 
Wire Bus Line
	1700 3350 2800 3350
$EndSCHEMATC
