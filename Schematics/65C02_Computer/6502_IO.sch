EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "65C02 Hobby Computer"
Date "2020-02-17"
Rev "v001"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Based on Ben Eater's design"
Comment4 "Author: Dawid Buchwald"
$EndDescr
Text GLabel 7950 2500 3    50   Input ~ 0
+5V
Wire Wire Line
	7850 2400 7950 2400
Wire Wire Line
	7950 2400 7950 2500
Text GLabel 6750 1000 1    50   Input ~ 0
GND
Wire Wire Line
	6750 1000 6750 1100
Wire Wire Line
	6750 1100 6850 1100
NoConn ~ 6850 1700
NoConn ~ 6850 2100
NoConn ~ 6850 1500
Text GLabel 7950 1000 1    50   Input ~ 0
R~W
Wire Wire Line
	7950 1000 7950 1100
Wire Wire Line
	7950 1100 7850 1100
Text GLabel 8100 1000 1    50   Input ~ 0
CLK
Wire Wire Line
	8100 1000 8100 1200
Wire Wire Line
	8100 1200 7850 1200
Text Label 8400 2100 2    50   ~ 0
d0
Text Label 8400 2000 2    50   ~ 0
d1
Text Label 8400 1900 2    50   ~ 0
d2
Text Label 8400 1800 2    50   ~ 0
d3
Text Label 8400 1700 2    50   ~ 0
d4
Text Label 8400 1600 2    50   ~ 0
d5
Text Label 8400 1500 2    50   ~ 0
d6
Text Label 8400 1400 2    50   ~ 0
d7
Wire Wire Line
	7850 1400 8400 1400
Wire Wire Line
	7850 1500 8400 1500
Wire Wire Line
	7850 1600 8400 1600
Wire Wire Line
	7850 1700 8400 1700
Wire Wire Line
	7850 1800 8400 1800
Wire Wire Line
	7850 1900 8400 1900
Wire Wire Line
	7850 2000 8400 2000
Wire Wire Line
	7850 2100 8400 2100
Entry Wire Line
	8400 1400 8500 1300
Entry Wire Line
	8400 1500 8500 1400
Entry Wire Line
	8400 1600 8500 1500
Entry Wire Line
	8400 1700 8500 1600
Entry Wire Line
	8400 1800 8500 1700
Entry Wire Line
	8400 1900 8500 1800
Entry Wire Line
	8400 2000 8500 1900
Entry Wire Line
	8400 2100 8500 2000
Text Label 6700 1200 0    50   ~ 0
a10
Text GLabel 6450 1000 1    50   Input ~ 0
~IOCS
Wire Wire Line
	6450 1000 6450 1300
Wire Wire Line
	6450 1300 6850 1300
Wire Wire Line
	6850 1200 6700 1200
Entry Wire Line
	6600 1100 6700 1200
Text GLabel 6300 1000 1    50   Input ~ 0
~RES
Wire Wire Line
	6300 1000 6300 1400
Wire Wire Line
	6300 1400 6850 1400
Text GLabel 6750 1600 0    50   Input ~ 0
RS232CLK
Wire Wire Line
	6750 1600 6850 1600
Text Label 6700 2300 0    50   ~ 0
a0
Text Label 6700 2400 0    50   ~ 0
a1
Wire Wire Line
	6700 2400 6850 2400
Wire Wire Line
	6700 2300 6850 2300
Entry Wire Line
	6600 2400 6700 2300
Entry Wire Line
	6600 2500 6700 2400
Wire Bus Line
	6600 2400 6600 2500
Text GLabel 6750 2000 0    50   Output ~ 0
TxD
Wire Wire Line
	6850 2000 6750 2000
Text GLabel 6750 2150 0    50   Input ~ 0
RxD
Wire Wire Line
	6750 2150 6800 2150
Wire Wire Line
	6800 2150 6800 2200
Wire Wire Line
	6800 2200 6850 2200
Wire Bus Line
	6600 1000 6600 1100
Text GLabel 8250 1000 1    50   Output ~ 0
~AIRQ
Wire Wire Line
	7850 1300 8250 1300
Wire Wire Line
	8250 1300 8250 1000
Text GLabel 8100 2500 3    50   Input ~ 0
GND
Wire Wire Line
	7850 2300 8100 2300
Wire Wire Line
	8100 2300 8100 2500
Wire Wire Line
	7850 2200 8100 2200
Wire Wire Line
	8100 2200 8100 2300
Connection ~ 8100 2300
Text GLabel 6450 2350 3    50   BiDi ~ 0
~CTS
Text GLabel 6300 2350 3    50   BiDi ~ 0
~RTS
Wire Wire Line
	6450 2350 6450 1900
Wire Wire Line
	6450 1900 6850 1900
Wire Wire Line
	6300 2350 6300 1800
Wire Wire Line
	6300 1800 6850 1800
Text GLabel 5450 2200 3    50   Input ~ 0
~RES
Wire Wire Line
	5200 1900 5450 1900
Wire Wire Line
	5450 1900 5450 2200
Text GLabel 3650 1300 1    50   Input ~ 0
TxD
Text GLabel 4000 1300 1    50   Output ~ 0
RxD
Wire Wire Line
	4000 1300 4000 1400
Wire Wire Line
	4000 1400 4100 1400
Wire Wire Line
	3650 1300 3650 1700
Wire Wire Line
	3650 1700 4100 1700
NoConn ~ 5200 1400
Text GLabel 5600 2200 3    50   Input ~ 0
+5V
Wire Wire Line
	5600 2200 5600 1800
Wire Wire Line
	5600 1800 5200 1800
Text GLabel 5750 2200 3    50   Input ~ 0
GND
Wire Wire Line
	5750 2200 5750 1700
Wire Wire Line
	5750 1700 5200 1700
Text GLabel 3850 1300 1    50   BiDi ~ 0
~CTS
Wire Wire Line
	3850 1300 3850 1500
Wire Wire Line
	3850 1500 4100 1500
Text GLabel 3850 2200 3    50   BiDi ~ 0
~RTS
Wire Wire Line
	3850 2200 3850 1900
Wire Wire Line
	3850 1900 4100 1900
Text GLabel 3700 2200 3    50   Input ~ 0
GND
Wire Wire Line
	3700 2200 3700 1800
Wire Wire Line
	3700 1800 4100 1800
Wire Wire Line
	5200 2000 5300 2000
Wire Wire Line
	5300 2000 5300 1050
Wire Wire Line
	3750 1050 3750 1600
Wire Wire Line
	3750 1600 4100 1600
Text GLabel 4000 2200 3    50   BiDi ~ 0
USBD+
Text GLabel 5300 2200 3    50   BiDi ~ 0
USBD-
Wire Wire Line
	3750 1050 4800 1050
Wire Wire Line
	4000 2100 4100 2100
Wire Wire Line
	2350 1150 2350 1100
Text GLabel 2450 1350 2    50   BiDi ~ 0
USBD+
Text GLabel 2450 1450 2    50   BiDi ~ 0
USBD-
Wire Wire Line
	1450 1450 1550 1450
Wire Wire Line
	1550 1850 1550 1950
Wire Wire Line
	1950 1850 1950 1950
Wire Wire Line
	1950 1950 2350 1950
Wire Wire Line
	1550 1550 1550 1450
Wire Wire Line
	1950 1550 1950 1350
Wire Wire Line
	2350 1850 2350 1950
Wire Wire Line
	2350 1150 2350 1550
Connection ~ 2350 1150
Text GLabel 950  5400 3    50   Input ~ 0
+5V
Text GLabel 3200 5400 3    50   Input ~ 0
+5V
Wire Wire Line
	3200 5300 3300 5300
Text GLabel 2150 3300 1    50   Input ~ 0
~RES
Text GLabel 4400 3300 1    50   Input ~ 0
~RES
Wire Wire Line
	2050 4000 2150 4000
Wire Wire Line
	4300 4000 4400 4000
Text GLabel 2300 3300 1    50   Input ~ 0
CLK
Text GLabel 4550 3300 1    50   Input ~ 0
CLK
Text GLabel 3200 3300 1    50   Input ~ 0
GND
Text Label 4850 3600 2    50   ~ 0
a0
Text Label 4850 3700 2    50   ~ 0
a1
Text Label 4850 3800 2    50   ~ 0
a2
Text Label 4850 3900 2    50   ~ 0
a3
Wire Wire Line
	4300 3600 4850 3600
Wire Wire Line
	4300 3700 4850 3700
Wire Wire Line
	4300 3800 4850 3800
Wire Wire Line
	4300 3900 4850 3900
Entry Wire Line
	4850 3600 4950 3500
Entry Wire Line
	4850 3700 4950 3600
Entry Wire Line
	4850 3800 4950 3700
Entry Wire Line
	4850 3900 4950 3800
Text Label 4850 4100 2    50   ~ 0
d0
Text Label 4850 4200 2    50   ~ 0
d1
Text Label 4850 4300 2    50   ~ 0
d2
Text Label 4850 4400 2    50   ~ 0
d3
Text Label 4850 4500 2    50   ~ 0
d4
Text Label 4850 4600 2    50   ~ 0
d5
Text Label 4850 4700 2    50   ~ 0
d6
Text Label 4850 4800 2    50   ~ 0
d7
Wire Wire Line
	4300 4800 4850 4800
Wire Wire Line
	4300 4700 4850 4700
Wire Wire Line
	4300 4600 4850 4600
Wire Wire Line
	4300 4500 4850 4500
Wire Wire Line
	4300 4400 4850 4400
Wire Wire Line
	4300 4300 4850 4300
Wire Wire Line
	4300 4200 4850 4200
Wire Wire Line
	4300 4100 4850 4100
Entry Wire Line
	4850 4100 4950 4000
Entry Wire Line
	4850 4200 4950 4100
Entry Wire Line
	4850 4300 4950 4200
Entry Wire Line
	4850 4400 4950 4300
Entry Wire Line
	4850 4500 4950 4400
Entry Wire Line
	4850 4600 4950 4500
Entry Wire Line
	4850 4700 4950 4600
Entry Wire Line
	4850 4800 4950 4700
Text GLabel 2300 5400 3    50   Input ~ 0
R~W
Text GLabel 4550 5400 3    50   Input ~ 0
R~W
Text GLabel 2450 5400 3    50   Input ~ 0
~IOCS
Text GLabel 4700 5400 3    50   Input ~ 0
~IOCS
Text Label 4850 5000 2    50   ~ 0
a11
Wire Wire Line
	4850 5000 4300 5000
Entry Wire Line
	4850 5000 4950 4900
Text GLabel 950  3300 1    50   Input ~ 0
GND
Text Label 750  3500 0    50   ~ 0
v1pa0
Text Label 750  3600 0    50   ~ 0
v1pa1
Text Label 750  3700 0    50   ~ 0
v1pa2
Text Label 750  3800 0    50   ~ 0
v1pa3
Text Label 750  3900 0    50   ~ 0
v1pa4
Text Label 750  4000 0    50   ~ 0
v1pa5
Text Label 750  4100 0    50   ~ 0
v1pa6
Text Label 750  4200 0    50   ~ 0
v1pa7
Text Label 750  4300 0    50   ~ 0
v1pb0
Text Label 750  4400 0    50   ~ 0
v1pb1
Text Label 750  4500 0    50   ~ 0
v1pb2
Text Label 750  4600 0    50   ~ 0
v1pb3
Text Label 750  4700 0    50   ~ 0
v1pb4
Text Label 750  4800 0    50   ~ 0
v1pb5
Text Label 750  4900 0    50   ~ 0
v1pb6
Text Label 750  5000 0    50   ~ 0
v1pb7
Text Label 3000 3500 0    50   ~ 0
v2pa0
Text Label 3000 3600 0    50   ~ 0
v2pa1
Text Label 3000 3700 0    50   ~ 0
v2pa2
Text Label 3000 3800 0    50   ~ 0
v2pa3
Text Label 3000 3900 0    50   ~ 0
v2pa4
Text Label 3000 4000 0    50   ~ 0
v2pa5
Text Label 3000 4100 0    50   ~ 0
v2pa6
Text Label 3000 4200 0    50   ~ 0
v2pa7
Text Label 3000 4300 0    50   ~ 0
v2pb0
Text Label 3000 4400 0    50   ~ 0
v2pb1
Text Label 3000 4500 0    50   ~ 0
v2pb2
Text Label 3000 4600 0    50   ~ 0
v2pb3
Text Label 3000 4700 0    50   ~ 0
v2pb4
Text Label 3000 4800 0    50   ~ 0
v2pb5
Text Label 3000 4900 0    50   ~ 0
v2pb6
Text Label 3000 5000 0    50   ~ 0
v2pb7
Wire Wire Line
	950  5300 1050 5300
Wire Wire Line
	3000 3500 3300 3500
Wire Wire Line
	3000 3600 3300 3600
Wire Wire Line
	3000 3700 3300 3700
Wire Wire Line
	3000 3800 3300 3800
Wire Wire Line
	3000 3900 3300 3900
Wire Wire Line
	3000 4000 3300 4000
Wire Wire Line
	3000 4100 3300 4100
Wire Wire Line
	3000 4200 3300 4200
Wire Wire Line
	3000 4300 3300 4300
Wire Wire Line
	3000 4400 3300 4400
Wire Wire Line
	3000 4500 3300 4500
Wire Wire Line
	3000 4600 3300 4600
Wire Wire Line
	3000 4700 3300 4700
Wire Wire Line
	3000 4800 3300 4800
Wire Wire Line
	3000 4900 3300 4900
Wire Wire Line
	3000 5000 3300 5000
Wire Wire Line
	750  3500 1050 3500
Wire Wire Line
	750  3600 1050 3600
Wire Wire Line
	750  3700 1050 3700
Wire Wire Line
	750  3800 1050 3800
Wire Wire Line
	750  3900 1050 3900
Wire Wire Line
	750  4000 1050 4000
Wire Wire Line
	750  4100 1050 4100
Wire Wire Line
	750  4200 1050 4200
Wire Wire Line
	750  4300 1050 4300
Wire Wire Line
	750  4400 1050 4400
Wire Wire Line
	750  4500 1050 4500
Wire Wire Line
	750  4600 1050 4600
Wire Wire Line
	750  4700 1050 4700
Wire Wire Line
	750  4800 1050 4800
Wire Wire Line
	750  4900 1050 4900
Wire Wire Line
	750  5000 1050 5000
Wire Wire Line
	950  3300 950  3400
Wire Wire Line
	950  3400 1050 3400
Wire Wire Line
	3200 3300 3200 3400
Wire Wire Line
	3200 3400 3300 3400
Entry Wire Line
	650  3400 750  3500
Entry Wire Line
	650  3500 750  3600
Entry Wire Line
	650  3600 750  3700
Entry Wire Line
	650  3700 750  3800
Entry Wire Line
	650  3800 750  3900
Entry Wire Line
	650  3900 750  4000
Entry Wire Line
	650  4000 750  4100
Entry Wire Line
	650  4100 750  4200
Entry Wire Line
	650  4400 750  4300
Entry Wire Line
	650  4500 750  4400
Entry Wire Line
	650  4600 750  4500
Entry Wire Line
	650  4700 750  4600
Entry Wire Line
	650  4800 750  4700
Entry Wire Line
	650  4900 750  4800
Entry Wire Line
	650  5000 750  4900
Entry Wire Line
	650  5100 750  5000
Entry Wire Line
	2900 3400 3000 3500
Entry Wire Line
	2900 3500 3000 3600
Entry Wire Line
	2900 3600 3000 3700
Entry Wire Line
	2900 3700 3000 3800
Entry Wire Line
	2900 3800 3000 3900
Entry Wire Line
	2900 3900 3000 4000
Entry Wire Line
	2900 4000 3000 4100
Entry Wire Line
	2900 4100 3000 4200
Entry Wire Line
	2900 4400 3000 4300
Entry Wire Line
	2900 4500 3000 4400
Entry Wire Line
	2900 4600 3000 4500
Entry Wire Line
	2900 4700 3000 4600
Entry Wire Line
	2900 4800 3000 4700
Entry Wire Line
	2900 4900 3000 4800
Entry Wire Line
	2900 5000 3000 4900
Entry Wire Line
	2900 5100 3000 5000
Text GLabel 2150 5400 3    50   Output ~ 0
~V1IRQ
Text GLabel 4400 5400 3    50   Output ~ 0
~V2IRQ
Wire Wire Line
	2050 5300 2150 5300
Wire Wire Line
	2150 5300 2150 5400
Wire Wire Line
	2050 5200 2300 5200
Wire Wire Line
	2300 5200 2300 5400
Wire Wire Line
	2050 5100 2450 5100
Wire Wire Line
	2450 5100 2450 5400
Wire Wire Line
	4300 5300 4400 5300
Wire Wire Line
	4400 5300 4400 5400
Wire Wire Line
	4300 5200 4550 5200
Wire Wire Line
	4550 5200 4550 5400
Wire Wire Line
	4300 5100 4700 5100
Wire Wire Line
	4700 5100 4700 5400
Wire Wire Line
	4400 3300 4400 4000
Wire Wire Line
	4550 4900 4550 3300
Wire Wire Line
	4300 4900 4550 4900
Wire Wire Line
	2150 3300 2150 4000
Wire Wire Line
	2050 4900 2300 4900
Wire Wire Line
	950  5300 950  5400
Wire Wire Line
	3200 5400 3200 5300
Wire Bus Line
	4950 4900 4950 4800
Connection ~ 1950 1950
Wire Wire Line
	1950 1950 1550 1950
Wire Wire Line
	5200 2100 5300 2100
NoConn ~ 4100 2000
Wire Wire Line
	5200 1500 5400 1500
Wire Wire Line
	5400 1500 5400 1350
Wire Wire Line
	5200 1600 5700 1600
Wire Wire Line
	5700 1600 5700 1350
Wire Wire Line
	5300 950  5400 950 
Wire Wire Line
	5400 950  5400 1050
Wire Wire Line
	5000 950  4900 950 
Wire Wire Line
	4900 950  4900 1050
Connection ~ 4900 1050
Wire Wire Line
	4900 1050 5300 1050
Wire Wire Line
	4800 1050 4800 750 
Wire Wire Line
	4800 750  5000 750 
Connection ~ 4800 1050
Wire Wire Line
	4800 1050 4900 1050
Wire Wire Line
	5300 750  5700 750 
Wire Wire Line
	5700 750  5700 1050
Text GLabel 9400 900  1    50   Input ~ 0
+5V
Text GLabel 9400 1700 3    50   Input ~ 0
GND
Wire Wire Line
	9400 1700 9400 1600
Wire Wire Line
	9400 900  9400 1000
Text GLabel 9800 1300 2    50   Output ~ 0
RS232CLK
Wire Wire Line
	9700 1300 9800 1300
Wire Wire Line
	2950 1950 2950 1550
Wire Wire Line
	2950 1250 2950 1150
$Comp
L Connector:Mini-DIN-6 J6
U 1 1 5F701D58
P 9400 2500
F 0 "J6" H 9400 2867 50  0000 C CNN
F 1 "Mini-DIN-6" H 9400 2776 50  0000 C CNN
F 2 "65C02_Computer:mini_din-6" H 9400 2500 50  0001 C CNN
F 3 "http://service.powerdynamics.com/ec/Catalog17/Section%2011.pdf" H 9400 2500 50  0001 C CNN
	1    9400 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5F6AC848
P 2650 1150
F 0 "R12" V 2750 1150 50  0000 C CNN
F 1 "270" V 2650 1150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2580 1150 50  0001 C CNN
F 3 "~" H 2650 1150 50  0001 C CNN
	1    2650 1150
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D1
U 1 1 5F6AC13D
P 2950 1400
F 0 "D1" V 2989 1282 50  0000 R CNN
F 1 "PWR" V 2898 1282 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm_Clear" H 2950 1400 50  0001 C CNN
F 3 "~" H 2950 1400 50  0001 C CNN
	1    2950 1400
	0    -1   -1   0   
$EndComp
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 5F4F8D3E
P 9400 1300
AR Path="/5F4F8D3E" Ref="X?"  Part="1" 
AR Path="/5F14295C/5F4F8D3E" Ref="X2"  Part="1" 
F 0 "X2" H 9150 1350 50  0000 R CNN
F 1 "1.8432MHz" H 9150 1250 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 9850 950 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 9300 1300 50  0001 C CNN
	1    9400 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5F4BFCC3
P 5150 750
F 0 "R10" V 5250 750 50  0000 C CNN
F 1 "270" V 5150 750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5080 750 50  0001 C CNN
F 3 "~" H 5150 750 50  0001 C CNN
	1    5150 750 
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R11
U 1 1 5F4B3669
P 5150 950
F 0 "R11" V 5250 950 50  0000 C CNN
F 1 "270" V 5150 950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5080 950 50  0001 C CNN
F 3 "~" H 5150 950 50  0001 C CNN
	1    5150 950 
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D3
U 1 1 5F4A0458
P 5700 1200
F 0 "D3" V 5739 1083 50  0000 R CNN
F 1 "RX" V 5648 1083 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm_Clear" H 5700 1200 50  0001 C CNN
F 3 "~" H 5700 1200 50  0001 C CNN
	1    5700 1200
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D2
U 1 1 5F49EFBE
P 5400 1200
F 0 "D2" V 5439 1082 50  0000 R CNN
F 1 "TX" V 5348 1082 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm_Clear" H 5400 1200 50  0001 C CNN
F 3 "~" H 5400 1200 50  0001 C CNN
	1    5400 1200
	0    -1   -1   0   
$EndComp
$Comp
L 6502:65C22S U?
U 1 1 5F285E91
P 1550 4300
AR Path="/5F285E91" Ref="U?"  Part="1" 
AR Path="/5F14295C/5F285E91" Ref="U12"  Part="1" 
F 0 "U12" H 1550 5450 50  0000 C CNN
F 1 "65C22S" H 1550 5350 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 1650 4300 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c22.pdf" H 1650 4300 50  0001 C CNN
	1    1550 4300
	1    0    0    -1  
$EndComp
$Comp
L 6502:65C22S U?
U 1 1 5F285E8B
P 3800 4300
AR Path="/5F285E8B" Ref="U?"  Part="1" 
AR Path="/5F14295C/5F285E8B" Ref="U11"  Part="1" 
F 0 "U11" H 3800 5450 50  0000 C CNN
F 1 "65C22S" H 3800 5350 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 3900 4300 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c22.pdf" H 3900 4300 50  0001 C CNN
	1    3800 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F26EF26
P 2350 1700
AR Path="/5F26EF26" Ref="C?"  Part="1" 
AR Path="/5F14295C/5F26EF26" Ref="C8"  Part="1" 
F 0 "C8" H 2465 1746 50  0000 L CNN
F 1 "10nF" H 2465 1655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 2388 1550 50  0001 C CNN
F 3 "~" H 2350 1700 50  0001 C CNN
	1    2350 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F26EF13
P 1950 1700
AR Path="/5F26EF13" Ref="C?"  Part="1" 
AR Path="/5F14295C/5F26EF13" Ref="C9"  Part="1" 
F 0 "C9" H 2065 1746 50  0000 L CNN
F 1 "47pF" H 2065 1655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 1988 1550 50  0001 C CNN
F 3 "~" H 1950 1700 50  0001 C CNN
	1    1950 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F26EF0D
P 1550 1700
AR Path="/5F26EF0D" Ref="C?"  Part="1" 
AR Path="/5F14295C/5F26EF0D" Ref="C10"  Part="1" 
F 0 "C10" H 1665 1746 50  0000 L CNN
F 1 "47pF" H 1665 1655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 1588 1550 50  0001 C CNN
F 3 "~" H 1550 1700 50  0001 C CNN
	1    1550 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F26EEFF
P 2350 1100
AR Path="/5F26EEFF" Ref="#PWR?"  Part="1" 
AR Path="/5F14295C/5F26EEFF" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 2350 950 50  0001 C CNN
F 1 "+5V" H 2365 1273 50  0000 C CNN
F 2 "" H 2350 1100 50  0001 C CNN
F 3 "" H 2350 1100 50  0001 C CNN
	1    2350 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F26EEF9
P 2350 2050
AR Path="/5F26EEF9" Ref="#PWR?"  Part="1" 
AR Path="/5F14295C/5F26EEF9" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 2350 1800 50  0001 C CNN
F 1 "GND" H 2355 1877 50  0000 C CNN
F 2 "" H 2350 2050 50  0001 C CNN
F 3 "" H 2350 2050 50  0001 C CNN
	1    2350 2050
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B_Micro J?
U 1 1 5F26EEF2
P 5300 6800
AR Path="/5F26EEF2" Ref="J?"  Part="1" 
AR Path="/5F14295C/5F26EEF2" Ref="J3"  Part="1" 
F 0 "J3" H 5357 7267 50  0000 C CNN
F 1 "USB_B_Micro" H 5357 7176 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Molex-105017-0001" H 5450 6750 50  0001 C CNN
F 3 "~" H 5450 6750 50  0001 C CNN
	1    5300 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F203CE6
P 2150 1450
AR Path="/5F203CE6" Ref="R?"  Part="1" 
AR Path="/5F14295C/5F203CE6" Ref="R4"  Part="1" 
F 0 "R4" V 2250 1450 50  0000 C CNN
F 1 "27" V 2150 1450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2080 1450 50  0001 C CNN
F 3 "~" H 2150 1450 50  0001 C CNN
	1    2150 1450
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F203CE0
P 2150 1350
AR Path="/5F203CE0" Ref="R?"  Part="1" 
AR Path="/5F14295C/5F203CE0" Ref="R5"  Part="1" 
F 0 "R5" V 2050 1350 50  0000 C CNN
F 1 "27" V 2150 1350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2080 1350 50  0001 C CNN
F 3 "~" H 2150 1350 50  0001 C CNN
	1    2150 1350
	0    1    1    0   
$EndComp
$Comp
L 6502:FT230XS U?
U 1 1 5F203CBA
P 4650 1750
AR Path="/5F203CBA" Ref="U?"  Part="1" 
AR Path="/5F14295C/5F203CBA" Ref="U6"  Part="1" 
F 0 "U6" H 4650 2365 50  0000 C CNN
F 1 "FT230XS" H 4650 2274 50  0000 C CNN
F 2 "65C02_Computer:SSOP-16_3.9x4.9mm_P0.635mm_long_pads" H 4650 2250 50  0001 C CNN
F 3 "https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT230X.pdf" H 4650 1750 50  0001 C CNN
	1    4650 1750
	1    0    0    -1  
$EndComp
$Comp
L 6502:65C51N U?
U 1 1 5F1AD73D
P 7350 1750
AR Path="/5F1AD73D" Ref="U?"  Part="1" 
AR Path="/5F14295C/5F1AD73D" Ref="U5"  Part="1" 
F 0 "U5" H 7350 2650 50  0000 C CNN
F 1 "65C51N" H 7350 2550 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 7350 1750 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c51n.pdf" H 7350 1750 50  0001 C CNN
	1    7350 1750
	1    0    0    -1  
$EndComp
NoConn ~ 1050 5100
NoConn ~ 1050 5200
Wire Wire Line
	2300 4900 2300 3300
Text Label 2600 3600 2    50   ~ 0
a0
Text Label 2600 3700 2    50   ~ 0
a1
Text Label 2600 3800 2    50   ~ 0
a2
Text Label 2600 3900 2    50   ~ 0
a3
Wire Wire Line
	2050 3900 2600 3900
Wire Wire Line
	2050 3800 2600 3800
Wire Wire Line
	2050 3700 2600 3700
Wire Wire Line
	2050 3600 2600 3600
Entry Wire Line
	2600 3600 2700 3500
Entry Wire Line
	2600 3700 2700 3600
Entry Wire Line
	2600 3800 2700 3700
Entry Wire Line
	2600 3900 2700 3800
Text Label 2600 4100 2    50   ~ 0
d0
Text Label 2600 4200 2    50   ~ 0
d1
Text Label 2600 4300 2    50   ~ 0
d2
Text Label 2600 4400 2    50   ~ 0
d3
Text Label 2600 4500 2    50   ~ 0
d4
Text Label 2600 4600 2    50   ~ 0
d5
Text Label 2600 4700 2    50   ~ 0
d6
Text Label 2600 4800 2    50   ~ 0
d7
Wire Wire Line
	2050 4100 2600 4100
Wire Wire Line
	2050 4200 2600 4200
Wire Wire Line
	2050 4300 2600 4300
Wire Wire Line
	2050 4400 2600 4400
Wire Wire Line
	2050 4500 2600 4500
Wire Wire Line
	2050 4600 2600 4600
Wire Wire Line
	2050 4700 2600 4700
Wire Wire Line
	2050 4800 2600 4800
Entry Wire Line
	2600 4100 2700 4000
Entry Wire Line
	2600 4200 2700 4100
Entry Wire Line
	2600 4300 2700 4200
Entry Wire Line
	2600 4400 2700 4300
Entry Wire Line
	2600 4500 2700 4400
Entry Wire Line
	2600 4600 2700 4500
Entry Wire Line
	2600 4700 2700 4600
Entry Wire Line
	2600 4800 2700 4700
Text Label 2600 5000 2    50   ~ 0
a12
Wire Wire Line
	2600 5000 2050 5000
Entry Wire Line
	2600 5000 2700 4900
Wire Bus Line
	2700 4900 2700 4800
Text Label 2600 3500 2    50   ~ 0
v1pa9
Text Label 2600 3400 2    50   ~ 0
v1pa8
Wire Wire Line
	2050 3400 2600 3400
Wire Wire Line
	2050 3500 2600 3500
Entry Wire Line
	2600 3500 2700 3400
Entry Wire Line
	2600 3400 2700 3300
Text Label 4850 3500 2    50   ~ 0
v2pa9
Text Label 4850 3400 2    50   ~ 0
v2pa8
Wire Wire Line
	4300 3400 4850 3400
Wire Wire Line
	4300 3500 4850 3500
Entry Wire Line
	4850 3500 4950 3400
Entry Wire Line
	4850 3400 4950 3300
Text Label 3000 5100 0    50   ~ 0
v2pb8
Text Label 3000 5200 0    50   ~ 0
v2pb9
Wire Wire Line
	3000 5100 3300 5100
Wire Wire Line
	3000 5200 3300 5200
Entry Wire Line
	2900 5200 3000 5100
Entry Wire Line
	2900 5300 3000 5200
Wire Bus Line
	2900 3000 4950 3000
Wire Bus Line
	650  3000 2700 3000
$Comp
L Connector:Conn_01x16_Female J11
U 1 1 5FB15958
P 6000 4150
F 0 "J11" V 6050 4100 50  0000 L CNN
F 1 "LCD Connector" V 6050 3350 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x16_P2.54mm_Vertical" H 6000 4150 50  0001 C CNN
F 3 "~" H 6000 4150 50  0001 C CNN
	1    6000 4150
	1    0    0    -1  
$EndComp
Text GLabel 5400 3550 0    50   Input ~ 0
+5V
Text GLabel 5400 3450 0    50   Input ~ 0
GND
Text Label 5400 3750 0    50   ~ 0
v1pb1
Text Label 5400 3850 0    50   ~ 0
v1pb2
Text Label 5400 3950 0    50   ~ 0
v1pb3
Text Label 5400 4450 0    50   ~ 0
v1pb4
Text Label 5400 4550 0    50   ~ 0
v1pb5
Text Label 5400 4650 0    50   ~ 0
v1pb6
Text Label 5400 4750 0    50   ~ 0
v1pb7
Wire Wire Line
	5800 4350 5700 4350
Wire Wire Line
	5700 4350 5700 4250
Wire Wire Line
	5700 4050 5800 4050
Wire Wire Line
	5800 4150 5700 4150
Connection ~ 5700 4150
Wire Wire Line
	5700 4150 5700 4050
Wire Wire Line
	5800 4250 5700 4250
Connection ~ 5700 4250
Wire Wire Line
	5700 4250 5700 4200
Text GLabel 5400 4950 0    50   Input ~ 0
GND
Text GLabel 5400 4850 0    50   Input ~ 0
+5V
Text GLabel 5600 4200 0    50   Input ~ 0
GND
Wire Wire Line
	5600 4200 5700 4200
Connection ~ 5700 4200
Wire Wire Line
	5700 4200 5700 4150
Wire Wire Line
	5400 3450 5450 3450
Wire Wire Line
	5400 3550 5750 3550
Wire Wire Line
	5800 3750 5400 3750
Wire Wire Line
	5800 3850 5400 3850
Wire Wire Line
	5800 3950 5400 3950
Wire Wire Line
	5400 4450 5800 4450
Wire Wire Line
	5400 4550 5800 4550
Wire Wire Line
	5400 4650 5800 4650
Wire Wire Line
	5400 4750 5800 4750
Wire Wire Line
	5400 4850 5800 4850
Wire Wire Line
	5400 4950 5800 4950
Entry Wire Line
	5300 4350 5400 4450
Entry Wire Line
	5300 4450 5400 4550
Entry Wire Line
	5300 4550 5400 4650
Entry Wire Line
	5300 4650 5400 4750
Entry Wire Line
	5300 3850 5400 3750
Entry Wire Line
	5300 3950 5400 3850
Entry Wire Line
	5300 4050 5400 3950
$Comp
L Device:R_POT RV1
U 1 1 5FD119EF
P 5600 3250
F 0 "RV1" V 5500 3250 50  0000 C CNN
F 1 "10K" V 5600 3250 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_PT-10-V10_Vertical" H 5600 3250 50  0001 C CNN
F 3 "~" H 5600 3250 50  0001 C CNN
	1    5600 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	5450 3250 5450 3450
Connection ~ 5450 3450
Wire Wire Line
	5450 3450 5800 3450
Wire Wire Line
	5750 3250 5750 3550
Connection ~ 5750 3550
Wire Wire Line
	5750 3550 5800 3550
Wire Wire Line
	5600 3400 5600 3650
Wire Wire Line
	5600 3650 5800 3650
Text Label 6500 3000 0    50   ~ 0
v2pa0
Text Label 6500 3100 0    50   ~ 0
v2pa1
Text Label 6500 3200 0    50   ~ 0
v2pa2
Text Label 6500 3300 0    50   ~ 0
v2pa3
Text Label 6500 3400 0    50   ~ 0
v2pa4
Text Label 6500 3500 0    50   ~ 0
v2pa5
Text Label 6500 3600 0    50   ~ 0
v2pa6
Text Label 6500 3700 0    50   ~ 0
v2pa7
Text Label 6500 3800 0    50   ~ 0
v2pa8
Text Label 6500 3900 0    50   ~ 0
v2pa9
$Comp
L Connector:Conn_01x12_Male J9
U 1 1 5FD88768
P 7000 3500
F 0 "J9" H 7050 4150 50  0000 L CNN
F 1 "VIA2PA" V 6950 3250 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 7000 3500 50  0001 C CNN
F 3 "~" H 7000 3500 50  0001 C CNN
	1    7000 3500
	-1   0    0    -1  
$EndComp
Text GLabel 6500 4100 0    50   Input ~ 0
+5V
Text GLabel 6500 4000 0    50   Input ~ 0
GND
Wire Wire Line
	6500 3900 6800 3900
Wire Wire Line
	6500 3800 6800 3800
Wire Wire Line
	6500 3700 6800 3700
Wire Wire Line
	6500 3600 6800 3600
Wire Wire Line
	6500 3500 6800 3500
Wire Wire Line
	6500 3400 6800 3400
Wire Wire Line
	6500 3300 6800 3300
Wire Wire Line
	6500 3200 6800 3200
Wire Wire Line
	6500 3100 6800 3100
Wire Wire Line
	6500 3000 6800 3000
Entry Wire Line
	6400 2900 6500 3000
Entry Wire Line
	6400 2900 6500 3000
Entry Wire Line
	6400 3000 6500 3100
Entry Wire Line
	6400 3100 6500 3200
Entry Wire Line
	6400 3200 6500 3300
Entry Wire Line
	6400 3300 6500 3400
Entry Wire Line
	6400 3400 6500 3500
Entry Wire Line
	6400 3500 6500 3600
Entry Wire Line
	6400 3600 6500 3700
Entry Wire Line
	6400 3700 6500 3800
Entry Wire Line
	6400 3800 6500 3900
$Comp
L Connector:Conn_01x12_Male J10
U 1 1 5FEAF969
P 7000 4900
F 0 "J10" H 7050 5550 50  0000 L CNN
F 1 "VIA2PB" V 6950 4650 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 7000 4900 50  0001 C CNN
F 3 "~" H 7000 4900 50  0001 C CNN
	1    7000 4900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6500 4000 6800 4000
Wire Wire Line
	6500 4100 6800 4100
Text GLabel 6500 5400 0    50   Input ~ 0
GND
Text GLabel 6500 5500 0    50   Input ~ 0
+5V
Wire Wire Line
	6500 5500 6800 5500
Wire Wire Line
	6500 5400 6800 5400
Text Label 6500 4400 0    50   ~ 0
v2pb0
Text Label 6500 4500 0    50   ~ 0
v2pb1
Text Label 6500 4600 0    50   ~ 0
v2pb2
Text Label 6500 4700 0    50   ~ 0
v2pb3
Text Label 6500 4800 0    50   ~ 0
v2pb4
Text Label 6500 4900 0    50   ~ 0
v2pb5
Text Label 6500 5000 0    50   ~ 0
v2pb6
Text Label 6500 5100 0    50   ~ 0
v2pb7
Text Label 6500 5200 0    50   ~ 0
v2pb8
Text Label 6500 5300 0    50   ~ 0
v2pb9
Wire Wire Line
	6500 4400 6800 4400
Wire Wire Line
	6500 4500 6800 4500
Wire Wire Line
	6500 4600 6800 4600
Wire Wire Line
	6500 4700 6800 4700
Wire Wire Line
	6500 4800 6800 4800
Wire Wire Line
	6500 4900 6800 4900
Wire Wire Line
	6500 5000 6800 5000
Wire Wire Line
	6500 5100 6800 5100
Wire Wire Line
	6500 5200 6800 5200
Wire Wire Line
	6500 5300 6800 5300
Entry Wire Line
	6400 4300 6500 4400
Entry Wire Line
	6400 4400 6500 4500
Entry Wire Line
	6400 4500 6500 4600
Entry Wire Line
	6400 4600 6500 4700
Entry Wire Line
	6400 4700 6500 4800
Entry Wire Line
	6400 4800 6500 4900
Entry Wire Line
	6400 4900 6500 5000
Entry Wire Line
	6400 5000 6500 5100
Entry Wire Line
	6400 5100 6500 5200
Entry Wire Line
	6400 5200 6500 5300
Text GLabel 9800 2400 2    50   Output ~ 0
KBCLK
Text GLabel 9800 2600 2    50   Output ~ 0
KBDAT
Text GLabel 9800 2500 2    50   Input ~ 0
GND
Text GLabel 9000 2500 0    50   Input ~ 0
+5V
Wire Wire Line
	9000 2500 9100 2500
Wire Wire Line
	9700 2500 9800 2500
Wire Wire Line
	9700 2400 9800 2400
Wire Wire Line
	9700 2600 9800 2600
NoConn ~ 9100 2400
NoConn ~ 9100 2600
Text GLabel 8150 3250 1    50   Input ~ 0
+5V
Text GLabel 8150 5650 3    50   Input ~ 0
GND
Text GLabel 7450 3650 0    50   Input ~ 0
~RES
Text Label 9050 3650 2    50   ~ 0
v1pa0
Text Label 9050 3750 2    50   ~ 0
v1pa1
Text Label 9050 3850 2    50   ~ 0
v1pa2
Text Label 9050 3950 2    50   ~ 0
v1pa3
Text Label 9050 4050 2    50   ~ 0
v1pa4
Text Label 9050 4150 2    50   ~ 0
v1pa5
Text Label 9050 4250 2    50   ~ 0
v1pa6
Text Label 9050 4350 2    50   ~ 0
v1pa7
Entry Wire Line
	9050 3650 9150 3550
Entry Wire Line
	9050 3750 9150 3650
Entry Wire Line
	9050 3850 9150 3750
Entry Wire Line
	9050 3950 9150 3850
Entry Wire Line
	9050 4050 9150 3950
Entry Wire Line
	9050 4150 9150 4050
Entry Wire Line
	9050 4250 9150 4150
Entry Wire Line
	9050 4350 9150 4250
Wire Wire Line
	8750 3650 9050 3650
Wire Wire Line
	8750 3750 9050 3750
Wire Wire Line
	8750 3850 9050 3850
Wire Wire Line
	8750 3950 9050 3950
Wire Wire Line
	8750 4050 9050 4050
Wire Wire Line
	8750 4150 9050 4150
Wire Wire Line
	8750 4250 9050 4250
Wire Wire Line
	8750 4350 9050 4350
Text GLabel 8950 5250 3    50   Input ~ 0
KBDAT
$Comp
L MCU_Microchip_ATtiny:ATtiny4313-PU U10
U 1 1 5E5D2E2B
P 8150 4450
F 0 "U10" H 8150 4350 50  0000 C CNN
F 1 "ATtiny4313-PU" H 8150 4450 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket" H 8150 4450 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc8246.pdf" H 8150 4450 50  0001 C CNN
	1    8150 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 3650 7550 3650
Wire Wire Line
	8750 4750 8850 4750
Text GLabel 8850 5250 3    50   Input ~ 0
KBCLK
NoConn ~ 7550 3850
NoConn ~ 7550 4050
Text Label 9200 4650 2    50   ~ 0
v1pa8
Text Label 9200 4850 2    50   ~ 0
v1pa9
Wire Wire Line
	8850 5250 8850 4750
Wire Wire Line
	8950 5250 8950 4550
Wire Wire Line
	8750 4550 8950 4550
Wire Wire Line
	8750 4650 9200 4650
Wire Wire Line
	8750 4850 9200 4850
Wire Wire Line
	8150 5650 8150 5550
Wire Wire Line
	8150 3250 8150 3350
Entry Wire Line
	9200 4650 9300 4750
Entry Wire Line
	9200 4850 9300 4950
Wire Bus Line
	9300 4950 9300 4750
NoConn ~ 8750 4950
NoConn ~ 8750 5050
NoConn ~ 8750 5150
Text GLabel 800  7600 2    50   Input ~ 0
a[0..15]
Text Label 800  5950 0    50   ~ 0
a0
Text Label 800  6050 0    50   ~ 0
a1
Text Label 800  6150 0    50   ~ 0
a2
Text Label 800  6250 0    50   ~ 0
a3
Text Label 800  6350 0    50   ~ 0
a4
Text Label 800  6450 0    50   ~ 0
a5
Text Label 800  6550 0    50   ~ 0
a6
Text Label 800  6650 0    50   ~ 0
a7
Text Label 800  6750 0    50   ~ 0
a8
Text Label 800  6850 0    50   ~ 0
a9
Text Label 800  6950 0    50   ~ 0
a10
Text Label 800  7050 0    50   ~ 0
a11
Entry Wire Line
	700  6050 800  5950
Entry Wire Line
	700  6150 800  6050
Entry Wire Line
	700  6250 800  6150
Entry Wire Line
	700  6350 800  6250
Entry Wire Line
	700  6450 800  6350
Entry Wire Line
	700  6550 800  6450
Entry Wire Line
	700  6650 800  6550
Entry Wire Line
	700  6750 800  6650
Entry Wire Line
	700  6850 800  6750
Entry Wire Line
	700  6950 800  6850
Entry Wire Line
	700  7050 800  6950
Entry Wire Line
	700  7150 800  7050
Text Label 800  7150 0    50   ~ 0
a12
Text Label 800  7250 0    50   ~ 0
a13
Text Label 800  7350 0    50   ~ 0
a14
Text Label 800  7450 0    50   ~ 0
a15
Entry Wire Line
	700  7250 800  7150
Entry Wire Line
	700  7350 800  7250
Entry Wire Line
	700  7450 800  7350
Entry Wire Line
	700  7550 800  7450
Wire Bus Line
	700  7600 800  7600
Text Label 1350 7450 0    50   ~ 0
d7
Text Label 1350 7350 0    50   ~ 0
d6
Text Label 1350 7250 0    50   ~ 0
d5
Text Label 1350 7150 0    50   ~ 0
d4
Text Label 1350 7050 0    50   ~ 0
d3
Text Label 1350 6950 0    50   ~ 0
d2
Text Label 1350 6850 0    50   ~ 0
d1
Text Label 1350 6750 0    50   ~ 0
d0
Entry Wire Line
	1350 6750 1250 6850
Entry Wire Line
	1350 6850 1250 6950
Entry Wire Line
	1350 6950 1250 7050
Entry Wire Line
	1350 7050 1250 7150
Entry Wire Line
	1350 7150 1250 7250
Entry Wire Line
	1350 7250 1250 7350
Entry Wire Line
	1350 7350 1250 7450
Entry Wire Line
	1350 7450 1250 7550
Text GLabel 1350 7600 2    50   Input ~ 0
d[0..7]
Wire Bus Line
	1250 7600 1350 7600
$Comp
L Device:LED D4
U 1 1 5E6EE4AE
P 6150 5950
F 0 "D4" H 6189 5832 50  0000 R CNN
F 1 "BLINK" H 6098 5832 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm_Clear" H 6150 5950 50  0001 C CNN
F 3 "~" H 6150 5950 50  0001 C CNN
	1    6150 5950
	-1   0    0    1   
$EndComp
Text Label 5250 5950 0    50   ~ 0
v1pb0
Entry Wire Line
	5150 5850 5250 5950
Wire Bus Line
	5150 5850 5150 5750
Text GLabel 6400 5950 2    50   Input ~ 0
GND
$Comp
L Device:R R9
U 1 1 5E7595AF
P 5750 5950
F 0 "R9" V 5850 5950 50  0000 C CNN
F 1 "270" V 5750 5950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5680 5950 50  0001 C CNN
F 3 "~" H 5750 5950 50  0001 C CNN
	1    5750 5950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2350 1150 2500 1150
Wire Wire Line
	2800 1150 2950 1150
Wire Wire Line
	2950 1950 2350 1950
Connection ~ 2350 1950
Wire Wire Line
	5250 5950 5600 5950
Wire Wire Line
	5900 5950 6000 5950
Wire Wire Line
	6300 5950 6400 5950
$Comp
L Connector:Conn_01x06_Female J2
U 1 1 5E4D0B3D
P 2050 6100
F 0 "J2" H 2078 6076 50  0000 L CNN
F 1 "Optional UART Port" H 2078 5985 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 2050 6100 50  0001 C CNN
F 3 "~" H 2050 6100 50  0001 C CNN
	1    2050 6100
	1    0    0    -1  
$EndComp
Text GLabel 1750 6000 0    50   Output ~ 0
RxD
Text GLabel 1750 5900 0    50   Input ~ 0
TxD
Text GLabel 1550 6100 0    50   BiDi ~ 0
~RTS
Text GLabel 1750 6200 0    50   BiDi ~ 0
~CTS
Text GLabel 1750 6400 0    50   Input ~ 0
+5V
Text GLabel 1550 6300 0    50   Input ~ 0
GND
Wire Wire Line
	1750 5900 1850 5900
Wire Wire Line
	1750 6000 1850 6000
Wire Wire Line
	1550 6100 1850 6100
Wire Wire Line
	1750 6200 1850 6200
Wire Wire Line
	1550 6300 1850 6300
Wire Wire Line
	1750 6400 1850 6400
$Comp
L Connector:Barrel_Jack J5
U 1 1 5E59BEED
P 2050 7100
F 0 "J5" H 2107 7425 50  0000 C CNN
F 1 "Power Connector" H 2107 7334 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 2100 7060 50  0001 C CNN
F 3 "~" H 2100 7060 50  0001 C CNN
	1    2050 7100
	1    0    0    -1  
$EndComp
Text GLabel 2450 7000 2    50   Input ~ 0
+5V
Text GLabel 2450 7200 2    50   Input ~ 0
GND
Wire Wire Line
	2450 7200 2350 7200
Wire Wire Line
	2450 7000 2350 7000
$Comp
L 6502:USB_B J4
U 1 1 5E5D8CF6
P 4200 6800
F 0 "J4" H 4257 7267 50  0000 C CNN
F 1 "USB_B" H 4257 7176 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 4350 6750 50  0001 C CNN
F 3 " ~" H 4350 6750 50  0001 C CNN
	1    4200 6800
	1    0    0    -1  
$EndComp
Text GLabel 4200 7300 3    50   Input ~ 0
GND
Text GLabel 4600 6800 2    50   BiDi ~ 0
PUSBD+
Text GLabel 4600 6900 2    50   BiDi ~ 0
PUSBD-
NoConn ~ 4100 7200
Wire Wire Line
	4200 7300 4200 7200
Wire Wire Line
	4500 6900 4600 6900
Wire Wire Line
	4500 6800 4600 6800
Wire Wire Line
	4500 6600 4600 6600
Wire Wire Line
	4000 2100 4000 2200
Wire Wire Line
	5300 2100 5300 2200
Wire Wire Line
	1450 1350 1950 1350
Connection ~ 1950 1350
Wire Wire Line
	1950 1350 2000 1350
Wire Wire Line
	2300 1350 2450 1350
Wire Wire Line
	2450 1450 2300 1450
Wire Wire Line
	2000 1450 1550 1450
Connection ~ 1550 1450
Text GLabel 6550 6600 2    50   Input ~ 0
+5V
Text GLabel 5300 7300 3    50   Input ~ 0
GND
NoConn ~ 5200 7200
Wire Wire Line
	5700 6600 5600 6600
Wire Wire Line
	5300 7300 5300 7200
NoConn ~ 5600 7000
Text GLabel 5700 6800 2    50   BiDi ~ 0
PUSBD+
Text GLabel 5700 6900 2    50   BiDi ~ 0
PUSBD-
Wire Wire Line
	5700 6900 5600 6900
Wire Wire Line
	5600 6800 5700 6800
Wire Wire Line
	2350 2050 2350 1950
Text GLabel 1450 1350 0    50   BiDi ~ 0
PUSBD+
Text GLabel 1450 1450 0    50   BiDi ~ 0
PUSBD-
$Comp
L Device:Ferrite_Bead_Small FB1
U 1 1 5E6E4D6F
P 6100 6600
F 0 "FB1" V 5863 6600 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 5954 6600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6030 6600 50  0001 C CNN
F 3 "~" H 6100 6600 50  0001 C CNN
	1    6100 6600
	0    1    1    0   
$EndComp
Wire Wire Line
	6200 6600 6400 6600
Wire Wire Line
	4600 6600 4600 6250
Wire Wire Line
	4600 6250 5700 6250
Wire Wire Line
	5700 6250 5700 6600
Wire Wire Line
	5700 6600 6000 6600
Connection ~ 5700 6600
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5E78C1CB
P 6400 6600
F 0 "#FLG0101" H 6400 6675 50  0001 C CNN
F 1 "PWR_FLAG" H 6400 6773 50  0000 C CNN
F 2 "" H 6400 6600 50  0001 C CNN
F 3 "~" H 6400 6600 50  0001 C CNN
	1    6400 6600
	-1   0    0    1   
$EndComp
Connection ~ 6400 6600
Wire Wire Line
	6400 6600 6550 6600
Text GLabel 9900 3350 1    50   Input ~ 0
+5V
Wire Wire Line
	9900 3350 9900 3450
Text GLabel 9900 4450 3    50   Input ~ 0
GND
Wire Wire Line
	9900 4450 9900 4350
Text GLabel 10500 4150 3    50   Input ~ 0
~RES
Wire Wire Line
	10400 4050 10500 4050
Wire Wire Line
	10500 4050 10500 4150
Text Label 10650 3950 2    50   ~ 0
v1pa7
Text Label 10650 3750 2    50   ~ 0
v1pa6
Text Label 10650 3850 2    50   ~ 0
v1pa5
Wire Wire Line
	10400 3950 10650 3950
Wire Wire Line
	10400 3750 10650 3750
Entry Wire Line
	10650 3750 10750 3650
Entry Wire Line
	10650 3850 10750 3750
Entry Wire Line
	10650 3950 10750 3850
Wire Bus Line
	10750 3050 9150 3050
Wire Wire Line
	10400 3850 10650 3850
$Comp
L Connector:AVR-ISP-6 J8
U 1 1 5E902E5F
P 10000 3950
F 0 "J8" H 9670 4046 50  0000 R CNN
F 1 "AVR-ISP-10" H 9670 3955 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 9750 4000 50  0001 C CNN
F 3 " ~" H 8725 3400 50  0001 C CNN
	1    10000 3950
	1    0    0    -1  
$EndComp
Wire Bus Line
	4950 3000 4950 3400
Wire Bus Line
	2700 3000 2700 3400
Wire Bus Line
	4950 3500 4950 3800
Wire Bus Line
	2700 3500 2700 3800
Wire Bus Line
	10750 3050 10750 3850
Wire Bus Line
	8500 1300 8500 2000
Wire Bus Line
	4950 4000 4950 4700
Wire Bus Line
	650  4400 650  5100
Wire Bus Line
	2700 4000 2700 4700
Wire Bus Line
	5300 3850 5300 4650
Wire Bus Line
	1250 6850 1250 7600
Wire Bus Line
	9150 3050 9150 4250
Wire Bus Line
	6400 4300 6400 5200
Wire Bus Line
	6400 2900 6400 3800
Wire Bus Line
	2900 4400 2900 5300
Wire Bus Line
	2900 3000 2900 4100
Wire Bus Line
	650  3000 650  4100
Wire Bus Line
	700  6050 700  7600
$EndSCHEMATC
