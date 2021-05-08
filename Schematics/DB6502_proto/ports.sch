EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
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
L Connector:Conn_01x40_Female J10
U 1 1 6014BD0C
P 4300 6200
F 0 "J10" H 4328 6176 50  0000 L CNN
F 1 "System Bus" H 4328 6085 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x40_P2.54mm_Vertical" H 4300 6200 50  0001 C CNN
F 3 "~" H 4300 6200 50  0001 C CNN
	1    4300 6200
	0    -1   -1   0   
$EndComp
Text Label 2400 6600 1    50   ~ 0
a0
Text Label 2500 6600 1    50   ~ 0
a1
Text Label 2600 6600 1    50   ~ 0
a2
Text Label 2700 6600 1    50   ~ 0
a3
Text Label 2800 6600 1    50   ~ 0
a4
Text Label 2900 6600 1    50   ~ 0
a5
Text Label 3000 6600 1    50   ~ 0
a6
Text Label 3100 6600 1    50   ~ 0
a7
Text Label 3200 6600 1    50   ~ 0
a8
Text Label 3300 6600 1    50   ~ 0
a9
Text Label 3400 6600 1    50   ~ 0
a10
Text Label 3500 6600 1    50   ~ 0
a11
Text Label 3600 6600 1    50   ~ 0
a12
Text Label 3700 6600 1    50   ~ 0
a13
Text Label 3800 6600 1    50   ~ 0
a14
Text Label 3900 6600 1    50   ~ 0
a15
Wire Wire Line
	2400 6600 2400 6400
Wire Wire Line
	2500 6600 2500 6400
Wire Wire Line
	2600 6600 2600 6400
Wire Wire Line
	2700 6600 2700 6400
Wire Wire Line
	2800 6600 2800 6400
Wire Wire Line
	2900 6600 2900 6400
Wire Wire Line
	3000 6600 3000 6400
Wire Wire Line
	3100 6600 3100 6400
Wire Wire Line
	3200 6600 3200 6400
Wire Wire Line
	3300 6600 3300 6400
Wire Wire Line
	3400 6600 3400 6400
Wire Wire Line
	3500 6600 3500 6400
Wire Wire Line
	3600 6600 3600 6400
Wire Wire Line
	3700 6600 3700 6400
Wire Wire Line
	3800 6600 3800 6400
Wire Wire Line
	3900 6600 3900 6400
Entry Wire Line
	2300 6700 2400 6600
Entry Wire Line
	2400 6700 2500 6600
Entry Wire Line
	2500 6700 2600 6600
Entry Wire Line
	2600 6700 2700 6600
Entry Wire Line
	2700 6700 2800 6600
Entry Wire Line
	2800 6700 2900 6600
Entry Wire Line
	2900 6700 3000 6600
Entry Wire Line
	3000 6700 3100 6600
Entry Wire Line
	3100 6700 3200 6600
Entry Wire Line
	3200 6700 3300 6600
Entry Wire Line
	3300 6700 3400 6600
Entry Wire Line
	3400 6700 3500 6600
Entry Wire Line
	3500 6700 3600 6600
Entry Wire Line
	3600 6700 3700 6600
Entry Wire Line
	3700 6700 3800 6600
Entry Wire Line
	3800 6700 3900 6600
Text GLabel 3800 6800 3    50   BiDi ~ 0
a[0..15]
Wire Bus Line
	3800 6800 3800 6700
Text Label 4000 6600 1    50   ~ 0
d0
Text Label 4100 6600 1    50   ~ 0
d1
Text Label 4200 6600 1    50   ~ 0
d2
Text Label 4300 6600 1    50   ~ 0
d3
Text Label 4400 6600 1    50   ~ 0
d4
Text Label 4500 6600 1    50   ~ 0
d5
Text Label 4600 6600 1    50   ~ 0
d6
Text Label 4700 6600 1    50   ~ 0
d7
Wire Wire Line
	4000 6600 4000 6400
Wire Wire Line
	4100 6600 4100 6400
Wire Wire Line
	4200 6600 4200 6400
Wire Wire Line
	4300 6600 4300 6400
Wire Wire Line
	4400 6600 4400 6400
Wire Wire Line
	4500 6600 4500 6400
Wire Wire Line
	4600 6600 4600 6400
Wire Wire Line
	4700 6600 4700 6400
Entry Wire Line
	3900 6700 4000 6600
Entry Wire Line
	4000 6700 4100 6600
Entry Wire Line
	4100 6700 4200 6600
Entry Wire Line
	4200 6700 4300 6600
Entry Wire Line
	4300 6700 4400 6600
Entry Wire Line
	4400 6700 4500 6600
Entry Wire Line
	4500 6700 4600 6600
Entry Wire Line
	4600 6700 4700 6600
Text GLabel 4600 6800 3    50   BiDi ~ 0
d[0..7]
Wire Bus Line
	4600 6800 4600 6700
Text Label 2750 1700 0    50   ~ 0
d0
Text Label 2750 1800 0    50   ~ 0
d1
Text Label 2750 1900 0    50   ~ 0
d2
Text Label 2750 2000 0    50   ~ 0
d3
Text Label 2750 2100 0    50   ~ 0
d4
Text Label 2750 2200 0    50   ~ 0
d5
Text Label 2750 2300 0    50   ~ 0
d6
Text Label 2750 2400 0    50   ~ 0
d7
Wire Wire Line
	2750 1700 3050 1700
Wire Wire Line
	2750 1800 3050 1800
Wire Wire Line
	2750 1900 3050 1900
Wire Wire Line
	2750 2000 3050 2000
Wire Wire Line
	2750 2100 3050 2100
Wire Wire Line
	2750 2200 3050 2200
Wire Wire Line
	2750 2300 3050 2300
Wire Wire Line
	2750 2400 3050 2400
Entry Wire Line
	2650 1600 2750 1700
Entry Wire Line
	2650 1700 2750 1800
Entry Wire Line
	2650 1800 2750 1900
Entry Wire Line
	2650 1900 2750 2000
Entry Wire Line
	2650 2000 2750 2100
Entry Wire Line
	2650 2100 2750 2200
Entry Wire Line
	2650 2200 2750 2300
Entry Wire Line
	2650 2300 2750 2400
Text GLabel 5750 1100 1    50   Input ~ 0
BE
Text GLabel 5600 1100 1    50   Input ~ 0
~IRQ
Text GLabel 5450 1100 1    50   Output ~ 0
~NMI
Text GLabel 5300 1100 1    50   Output ~ 0
~SO
Text GLabel 5150 1100 1    50   Input ~ 0
6502_CLK
Text GLabel 4850 1100 1    50   Input ~ 0
R~W
Wire Wire Line
	5150 2100 6850 2100
Wire Wire Line
	5150 1100 5150 2100
Wire Wire Line
	5300 2000 6850 2000
Wire Wire Line
	5300 1100 5300 2000
Wire Wire Line
	5450 1900 6850 1900
Wire Wire Line
	5450 1100 5450 1900
Wire Wire Line
	5600 1800 6850 1800
Wire Wire Line
	5600 1100 5600 1800
Wire Wire Line
	5750 1700 6850 1700
Wire Wire Line
	5750 1100 5750 1700
Wire Wire Line
	5900 1600 6850 1600
Wire Wire Line
	5900 1100 5900 1600
Wire Wire Line
	6050 1500 6850 1500
Wire Wire Line
	6050 1100 6050 1500
Wire Wire Line
	6200 1400 6850 1400
Wire Wire Line
	6200 1100 6200 1400
Wire Wire Line
	6350 1300 6350 1100
Wire Wire Line
	6350 1300 6850 1300
$Comp
L Connector:Conn_01x40_Female J2
U 1 1 60166003
P 7050 2900
F 0 "J2" H 7078 2876 50  0000 L CNN
F 1 "Controls" H 7078 2785 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x40_P2.54mm_Vertical" H 7050 2900 50  0001 C CNN
F 3 "~" H 7050 2900 50  0001 C CNN
	1    7050 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1100 6500 1200
Wire Wire Line
	6500 1200 6850 1200
Wire Wire Line
	5000 1100 5000 2200
Wire Wire Line
	5000 2200 6850 2200
Wire Wire Line
	4850 1100 4850 2300
Wire Wire Line
	4850 2300 6850 2300
$Comp
L Connector:Conn_01x40_Female J9
U 1 1 60200164
P 3250 2900
F 0 "J9" H 3278 2876 50  0000 L CNN
F 1 "I/O Bus" H 3278 2785 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x40_P2.54mm_Vertical" H 3250 2900 50  0001 C CNN
F 3 "~" H 3250 2900 50  0001 C CNN
	1    3250 2900
	1    0    0    -1  
$EndComp
Text Label 2850 1200 0    50   ~ 0
a0
Text Label 2850 1300 0    50   ~ 0
a1
Text Label 2850 1400 0    50   ~ 0
a2
Text Label 2850 1500 0    50   ~ 0
a3
Text Label 2850 1600 0    50   ~ 0
a4
Wire Wire Line
	2850 1600 3050 1600
Wire Wire Line
	2850 1500 3050 1500
Wire Wire Line
	2850 1400 3050 1400
Wire Wire Line
	2850 1300 3050 1300
Wire Wire Line
	2850 1200 3050 1200
Entry Wire Line
	2750 1100 2850 1200
Entry Wire Line
	2750 1200 2850 1300
Entry Wire Line
	2750 1300 2850 1400
Entry Wire Line
	2750 1400 2850 1500
Entry Wire Line
	2750 1500 2850 1600
Text GLabel 2400 2400 1    50   Input ~ 0
~VIA2
Text GLabel 2250 2400 1    50   Input ~ 0
~IOCS0
Text GLabel 2100 2400 1    50   Input ~ 0
~IOCS1
Text GLabel 1950 2400 1    50   Input ~ 0
~IOCS2
Text GLabel 1800 2400 1    50   Input ~ 0
~IOCS3
Wire Wire Line
	2400 2400 2400 2600
Wire Wire Line
	2400 2600 3050 2600
Wire Wire Line
	2250 2400 2250 2700
Wire Wire Line
	2250 2700 3050 2700
Wire Wire Line
	2100 2400 2100 2800
Wire Wire Line
	2100 2800 3050 2800
Wire Wire Line
	1950 2400 1950 2900
Wire Wire Line
	1950 2900 3050 2900
Wire Wire Line
	1800 2400 1800 3000
Wire Wire Line
	1800 3000 3050 3000
Wire Wire Line
	1650 2400 1650 3100
Wire Wire Line
	1650 3100 3050 3100
Wire Wire Line
	1500 2400 1500 3200
Wire Wire Line
	1500 3200 3050 3200
Wire Wire Line
	1350 2400 1350 3300
Wire Wire Line
	1350 3300 3050 3300
Wire Wire Line
	2550 2400 2550 2500
Wire Wire Line
	2550 2500 3050 2500
Text GLabel 1650 2400 1    50   Input ~ 0
~RD
Text GLabel 1500 2400 1    50   Input ~ 0
~WR
Wire Wire Line
	1050 2400 1050 3500
Wire Wire Line
	1050 3500 3050 3500
Wire Wire Line
	1200 2400 1200 3400
Wire Wire Line
	1200 3400 3050 3400
Text GLabel 4400 1100 1    50   Output ~ 0
EXRAM
Text GLabel 6400 6950 2    50   Input ~ 0
~RD
Text GLabel 6400 6800 2    50   Input ~ 0
~WR
Wire Wire Line
	6400 6950 6000 6950
Wire Wire Line
	6000 6950 6000 6400
Wire Wire Line
	6400 6800 6100 6800
Wire Wire Line
	6100 6800 6100 6400
Text GLabel 6400 6650 2    50   Input ~ 0
+5V
Text GLabel 6400 6500 2    50   Input ~ 0
GND
Wire Wire Line
	6400 6500 6300 6500
Wire Wire Line
	6300 6500 6300 6400
Wire Wire Line
	6200 6650 6200 6400
Wire Wire Line
	6200 6650 6400 6650
Text GLabel 6400 7550 2    50   Input ~ 0
6502_CLK
Wire Wire Line
	6400 7100 5900 7100
Wire Wire Line
	5900 7100 5900 6400
Text GLabel 6400 7100 2    50   Input ~ 0
R~W
Wire Wire Line
	6400 7250 5800 7250
Wire Wire Line
	5800 7250 5800 6400
Text GLabel 6400 7250 2    50   Input ~ 0
~6502_RES
Wire Wire Line
	6400 7400 5700 7400
Wire Wire Line
	5700 7400 5700 6400
Text GLabel 1200 2400 1    50   Input ~ 0
6502_CLK
Wire Wire Line
	1750 5000 1750 3800
Wire Wire Line
	1750 3800 3050 3800
Text GLabel 1350 2400 1    50   Input ~ 0
R~W
Wire Wire Line
	1600 5000 1600 3700
Wire Wire Line
	1600 3700 3050 3700
Text GLabel 1450 5000 3    50   Input ~ 0
~6502_RES
Wire Wire Line
	1450 5000 1450 3600
Wire Wire Line
	1450 3600 3050 3600
Text GLabel 6400 7400 2    50   Input ~ 0
SYNC
Wire Wire Line
	6400 7550 5600 7550
Wire Wire Line
	5600 7550 5600 6400
Text GLabel 4650 5000 3    50   Input ~ 0
RDY_M1F
Text GLabel 4750 5000 3    50   Input ~ 0
RDY_M2F
Text GLabel 4850 5000 3    50   Input ~ 0
WS_DISABLE
Text GLabel 4950 5000 3    50   Input ~ 0
DBG_WAIT
Text GLabel 5050 5000 3    50   Output ~ 0
6502_RDY
Wire Wire Line
	1900 5000 1900 3900
Wire Wire Line
	1900 3900 3050 3900
Wire Wire Line
	2050 5000 2050 4000
Wire Wire Line
	2050 4000 3050 4000
Wire Wire Line
	2150 5000 2150 4100
Wire Wire Line
	2150 4100 3050 4100
$Comp
L Device:R R2
U 1 1 60B17A68
P 9850 1000
F 0 "R2" H 9920 1046 50  0000 L CNN
F 1 "470" H 9920 955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 9780 1000 50  0001 C CNN
F 3 "~" H 9850 1000 50  0001 C CNN
	1    9850 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 60B19002
P 9850 1400
F 0 "D1" V 9889 1282 50  0000 R CNN
F 1 "PWR" V 9798 1282 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 9850 1400 50  0001 C CNN
F 3 "~" H 9850 1400 50  0001 C CNN
	1    9850 1400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9850 750  9850 850 
Wire Wire Line
	9850 1150 9850 1250
Wire Wire Line
	9850 1650 9850 1550
$Comp
L Connector:Conn_01x06_Male J7
U 1 1 5FB4D429
P 8800 5150
AR Path="/6014B4D9/5FB4D429" Ref="J7"  Part="1" 
AR Path="/5F8F4E1E/5FB4D429" Ref="J?"  Part="1" 
AR Path="/5F910E81/5FB4D429" Ref="J?"  Part="1" 
F 0 "J7" H 8900 5600 50  0000 C CNN
F 1 "UART A" H 8900 5500 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 8800 5150 50  0001 C CNN
F 3 "~" H 8800 5150 50  0001 C CNN
	1    8800 5150
	1    0    0    -1  
$EndComp
Text GLabel 9200 4850 2    50   Input ~ 0
GND
Text GLabel 9200 5250 2    50   Output ~ 0
UART_A_RxD
Wire Wire Line
	9200 5250 9000 5250
Text GLabel 9200 5350 2    50   Input ~ 0
UART_A_TxD
Wire Wire Line
	9200 5350 9000 5350
Wire Wire Line
	9000 4950 9100 4950
Wire Wire Line
	9100 4950 9100 4850
Wire Wire Line
	9100 4850 9200 4850
Text GLabel 9200 5000 2    50   Input ~ 0
UART_A_~RTS
Text GLabel 9200 5500 2    50   Output ~ 0
UART_A_~CTS
Wire Wire Line
	9200 5500 9100 5500
Wire Wire Line
	9100 5500 9100 5450
Wire Wire Line
	9100 5450 9000 5450
Wire Wire Line
	9100 5050 9100 5000
Wire Wire Line
	9100 5000 9200 5000
Wire Wire Line
	9000 5050 9100 5050
$Comp
L Connector:Conn_01x06_Male J8
U 1 1 5FB4D441
P 9900 5150
AR Path="/6014B4D9/5FB4D441" Ref="J8"  Part="1" 
AR Path="/5F8F4E1E/5FB4D441" Ref="J?"  Part="1" 
AR Path="/5F910E81/5FB4D441" Ref="J?"  Part="1" 
F 0 "J8" H 10000 5600 50  0000 C CNN
F 1 "UART B" H 10000 5500 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 9900 5150 50  0001 C CNN
F 3 "~" H 9900 5150 50  0001 C CNN
	1    9900 5150
	1    0    0    -1  
$EndComp
Text GLabel 10300 4850 2    50   Input ~ 0
GND
Text GLabel 10300 5250 2    50   Output ~ 0
UART_B_RxD
Wire Wire Line
	10300 5250 10100 5250
Text GLabel 10300 5350 2    50   Input ~ 0
UART_B_TxD
Wire Wire Line
	10300 5350 10100 5350
Wire Wire Line
	10100 4950 10200 4950
Wire Wire Line
	10200 4950 10200 4850
Wire Wire Line
	10200 4850 10300 4850
Text GLabel 10300 5000 2    50   Input ~ 0
UART_B_~RTS
Text GLabel 10300 5500 2    50   Output ~ 0
UART_B_~CTS
Wire Wire Line
	10300 5500 10200 5500
Wire Wire Line
	10200 5500 10200 5450
Wire Wire Line
	10200 5450 10100 5450
Wire Wire Line
	10200 5050 10200 5000
Wire Wire Line
	10200 5000 10300 5000
Wire Wire Line
	10100 5050 10200 5050
$Comp
L power:+5V #PWR?
U 1 1 5FC0FAA0
P 10700 750
AR Path="/5FC0FAA0" Ref="#PWR?"  Part="1" 
AR Path="/6014B4D9/5FC0FAA0" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 10700 600 50  0001 C CNN
F 1 "+5V" H 10715 923 50  0000 C CNN
F 2 "" H 10700 750 50  0001 C CNN
F 3 "" H 10700 750 50  0001 C CNN
	1    10700 750 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC0FAA6
P 10700 1650
AR Path="/5FC0FAA6" Ref="#PWR?"  Part="1" 
AR Path="/6014B4D9/5FC0FAA6" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 10700 1400 50  0001 C CNN
F 1 "GND" H 10705 1477 50  0000 C CNN
F 2 "" H 10700 1650 50  0001 C CNN
F 3 "" H 10700 1650 50  0001 C CNN
	1    10700 1650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10700 750  10600 750 
Wire Wire Line
	10600 1350 10600 1450
Connection ~ 10600 1450
Wire Wire Line
	10600 1450 10600 1650
Connection ~ 10600 950 
Wire Wire Line
	10600 950  10600 1050
Text GLabel 10500 950  0    50   Output ~ 0
+5V
Text GLabel 10500 1450 0    50   Output ~ 0
GND
Wire Wire Line
	10500 1450 10600 1450
Wire Wire Line
	10500 950  10600 950 
$Comp
L Device:CP C?
U 1 1 5FC0FAB6
P 10600 1200
AR Path="/5FC0FAB6" Ref="C?"  Part="1" 
AR Path="/6014B4D9/5FC0FAB6" Ref="C10"  Part="1" 
F 0 "C10" H 10718 1246 50  0000 L CNN
F 1 "10uF" H 10718 1155 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P1.50mm" H 10638 1050 50  0001 C CNN
F 3 "~" H 10600 1200 50  0001 C CNN
	1    10600 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 1650 10600 1650
Connection ~ 10600 1650
Wire Wire Line
	9850 750  10600 750 
Connection ~ 10600 750 
Wire Wire Line
	10600 750  10600 950 
Wire Wire Line
	10700 1650 10600 1650
$Comp
L Connector:Conn_01x06_Male J6
U 1 1 5FFB5039
P 9950 6050
AR Path="/6014B4D9/5FFB5039" Ref="J6"  Part="1" 
AR Path="/5F8F4E1E/5FFB5039" Ref="J?"  Part="1" 
F 0 "J6" H 10050 6500 50  0000 C CNN
F 1 "Debug UART" H 10050 6400 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 9950 6050 50  0001 C CNN
F 3 "~" H 9950 6050 50  0001 C CNN
	1    9950 6050
	1    0    0    -1  
$EndComp
Text GLabel 10250 5850 2    50   Input ~ 0
GND
Wire Wire Line
	10250 5850 10200 5850
Wire Wire Line
	10150 5950 10200 5950
Wire Wire Line
	10200 5950 10200 5850
Connection ~ 10200 5850
Wire Wire Line
	10200 5850 10150 5850
NoConn ~ 10150 6350
Wire Wire Line
	10250 6150 10150 6150
Wire Wire Line
	10250 6250 10150 6250
Text GLabel 10250 6250 2    50   Input ~ 0
DBG_TxD
Text GLabel 10250 6150 2    50   Output ~ 0
DBG_RxD
$Comp
L 6502:USB_B J4
U 1 1 5FFE872B
P 8450 3600
AR Path="/6014B4D9/5FFE872B" Ref="J4"  Part="1" 
AR Path="/5F8F4E1E/5FFE872B" Ref="J?"  Part="1" 
F 0 "J4" H 8450 4100 50  0000 C CNN
F 1 "Debug USB" H 8450 4000 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 8600 3550 50  0001 C CNN
F 3 "" H 8600 3550 50  0001 C CNN
	1    8450 3600
	1    0    0    -1  
$EndComp
NoConn ~ 8350 4000
Wire Wire Line
	8750 3700 8850 3700
Text GLabel 10250 3850 2    50   BiDi ~ 0
DBG_USBD-
Text GLabel 10250 3600 2    50   BiDi ~ 0
DBG_USBD+
$Comp
L Device:R R10
U 1 1 5FFE873E
P 10000 3850
AR Path="/6014B4D9/5FFE873E" Ref="R10"  Part="1" 
AR Path="/5F8F4E1E/5FFE873E" Ref="R?"  Part="1" 
F 0 "R10" V 10100 3850 50  0000 C CNN
F 1 "27" V 10000 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 9930 3850 50  0001 C CNN
F 3 "~" H 10000 3850 50  0001 C CNN
	1    10000 3850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R9
U 1 1 5FFE8744
P 10000 3600
AR Path="/6014B4D9/5FFE8744" Ref="R9"  Part="1" 
AR Path="/5F8F4E1E/5FFE8744" Ref="R?"  Part="1" 
F 0 "R9" V 10100 3600 50  0000 C CNN
F 1 "27" V 10000 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 9930 3600 50  0001 C CNN
F 3 "~" H 10000 3600 50  0001 C CNN
	1    10000 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10150 3850 10250 3850
Wire Wire Line
	10150 3600 10250 3600
Wire Wire Line
	8850 3700 8850 3850
$Comp
L Device:C_Small C11
U 1 1 5FFE874D
P 9300 4050
AR Path="/6014B4D9/5FFE874D" Ref="C11"  Part="1" 
AR Path="/5F8F4E1E/5FFE874D" Ref="C?"  Part="1" 
F 0 "C11" H 9392 4096 50  0000 L CNN
F 1 "47pF" H 9392 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 9300 4050 50  0001 C CNN
F 3 "~" H 9300 4050 50  0001 C CNN
	1    9300 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5FFE8753
P 9650 4050
AR Path="/6014B4D9/5FFE8753" Ref="C12"  Part="1" 
AR Path="/5F8F4E1E/5FFE8753" Ref="C?"  Part="1" 
F 0 "C12" H 9742 4096 50  0000 L CNN
F 1 "47pF" H 9742 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 9650 4050 50  0001 C CNN
F 3 "~" H 9650 4050 50  0001 C CNN
	1    9650 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3600 9300 3600
Wire Wire Line
	8850 3850 9650 3850
Text GLabel 10250 4250 2    50   Input ~ 0
GND
Wire Wire Line
	9300 3950 9300 3600
Connection ~ 9300 3600
Wire Wire Line
	9300 3600 9850 3600
Wire Wire Line
	9300 4150 9300 4250
Wire Wire Line
	9650 4250 9650 4150
Wire Wire Line
	9650 3950 9650 3850
Connection ~ 9650 3850
Wire Wire Line
	9650 3850 9850 3850
$Comp
L Connector:AVR-ISP-6 J3
U 1 1 600EABFA
P 10100 2450
AR Path="/6014B4D9/600EABFA" Ref="J3"  Part="1" 
AR Path="/5F8F4E1E/600EABFA" Ref="J?"  Part="1" 
F 0 "J3" H 10000 2550 50  0000 C CNN
F 1 "AVR ISP" H 10000 2450 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 9850 2500 50  0001 C CNN
F 3 " ~" H 8825 1900 50  0001 C CNN
	1    10100 2450
	1    0    0    -1  
$EndComp
Text GLabel 10100 2950 2    50   Input ~ 0
GND
Text GLabel 10100 1850 2    50   Input ~ 0
+5V
Text GLabel 10600 2550 2    50   Output ~ 0
~RES
Wire Wire Line
	10500 2550 10600 2550
Text Label 10650 2250 2    50   ~ 0
d6
Text Label 10650 2350 2    50   ~ 0
d5
Text Label 10650 2450 2    50   ~ 0
d7
Wire Wire Line
	10500 2450 10650 2450
Wire Wire Line
	10500 2350 10650 2350
Wire Wire Line
	10500 2250 10650 2250
Entry Wire Line
	10650 2350 10750 2250
Entry Wire Line
	10650 2250 10750 2150
Entry Wire Line
	10650 2450 10750 2350
Wire Wire Line
	10000 1850 10000 1950
Wire Wire Line
	10000 2850 10000 2950
Text GLabel 2550 2400 1    50   Input ~ 0
IOCS
Wire Wire Line
	10100 2950 10000 2950
Wire Wire Line
	10000 1850 10100 1850
Wire Wire Line
	10250 4250 9650 4250
Connection ~ 9300 4250
Connection ~ 9650 4250
Wire Wire Line
	9650 4250 9300 4250
NoConn ~ 10150 6050
NoConn ~ 9000 5150
NoConn ~ 10100 5150
Wire Wire Line
	8450 4000 8450 4250
$Comp
L Connector:Barrel_Jack J1
U 1 1 60416F76
P 8900 6050
F 0 "J1" H 8957 6375 50  0000 C CNN
F 1 "Power plug" H 8957 6284 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 8950 6010 50  0001 C CNN
F 3 "~" H 8950 6010 50  0001 C CNN
	1    8900 6050
	1    0    0    -1  
$EndComp
Text GLabel 9500 5950 2    50   Input ~ 0
+5V
Text GLabel 9500 6150 2    50   Input ~ 0
GND
Wire Wire Line
	9200 5950 9400 5950
$Comp
L power:PWR_FLAG #FLG01
U 1 1 60469558
P 9400 5950
F 0 "#FLG01" H 9400 6025 50  0001 C CNN
F 1 "PWR_FLAG" H 9400 6123 50  0000 C CNN
F 2 "" H 9400 5950 50  0001 C CNN
F 3 "~" H 9400 5950 50  0001 C CNN
	1    9400 5950
	1    0    0    -1  
$EndComp
Connection ~ 9400 5950
Wire Wire Line
	9400 5950 9500 5950
$Comp
L power:PWR_FLAG #FLG02
U 1 1 6046A445
P 9400 6150
F 0 "#FLG02" H 9400 6225 50  0001 C CNN
F 1 "PWR_FLAG" H 9400 6323 50  0000 C CNN
F 2 "" H 9400 6150 50  0001 C CNN
F 3 "~" H 9400 6150 50  0001 C CNN
	1    9400 6150
	-1   0    0    1   
$EndComp
Connection ~ 9400 6150
Wire Wire Line
	9400 6150 9500 6150
Wire Wire Line
	9200 6150 9400 6150
Wire Wire Line
	8450 4250 9300 4250
$Comp
L Device:R R7
U 1 1 604AB578
P 9000 3400
F 0 "R7" V 8900 3400 50  0000 C CNN
F 1 "4K7" V 9000 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8930 3400 50  0001 C CNN
F 3 "~" H 9000 3400 50  0001 C CNN
	1    9000 3400
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 604AC544
P 9500 3400
F 0 "R8" V 9400 3400 50  0000 C CNN
F 1 "10K" V 9500 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 9430 3400 50  0001 C CNN
F 3 "~" H 9500 3400 50  0001 C CNN
	1    9500 3400
	0    1    1    0   
$EndComp
Text GLabel 10250 3400 2    50   Input ~ 0
GND
Wire Wire Line
	9650 3400 10250 3400
Wire Wire Line
	9150 3400 9250 3400
Wire Wire Line
	8750 3400 8850 3400
Text GLabel 10250 3250 2    50   Output ~ 0
VBUS_SENSE
Wire Wire Line
	10250 3250 9250 3250
Wire Wire Line
	9250 3250 9250 3400
Connection ~ 9250 3400
Wire Wire Line
	9250 3400 9350 3400
Text GLabel 2850 900  1    50   Input ~ 0
GND
Text GLabel 2950 900  1    50   Input ~ 0
+5V
Wire Wire Line
	2950 900  2950 1000
Wire Wire Line
	2850 1100 3050 1100
Wire Wire Line
	2850 900  2850 1100
Wire Wire Line
	2950 1000 3050 1000
Text GLabel 1600 5000 3    50   Output ~ 0
~VIA2_IRQ
Text GLabel 1750 5000 3    50   Output ~ 0
~EXT_IRQ
Wire Wire Line
	2250 5000 2250 4200
Wire Wire Line
	2250 4200 3050 4200
Wire Wire Line
	2350 5000 2350 4300
Wire Wire Line
	2350 4300 3050 4300
Text GLabel 6650 900  1    50   Input ~ 0
GND
Text GLabel 6750 900  1    50   Input ~ 0
+5V
Wire Wire Line
	6750 900  6750 1000
Wire Wire Line
	6750 1000 6850 1000
Wire Wire Line
	6650 1100 6850 1100
Wire Wire Line
	6650 900  6650 1100
$Comp
L Connector_Generic:Conn_02x13_Odd_Even J5
U 1 1 606B3BDC
P 8650 1950
F 0 "J5" H 8700 2750 50  0000 C CNN
F 1 "JPR" H 8700 2650 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x13_P2.54mm_Vertical" H 8650 1950 50  0001 C CNN
F 3 "~" H 8650 1950 50  0001 C CNN
	1    8650 1950
	1    0    0    -1  
$EndComp
Text GLabel 9150 1950 2    50   Input ~ 0
WS_DISABLE
Text GLabel 8350 1250 1    50   Input ~ 0
~PLD_WR
Text GLabel 8200 1250 1    50   Input ~ 0
~PLD_RD
Text GLabel 9050 1250 1    50   Output ~ 0
~WR
Text GLabel 9200 1250 1    50   Output ~ 0
~RD
Text GLabel 8250 1750 0    50   Input ~ 0
IO16
Text GLabel 9150 1750 2    50   Output ~ 0
6502_RDY
Text GLabel 9150 1850 2    50   Input ~ 0
DBG_WAIT
Text GLabel 8250 1850 0    50   Output ~ 0
IO15
Text GLabel 8250 1950 0    50   Output ~ 0
IO14
Text GLabel 8250 2050 0    50   Output ~ 0
IO13
Text GLabel 9150 2050 2    50   Input ~ 0
RDY_M2F
Wire Wire Line
	9150 1850 8950 1850
Wire Wire Line
	9150 1750 8950 1750
Wire Wire Line
	8250 1850 8450 1850
Wire Wire Line
	8250 1750 8450 1750
Wire Wire Line
	8350 1250 8350 1350
Wire Wire Line
	8350 1350 8450 1350
Wire Wire Line
	8200 1250 8200 1450
Wire Wire Line
	8200 1450 8450 1450
Wire Wire Line
	9050 1250 9050 1350
Wire Wire Line
	9050 1350 8950 1350
Wire Wire Line
	9200 1250 9200 1450
Wire Wire Line
	9200 1450 8950 1450
Wire Wire Line
	9150 1950 8950 1950
Wire Wire Line
	9150 2050 8950 2050
Wire Wire Line
	8250 1950 8450 1950
Wire Wire Line
	8250 2050 8450 2050
Text GLabel 8250 2150 0    50   Output ~ 0
IN12
Text GLabel 9150 2150 2    50   Input ~ 0
RDY_M1F
Wire Wire Line
	9150 2150 8950 2150
Wire Wire Line
	8250 2150 8450 2150
Text GLabel 8250 1550 0    50   Input ~ 0
DBG_USB_RxD
Text GLabel 9150 1550 2    50   Output ~ 0
DBG_RxD
Wire Wire Line
	8250 1550 8450 1550
Wire Wire Line
	9150 1550 8950 1550
Text GLabel 8250 2250 0    50   Input ~ 0
CLK_1
Text GLabel 8250 2350 0    50   Input ~ 0
CLK_2
Text GLabel 8250 2450 0    50   Input ~ 0
CLK_4
Wire Wire Line
	8250 2250 8450 2250
Wire Wire Line
	8250 2350 8450 2350
Wire Wire Line
	8250 2450 8450 2450
Text GLabel 9150 2350 2    50   Output ~ 0
CLK
Wire Wire Line
	8950 2250 9050 2250
Wire Wire Line
	9050 2250 9050 2350
Wire Wire Line
	9050 2450 8950 2450
Wire Wire Line
	8950 2350 9050 2350
Connection ~ 9050 2350
Wire Wire Line
	9050 2350 9050 2450
Wire Wire Line
	9150 2350 9050 2350
Text GLabel 8250 1650 0    50   Input ~ 0
BLINK_OUT
Wire Wire Line
	8250 1650 8450 1650
Text GLabel 9150 1650 2    50   Output ~ 0
BLINK_IN
Wire Wire Line
	8950 1650 9150 1650
Text GLabel 5000 1100 1    50   Input ~ 0
~6502_CLK
Text GLabel 4700 1100 1    50   Output ~ 0
~WR
Text GLabel 4550 1100 1    50   Output ~ 0
~RD
Wire Wire Line
	6850 2400 4700 2400
Wire Wire Line
	4700 2400 4700 1100
Wire Wire Line
	4550 1100 4550 2500
Wire Wire Line
	4550 2500 6850 2500
Wire Wire Line
	6850 2600 4400 2600
Wire Wire Line
	7750 4950 7750 4850
Text GLabel 7750 4950 3    50   Input ~ 0
GND
Wire Wire Line
	7750 4550 7750 4450
$Comp
L Device:R R6
U 1 1 604F21BB
P 7750 4700
F 0 "R6" H 7680 4654 50  0000 R CNN
F 1 "4K7" H 7680 4745 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7680 4700 50  0001 C CNN
F 3 "~" H 7750 4700 50  0001 C CNN
	1    7750 4700
	-1   0    0    1   
$EndComp
Text GLabel 5350 5000 3    50   Input ~ 0
~PLD_WR
Text GLabel 5200 5000 3    50   Input ~ 0
~PLD_RD
Text GLabel 4100 5000 3    50   Input ~ 0
RAM2_~CS
Text GLabel 4100 1100 1    50   Input ~ 0
RAM1_~CS
Text GLabel 4250 1100 1    50   Input ~ 0
ROM_~CS
Text GLabel 4550 5000 3    50   Input ~ 0
IOCS
Wire Wire Line
	4400 1100 4400 2600
Text GLabel 7750 4450 1    50   Output ~ 0
EXRAM
Wire Wire Line
	4250 1100 4250 2700
Wire Wire Line
	4250 2700 6850 2700
Wire Wire Line
	4100 1100 4100 2800
Wire Wire Line
	4100 2800 6850 2800
Text GLabel 5500 5000 3    50   Input ~ 0
IO16
Text GLabel 5600 5000 3    50   Input ~ 0
IO15
Text GLabel 5700 5000 3    50   Input ~ 0
IO14
Text GLabel 5800 5000 3    50   Input ~ 0
IO13
Text GLabel 5900 5000 3    50   Output ~ 0
IN12
Wire Wire Line
	4100 5000 4100 2900
Wire Wire Line
	4100 2900 6850 2900
Wire Wire Line
	4250 5000 4250 3000
Wire Wire Line
	4250 3000 6850 3000
Wire Wire Line
	4400 5000 4400 3100
Wire Wire Line
	4400 3100 6850 3100
Wire Wire Line
	4550 5000 4550 3200
Wire Wire Line
	4550 3200 6850 3200
Wire Wire Line
	4650 5000 4650 3300
Wire Wire Line
	4650 3300 6850 3300
Wire Wire Line
	4750 5000 4750 3400
Wire Wire Line
	4750 3400 6850 3400
Wire Wire Line
	4850 5000 4850 3500
Wire Wire Line
	4850 3500 6850 3500
Wire Wire Line
	4950 5000 4950 3600
Wire Wire Line
	4950 3600 6850 3600
Wire Wire Line
	5050 5000 5050 3700
Wire Wire Line
	5050 3700 6850 3700
Wire Wire Line
	5200 5000 5200 3800
Wire Wire Line
	5200 3800 6850 3800
Wire Wire Line
	5350 5000 5350 3900
Wire Wire Line
	5350 3900 6850 3900
Wire Wire Line
	5500 5000 5500 4000
Wire Wire Line
	5500 4000 6850 4000
Wire Wire Line
	5600 5000 5600 4100
Wire Wire Line
	5600 4100 6850 4100
Wire Wire Line
	5700 5000 5700 4200
Wire Wire Line
	5700 4200 6850 4200
Text GLabel 1900 5000 3    50   Output ~ 0
~NMI
Text GLabel 6500 1100 1    50   Input ~ 0
~6502_RES
Text GLabel 6050 1100 1    50   Input ~ 0
~VP
Text GLabel 6200 1100 1    50   Input ~ 0
~ML
Text GLabel 6350 1100 1    50   Input ~ 0
SYNC
Text GLabel 1050 2400 1    50   Input ~ 0
~6502_CLK
Text GLabel 6400 7700 2    50   Input ~ 0
~6502_CLK
Wire Wire Line
	6400 7700 5500 7700
Wire Wire Line
	5500 7700 5500 6400
Text GLabel 5900 1100 1    50   Input ~ 0
6502_RDY_IN
Text GLabel 4250 5000 3    50   Input ~ 0
~UART
Text GLabel 4400 5000 3    50   Input ~ 0
~VIA1
Wire Wire Line
	5800 5000 5800 4300
Wire Wire Line
	5800 4300 6850 4300
Wire Wire Line
	5900 5000 5900 4400
Wire Wire Line
	5900 4400 6850 4400
Text GLabel 6000 5000 3    50   Input ~ 0
LATCH_CP
Wire Wire Line
	6000 5000 6000 4500
Wire Wire Line
	6000 4500 6850 4500
Text GLabel 8250 2550 0    50   Input ~ 0
LATCH_Q7
Wire Wire Line
	8250 2550 8450 2550
Text GLabel 9150 2550 2    50   Output ~ 0
EXRAM
Wire Wire Line
	8950 2550 9150 2550
Text GLabel 2750 5000 3    50   Input ~ 0
LATCH_Q7
Text GLabel 2650 5000 3    50   Input ~ 0
LATCH_Q6
Text GLabel 2550 5000 3    50   Input ~ 0
LATCH_Q5
Text GLabel 2450 5000 3    50   Input ~ 0
LATCH_Q4
Text GLabel 2350 5000 3    50   Input ~ 0
LATCH_Q3
Text GLabel 2250 5000 3    50   Input ~ 0
LATCH_Q2
Text GLabel 2150 5000 3    50   Input ~ 0
LATCH_Q1
Text GLabel 2050 5000 3    50   Input ~ 0
LATCH_Q0
Wire Wire Line
	2950 5000 2950 4900
Wire Wire Line
	2950 4900 3050 4900
Wire Wire Line
	2850 5000 2850 4800
Wire Wire Line
	2850 4800 3050 4800
Wire Wire Line
	2750 5000 2750 4700
Wire Wire Line
	2750 4700 3050 4700
Wire Wire Line
	2650 5000 2650 4600
Wire Wire Line
	2650 4600 3050 4600
Wire Wire Line
	2550 5000 2550 4500
Wire Wire Line
	2550 4500 3050 4500
Wire Wire Line
	2450 5000 2450 4400
Wire Wire Line
	2450 4400 3050 4400
Text GLabel 2850 5000 3    50   Input ~ 0
+5V
Text GLabel 2950 5000 3    50   Input ~ 0
GND
Text GLabel 4900 6800 3    50   Input ~ 0
RDY_M1F
Text GLabel 5000 6800 3    50   Input ~ 0
RDY_M2F
Wire Wire Line
	4800 6800 4800 6400
Wire Wire Line
	4900 6800 4900 6400
Text GLabel 4800 6800 3    50   Input ~ 0
6502_RDY
Wire Wire Line
	5000 6800 5000 6400
Text GLabel 5100 6800 3    50   Input ~ 0
SR_QE
Text GLabel 5200 6800 3    50   Input ~ 0
SR_QF
Text GLabel 5300 6800 3    50   Input ~ 0
SR_QG
Wire Wire Line
	5100 6800 5100 6400
Wire Wire Line
	5200 6800 5200 6400
Wire Wire Line
	5300 6800 5300 6400
Text GLabel 6200 5000 3    50   Input ~ 0
CLK_1
Text GLabel 6300 5000 3    50   Input ~ 0
CLK_2
Text GLabel 6400 5000 3    50   Input ~ 0
CLK_4
Wire Wire Line
	6400 5000 6400 4900
Wire Wire Line
	6400 4900 6850 4900
Wire Wire Line
	6300 5000 6300 4800
Wire Wire Line
	6300 4800 6850 4800
Wire Wire Line
	6200 5000 6200 4700
Wire Wire Line
	6200 4700 6850 4700
Wire Wire Line
	6100 5000 6100 4600
Wire Wire Line
	6100 4600 6850 4600
Text GLabel 6100 5000 3    50   Output ~ 0
EXT_BE
Text GLabel 5400 6800 3    50   Input ~ 0
BE
Wire Wire Line
	5400 6800 5400 6400
Wire Bus Line
	10750 2150 10750 2350
Wire Bus Line
	2750 1100 2750 1500
Wire Bus Line
	3900 6700 4600 6700
Wire Bus Line
	2650 1600 2650 2300
Wire Bus Line
	2300 6700 3800 6700
$EndSCHEMATC
