EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
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
L 6502:SC26C92 U18
U 1 1 5F92CA23
P 2400 2050
F 0 "U18" H 2400 2100 50  0000 C CNN
F 1 "SC26C92" H 2400 2000 50  0000 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 2400 2050 50  0001 C CNN
F 3 "" H 2400 2050 50  0001 C CNN
	1    2400 2050
	1    0    0    -1  
$EndComp
Text GLabel 1050 1550 1    50   Input ~ 0
~WR
Wire Wire Line
	1050 1550 1050 1750
Wire Wire Line
	1050 1750 1600 1750
Text GLabel 900  1550 1    50   Input ~ 0
~RD
Wire Wire Line
	900  1550 900  1850
Wire Wire Line
	900  1850 1600 1850
Text Label 1450 1550 0    50   ~ 0
a3
Text Label 1900 750  3    50   ~ 0
a2
Text Label 2100 750  3    50   ~ 0
a1
Text Label 2300 750  3    50   ~ 0
a0
Text GLabel 2500 800  1    50   Input ~ 0
+5V
Wire Wire Line
	1600 1550 1450 1550
Wire Wire Line
	1900 1250 1900 750 
Wire Wire Line
	2100 1250 2100 750 
Wire Wire Line
	2300 1250 2300 750 
Entry Wire Line
	1350 1450 1450 1550
Entry Wire Line
	1800 650  1900 750 
Entry Wire Line
	2000 650  2100 750 
Entry Wire Line
	2200 650  2300 750 
Wire Bus Line
	1350 1450 1350 650 
Wire Bus Line
	1250 650  1350 650 
Connection ~ 1350 650 
Text GLabel 1250 650  0    50   Input ~ 0
a[0..15]
Wire Wire Line
	2500 800  2500 900 
$Comp
L Device:C_Small C26
U 1 1 5F932BB1
P 2700 900
F 0 "C26" V 2471 900 50  0000 C CNN
F 1 "0,1uF" V 2562 900 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2700 900 50  0001 C CNN
F 3 "~" H 2700 900 50  0001 C CNN
	1    2700 900 
	0    1    1    0   
$EndComp
Text GLabel 2900 900  2    50   Input ~ 0
GND
Wire Wire Line
	2500 900  2600 900 
Connection ~ 2500 900 
Wire Wire Line
	2500 900  2500 1250
Wire Wire Line
	2800 900  2900 900 
Text GLabel 3500 1650 2    50   Input ~ 0
UART_RES
Text GLabel 3500 1500 2    50   Input ~ 0
~UART
Wire Wire Line
	3200 1650 3500 1650
Wire Wire Line
	3200 1550 3250 1550
Wire Wire Line
	3250 1550 3250 1500
Wire Wire Line
	3250 1500 3500 1500
Text GLabel 3500 1950 2    50   Input ~ 0
UART_A_RxD
Text GLabel 3500 2150 2    50   Output ~ 0
UART_A_TxD
Wire Wire Line
	3200 1950 3500 1950
Wire Wire Line
	3200 2150 3500 2150
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
Text GLabel 1250 1950 0    50   Input ~ 0
UART_B_RxD
Text GLabel 1250 2150 0    50   Output ~ 0
UART_B_TxD
Wire Wire Line
	1250 1950 1600 1950
Wire Wire Line
	1250 2150 1600 2150
$Comp
L Device:Crystal_Small Y2
U 1 1 5F93DD15
P 4150 1800
F 0 "Y2" V 4104 1888 50  0000 L CNN
F 1 "3,6864MHz" V 4195 1888 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 4150 1800 50  0001 C CNN
F 3 "~" H 4150 1800 50  0001 C CNN
	1    4150 1800
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C27
U 1 1 5F93E98E
P 4150 1500
F 0 "C27" H 4058 1454 50  0000 R CNN
F 1 "22pF" H 4058 1545 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4150 1500 50  0001 C CNN
F 3 "~" H 4150 1500 50  0001 C CNN
	1    4150 1500
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C28
U 1 1 5F93F1BF
P 4150 2100
F 0 "C28" H 4058 2054 50  0000 R CNN
F 1 "22pF" H 4058 2145 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4150 2100 50  0001 C CNN
F 3 "~" H 4150 2100 50  0001 C CNN
	1    4150 2100
	-1   0    0    1   
$EndComp
Text GLabel 4150 2300 3    50   Input ~ 0
GND
Text GLabel 4150 1300 1    50   Input ~ 0
GND
Wire Wire Line
	4150 1300 4150 1400
Wire Wire Line
	4150 1600 4150 1650
Wire Wire Line
	4150 1900 4150 1950
Wire Wire Line
	4150 2200 4150 2300
Wire Wire Line
	3200 1850 4050 1850
Wire Wire Line
	4050 1850 4050 1950
Wire Wire Line
	4050 1950 4150 1950
Connection ~ 4150 1950
Wire Wire Line
	4150 1950 4150 2000
Wire Wire Line
	3200 1750 4050 1750
Wire Wire Line
	4050 1750 4050 1650
Wire Wire Line
	4050 1650 4150 1650
Connection ~ 4150 1650
Wire Wire Line
	4150 1650 4150 1700
$Comp
L 74xx:74LS04 U?
U 5 1 5F9A15C7
P 4150 5650
AR Path="/5F8F4E1E/5F9A15C7" Ref="U?"  Part="6" 
AR Path="/5F910E81/5F9A15C7" Ref="U8"  Part="5" 
F 0 "U8" H 4150 5967 50  0000 C CNN
F 1 "74AC04" H 4150 5876 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4150 5650 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 4150 5650 50  0001 C CNN
	5    4150 5650
	1    0    0    -1  
$EndComp
Text GLabel 4550 5650 2    50   Output ~ 0
UART_RES
Text GLabel 3650 5650 0    50   Input ~ 0
~6502_RES
Wire Wire Line
	3650 5650 3850 5650
Wire Wire Line
	4450 5650 4550 5650
Text GLabel 3500 2300 2    50   Output ~ 0
UART_A_~RTS
Wire Wire Line
	3200 2250 3400 2250
Wire Wire Line
	3400 2250 3400 2300
Wire Wire Line
	3400 2300 3500 2300
Text GLabel 1250 2300 0    50   Output ~ 0
UART_B_~RTS
Wire Wire Line
	1250 2300 1350 2300
Wire Wire Line
	1350 2300 1350 2250
Wire Wire Line
	1350 2250 1600 2250
Text GLabel 1200 1550 1    50   Input ~ 0
UART_A_~CTS
Wire Wire Line
	1200 1550 1200 1650
Wire Wire Line
	1200 1650 1600 1650
Text GLabel 3300 1000 2    50   Input ~ 0
UART_B_~CTS
Wire Wire Line
	3300 1000 2000 1000
Wire Wire Line
	2000 1000 2000 1250
$Comp
L 6502:65C22S U19
U 1 1 60B5BF49
P 6600 2150
F 0 "U19" H 6600 3315 50  0000 C CNN
F 1 "65C22S" H 6600 3224 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 6600 3200 50  0001 C CNN
F 3 "" H 6700 2150 50  0001 C CNN
	1    6600 2150
	1    0    0    -1  
$EndComp
Text Label 7150 1950 0    50   ~ 0
d0
Text Label 7150 2050 0    50   ~ 0
d1
Text Label 7150 2150 0    50   ~ 0
d2
Text Label 7150 2250 0    50   ~ 0
d3
Text Label 7150 2350 0    50   ~ 0
d4
Text Label 7150 2450 0    50   ~ 0
d5
Text Label 7150 2550 0    50   ~ 0
d6
Text Label 7150 2650 0    50   ~ 0
d7
Entry Wire Line
	7850 1950 7950 2050
Entry Wire Line
	7850 2050 7950 2150
Entry Wire Line
	7850 2150 7950 2250
Entry Wire Line
	7850 2250 7950 2350
Entry Wire Line
	7850 2350 7950 2450
Entry Wire Line
	7850 2450 7950 2550
Entry Wire Line
	7850 2550 7950 2650
Entry Wire Line
	7850 2650 7950 2750
Wire Wire Line
	7100 1950 7850 1950
Wire Wire Line
	7100 2050 7850 2050
Wire Wire Line
	7100 2150 7850 2150
Wire Wire Line
	7100 2250 7850 2250
Wire Wire Line
	7100 2350 7850 2350
Wire Wire Line
	7100 2450 7850 2450
Wire Wire Line
	7100 2550 7850 2550
Wire Wire Line
	7100 2650 7850 2650
Wire Bus Line
	7950 2750 8000 2750
Text GLabel 8000 2750 2    50   Input ~ 0
d[0..7]
Text GLabel 7300 1850 2    50   Input ~ 0
~6502_RES
Wire Wire Line
	7100 1850 7300 1850
Text Label 7150 1750 0    50   ~ 0
a3
Text Label 7150 1650 0    50   ~ 0
a2
Text Label 7150 1550 0    50   ~ 0
a1
Text Label 7150 1450 0    50   ~ 0
a0
Entry Wire Line
	7400 1750 7500 1650
Entry Wire Line
	7400 1650 7500 1550
Entry Wire Line
	7400 1550 7500 1450
Entry Wire Line
	7400 1450 7500 1350
Wire Wire Line
	7100 1450 7400 1450
Wire Wire Line
	7100 1550 7400 1550
Wire Wire Line
	7100 1650 7400 1650
Wire Wire Line
	7100 1750 7400 1750
Wire Bus Line
	7500 1350 7550 1350
Text GLabel 7550 1350 2    50   Input ~ 0
a[0..15]
Text GLabel 7200 3250 3    50   Output ~ 0
~VIA1_IRQ
Wire Wire Line
	7100 3150 7200 3150
Wire Wire Line
	7200 3150 7200 3250
Text GLabel 7350 3250 3    50   Input ~ 0
R~W
Wire Wire Line
	7100 3050 7350 3050
Wire Wire Line
	7350 3050 7350 3250
Text GLabel 7500 3250 3    50   Input ~ 0
~VIA1
Wire Wire Line
	7500 3250 7500 2950
Wire Wire Line
	7500 2950 7100 2950
Text GLabel 7650 3250 3    50   Input ~ 0
IOCS
Wire Wire Line
	7650 3250 7650 2850
Wire Wire Line
	7650 2850 7100 2850
Text GLabel 7800 3250 3    50   Input ~ 0
6502_CLK
Wire Wire Line
	7100 2750 7800 2750
Wire Wire Line
	7800 2750 7800 3250
Text GLabel 5900 3150 0    50   Input ~ 0
+5V
Wire Wire Line
	5900 3150 6000 3150
$Comp
L Device:C_Small C29
U 1 1 60B853CC
P 5800 3500
F 0 "C29" V 5571 3500 50  0000 C CNN
F 1 "0,1uF" V 5662 3500 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5800 3500 50  0001 C CNN
F 3 "~" H 5800 3500 50  0001 C CNN
	1    5800 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 3500 6000 3500
Wire Wire Line
	6000 3500 6000 3150
Connection ~ 6000 3150
Wire Wire Line
	6000 3150 6100 3150
Text GLabel 6000 1150 1    50   Input ~ 0
GND
Wire Wire Line
	6000 1250 6100 1250
Text GLabel 5600 3500 0    50   Input ~ 0
GND
Wire Wire Line
	5600 3500 5700 3500
Text Label 5800 2150 0    50   ~ 0
v1pb0
Text Label 5800 2250 0    50   ~ 0
v1pb1
Text Label 5800 2350 0    50   ~ 0
v1pb2
Text Label 5800 2450 0    50   ~ 0
v1pb3
Text Label 5800 2550 0    50   ~ 0
v1pb4
Text Label 5800 2650 0    50   ~ 0
v1pb5
Text Label 5800 2750 0    50   ~ 0
v1pb6
Text Label 5800 2850 0    50   ~ 0
v1pb7
Text Label 5800 2950 0    50   ~ 0
v1pb8
Text Label 5800 3050 0    50   ~ 0
v1pb9
Wire Wire Line
	6000 1150 6000 1250
Text Label 5800 2050 0    50   ~ 0
v1pa7
Text Label 5800 1950 0    50   ~ 0
v1pa6
Text Label 5800 1850 0    50   ~ 0
v1pa5
Text Label 5800 1750 0    50   ~ 0
v1pa4
Text Label 5800 1650 0    50   ~ 0
v1pa3
Text Label 5800 1550 0    50   ~ 0
v1pa2
Text Label 5800 1450 0    50   ~ 0
v1pa1
Text Label 5800 1350 0    50   ~ 0
v1pa0
Text Label 7150 1250 0    50   ~ 0
v1pa8
Text Label 7150 1350 0    50   ~ 0
v1pa9
Entry Wire Line
	7400 1350 7500 1250
Entry Wire Line
	7400 1250 7500 1150
Entry Wire Line
	5650 2950 5750 3050
Entry Wire Line
	5650 2850 5750 2950
Entry Wire Line
	5650 2750 5750 2850
Entry Wire Line
	5650 2650 5750 2750
Entry Wire Line
	5650 2550 5750 2650
Entry Wire Line
	5650 2450 5750 2550
Entry Wire Line
	5650 2350 5750 2450
Entry Wire Line
	5650 2250 5750 2350
Entry Wire Line
	5650 2150 5750 2250
Entry Wire Line
	5650 2050 5750 2150
Entry Wire Line
	5650 1950 5750 2050
Entry Wire Line
	5650 1850 5750 1950
Entry Wire Line
	5650 1750 5750 1850
Entry Wire Line
	5650 1650 5750 1750
Entry Wire Line
	5650 1550 5750 1650
Entry Wire Line
	5650 1450 5750 1550
Entry Wire Line
	5650 1350 5750 1450
Entry Wire Line
	5650 1250 5750 1350
Wire Wire Line
	5750 1350 6100 1350
Wire Wire Line
	5750 1450 6100 1450
Wire Wire Line
	5750 1550 6100 1550
Wire Wire Line
	5750 1650 6100 1650
Wire Wire Line
	5750 1750 6100 1750
Wire Wire Line
	5750 1850 6100 1850
Wire Wire Line
	5750 1950 6100 1950
Wire Wire Line
	5750 2050 6100 2050
Wire Wire Line
	5750 2150 6100 2150
Wire Wire Line
	5750 2250 6100 2250
Wire Wire Line
	5750 2350 6100 2350
Wire Wire Line
	5750 2450 6100 2450
Wire Wire Line
	5750 2550 6100 2550
Wire Wire Line
	5750 2650 6100 2650
Wire Wire Line
	5750 2750 6100 2750
Wire Wire Line
	5750 2850 6100 2850
Wire Wire Line
	5750 2950 6100 2950
Wire Wire Line
	5750 3050 6100 3050
Wire Wire Line
	7100 1250 7400 1250
Wire Wire Line
	7100 1350 7400 1350
Wire Bus Line
	5650 850  7500 850 
$Comp
L Connector:Conn_01x16_Female J11
U 1 1 60BD0212
P 9800 1750
F 0 "J11" H 9828 1726 50  0000 L CNN
F 1 "LCD Port" H 9828 1635 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x16_P2.54mm_Vertical" H 9800 1750 50  0001 C CNN
F 3 "~" H 9800 1750 50  0001 C CNN
	1    9800 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 60BD3EE7
P 9250 850
F 0 "RV1" V 9150 850 50  0000 C CNN
F 1 "10K" V 9250 850 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3386F_Vertical" H 9250 850 50  0001 C CNN
F 3 "~" H 9250 850 50  0001 C CNN
	1    9250 850 
	0    1    1    0   
$EndComp
Text GLabel 8900 1050 0    50   Input ~ 0
GND
Text GLabel 8900 1150 0    50   Input ~ 0
+5V
Wire Wire Line
	8900 1050 9000 1050
Wire Wire Line
	9100 850  9000 850 
Wire Wire Line
	9000 850  9000 1050
Connection ~ 9000 1050
Wire Wire Line
	9000 1050 9600 1050
Wire Wire Line
	8900 1150 9500 1150
Wire Wire Line
	9400 850  9500 850 
Wire Wire Line
	9500 850  9500 1150
Connection ~ 9500 1150
Wire Wire Line
	9500 1150 9600 1150
Wire Wire Line
	9250 1000 9250 1250
Wire Wire Line
	9250 1250 9600 1250
Text Label 9200 1350 0    50   ~ 0
v1pb1
Text Label 9200 1450 0    50   ~ 0
v1pb2
Text Label 9200 1550 0    50   ~ 0
v1pb3
Text Label 9200 2050 0    50   ~ 0
v1pb4
Text Label 9200 2150 0    50   ~ 0
v1pb5
Text Label 9200 2250 0    50   ~ 0
v1pb6
Text Label 9200 2350 0    50   ~ 0
v1pb7
Text GLabel 8900 2550 0    50   Input ~ 0
+5V
Text GLabel 8900 2650 0    50   Input ~ 0
GND
Wire Wire Line
	9500 2550 9600 2550
$Comp
L Device:R R14
U 1 1 60BF69A9
P 9150 2550
F 0 "R14" V 9050 2550 50  0000 C CNN
F 1 "0R" V 9150 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9080 2550 50  0001 C CNN
F 3 "~" H 9150 2550 50  0001 C CNN
	1    9150 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	8900 2550 9000 2550
Wire Wire Line
	9300 2550 9400 2550
Wire Wire Line
	9400 2550 9400 2450
Wire Wire Line
	9400 2450 9600 2450
Wire Wire Line
	8900 2650 9500 2650
Wire Wire Line
	9500 2550 9500 2650
Entry Wire Line
	9100 1450 9200 1350
Entry Wire Line
	9100 1550 9200 1450
Entry Wire Line
	9100 1650 9200 1550
Entry Wire Line
	9100 1950 9200 2050
Entry Wire Line
	9100 2050 9200 2150
Entry Wire Line
	9100 2150 9200 2250
Entry Wire Line
	9100 2250 9200 2350
Text GLabel 9400 1800 0    50   Input ~ 0
GND
Wire Wire Line
	9400 1800 9500 1800
Wire Wire Line
	9500 1800 9500 1750
Wire Wire Line
	9500 1650 9600 1650
Wire Wire Line
	9500 1750 9600 1750
Connection ~ 9500 1750
Wire Wire Line
	9500 1750 9500 1650
Wire Wire Line
	9500 1800 9500 1850
Wire Wire Line
	9500 1850 9600 1850
Connection ~ 9500 1800
Wire Wire Line
	9500 1850 9500 1950
Wire Wire Line
	9500 1950 9600 1950
Connection ~ 9500 1850
Wire Wire Line
	9600 2050 9200 2050
Wire Wire Line
	9600 2150 9200 2150
Wire Wire Line
	9600 2250 9200 2250
Wire Wire Line
	9600 2350 9200 2350
Wire Wire Line
	9200 1550 9600 1550
Wire Wire Line
	9200 1450 9600 1450
Wire Wire Line
	9200 1350 9600 1350
Text Label 6000 3900 0    50   ~ 0
v1pb0
$Comp
L Device:R R15
U 1 1 60C63461
P 6950 4350
F 0 "R15" V 6850 4350 50  0000 C CNN
F 1 "470" V 6950 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6880 4350 50  0001 C CNN
F 3 "~" H 6950 4350 50  0001 C CNN
	1    6950 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	7100 4350 7200 4350
$Comp
L Device:LED D4
U 1 1 60C6A184
P 7350 4350
F 0 "D4" H 7400 4200 50  0000 C CNN
F 1 "BLINK" H 7200 4200 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 7350 4350 50  0001 C CNN
F 3 "~" H 7350 4350 50  0001 C CNN
	1    7350 4350
	-1   0    0    1   
$EndComp
Text GLabel 7600 4350 2    50   Input ~ 0
GND
Wire Wire Line
	7500 4350 7600 4350
Entry Wire Line
	5900 3800 6000 3900
Wire Bus Line
	5900 3800 5900 3750
$Comp
L Connector:Conn_01x20_Female J12
U 1 1 60C83532
P 9800 4350
F 0 "J12" H 9828 4326 50  0000 L CNN
F 1 "VIA Ports" H 9828 4235 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 9800 4350 50  0001 C CNN
F 3 "~" H 9800 4350 50  0001 C CNN
	1    9800 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3900 6300 3900
Wire Wire Line
	6700 4350 6800 4350
Text Label 9300 3450 0    50   ~ 0
v1pa0
Wire Wire Line
	9300 3450 9600 3450
Text Label 9300 3550 0    50   ~ 0
v1pa1
Text Label 9300 3650 0    50   ~ 0
v1pa2
Text Label 9300 3750 0    50   ~ 0
v1pa3
Text Label 9300 3850 0    50   ~ 0
v1pa4
Text Label 9300 3950 0    50   ~ 0
v1pa5
Text Label 9300 4050 0    50   ~ 0
v1pa6
Text Label 9300 4150 0    50   ~ 0
v1pa7
Text Label 9300 4250 0    50   ~ 0
v1pa8
Text Label 9300 4350 0    50   ~ 0
v1pa9
Text Label 9300 4450 0    50   ~ 0
v1pb0
Text Label 9300 4550 0    50   ~ 0
v1pb1
Text Label 9300 4650 0    50   ~ 0
v1pb2
Text Label 9300 4750 0    50   ~ 0
v1pb3
Text Label 9300 4850 0    50   ~ 0
v1pb4
Text Label 9300 4950 0    50   ~ 0
v1pb5
Text Label 9300 5050 0    50   ~ 0
v1pb6
Text Label 9300 5150 0    50   ~ 0
v1pb7
Text Label 9300 5250 0    50   ~ 0
v1pb8
Text Label 9300 5350 0    50   ~ 0
v1pb9
Wire Wire Line
	9300 3550 9600 3550
Wire Wire Line
	9300 3650 9600 3650
Wire Wire Line
	9300 3750 9600 3750
Wire Wire Line
	9300 3850 9600 3850
Wire Wire Line
	9300 3950 9600 3950
Wire Wire Line
	9300 4050 9600 4050
Wire Wire Line
	9300 4150 9600 4150
Wire Wire Line
	9300 4250 9600 4250
Wire Wire Line
	9300 4350 9600 4350
Wire Wire Line
	9300 4450 9600 4450
Wire Wire Line
	9300 4550 9600 4550
Wire Wire Line
	9300 4650 9600 4650
Wire Wire Line
	9300 4750 9600 4750
Wire Wire Line
	9300 4850 9600 4850
Wire Wire Line
	9300 4950 9600 4950
Wire Wire Line
	9300 5050 9600 5050
Wire Wire Line
	9300 5150 9600 5150
Wire Wire Line
	9300 5250 9600 5250
Wire Wire Line
	9300 5350 9600 5350
Entry Wire Line
	9200 3350 9300 3450
Entry Wire Line
	9200 3450 9300 3550
Entry Wire Line
	9200 3550 9300 3650
Entry Wire Line
	9200 3650 9300 3750
Entry Wire Line
	9200 3750 9300 3850
Entry Wire Line
	9200 3850 9300 3950
Entry Wire Line
	9200 3950 9300 4050
Entry Wire Line
	9200 4050 9300 4150
Entry Wire Line
	9200 4150 9300 4250
Entry Wire Line
	9200 4250 9300 4350
Entry Wire Line
	9200 4350 9300 4450
Entry Wire Line
	9200 4450 9300 4550
Entry Wire Line
	9200 4550 9300 4650
Entry Wire Line
	9200 4650 9300 4750
Entry Wire Line
	9200 4750 9300 4850
Entry Wire Line
	9200 4850 9300 4950
Entry Wire Line
	9200 4950 9300 5050
Entry Wire Line
	9200 5050 9300 5150
Entry Wire Line
	9200 5150 9300 5250
Entry Wire Line
	9200 5250 9300 5350
Text GLabel 6300 3900 2    50   Output ~ 0
BLINK_OUT
Text GLabel 6700 4350 0    50   Input ~ 0
BLINK_IN
$Comp
L 74xx:74LS21 U?
U 2 1 60CF3975
P 2700 7050
AR Path="/60CF3975" Ref="U?"  Part="2" 
AR Path="/5F910E81/60CF3975" Ref="U9"  Part="2" 
F 0 "U9" H 2700 7425 50  0000 C CNN
F 1 "74HC21" H 2700 7334 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2700 7050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 2700 7050 50  0001 C CNN
	2    2700 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 7000 2400 7000
Wire Wire Line
	2300 6900 2400 6900
Text GLabel 3400 6850 0    50   Input ~ 0
~6502_CLK
$Comp
L 74xx:74LS08 U?
U 3 1 60CF3980
P 3800 6950
AR Path="/5F8F4E1E/60CF3980" Ref="U?"  Part="3" 
AR Path="/60CF3980" Ref="U?"  Part="2" 
AR Path="/5F910E81/60CF3980" Ref="U17"  Part="3" 
F 0 "U17" H 3800 7275 50  0000 C CNN
F 1 "74AC08" H 3800 7184 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3800 6950 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 3800 6950 50  0001 C CNN
	3    3800 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 6850 3500 6850
Wire Wire Line
	3000 7050 3500 7050
Text GLabel 2300 6900 0    50   Input ~ 0
6502_RDY
Text GLabel 2300 7000 0    50   Input ~ 0
IOCS
$Comp
L 74xx:74HC04 U20
U 1 1 60CFD709
P 1400 6950
F 0 "U20" H 1400 7267 50  0000 C CNN
F 1 "74AC04" H 1400 7176 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1400 6950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 1400 6950 50  0001 C CNN
	1    1400 6950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U20
U 7 1 60CFED37
P 5450 7000
F 0 "U20" H 5680 7046 50  0000 L CNN
F 1 "74AC04" H 5680 6955 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5450 7000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5450 7000 50  0001 C CNN
	7    5450 7000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U20
U 2 1 60CFFFD7
P 1400 7500
F 0 "U20" H 1400 7817 50  0000 C CNN
F 1 "74AC04" H 1400 7726 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1400 7500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 1400 7500 50  0001 C CNN
	2    1400 7500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U20
U 3 1 60D014BB
P 6600 5950
F 0 "U20" H 6600 6267 50  0000 C CNN
F 1 "74AC04" H 6600 6176 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6600 5950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6600 5950 50  0001 C CNN
	3    6600 5950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U20
U 4 1 60D01A1D
P 6600 6500
F 0 "U20" H 6600 6817 50  0000 C CNN
F 1 "74AC04" H 6600 6726 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6600 6500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6600 6500 50  0001 C CNN
	4    6600 6500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U20
U 5 1 60D03550
P 6600 7050
F 0 "U20" H 6600 7367 50  0000 C CNN
F 1 "74AC04" H 6600 7276 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6600 7050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6600 7050 50  0001 C CNN
	5    6600 7050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U20
U 6 1 60D0440D
P 6600 7600
F 0 "U20" H 6600 7917 50  0000 C CNN
F 1 "74AC04" H 6600 7826 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6600 7600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6600 7600 50  0001 C CNN
	6    6600 7600
	1    0    0    -1  
$EndComp
Text GLabel 1000 7500 0    50   Input ~ 0
~LATCH
Wire Wire Line
	1000 7500 1100 7500
Text GLabel 1000 6950 0    50   Input ~ 0
~WR
Wire Wire Line
	1000 6950 1100 6950
Wire Wire Line
	1700 6950 1800 6950
Wire Wire Line
	1800 6950 1800 7100
Wire Wire Line
	1800 7100 2400 7100
Wire Wire Line
	1700 7500 1800 7500
Wire Wire Line
	1800 7500 1800 7200
Wire Wire Line
	1800 7200 2400 7200
Text GLabel 6200 5950 0    50   Input ~ 0
GND
Wire Wire Line
	6200 5950 6300 5950
Text GLabel 6200 6500 0    50   Input ~ 0
GND
Text GLabel 6200 7050 0    50   Input ~ 0
GND
Text GLabel 6200 7600 0    50   Input ~ 0
GND
Wire Wire Line
	6200 6500 6300 6500
Wire Wire Line
	6200 7050 6300 7050
Wire Wire Line
	6200 7600 6300 7600
NoConn ~ 6900 5950
NoConn ~ 6900 6500
NoConn ~ 6900 7050
NoConn ~ 6900 7600
$Comp
L Device:C_Small C31
U 1 1 60DAA8E7
P 5100 7000
F 0 "C31" V 4871 7000 50  0000 C CNN
F 1 "0,1uF" V 4962 7000 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5100 7000 50  0001 C CNN
F 3 "~" H 5100 7000 50  0001 C CNN
	1    5100 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 6900 5100 6400
Wire Wire Line
	5100 6400 5450 6400
Wire Wire Line
	5450 6400 5450 6500
Wire Wire Line
	5100 7100 5100 7600
Wire Wire Line
	5100 7600 5450 7600
Wire Wire Line
	5450 7600 5450 7500
Text GLabel 5550 7600 2    50   Input ~ 0
GND
Text GLabel 5550 6400 2    50   Input ~ 0
+5V
Wire Wire Line
	5550 6400 5450 6400
Connection ~ 5450 6400
Wire Wire Line
	5550 7600 5450 7600
Connection ~ 5450 7600
$Comp
L 74xx:74HCT574 U21
U 1 1 60DE9676
P 1900 5500
F 0 "U21" H 1700 6200 50  0000 C CNN
F 1 "74AC574" H 2150 6200 50  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 1900 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT574" H 1900 5500 50  0001 C CNN
	1    1900 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 5900 1400 5900
Text GLabel 1200 6400 0    50   Input ~ 0
GND
Wire Wire Line
	1200 6400 1300 6400
Wire Wire Line
	1300 6400 1300 6000
Wire Wire Line
	1300 6000 1400 6000
Wire Wire Line
	1900 6300 1900 6400
Wire Wire Line
	1900 6400 1300 6400
Connection ~ 1300 6400
$Comp
L Device:C_Small C30
U 1 1 60E5ED64
P 2100 4600
F 0 "C30" V 1871 4600 50  0000 C CNN
F 1 "0,1uF" V 1962 4600 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2100 4600 50  0001 C CNN
F 3 "~" H 2100 4600 50  0001 C CNN
	1    2100 4600
	0    1    1    0   
$EndComp
Text GLabel 2300 4600 2    50   Input ~ 0
GND
Wire Wire Line
	2300 4600 2200 4600
Text GLabel 1900 4500 1    50   Input ~ 0
+5V
Wire Wire Line
	1900 4500 1900 4600
Wire Wire Line
	1900 4600 2000 4600
Wire Wire Line
	1900 4600 1900 4700
Connection ~ 1900 4600
Text Label 1250 5000 0    50   ~ 0
d0
Text Label 1250 5100 0    50   ~ 0
d1
Text Label 1250 5200 0    50   ~ 0
d2
Text Label 1250 5300 0    50   ~ 0
d3
Text Label 1250 5400 0    50   ~ 0
d4
Text Label 1250 5500 0    50   ~ 0
d5
Text Label 1250 5600 0    50   ~ 0
d6
Text Label 1250 5700 0    50   ~ 0
d7
Wire Wire Line
	1250 5700 1400 5700
Wire Wire Line
	1250 5600 1400 5600
Wire Wire Line
	1250 5500 1400 5500
Wire Wire Line
	1250 5400 1400 5400
Wire Wire Line
	1250 5300 1400 5300
Wire Wire Line
	1250 5200 1400 5200
Wire Wire Line
	1250 5100 1400 5100
Wire Wire Line
	1250 5000 1400 5000
Entry Wire Line
	1150 5600 1250 5700
Entry Wire Line
	1150 5500 1250 5600
Entry Wire Line
	1150 5400 1250 5500
Entry Wire Line
	1150 5300 1250 5400
Entry Wire Line
	1150 5200 1250 5300
Entry Wire Line
	1150 5100 1250 5200
Entry Wire Line
	1150 5000 1250 5100
Entry Wire Line
	1150 4900 1250 5000
Text GLabel 2500 5000 2    50   Output ~ 0
LATCH_Q0
Wire Wire Line
	2400 5000 2500 5000
Text GLabel 2500 5100 2    50   Output ~ 0
LATCH_Q1
Text GLabel 2500 5200 2    50   Output ~ 0
LATCH_Q2
Text GLabel 2500 5300 2    50   Output ~ 0
LATCH_Q3
Text GLabel 2500 5400 2    50   Output ~ 0
LATCH_Q4
Text GLabel 2500 5500 2    50   Output ~ 0
LATCH_Q5
Text GLabel 2500 5600 2    50   Output ~ 0
LATCH_Q6
Text GLabel 2500 5700 2    50   Output ~ 0
LATCH_Q7
Wire Wire Line
	2400 5100 2500 5100
Wire Wire Line
	2400 5200 2500 5200
Wire Wire Line
	2400 5300 2500 5300
Wire Wire Line
	2400 5400 2500 5400
Wire Wire Line
	2400 5500 2500 5500
Wire Wire Line
	2400 5600 2500 5600
Wire Wire Line
	2400 5700 2500 5700
Text GLabel 4300 6950 2    50   Output ~ 0
LATCH_CP
Text GLabel 1300 5900 0    50   Input ~ 0
LATCH_CP
$Comp
L Connector:TestPoint TP3
U 1 1 60FCC9CE
P 4200 6850
F 0 "TP3" H 4258 6968 50  0000 L CNN
F 1 "Latch_CP" H 4258 6877 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5005-5009_Compact" H 4400 6850 50  0001 C CNN
F 3 "~" H 4400 6850 50  0001 C CNN
	1    4200 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 6950 4200 6950
Wire Wire Line
	4200 6950 4200 6850
Connection ~ 4200 6950
Wire Wire Line
	4200 6950 4300 6950
Text Label 3200 2350 0    50   ~ 0
op2
Text Label 3200 2450 0    50   ~ 0
op4
Text Label 3200 2550 0    50   ~ 0
op6
Text Label 1600 2350 2    50   ~ 0
op3
Text Label 1600 2450 2    50   ~ 0
op5
Text Label 1600 2550 2    50   ~ 0
op7
Text Label 2900 1250 1    50   ~ 0
ip2
Text Label 2800 1250 1    50   ~ 0
ip6
Text Label 2700 1250 1    50   ~ 0
ip5
Text Label 2600 1250 1    50   ~ 0
ip4
Text Label 2200 1250 1    50   ~ 0
ip3
$Comp
L Connector_Generic:Conn_02x06_Odd_Even J13
U 1 1 60A20A5D
P 4100 3400
F 0 "J13" H 4150 3817 50  0000 C CNN
F 1 "Conn_02x06_Odd_Even" H 4150 3726 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x06_P2.54mm_Vertical" H 4100 3400 50  0001 C CNN
F 3 "~" H 4100 3400 50  0001 C CNN
	1    4100 3400
	-1   0    0    -1  
$EndComp
Text Label 3800 3200 2    50   ~ 0
ip2
Text Label 3800 3300 2    50   ~ 0
ip3
Text Label 3800 3400 2    50   ~ 0
ip4
Text Label 3800 3500 2    50   ~ 0
ip5
Text Label 3800 3600 2    50   ~ 0
ip6
Text Label 4300 3200 0    50   ~ 0
op2
Text Label 4300 3300 0    50   ~ 0
op3
Text Label 4300 3400 0    50   ~ 0
op4
Text Label 4300 3500 0    50   ~ 0
op5
Text Label 4300 3600 0    50   ~ 0
op6
Text Label 4300 3700 0    50   ~ 0
op7
Text GLabel 3700 3700 0    50   Input ~ 0
GND
Wire Wire Line
	3700 3700 3800 3700
Wire Bus Line
	7500 850  7500 1250
Wire Bus Line
	1350 650  2200 650 
Wire Bus Line
	7500 1350 7500 1650
Wire Bus Line
	7950 2050 7950 2750
Wire Bus Line
	9100 1450 9100 2250
Wire Bus Line
	1150 4900 1150 5600
Wire Bus Line
	1700 3350 2800 3350
Wire Bus Line
	9200 3350 9200 5250
Wire Bus Line
	5650 850  5650 2950
$EndSCHEMATC
