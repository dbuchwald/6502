EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
Title "DB6502 Hobby Computer Version 2"
Date "2020-11-03"
Rev "v003"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Open Source Hardware"
Comment4 "Author: Dawid Buchwald"
$EndDescr
$Comp
L 6502:SC26C92 U16
U 1 1 5F92CA23
P 2400 2050
F 0 "U16" H 2400 2100 50  0000 C CNN
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
L Device:C_Small C31
U 1 1 5F932BB1
P 2700 1050
F 0 "C31" V 2471 1050 50  0000 C CNN
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
~UART
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
L Device:C_Small C35
U 1 1 5F93E98E
P 3950 1500
F 0 "C35" H 3858 1454 50  0000 R CNN
F 1 "22pF" H 3858 1545 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3950 1500 50  0001 C CNN
F 3 "~" H 3950 1500 50  0001 C CNN
	1    3950 1500
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C36
U 1 1 5F93F1BF
P 3950 2100
F 0 "C36" H 3858 2054 50  0000 R CNN
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
P 6350 1400
AR Path="/6014B4D9/5F95BFD2" Ref="U?"  Part="1" 
AR Path="/5F8F4E1E/5F95BFD2" Ref="U?"  Part="1" 
AR Path="/5F910E81/5F95BFD2" Ref="U17"  Part="1" 
F 0 "U17" H 6350 2015 50  0000 C CNN
F 1 "FT230XS" H 6350 1924 50  0000 C CNN
F 2 "Package_SO:SSOP-16_5.3x6.2mm_P0.65mm" H 6350 1900 50  0001 C CNN
F 3 "" H 6350 1400 50  0001 C CNN
	1    6350 1400
	1    0    0    -1  
$EndComp
Text GLabel 5700 1000 0    50   Output ~ 0
UART_A_RxD_USB
Text GLabel 5700 1350 0    50   Input ~ 0
UART_A_TxD
Text GLabel 5700 1450 0    50   Input ~ 0
GND
Text GLabel 5700 1900 0    50   BiDi ~ 0
UART_A_USBD+
Text GLabel 7000 1850 2    50   BiDi ~ 0
UART_A_USBD-
Text GLabel 7200 1250 1    50   Input ~ 0
GND
Text GLabel 7600 1250 1    50   Input ~ 0
+5V
Wire Wire Line
	5700 1350 5800 1350
Wire Wire Line
	4950 1250 4950 2050
Wire Wire Line
	4950 2050 5100 2050
Wire Wire Line
	7700 2050 7700 1650
Wire Wire Line
	7700 1650 6900 1650
Wire Wire Line
	4950 1250 5800 1250
Wire Wire Line
	6900 1550 7700 1550
Wire Wire Line
	7700 1550 7700 1650
Connection ~ 7700 1650
$Comp
L Device:C_Small C?
U 1 1 5F95BFF2
P 5100 2250
AR Path="/6014B4D9/5F95BFF2" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F95BFF2" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F95BFF2" Ref="C37"  Part="1" 
F 0 "C37" H 5215 2296 50  0000 L CNN
F 1 "0,1uF" H 5215 2205 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5138 2100 50  0001 C CNN
F 3 "~" H 5100 2250 50  0001 C CNN
	1    5100 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2050 5100 2150
Connection ~ 5100 2050
Wire Wire Line
	5100 2050 5650 2050
Text GLabel 5200 2450 2    50   Input ~ 0
GND
Wire Wire Line
	5100 2450 5100 2350
Text GLabel 7050 1150 1    50   Output ~ 0
~UART_A_RXLED
Text GLabel 5600 1750 0    50   Output ~ 0
~UART_A_TXLED
Wire Wire Line
	5700 1900 5750 1900
Wire Wire Line
	5750 1900 5750 1750
Wire Wire Line
	5750 1750 5800 1750
NoConn ~ 6900 1150
NoConn ~ 6900 1050
$Comp
L Device:R R?
U 1 1 5F95C00C
P 6000 2250
AR Path="/6014B4D9/5F95C00C" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F95C00C" Ref="R?"  Part="1" 
AR Path="/5F910E81/5F95C00C" Ref="R20"  Part="1" 
F 0 "R20" V 6100 2250 50  0000 C CNN
F 1 "220" V 6000 2250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5930 2250 50  0001 C CNN
F 3 "~" H 6000 2250 50  0001 C CNN
	1    6000 2250
	0    -1   -1   0   
$EndComp
Connection ~ 5650 2050
Wire Wire Line
	5650 2050 5750 2050
Connection ~ 5750 2050
Wire Wire Line
	5750 2050 7700 2050
$Comp
L Device:LED D?
U 1 1 5F95C018
P 6400 2550
AR Path="/6014B4D9/5F95C018" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5F95C018" Ref="D?"  Part="1" 
AR Path="/5F910E81/5F95C018" Ref="D5"  Part="1" 
F 0 "D5" H 6400 2450 50  0000 C CNN
F 1 "A_RX" H 6400 2650 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6400 2550 50  0001 C CNN
F 3 "~" H 6400 2550 50  0001 C CNN
	1    6400 2550
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5F95C01E
P 6400 2250
AR Path="/6014B4D9/5F95C01E" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5F95C01E" Ref="D?"  Part="1" 
AR Path="/5F910E81/5F95C01E" Ref="D4"  Part="1" 
F 0 "D4" H 6400 2150 50  0000 C CNN
F 1 "A_TX" H 6400 2350 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6400 2250 50  0001 C CNN
F 3 "~" H 6400 2250 50  0001 C CNN
	1    6400 2250
	-1   0    0    1   
$EndComp
Text GLabel 6650 2550 2    50   Input ~ 0
~UART_A_RXLED
Text GLabel 6650 2250 2    50   Input ~ 0
~UART_A_TXLED
Wire Wire Line
	6650 2550 6550 2550
Wire Wire Line
	6650 2250 6550 2250
$Comp
L Device:C_Small C?
U 1 1 5F95C03D
P 7400 1350
AR Path="/5F8F4E1E/5F95C03D" Ref="C?"  Part="1" 
AR Path="/5F910E81/5F95C03D" Ref="C38"  Part="1" 
F 0 "C38" H 7308 1304 50  0000 R CNN
F 1 "0,1uF" H 7308 1395 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7400 1350 50  0001 C CNN
F 3 "~" H 7400 1350 50  0001 C CNN
	1    7400 1350
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS04 U?
U 6 1 5F9A15C7
P 1850 3850
AR Path="/5F8F4E1E/5F9A15C7" Ref="U?"  Part="6" 
AR Path="/5F910E81/5F9A15C7" Ref="U4"  Part="6" 
F 0 "U4" H 1850 4167 50  0000 C CNN
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
	5700 1450 5800 1450
Wire Wire Line
	5600 1750 5700 1750
Wire Wire Line
	5700 1750 5700 1650
Wire Wire Line
	5700 1650 5800 1650
Text GLabel 5600 1600 0    50   Input ~ 0
UART_A_~RTS
Wire Wire Line
	5600 1600 5650 1600
Wire Wire Line
	5650 1600 5650 1550
Wire Wire Line
	5650 1550 5800 1550
Text GLabel 5700 1150 0    50   Output ~ 0
UART_A_~CTS~_USB
Wire Wire Line
	5800 1150 5700 1150
Wire Wire Line
	5800 1050 5750 1050
Wire Wire Line
	5750 1050 5750 1000
Wire Wire Line
	5750 1000 5700 1000
Wire Wire Line
	7050 1250 7050 1150
Wire Wire Line
	6900 1250 7050 1250
Wire Wire Line
	7200 1250 7200 1350
Wire Wire Line
	6900 1350 7200 1350
Wire Wire Line
	7600 1450 7600 1350
Wire Wire Line
	6900 1450 7600 1450
Wire Wire Line
	7500 1350 7600 1350
Connection ~ 7600 1350
Wire Wire Line
	7600 1350 7600 1250
Wire Wire Line
	7300 1350 7200 1350
Connection ~ 7200 1350
$Comp
L Device:R R?
U 1 1 5FA78290
P 6000 2550
AR Path="/6014B4D9/5FA78290" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FA78290" Ref="R?"  Part="1" 
AR Path="/5F910E81/5FA78290" Ref="R21"  Part="1" 
F 0 "R21" V 6100 2550 50  0000 C CNN
F 1 "220" V 6000 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5930 2550 50  0001 C CNN
F 3 "~" H 6000 2550 50  0001 C CNN
	1    6000 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6150 2250 6250 2250
Wire Wire Line
	6150 2550 6250 2550
Wire Wire Line
	5750 2250 5850 2250
Wire Wire Line
	5750 2050 5750 2250
Wire Wire Line
	5650 2550 5850 2550
Wire Wire Line
	5650 2050 5650 2550
Wire Wire Line
	5100 2450 5200 2450
Wire Wire Line
	7000 1850 6950 1850
Wire Wire Line
	6950 1850 6950 1750
Wire Wire Line
	6950 1750 6900 1750
$Comp
L Jumper:Jumper_3_Open JP4
U 1 1 5F988276
P 6150 4150
F 0 "JP4" H 6150 4387 50  0000 C CNN
F 1 "UART A ~CTS~" H 6150 4289 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6150 4150 50  0001 C CNN
F 3 "~" H 6150 4150 50  0001 C CNN
	1    6150 4150
	1    0    0    -1  
$EndComp
Text GLabel 6050 4400 0    50   Output ~ 0
UART_A_~CTS
Wire Wire Line
	6150 4300 6150 4400
Wire Wire Line
	6050 4400 6150 4400
Text GLabel 5800 4150 0    50   Input ~ 0
UART_A_~CTS~_USB
Wire Wire Line
	5800 4150 5900 4150
Text GLabel 6500 4150 2    50   Input ~ 0
UART_A_~CTS~_232
Wire Wire Line
	6400 4150 6500 4150
$Comp
L Jumper:Jumper_3_Open JP5
U 1 1 5F9AA8A3
P 6150 4800
F 0 "JP5" H 6150 5024 50  0000 C CNN
F 1 "UART A RxD" H 6150 4933 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6150 4800 50  0001 C CNN
F 3 "~" H 6150 4800 50  0001 C CNN
	1    6150 4800
	1    0    0    -1  
$EndComp
Text GLabel 6050 5050 0    50   Output ~ 0
UART_A_RxD
Wire Wire Line
	6150 4950 6150 5050
Wire Wire Line
	6050 5050 6150 5050
Text GLabel 5800 4800 0    50   Input ~ 0
UART_A_RxD_USB
Wire Wire Line
	5800 4800 5900 4800
Text GLabel 6500 4800 2    50   Input ~ 0
UART_A_RxD_232
Wire Wire Line
	6400 4800 6500 4800
$Comp
L 6502:FT230XS U?
U 1 1 5FF88878
P 9600 1400
AR Path="/6014B4D9/5FF88878" Ref="U?"  Part="1" 
AR Path="/5F8F4E1E/5FF88878" Ref="U?"  Part="1" 
AR Path="/5F910E81/5FF88878" Ref="U18"  Part="1" 
F 0 "U18" H 9600 2015 50  0000 C CNN
F 1 "FT230XS" H 9600 1924 50  0000 C CNN
F 2 "Package_SO:SSOP-16_5.3x6.2mm_P0.65mm" H 9600 1900 50  0001 C CNN
F 3 "" H 9600 1400 50  0001 C CNN
	1    9600 1400
	1    0    0    -1  
$EndComp
Text GLabel 8950 1000 0    50   Output ~ 0
UART_B_RxD_USB
Text GLabel 8950 1350 0    50   Input ~ 0
UART_B_TxD
Text GLabel 8950 1450 0    50   Input ~ 0
GND
Text GLabel 8950 1900 0    50   BiDi ~ 0
UART_B_USBD+
Text GLabel 10250 1850 2    50   BiDi ~ 0
UART_B_USBD-
Text GLabel 10450 1250 1    50   Input ~ 0
GND
Text GLabel 10850 1250 1    50   Input ~ 0
+5V
Wire Wire Line
	8950 1350 9050 1350
Wire Wire Line
	8200 1250 8200 2050
Wire Wire Line
	8200 2050 8350 2050
Wire Wire Line
	10950 2050 10950 1650
Wire Wire Line
	10950 1650 10150 1650
Wire Wire Line
	8200 1250 9050 1250
Wire Wire Line
	10150 1550 10950 1550
Wire Wire Line
	10950 1550 10950 1650
Connection ~ 10950 1650
$Comp
L Device:C_Small C?
U 1 1 5FF88892
P 8350 2250
AR Path="/6014B4D9/5FF88892" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5FF88892" Ref="C?"  Part="1" 
AR Path="/5F910E81/5FF88892" Ref="C39"  Part="1" 
F 0 "C39" H 8465 2296 50  0000 L CNN
F 1 "0,1uF" H 8465 2205 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8388 2100 50  0001 C CNN
F 3 "~" H 8350 2250 50  0001 C CNN
	1    8350 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2050 8350 2150
Connection ~ 8350 2050
Wire Wire Line
	8350 2050 8900 2050
Text GLabel 8450 2450 2    50   Input ~ 0
GND
Wire Wire Line
	8350 2450 8350 2350
Text GLabel 10300 1150 1    50   Output ~ 0
~UART_B_RXLED
Text GLabel 8850 1750 0    50   Output ~ 0
~UART_B_TXLED
Wire Wire Line
	8950 1900 9000 1900
Wire Wire Line
	9000 1900 9000 1750
Wire Wire Line
	9000 1750 9050 1750
NoConn ~ 10150 1150
NoConn ~ 10150 1050
$Comp
L Device:R R?
U 1 1 5FF888A8
P 9250 2250
AR Path="/6014B4D9/5FF888A8" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FF888A8" Ref="R?"  Part="1" 
AR Path="/5F910E81/5FF888A8" Ref="R22"  Part="1" 
F 0 "R22" V 9350 2250 50  0000 C CNN
F 1 "220" V 9250 2250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9180 2250 50  0001 C CNN
F 3 "~" H 9250 2250 50  0001 C CNN
	1    9250 2250
	0    -1   -1   0   
$EndComp
Connection ~ 8900 2050
Wire Wire Line
	8900 2050 9000 2050
Connection ~ 9000 2050
Wire Wire Line
	9000 2050 10950 2050
$Comp
L Device:LED D?
U 1 1 5FF888B6
P 9650 2550
AR Path="/6014B4D9/5FF888B6" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5FF888B6" Ref="D?"  Part="1" 
AR Path="/5F910E81/5FF888B6" Ref="D7"  Part="1" 
F 0 "D7" H 9650 2450 50  0000 C CNN
F 1 "B_RX" H 9650 2650 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9650 2550 50  0001 C CNN
F 3 "~" H 9650 2550 50  0001 C CNN
	1    9650 2550
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5FF888C0
P 9650 2250
AR Path="/6014B4D9/5FF888C0" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5FF888C0" Ref="D?"  Part="1" 
AR Path="/5F910E81/5FF888C0" Ref="D6"  Part="1" 
F 0 "D6" H 9650 2150 50  0000 C CNN
F 1 "B_TX" H 9650 2350 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9650 2250 50  0001 C CNN
F 3 "~" H 9650 2250 50  0001 C CNN
	1    9650 2250
	-1   0    0    1   
$EndComp
Text GLabel 9900 2550 2    50   Input ~ 0
~UART_B_RXLED
Text GLabel 9900 2250 2    50   Input ~ 0
~UART_B_TXLED
Wire Wire Line
	9900 2550 9800 2550
Wire Wire Line
	9900 2250 9800 2250
$Comp
L Device:C_Small C?
U 1 1 5FF888CE
P 10650 1350
AR Path="/5F8F4E1E/5FF888CE" Ref="C?"  Part="1" 
AR Path="/5F910E81/5FF888CE" Ref="C40"  Part="1" 
F 0 "C40" H 10558 1304 50  0000 R CNN
F 1 "0,1uF" H 10558 1395 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 10650 1350 50  0001 C CNN
F 3 "~" H 10650 1350 50  0001 C CNN
	1    10650 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	8950 1450 9050 1450
Wire Wire Line
	8850 1750 8950 1750
Wire Wire Line
	8950 1750 8950 1650
Wire Wire Line
	8950 1650 9050 1650
Text GLabel 8850 1600 0    50   Input ~ 0
UART_B_~RTS
Wire Wire Line
	8850 1600 8900 1600
Wire Wire Line
	8900 1600 8900 1550
Wire Wire Line
	8900 1550 9050 1550
Text GLabel 8950 1150 0    50   Output ~ 0
UART_B_~CTS~_USB
Wire Wire Line
	9050 1150 8950 1150
Wire Wire Line
	9050 1050 9000 1050
Wire Wire Line
	9000 1050 9000 1000
Wire Wire Line
	9000 1000 8950 1000
Wire Wire Line
	10300 1250 10300 1150
Wire Wire Line
	10150 1250 10300 1250
Wire Wire Line
	10450 1250 10450 1350
Wire Wire Line
	10150 1350 10450 1350
Wire Wire Line
	10850 1450 10850 1350
Wire Wire Line
	10150 1450 10850 1450
Wire Wire Line
	10750 1350 10850 1350
Connection ~ 10850 1350
Wire Wire Line
	10850 1350 10850 1250
Wire Wire Line
	10550 1350 10450 1350
Connection ~ 10450 1350
$Comp
L Device:R R?
U 1 1 5FF8896B
P 9250 2550
AR Path="/6014B4D9/5FF8896B" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FF8896B" Ref="R?"  Part="1" 
AR Path="/5F910E81/5FF8896B" Ref="R23"  Part="1" 
F 0 "R23" V 9350 2550 50  0000 C CNN
F 1 "220" V 9250 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9180 2550 50  0001 C CNN
F 3 "~" H 9250 2550 50  0001 C CNN
	1    9250 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9400 2250 9500 2250
Wire Wire Line
	9400 2550 9500 2550
Wire Wire Line
	9000 2250 9100 2250
Wire Wire Line
	9000 2050 9000 2250
Wire Wire Line
	8900 2550 9100 2550
Wire Wire Line
	8900 2050 8900 2550
Wire Wire Line
	8350 2450 8450 2450
Wire Wire Line
	10250 1850 10200 1850
Wire Wire Line
	10200 1850 10200 1750
Wire Wire Line
	10200 1750 10150 1750
Wire Wire Line
	5850 3750 5950 3750
Text GLabel 5850 3750 0    50   Input ~ 0
UART_B_RxD_USB
Wire Wire Line
	6350 3750 6450 3750
Text GLabel 6450 3750 2    50   Output ~ 0
UART_B_RxD
$Comp
L Jumper:Jumper_2_Open JP3
U 1 1 5F9C18BA
P 6150 3750
F 0 "JP3" H 6150 3985 50  0000 C CNN
F 1 "UART B RxD" H 6150 3894 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6150 3750 50  0001 C CNN
F 3 "~" H 6150 3750 50  0001 C CNN
	1    6150 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3350 5950 3350
Text GLabel 5850 3350 0    50   Input ~ 0
UART_B_~CTS~_USB
Wire Wire Line
	6350 3350 6450 3350
Text GLabel 6450 3350 2    50   Output ~ 0
UART_B_~CTS
$Comp
L Jumper:Jumper_2_Open JP2
U 1 1 5F9B2318
P 6150 3350
F 0 "JP2" H 6150 3597 50  0000 C CNN
F 1 "UART B ~CTS~" H 6150 3499 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6150 3350 50  0001 C CNN
F 3 "~" H 6150 3350 50  0001 C CNN
	1    6150 3350
	1    0    0    -1  
$EndComp
NoConn ~ 4100 7350
Wire Wire Line
	3000 6600 3400 6600
Wire Wire Line
	3400 6850 3800 6850
Wire Wire Line
	3400 6600 3400 6850
Wire Wire Line
	3000 7000 3550 7000
Wire Wire Line
	3550 6650 3800 6650
Wire Wire Line
	3550 7000 3550 6650
Wire Wire Line
	3350 6950 3800 6950
Wire Wire Line
	3350 6800 3350 6950
Wire Wire Line
	3000 6400 3450 6400
Wire Wire Line
	3450 6750 3800 6750
Wire Wire Line
	3450 6400 3450 6750
Wire Wire Line
	3350 6800 3000 6800
NoConn ~ 3800 6450
Connection ~ 3700 7050
Wire Wire Line
	3700 6550 3800 6550
Wire Wire Line
	3700 7050 3700 6550
Wire Wire Line
	3700 7050 3800 7050
Wire Wire Line
	3700 7150 3700 7050
Wire Wire Line
	3800 7150 3700 7150
Wire Wire Line
	3700 6350 3800 6350
Text GLabel 3700 6350 0    50   Input ~ 0
GND
$Comp
L Connector:DB9_Male_MountingHoles J11
U 1 1 5FD1CD9F
P 4100 6750
F 0 "J11" H 4280 6796 50  0000 L CNN
F 1 "DB9_Male" H 4280 6705 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Male_Horizontal_P2.77x2.84mm_EdgePinOffset7.70mm_Housed_MountingHolesOffset9.12mm" H 4100 6750 50  0001 C CNN
F 3 " ~" H 4100 6750 50  0001 C CNN
	1    4100 6750
	1    0    0    -1  
$EndComp
Connection ~ 2200 5000
Wire Wire Line
	2300 5000 2200 5000
Wire Wire Line
	2600 5000 2500 5000
Text GLabel 2600 5000 2    50   Input ~ 0
GND
$Comp
L Device:CP_Small C30
U 1 1 5FB9DD34
P 2400 5000
F 0 "C30" V 2550 5000 50  0000 C CNN
F 1 "10uF" V 2250 5000 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 2400 5000 50  0001 C CNN
F 3 "~" H 2400 5000 50  0001 C CNN
	1    2400 5000
	0    -1   -1   0   
$EndComp
Text Label 3000 7000 0    50   ~ 0
232_~CTS
Text Label 3000 6800 0    50   ~ 0
232_RxD
Text Label 3000 6600 0    50   ~ 0
232_~RTS
Text Label 3000 6400 0    50   ~ 0
232_TxD
Wire Wire Line
	1300 7000 1400 7000
Text GLabel 1300 7000 0    50   Output ~ 0
UART_A_~CTS~_232
Text GLabel 1300 6800 0    50   Output ~ 0
UART_A_RxD_232
Wire Wire Line
	1300 6800 1400 6800
Wire Wire Line
	1300 6600 1400 6600
Text GLabel 1300 6600 0    50   Input ~ 0
UART_A_~RTS
Wire Wire Line
	1300 6400 1400 6400
Text GLabel 1300 6400 0    50   Input ~ 0
UART_A_TxD
Wire Wire Line
	3500 6050 3500 5900
Connection ~ 3500 6050
Wire Wire Line
	3500 6050 3600 6050
Wire Wire Line
	3500 5900 3300 5900
Wire Wire Line
	3500 6200 3500 6050
Wire Wire Line
	3300 6200 3500 6200
Text GLabel 3600 6050 2    50   Input ~ 0
GND
Wire Wire Line
	3000 6200 3100 6200
$Comp
L Device:CP_Small C34
U 1 1 5FA4E5C0
P 3200 6200
F 0 "C34" V 3100 6100 50  0000 C CNN
F 1 "10uF" V 3100 6350 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 3200 6200 50  0001 C CNN
F 3 "~" H 3200 6200 50  0001 C CNN
	1    3200 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 5900 3000 5900
$Comp
L Device:CP_Small C33
U 1 1 5FA453BA
P 3200 5900
F 0 "C33" V 3300 6000 50  0000 C CNN
F 1 "10uF" V 3300 5750 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 3200 5900 50  0001 C CNN
F 3 "~" H 3200 5900 50  0001 C CNN
	1    3200 5900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 5400 3100 5450
Wire Wire Line
	3000 5400 3100 5400
Wire Wire Line
	3100 5700 3000 5700
Wire Wire Line
	3100 5650 3100 5700
$Comp
L Device:CP_Small C32
U 1 1 5FA2B0E8
P 3100 5550
F 0 "C32" H 3188 5596 50  0000 L CNN
F 1 "10uF" H 3188 5505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 3100 5550 50  0001 C CNN
F 3 "~" H 3100 5550 50  0001 C CNN
	1    3100 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 5400 1400 5400
Wire Wire Line
	1200 5450 1200 5400
Wire Wire Line
	1200 5700 1200 5650
Wire Wire Line
	1400 5700 1200 5700
$Comp
L Device:CP_Small C29
U 1 1 5FA0BA80
P 1200 5550
F 0 "C29" H 1288 5596 50  0000 L CNN
F 1 "10uF" H 1288 5505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 1200 5550 50  0001 C CNN
F 3 "~" H 1200 5550 50  0001 C CNN
	1    1200 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5000 2200 5000
Wire Wire Line
	2200 7600 2200 7500
Wire Wire Line
	2100 7600 2200 7600
Text GLabel 2100 7600 0    50   Input ~ 0
GND
Wire Wire Line
	2200 5000 2200 5100
Text GLabel 2100 5000 0    50   Input ~ 0
+5V
$Comp
L Interface_UART:MAX232 U15
U 1 1 5F9EBE64
P 2200 6300
F 0 "U15" H 2200 6600 50  0000 C CNN
F 1 "MAX232" H 2200 6500 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 2250 5250 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 2200 6400 50  0001 C CNN
	1    2200 6300
	1    0    0    -1  
$EndComp
Wire Bus Line
	1350 800  2200 800 
Wire Bus Line
	1700 3350 2800 3350
$EndSCHEMATC
