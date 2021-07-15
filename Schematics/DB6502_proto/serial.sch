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
L Device:C_Small C23
U 1 1 5F932BB1
P 2700 900
F 0 "C23" V 2471 900 50  0000 C CNN
F 1 "0,1uF" V 2562 900 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 2700 900 50  0001 C CNN
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
L Device:C_Small C24
U 1 1 5F93E98E
P 4150 1500
F 0 "C24" H 4058 1454 50  0000 R CNN
F 1 "22pF" H 4058 1545 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4150 1500 50  0001 C CNN
F 3 "~" H 4150 1500 50  0001 C CNN
	1    4150 1500
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C25
U 1 1 5F93F1BF
P 4150 2100
F 0 "C25" H 4058 2054 50  0000 R CNN
F 1 "22pF" H 4058 2145 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4150 2100 50  0001 C CNN
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
Text GLabel 2650 3900 2    50   Output ~ 0
UART_RES
Text GLabel 1750 3900 0    50   Input ~ 0
~6502_RES
Wire Wire Line
	1750 3900 1950 3900
Wire Wire Line
	2550 3900 2650 3900
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
L 6502:65C22S U17
U 1 1 60B5BF49
P 5950 2100
F 0 "U17" H 5950 3265 50  0000 C CNN
F 1 "65C22S" H 5950 3174 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 5950 3150 50  0001 C CNN
F 3 "" H 6050 2100 50  0001 C CNN
	1    5950 2100
	1    0    0    -1  
$EndComp
Text Label 6500 1900 0    50   ~ 0
d0
Text Label 6500 2000 0    50   ~ 0
d1
Text Label 6500 2100 0    50   ~ 0
d2
Text Label 6500 2200 0    50   ~ 0
d3
Text Label 6500 2300 0    50   ~ 0
d4
Text Label 6500 2400 0    50   ~ 0
d5
Text Label 6500 2500 0    50   ~ 0
d6
Text Label 6500 2600 0    50   ~ 0
d7
Entry Wire Line
	7200 1900 7300 2000
Entry Wire Line
	7200 2000 7300 2100
Entry Wire Line
	7200 2100 7300 2200
Entry Wire Line
	7200 2200 7300 2300
Entry Wire Line
	7200 2300 7300 2400
Entry Wire Line
	7200 2400 7300 2500
Entry Wire Line
	7200 2500 7300 2600
Entry Wire Line
	7200 2600 7300 2700
Wire Wire Line
	6450 1900 7200 1900
Wire Wire Line
	6450 2000 7200 2000
Wire Wire Line
	6450 2100 7200 2100
Wire Wire Line
	6450 2200 7200 2200
Wire Wire Line
	6450 2300 7200 2300
Wire Wire Line
	6450 2400 7200 2400
Wire Wire Line
	6450 2500 7200 2500
Wire Wire Line
	6450 2600 7200 2600
Wire Bus Line
	7300 2700 7350 2700
Text GLabel 7350 2700 2    50   Input ~ 0
d[0..7]
Text GLabel 6650 1800 2    50   Input ~ 0
~6502_RES
Wire Wire Line
	6450 1800 6650 1800
Text Label 6500 1700 0    50   ~ 0
a3
Text Label 6500 1600 0    50   ~ 0
a2
Text Label 6500 1500 0    50   ~ 0
a1
Text Label 6500 1400 0    50   ~ 0
a0
Entry Wire Line
	6750 1700 6850 1600
Entry Wire Line
	6750 1600 6850 1500
Entry Wire Line
	6750 1500 6850 1400
Entry Wire Line
	6750 1400 6850 1300
Wire Wire Line
	6450 1400 6750 1400
Wire Wire Line
	6450 1500 6750 1500
Wire Wire Line
	6450 1600 6750 1600
Wire Wire Line
	6450 1700 6750 1700
Wire Bus Line
	6850 1300 6900 1300
Text GLabel 6900 1300 2    50   Input ~ 0
a[0..15]
Text GLabel 6550 3200 3    50   Output ~ 0
~VIA1_IRQ
Wire Wire Line
	6450 3100 6550 3100
Wire Wire Line
	6550 3100 6550 3200
Text GLabel 6700 3200 3    50   Input ~ 0
R~W
Wire Wire Line
	6450 3000 6700 3000
Wire Wire Line
	6700 3000 6700 3200
Text GLabel 6850 3200 3    50   Input ~ 0
~VIA1
Wire Wire Line
	6850 3200 6850 2900
Wire Wire Line
	6850 2900 6450 2900
Wire Wire Line
	7000 3200 7000 2800
Wire Wire Line
	7000 2800 6450 2800
Text GLabel 7150 3200 3    50   Input ~ 0
SYS_CLK
Wire Wire Line
	6450 2700 7150 2700
Wire Wire Line
	7150 2700 7150 3200
Text GLabel 5250 3100 0    50   Input ~ 0
+5V
Wire Wire Line
	5250 3100 5350 3100
$Comp
L Device:C_Small C26
U 1 1 60B853CC
P 5150 3450
F 0 "C26" V 4921 3450 50  0000 C CNN
F 1 "0,1uF" V 5012 3450 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 5150 3450 50  0001 C CNN
F 3 "~" H 5150 3450 50  0001 C CNN
	1    5150 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 3450 5350 3450
Wire Wire Line
	5350 3450 5350 3100
Connection ~ 5350 3100
Wire Wire Line
	5350 3100 5450 3100
Text GLabel 5350 1100 1    50   Input ~ 0
GND
Wire Wire Line
	5350 1200 5450 1200
Text GLabel 4950 3450 0    50   Input ~ 0
GND
Wire Wire Line
	4950 3450 5050 3450
Text Label 5150 2100 0    50   ~ 0
v1pb0
Text Label 5150 2200 0    50   ~ 0
v1pb1
Text Label 5150 2300 0    50   ~ 0
v1pb2
Text Label 5150 2400 0    50   ~ 0
v1pb3
Text Label 5150 2500 0    50   ~ 0
v1pb4
Text Label 5150 2600 0    50   ~ 0
v1pb5
Text Label 5150 2700 0    50   ~ 0
v1pb6
Text Label 5150 2800 0    50   ~ 0
v1pb7
Text Label 5150 2900 0    50   ~ 0
v1pb8
Text Label 5150 3000 0    50   ~ 0
v1pb9
Wire Wire Line
	5350 1100 5350 1200
Text Label 5150 2000 0    50   ~ 0
v1pa7
Text Label 5150 1900 0    50   ~ 0
v1pa6
Text Label 5150 1800 0    50   ~ 0
v1pa5
Text Label 5150 1700 0    50   ~ 0
v1pa4
Text Label 5150 1600 0    50   ~ 0
v1pa3
Text Label 5150 1500 0    50   ~ 0
v1pa2
Text Label 5150 1400 0    50   ~ 0
v1pa1
Text Label 5150 1300 0    50   ~ 0
v1pa0
Text Label 6500 1200 0    50   ~ 0
v1pa8
Text Label 6500 1300 0    50   ~ 0
v1pa9
Entry Wire Line
	6750 1300 6850 1200
Entry Wire Line
	6750 1200 6850 1100
Entry Wire Line
	5000 2900 5100 3000
Entry Wire Line
	5000 2800 5100 2900
Entry Wire Line
	5000 2700 5100 2800
Entry Wire Line
	5000 2600 5100 2700
Entry Wire Line
	5000 2500 5100 2600
Entry Wire Line
	5000 2400 5100 2500
Entry Wire Line
	5000 2300 5100 2400
Entry Wire Line
	5000 2200 5100 2300
Entry Wire Line
	5000 2100 5100 2200
Entry Wire Line
	5000 2000 5100 2100
Entry Wire Line
	5000 1900 5100 2000
Entry Wire Line
	5000 1800 5100 1900
Entry Wire Line
	5000 1700 5100 1800
Entry Wire Line
	5000 1600 5100 1700
Entry Wire Line
	5000 1500 5100 1600
Entry Wire Line
	5000 1400 5100 1500
Entry Wire Line
	5000 1300 5100 1400
Entry Wire Line
	5000 1200 5100 1300
Wire Wire Line
	5100 1300 5450 1300
Wire Wire Line
	5100 1400 5450 1400
Wire Wire Line
	5100 1500 5450 1500
Wire Wire Line
	5100 1600 5450 1600
Wire Wire Line
	5100 1700 5450 1700
Wire Wire Line
	5100 1800 5450 1800
Wire Wire Line
	5100 1900 5450 1900
Wire Wire Line
	5100 2000 5450 2000
Wire Wire Line
	5100 2100 5450 2100
Wire Wire Line
	5100 2200 5450 2200
Wire Wire Line
	5100 2300 5450 2300
Wire Wire Line
	5100 2400 5450 2400
Wire Wire Line
	5100 2500 5450 2500
Wire Wire Line
	5100 2600 5450 2600
Wire Wire Line
	5100 2700 5450 2700
Wire Wire Line
	5100 2800 5450 2800
Wire Wire Line
	5100 2900 5450 2900
Wire Wire Line
	5100 3000 5450 3000
Wire Wire Line
	6450 1200 6750 1200
Wire Wire Line
	6450 1300 6750 1300
Wire Bus Line
	5000 800  6850 800 
$Comp
L Connector:Conn_01x16_Female J11
U 1 1 60BD0212
P 9150 1750
F 0 "J11" H 9178 1726 50  0000 L CNN
F 1 "LCD Port" H 9178 1635 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x16_P2.54mm_Vertical" H 9150 1750 50  0001 C CNN
F 3 "~" H 9150 1750 50  0001 C CNN
	1    9150 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 60BD3EE7
P 8600 850
F 0 "RV1" V 8500 850 50  0000 C CNN
F 1 "10K" V 8600 850 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3386F_Vertical" H 8600 850 50  0001 C CNN
F 3 "~" H 8600 850 50  0001 C CNN
	1    8600 850 
	0    1    1    0   
$EndComp
Text GLabel 8250 1050 0    50   Input ~ 0
GND
Text GLabel 8250 1150 0    50   Input ~ 0
+5V
Wire Wire Line
	8250 1050 8350 1050
Wire Wire Line
	8450 850  8350 850 
Wire Wire Line
	8350 850  8350 1050
Connection ~ 8350 1050
Wire Wire Line
	8350 1050 8950 1050
Wire Wire Line
	8250 1150 8850 1150
Wire Wire Line
	8750 850  8850 850 
Wire Wire Line
	8850 850  8850 1150
Connection ~ 8850 1150
Wire Wire Line
	8850 1150 8950 1150
Wire Wire Line
	8600 1000 8600 1250
Wire Wire Line
	8600 1250 8950 1250
Text Label 8550 1350 0    50   ~ 0
v1pb1
Text Label 8550 1450 0    50   ~ 0
v1pb2
Text Label 8550 1550 0    50   ~ 0
v1pb3
Text Label 8550 2050 0    50   ~ 0
v1pb4
Text Label 8550 2150 0    50   ~ 0
v1pb5
Text Label 8550 2250 0    50   ~ 0
v1pb6
Text Label 8550 2350 0    50   ~ 0
v1pb7
Text GLabel 8250 2550 0    50   Input ~ 0
+5V
Text GLabel 8250 2650 0    50   Input ~ 0
GND
Wire Wire Line
	8850 2550 8950 2550
$Comp
L Device:R R9
U 1 1 60BF69A9
P 8500 2550
F 0 "R9" V 8400 2550 50  0000 C CNN
F 1 "0R" V 8500 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8430 2550 50  0001 C CNN
F 3 "~" H 8500 2550 50  0001 C CNN
	1    8500 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 2550 8350 2550
Wire Wire Line
	8650 2550 8750 2550
Wire Wire Line
	8750 2550 8750 2450
Wire Wire Line
	8750 2450 8950 2450
Wire Wire Line
	8250 2650 8850 2650
Wire Wire Line
	8850 2550 8850 2650
Entry Wire Line
	8450 1450 8550 1350
Entry Wire Line
	8450 1550 8550 1450
Entry Wire Line
	8450 1650 8550 1550
Entry Wire Line
	8450 1950 8550 2050
Entry Wire Line
	8450 2050 8550 2150
Entry Wire Line
	8450 2150 8550 2250
Entry Wire Line
	8450 2250 8550 2350
Text GLabel 8750 1800 0    50   Input ~ 0
GND
Wire Wire Line
	8750 1800 8850 1800
Wire Wire Line
	8850 1800 8850 1750
Wire Wire Line
	8850 1650 8950 1650
Wire Wire Line
	8850 1750 8950 1750
Connection ~ 8850 1750
Wire Wire Line
	8850 1750 8850 1650
Wire Wire Line
	8850 1800 8850 1850
Wire Wire Line
	8850 1850 8950 1850
Connection ~ 8850 1800
Wire Wire Line
	8850 1850 8850 1950
Wire Wire Line
	8850 1950 8950 1950
Connection ~ 8850 1850
Wire Wire Line
	8950 2050 8550 2050
Wire Wire Line
	8950 2150 8550 2150
Wire Wire Line
	8950 2250 8550 2250
Wire Wire Line
	8950 2350 8550 2350
Wire Wire Line
	8550 1550 8950 1550
Wire Wire Line
	8550 1450 8950 1450
Wire Wire Line
	8550 1350 8950 1350
Text Label 8350 3250 0    50   ~ 0
v1pb0
$Comp
L Device:R R10
U 1 1 60C63461
P 8650 2900
F 0 "R10" V 8550 2900 50  0000 C CNN
F 1 "470" V 8650 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 8580 2900 50  0001 C CNN
F 3 "~" H 8650 2900 50  0001 C CNN
	1    8650 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	8800 2900 8900 2900
$Comp
L Device:LED D4
U 1 1 60C6A184
P 9050 2900
F 0 "D4" H 9100 2750 50  0000 C CNN
F 1 "BLINK" H 8900 2750 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9050 2900 50  0001 C CNN
F 3 "~" H 9050 2900 50  0001 C CNN
	1    9050 2900
	-1   0    0    1   
$EndComp
Text GLabel 9300 2900 2    50   Input ~ 0
GND
Wire Wire Line
	9200 2900 9300 2900
Entry Wire Line
	8250 3150 8350 3250
Wire Bus Line
	8250 3150 8250 3100
$Comp
L Connector:Conn_01x20_Female J12
U 1 1 60C83532
P 10400 1750
F 0 "J12" H 10428 1726 50  0000 L CNN
F 1 "VIA Ports" H 10428 1635 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 10400 1750 50  0001 C CNN
F 3 "~" H 10400 1750 50  0001 C CNN
	1    10400 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 3250 8650 3250
Wire Wire Line
	8400 2900 8500 2900
Text Label 9900 850  0    50   ~ 0
v1pa0
Wire Wire Line
	9900 850  10200 850 
Text Label 9900 950  0    50   ~ 0
v1pa1
Text Label 9900 1050 0    50   ~ 0
v1pa2
Text Label 9900 1150 0    50   ~ 0
v1pa3
Text Label 9900 1250 0    50   ~ 0
v1pa4
Text Label 9900 1350 0    50   ~ 0
v1pa5
Text Label 9900 1450 0    50   ~ 0
v1pa6
Text Label 9900 1550 0    50   ~ 0
v1pa7
Text Label 9900 1650 0    50   ~ 0
v1pa8
Text Label 9900 1750 0    50   ~ 0
v1pa9
Text Label 9900 1850 0    50   ~ 0
v1pb0
Text Label 9900 1950 0    50   ~ 0
v1pb1
Text Label 9900 2050 0    50   ~ 0
v1pb2
Text Label 9900 2150 0    50   ~ 0
v1pb3
Text Label 9900 2250 0    50   ~ 0
v1pb4
Text Label 9900 2350 0    50   ~ 0
v1pb5
Text Label 9900 2450 0    50   ~ 0
v1pb6
Text Label 9900 2550 0    50   ~ 0
v1pb7
Text Label 9900 2650 0    50   ~ 0
v1pb8
Text Label 9900 2750 0    50   ~ 0
v1pb9
Wire Wire Line
	9900 950  10200 950 
Wire Wire Line
	9900 1050 10200 1050
Wire Wire Line
	9900 1150 10200 1150
Wire Wire Line
	9900 1250 10200 1250
Wire Wire Line
	9900 1350 10200 1350
Wire Wire Line
	9900 1450 10200 1450
Wire Wire Line
	9900 1550 10200 1550
Wire Wire Line
	9900 1650 10200 1650
Wire Wire Line
	9900 1750 10200 1750
Wire Wire Line
	9900 1850 10200 1850
Wire Wire Line
	9900 1950 10200 1950
Wire Wire Line
	9900 2050 10200 2050
Wire Wire Line
	9900 2150 10200 2150
Wire Wire Line
	9900 2250 10200 2250
Wire Wire Line
	9900 2350 10200 2350
Wire Wire Line
	9900 2450 10200 2450
Wire Wire Line
	9900 2550 10200 2550
Wire Wire Line
	9900 2650 10200 2650
Wire Wire Line
	9900 2750 10200 2750
Entry Wire Line
	9800 750  9900 850 
Entry Wire Line
	9800 850  9900 950 
Entry Wire Line
	9800 950  9900 1050
Entry Wire Line
	9800 1050 9900 1150
Entry Wire Line
	9800 1150 9900 1250
Entry Wire Line
	9800 1250 9900 1350
Entry Wire Line
	9800 1350 9900 1450
Entry Wire Line
	9800 1450 9900 1550
Entry Wire Line
	9800 1550 9900 1650
Entry Wire Line
	9800 1650 9900 1750
Entry Wire Line
	9800 1750 9900 1850
Entry Wire Line
	9800 1850 9900 1950
Entry Wire Line
	9800 1950 9900 2050
Entry Wire Line
	9800 2050 9900 2150
Entry Wire Line
	9800 2150 9900 2250
Entry Wire Line
	9800 2250 9900 2350
Entry Wire Line
	9800 2350 9900 2450
Entry Wire Line
	9800 2450 9900 2550
Entry Wire Line
	9800 2550 9900 2650
Entry Wire Line
	9800 2650 9900 2750
Text GLabel 8650 3250 2    50   Output ~ 0
BLINK_OUT
Text GLabel 8400 2900 0    50   Input ~ 0
BLINK_IN
Text GLabel 6400 5300 0    50   Input ~ 0
~SYS_CLK
$Comp
L 74xx:74LS08 U?
U 1 1 60CF3980
P 8400 5650
AR Path="/5F8F4E1E/60CF3980" Ref="U?"  Part="3" 
AR Path="/60CF3980" Ref="U?"  Part="2" 
AR Path="/5F910E81/60CF3980" Ref="U15"  Part="1" 
F 0 "U15" H 8400 5975 50  0000 C CNN
F 1 "74AC08" H 8400 5884 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8400 5650 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 8400 5650 50  0001 C CNN
	1    8400 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5550 8100 5550
$Comp
L 74xx:74HC04 U18
U 1 1 60CFD709
P 6800 5750
F 0 "U18" H 6800 6067 50  0000 C CNN
F 1 "74AC04" H 6800 5976 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6800 5750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6800 5750 50  0001 C CNN
	1    6800 5750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U18
U 7 1 60CFED37
P 2250 7050
F 0 "U18" H 2250 7100 50  0000 C CNN
F 1 "74AC04" H 2250 7000 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2250 7050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2250 7050 50  0001 C CNN
	7    2250 7050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U18
U 2 1 60CFFFD7
P 6800 6300
F 0 "U18" H 6800 6617 50  0000 C CNN
F 1 "74AC04" H 6800 6526 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6800 6300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6800 6300 50  0001 C CNN
	2    6800 6300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U18
U 4 1 60D01A1D
P 3500 6450
F 0 "U18" H 3500 6767 50  0000 C CNN
F 1 "74AC04" H 3500 6676 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3500 6450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3500 6450 50  0001 C CNN
	4    3500 6450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U18
U 5 1 60D03550
P 3500 7000
F 0 "U18" H 3500 7317 50  0000 C CNN
F 1 "74AC04" H 3500 7226 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3500 7000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3500 7000 50  0001 C CNN
	5    3500 7000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U18
U 6 1 60D0440D
P 3500 7550
F 0 "U18" H 3500 7867 50  0000 C CNN
F 1 "74AC04" H 3500 7776 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3500 7550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3500 7550 50  0001 C CNN
	6    3500 7550
	1    0    0    -1  
$EndComp
Text GLabel 6400 6300 0    50   Input ~ 0
~LATCH
Wire Wire Line
	6400 6300 6500 6300
Text GLabel 6400 5750 0    50   Input ~ 0
~WR
Wire Wire Line
	6400 5750 6500 5750
Wire Wire Line
	7100 5750 7200 5750
Wire Wire Line
	7100 6300 7200 6300
Text GLabel 3100 6450 0    50   Input ~ 0
GND
Text GLabel 3100 7000 0    50   Input ~ 0
GND
Text GLabel 3100 7550 0    50   Input ~ 0
GND
Wire Wire Line
	3100 6450 3200 6450
Wire Wire Line
	3100 7000 3200 7000
Wire Wire Line
	3100 7550 3200 7550
NoConn ~ 3800 6450
NoConn ~ 3800 7000
NoConn ~ 3800 7550
$Comp
L Device:C_Small C29
U 1 1 60DAA8E7
P 1900 7050
F 0 "C29" V 1671 7050 50  0000 C CNN
F 1 "0,1uF" V 1762 7050 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1900 7050 50  0001 C CNN
F 3 "~" H 1900 7050 50  0001 C CNN
	1    1900 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 6950 1900 6450
Wire Wire Line
	1900 6450 2250 6450
Wire Wire Line
	2250 6450 2250 6550
Wire Wire Line
	1900 7150 1900 7650
Wire Wire Line
	1900 7650 2250 7650
Wire Wire Line
	2250 7650 2250 7550
Text GLabel 2350 7650 2    50   Input ~ 0
GND
Text GLabel 2350 6450 2    50   Input ~ 0
+5V
Wire Wire Line
	2350 6450 2250 6450
Connection ~ 2250 6450
Wire Wire Line
	2350 7650 2250 7650
Connection ~ 2250 7650
$Comp
L 74xx:74HCT574 U19
U 1 1 60DE9676
P 9950 5250
F 0 "U19" H 9750 5950 50  0000 C CNN
F 1 "74AC574" H 10200 5950 50  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 9950 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT574" H 9950 5250 50  0001 C CNN
	1    9950 5250
	1    0    0    -1  
$EndComp
Text GLabel 9250 6150 0    50   Input ~ 0
GND
Wire Wire Line
	9250 6150 9350 6150
Wire Wire Line
	9350 6150 9350 5750
Wire Wire Line
	9350 5750 9450 5750
Wire Wire Line
	9950 6050 9950 6150
Wire Wire Line
	9950 6150 9350 6150
Connection ~ 9350 6150
$Comp
L Device:C_Small C27
U 1 1 60E5ED64
P 10150 4350
F 0 "C27" V 9921 4350 50  0000 C CNN
F 1 "0,1uF" V 10012 4350 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 10150 4350 50  0001 C CNN
F 3 "~" H 10150 4350 50  0001 C CNN
	1    10150 4350
	0    1    1    0   
$EndComp
Text GLabel 10350 4350 2    50   Input ~ 0
GND
Wire Wire Line
	10350 4350 10250 4350
Text GLabel 9950 4250 1    50   Input ~ 0
+5V
Wire Wire Line
	9950 4250 9950 4350
Wire Wire Line
	9950 4350 10050 4350
Wire Wire Line
	9950 4350 9950 4450
Connection ~ 9950 4350
Text Label 9300 4750 0    50   ~ 0
d0
Text Label 9300 4850 0    50   ~ 0
d1
Text Label 9300 4950 0    50   ~ 0
d2
Text Label 9300 5050 0    50   ~ 0
d3
Text Label 9300 5150 0    50   ~ 0
d4
Text Label 9300 5250 0    50   ~ 0
d5
Text Label 9300 5350 0    50   ~ 0
d6
Text Label 9300 5450 0    50   ~ 0
d7
Wire Wire Line
	9300 5450 9450 5450
Wire Wire Line
	9300 5350 9450 5350
Wire Wire Line
	9300 5250 9450 5250
Wire Wire Line
	9300 5150 9450 5150
Wire Wire Line
	9300 5050 9450 5050
Wire Wire Line
	9300 4950 9450 4950
Wire Wire Line
	9300 4850 9450 4850
Wire Wire Line
	9300 4750 9450 4750
Entry Wire Line
	9200 5350 9300 5450
Entry Wire Line
	9200 5250 9300 5350
Entry Wire Line
	9200 5150 9300 5250
Entry Wire Line
	9200 5050 9300 5150
Entry Wire Line
	9200 4950 9300 5050
Entry Wire Line
	9200 4850 9300 4950
Entry Wire Line
	9200 4750 9300 4850
Entry Wire Line
	9200 4650 9300 4750
Text GLabel 10550 4750 2    50   Output ~ 0
LATCH_Q0
Wire Wire Line
	10450 4750 10550 4750
Text GLabel 10550 4850 2    50   Output ~ 0
LATCH_Q1
Text GLabel 10550 4950 2    50   Output ~ 0
LATCH_Q2
Text GLabel 10550 5050 2    50   Output ~ 0
LATCH_Q3
Text GLabel 10550 5150 2    50   Output ~ 0
LATCH_Q4
Text GLabel 10550 5250 2    50   Output ~ 0
LATCH_Q5
Text GLabel 10550 5350 2    50   Output ~ 0
LATCH_Q6
Text GLabel 10550 5450 2    50   Output ~ 0
EXRAM
Wire Wire Line
	10450 4850 10550 4850
Wire Wire Line
	10450 4950 10550 4950
Wire Wire Line
	10450 5050 10550 5050
Wire Wire Line
	10450 5150 10550 5150
Wire Wire Line
	10450 5250 10550 5250
Wire Wire Line
	10450 5350 10550 5350
Wire Wire Line
	10450 5450 10550 5450
$Comp
L Connector:TestPoint TP4
U 1 1 60FCC9CE
P 8800 5550
F 0 "TP4" H 8858 5668 50  0000 L CNN
F 1 "Latch_CP" H 8858 5577 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5005-5009_Compact" H 9000 5550 50  0001 C CNN
F 3 "~" H 9000 5550 50  0001 C CNN
	1    8800 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5650 8800 5650
Wire Wire Line
	8800 5650 8800 5550
Connection ~ 8800 5650
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
F 1 "UART GPIO" H 4150 3726 50  0000 C CNN
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
$Comp
L 74xx:74HC04 U18
U 3 1 6111F40B
P 2250 3900
F 0 "U18" H 2250 4217 50  0000 C CNN
F 1 "74AC04" H 2250 4126 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2250 3900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2250 3900 50  0001 C CNN
	3    2250 3900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U?
U 2 1 611D4C6E
P 7600 6000
AR Path="/5F8F4E1E/611D4C6E" Ref="U?"  Part="3" 
AR Path="/611D4C6E" Ref="U?"  Part="2" 
AR Path="/5F910E81/611D4C6E" Ref="U15"  Part="2" 
F 0 "U15" H 7600 6325 50  0000 C CNN
F 1 "74AC08" H 7600 6234 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7600 6000 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 7600 6000 50  0001 C CNN
	2    7600 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 6000 8000 6000
Wire Wire Line
	8000 6000 8000 5750
Wire Wire Line
	8000 5750 8100 5750
Wire Wire Line
	7200 6100 7300 6100
Wire Wire Line
	7200 5900 7300 5900
Wire Wire Line
	7200 5750 7200 5900
Wire Wire Line
	7200 6300 7200 6100
Wire Wire Line
	6400 5300 7300 5300
Wire Wire Line
	7300 5300 7300 5550
$Comp
L 74xx:74LS08 U?
U 5 1 6127A0A1
P 1200 7050
AR Path="/5F8F4E1E/6127A0A1" Ref="U?"  Part="3" 
AR Path="/6127A0A1" Ref="U?"  Part="2" 
AR Path="/5F910E81/6127A0A1" Ref="U15"  Part="5" 
F 0 "U15" H 1200 7100 50  0000 C CNN
F 1 "74AC08" H 1200 7000 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1200 7050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 1200 7050 50  0001 C CNN
	5    1200 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C28
U 1 1 6127B351
P 850 7050
F 0 "C28" V 621 7050 50  0000 C CNN
F 1 "0,1uF" V 712 7050 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 850 7050 50  0001 C CNN
F 3 "~" H 850 7050 50  0001 C CNN
	1    850  7050
	1    0    0    -1  
$EndComp
Text GLabel 1300 6450 2    50   Input ~ 0
+5V
Text GLabel 1300 7650 2    50   Input ~ 0
GND
Wire Wire Line
	1300 7650 1200 7650
Wire Wire Line
	1200 7650 1200 7550
Wire Wire Line
	1200 7650 850  7650
Wire Wire Line
	850  7650 850  7150
Connection ~ 1200 7650
Wire Wire Line
	1200 6550 1200 6450
Wire Wire Line
	1200 6450 1300 6450
Wire Wire Line
	1200 6450 850  6450
Wire Wire Line
	850  6450 850  6950
Connection ~ 1200 6450
Wire Wire Line
	8800 5650 9450 5650
Text GLabel 7000 3200 3    50   Input ~ 0
+5V
Wire Bus Line
	6850 800  6850 1200
Wire Bus Line
	1350 650  2200 650 
Wire Bus Line
	6850 1300 6850 1600
Wire Bus Line
	7300 2000 7300 2700
Wire Bus Line
	8450 1450 8450 2250
Wire Bus Line
	9200 4650 9200 5350
Wire Bus Line
	1700 3350 2800 3350
Wire Bus Line
	9800 750  9800 2650
Wire Bus Line
	5000 800  5000 2900
$EndSCHEMATC
