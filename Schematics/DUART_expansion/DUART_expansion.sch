EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "SC26C92 DUART expansion board for 65C02 v001"
Date "2020-07-20"
Rev "v001"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Created by Dawid Buchwald"
$EndDescr
$Comp
L Connector_Generic:Conn_02x16_Odd_Even J1
U 1 1 5F15BD0D
P 1400 1650
F 0 "J1" H 1450 2567 50  0000 C CNN
F 1 "Expansion bus" H 1450 2476 50  0000 C CNN
F 2 "" H 1400 1650 50  0001 C CNN
F 3 "~" H 1400 1650 50  0001 C CNN
	1    1400 1650
	1    0    0    -1  
$EndComp
Text Label 1000 950  0    50   ~ 0
a0
Text Label 1000 1050 0    50   ~ 0
a1
Text Label 1000 1150 0    50   ~ 0
a2
Text Label 1000 1250 0    50   ~ 0
a3
Wire Wire Line
	1000 950  1200 950 
Wire Wire Line
	1000 1050 1200 1050
Wire Wire Line
	1000 1150 1200 1150
Wire Wire Line
	1000 1250 1200 1250
Entry Wire Line
	900  850  1000 950 
Entry Wire Line
	900  950  1000 1050
Entry Wire Line
	900  1050 1000 1150
Entry Wire Line
	900  1150 1000 1250
Text Label 1000 1850 0    50   ~ 0
a9
Wire Wire Line
	1000 1850 1200 1850
Entry Wire Line
	900  1750 1000 1850
Text GLabel 1900 2350 2    50   Input ~ 0
GND
Text GLabel 1900 2450 2    50   Input ~ 0
+5V
Wire Wire Line
	1900 2450 1800 2450
Wire Wire Line
	1700 2350 1900 2350
NoConn ~ 1700 2250
Text Label 1900 950  2    50   ~ 0
d0
Text Label 1900 1050 2    50   ~ 0
d1
Text Label 1900 1150 2    50   ~ 0
d2
Text Label 1900 1250 2    50   ~ 0
d3
Text Label 1900 1350 2    50   ~ 0
d4
Text Label 1900 1450 2    50   ~ 0
d5
Text Label 1900 1550 2    50   ~ 0
d6
Text Label 1900 1650 2    50   ~ 0
d7
Wire Wire Line
	1700 950  1900 950 
Wire Wire Line
	1700 1050 1900 1050
Wire Wire Line
	1700 1150 1900 1150
Wire Wire Line
	1700 1250 1900 1250
Wire Wire Line
	1700 1350 1900 1350
Wire Wire Line
	1700 1450 1900 1450
Wire Wire Line
	1700 1550 1900 1550
Wire Wire Line
	1700 1650 1900 1650
Entry Wire Line
	1900 950  2000 850 
Entry Wire Line
	1900 1050 2000 950 
Entry Wire Line
	1900 1150 2000 1050
Entry Wire Line
	1900 1250 2000 1150
Entry Wire Line
	1900 1350 2000 1250
Entry Wire Line
	1900 1450 2000 1350
Entry Wire Line
	1900 1550 2000 1450
Entry Wire Line
	1900 1650 2000 1550
Text GLabel 2150 1650 1    50   Output ~ 0
CLK
Text GLabel 2300 1650 1    50   Output ~ 0
R~W
Text GLabel 2450 1650 1    50   Output ~ 0
~IOCS
Text GLabel 2600 1650 1    50   Output ~ 0
~RES
Text GLabel 2750 1650 1    50   Input ~ 0
IRQX
Wire Wire Line
	2150 1650 2150 1750
Wire Wire Line
	2150 1750 1700 1750
Wire Wire Line
	2300 1650 2300 1850
Wire Wire Line
	2300 1850 1700 1850
Wire Wire Line
	2450 1650 2450 1950
Wire Wire Line
	2450 1950 1700 1950
Wire Wire Line
	2600 1650 2600 2050
Wire Wire Line
	2600 2050 1700 2050
Wire Wire Line
	2750 1650 2750 2150
Wire Wire Line
	2750 2150 1700 2150
$Comp
L 74xx:74HC04 U1
U 7 1 5F17BEEB
P 1100 3800
F 0 "U1" H 1330 3846 50  0000 L CNN
F 1 "74HC04" H 1330 3755 50  0000 L CNN
F 2 "" H 1100 3800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74AHC_AHCT04.pdf" H 1100 3800 50  0001 C CNN
	7    1100 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 3200 1100 3300
Wire Wire Line
	1100 4400 1100 4300
$Comp
L 74xx:74HC04 U1
U 1 1 5F17F7FF
P 3500 2700
F 0 "U1" H 3500 3017 50  0000 C CNN
F 1 "74HC04" H 3500 2926 50  0000 C CNN
F 2 "" H 3500 2700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74AHC_AHCT04.pdf" H 3500 2700 50  0001 C CNN
	1    3500 2700
	1    0    0    -1  
$EndComp
Text GLabel 3100 2700 0    50   Input ~ 0
~RES
Wire Wire Line
	3100 2700 3200 2700
Text GLabel 3900 2700 2    50   Output ~ 0
DUART_RES
Wire Wire Line
	3800 2700 3900 2700
$Comp
L 74xx:74HC04 U1
U 2 1 5F185D8B
P 3500 3900
F 0 "U1" H 3500 4217 50  0000 C CNN
F 1 "74HC04" H 3500 4126 50  0000 C CNN
F 2 "" H 3500 3900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74AHC_AHCT04.pdf" H 3500 3900 50  0001 C CNN
	2    3500 3900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U2
U 1 1 5F187D21
P 3500 3250
F 0 "U2" H 3500 3575 50  0000 C CNN
F 1 "74HC00" H 3500 3484 50  0000 C CNN
F 2 "" H 3500 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 3500 3250 50  0001 C CNN
	1    3500 3250
	1    0    0    -1  
$EndComp
Text GLabel 3900 3250 2    50   Output ~ 0
DUART_RDN
Wire Wire Line
	3800 3250 3900 3250
Text GLabel 3100 3150 0    50   Input ~ 0
R~W
Wire Wire Line
	3100 3150 3200 3150
Text GLabel 3100 3350 0    50   Input ~ 0
CLK
Wire Wire Line
	3100 3350 3200 3350
$Comp
L 74xx:74HC00 U2
U 5 1 5F18B90B
P 1950 3800
F 0 "U2" H 2180 3846 50  0000 L CNN
F 1 "74HC00" H 2180 3755 50  0000 L CNN
F 2 "" H 1950 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 1950 3800 50  0001 C CNN
	5    1950 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3200 1950 3300
Wire Wire Line
	1950 4400 1950 4300
Text GLabel 3100 3900 0    50   Input ~ 0
R~W
Wire Wire Line
	3100 3900 3200 3900
$Comp
L 74xx:74HC00 U2
U 2 1 5F19297E
P 4200 4000
F 0 "U2" H 4200 4325 50  0000 C CNN
F 1 "74HC00" H 4200 4234 50  0000 C CNN
F 2 "" H 4200 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4200 4000 50  0001 C CNN
	2    4200 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3900 3900 3900
Text GLabel 4600 4000 2    50   Output ~ 0
DUART_WRN
Wire Wire Line
	4500 4000 4600 4000
Text GLabel 3100 4100 0    50   Input ~ 0
CLK
Wire Wire Line
	3100 4100 3900 4100
$Comp
L 74xx:74HC04 U1
U 3 1 5F197B7F
P 3500 4600
F 0 "U1" H 3500 4917 50  0000 C CNN
F 1 "74HC04" H 3500 4826 50  0000 C CNN
F 2 "" H 3500 4600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74AHC_AHCT04.pdf" H 3500 4600 50  0001 C CNN
	3    3500 4600
	1    0    0    -1  
$EndComp
Text GLabel 3100 4600 0    50   Input ~ 0
~IOCS
Wire Wire Line
	3100 4600 3200 4600
$Comp
L 74xx:74HC00 U2
U 3 1 5F199FB8
P 4200 4700
F 0 "U2" H 4200 5025 50  0000 C CNN
F 1 "74HC00" H 4200 4934 50  0000 C CNN
F 2 "" H 4200 4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4200 4700 50  0001 C CNN
	3    4200 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4600 3900 4600
Text Label 3100 4800 2    50   ~ 0
a9
Wire Wire Line
	3100 4800 3900 4800
Entry Wire Line
	3000 4900 3100 4800
Wire Bus Line
	3000 4900 3000 4950
Text GLabel 6000 4800 2    50   Output ~ 0
DUART_CEN
Wire Wire Line
	4500 4700 4600 4700
Text GLabel 5550 3300 0    50   Input ~ 0
GND
Text GLabel 6600 1500 1    50   Input ~ 0
+5V
Wire Wire Line
	6600 1500 6600 1600
Text GLabel 5600 2000 0    50   Input ~ 0
GND
Wire Wire Line
	5600 2000 5700 2000
Text GLabel 7400 2000 2    50   Input ~ 0
DUART_RES
Wire Wire Line
	7400 2000 7300 2000
Text GLabel 7400 1900 2    50   Input ~ 0
DUART_CEN
Wire Wire Line
	7300 1900 7400 1900
Text GLabel 5600 2200 0    50   Input ~ 0
DUART_RDN
Wire Wire Line
	5600 2200 5700 2200
Text GLabel 5600 2100 0    50   Input ~ 0
DUART_WRN
Wire Wire Line
	5600 2100 5700 2100
Text Label 6400 1500 3    50   ~ 0
a0
Text Label 6200 1500 3    50   ~ 0
a1
Text Label 6000 1500 3    50   ~ 0
a2
Text Label 5600 1900 0    50   ~ 0
a3
Wire Wire Line
	5600 1900 5700 1900
Wire Wire Line
	6000 1500 6000 1600
Wire Wire Line
	6200 1500 6200 1600
Wire Wire Line
	6400 1500 6400 1600
Entry Wire Line
	6300 1400 6400 1500
Entry Wire Line
	6100 1400 6200 1500
Entry Wire Line
	5900 1400 6000 1500
Entry Wire Line
	5500 1800 5600 1900
Wire Bus Line
	5500 1800 5500 1400
NoConn ~ 6100 1600
NoConn ~ 6300 1600
NoConn ~ 6700 1600
NoConn ~ 6800 1600
NoConn ~ 6900 1600
NoConn ~ 7000 1600
NoConn ~ 7300 2600
NoConn ~ 7300 2700
NoConn ~ 7300 2800
NoConn ~ 7300 2900
NoConn ~ 5700 2900
NoConn ~ 5700 2800
NoConn ~ 5700 2700
NoConn ~ 5700 2600
NoConn ~ 5700 2300
NoConn ~ 5700 2500
Text Label 7000 3500 1    50   ~ 0
d0
Text Label 6900 3500 1    50   ~ 0
d2
Text Label 6800 3500 1    50   ~ 0
d4
Text Label 6700 3500 1    50   ~ 0
d6
Text Label 6000 3500 1    50   ~ 0
d1
Text Label 6100 3500 1    50   ~ 0
d3
Text Label 6200 3500 1    50   ~ 0
d5
Text Label 6300 3500 1    50   ~ 0
d7
Wire Wire Line
	6000 3200 6000 3500
Wire Wire Line
	6100 3200 6100 3500
Wire Wire Line
	6200 3200 6200 3500
Wire Wire Line
	6300 3200 6300 3500
Wire Wire Line
	6700 3200 6700 3500
Wire Wire Line
	6800 3200 6800 3500
Wire Wire Line
	6900 3200 6900 3500
Wire Wire Line
	7000 3200 7000 3500
Entry Wire Line
	5900 3600 6000 3500
Entry Wire Line
	6000 3600 6100 3500
Entry Wire Line
	6100 3600 6200 3500
Entry Wire Line
	6200 3600 6300 3500
Entry Wire Line
	6600 3600 6700 3500
Entry Wire Line
	6700 3600 6800 3500
Entry Wire Line
	6800 3600 6900 3500
Entry Wire Line
	6900 3600 7000 3500
Text GLabel 7400 2500 2    50   Output ~ 0
USB_UART_TxD
Text GLabel 7400 2300 2    50   Input ~ 0
USB_UART_RxD
Wire Wire Line
	7400 2300 7300 2300
Wire Wire Line
	7400 2500 7300 2500
Text GLabel 1100 4400 3    50   Input ~ 0
GND
Text GLabel 1950 4400 3    50   Input ~ 0
GND
Text GLabel 1100 3200 1    50   Input ~ 0
+5V
Text GLabel 1950 3200 1    50   Input ~ 0
+5V
$Comp
L 74xx:74HC04 U1
U 5 1 5F188CDA
P 4900 4700
F 0 "U1" H 4900 5017 50  0000 C CNN
F 1 "74HC04" H 4900 4926 50  0000 C CNN
F 2 "" H 4900 4700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74AHC_AHCT04.pdf" H 4900 4700 50  0001 C CNN
	5    4900 4700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U2
U 4 1 5F189A33
P 5600 4800
F 0 "U2" H 5600 5125 50  0000 C CNN
F 1 "74HC00" H 5600 5034 50  0000 C CNN
F 2 "" H 5600 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5600 4800 50  0001 C CNN
	4    5600 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4700 5300 4700
Text GLabel 3100 5050 0    50   Input ~ 0
CLK
Wire Wire Line
	3100 5050 5200 5050
Wire Wire Line
	5200 5050 5200 4900
Wire Wire Line
	5200 4900 5300 4900
Wire Wire Line
	5900 4800 6000 4800
$Comp
L 74xx:74HC04 U1
U 6 1 5F19385D
P 1500 5100
F 0 "U1" H 1500 5417 50  0000 C CNN
F 1 "74HC04" H 1500 5326 50  0000 C CNN
F 2 "" H 1500 5100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74AHC_AHCT04.pdf" H 1500 5100 50  0001 C CNN
	6    1500 5100
	1    0    0    -1  
$EndComp
Text GLabel 1100 5100 0    50   Input ~ 0
GND
Wire Wire Line
	1100 5100 1200 5100
NoConn ~ 1800 5100
Text GLabel 5550 3400 0    50   Output ~ 0
IRQX
Wire Wire Line
	5550 3400 6600 3400
Wire Wire Line
	6600 3400 6600 3200
Wire Wire Line
	5550 3300 6400 3300
Wire Wire Line
	6400 3300 6400 3200
$Comp
L DUART:SC26C92 U3
U 1 1 5F1A2B31
P 6500 2400
F 0 "U3" H 6450 2500 50  0000 L CNN
F 1 "SC26C92" H 6500 2300 50  0000 C CNN
F 2 "" H 6500 2400 50  0001 C CNN
F 3 "" H 6500 2400 50  0001 C CNN
	1    6500 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5F1DF768
P 8200 2150
F 0 "Y1" V 8154 2281 50  0000 L CNN
F 1 "Crystal" V 8245 2281 50  0000 L CNN
F 2 "" H 8200 2150 50  0001 C CNN
F 3 "~" H 8200 2150 50  0001 C CNN
	1    8200 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 2100 8050 2100
Wire Wire Line
	8050 2100 8050 2000
Wire Wire Line
	8050 2000 8200 2000
Wire Wire Line
	7300 2200 8050 2200
Wire Wire Line
	8050 2200 8050 2300
Wire Wire Line
	8050 2300 8200 2300
Wire Wire Line
	8200 2400 8200 2300
Connection ~ 8200 2300
Wire Wire Line
	8200 2000 8200 1900
Connection ~ 8200 2000
$Comp
L Device:C C1
U 1 1 5F1EB8DE
P 8200 1750
F 0 "C1" H 8315 1796 50  0000 L CNN
F 1 "22pF" H 8315 1705 50  0000 L CNN
F 2 "" H 8238 1600 50  0001 C CNN
F 3 "~" H 8200 1750 50  0001 C CNN
	1    8200 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5F1EC246
P 8200 2550
F 0 "C2" H 8315 2596 50  0000 L CNN
F 1 "22pF" H 8315 2505 50  0000 L CNN
F 2 "" H 8238 2400 50  0001 C CNN
F 3 "~" H 8200 2550 50  0001 C CNN
	1    8200 2550
	1    0    0    -1  
$EndComp
Text GLabel 8200 1500 1    50   Input ~ 0
GND
Text GLabel 8200 2800 3    50   Input ~ 0
GND
Wire Wire Line
	8200 2800 8200 2700
Wire Wire Line
	8200 1600 8200 1500
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5F1F24E0
P 1800 2450
F 0 "#FLG0101" H 1800 2525 50  0001 C CNN
F 1 "PWR_FLAG" H 1800 2623 50  0000 C CNN
F 2 "" H 1800 2450 50  0001 C CNN
F 3 "~" H 1800 2450 50  0001 C CNN
	1    1800 2450
	-1   0    0    1   
$EndComp
Connection ~ 1800 2450
Wire Wire Line
	1800 2450 1700 2450
NoConn ~ 1200 1350
NoConn ~ 1200 1450
NoConn ~ 1200 1550
NoConn ~ 1200 1650
NoConn ~ 1200 1750
NoConn ~ 1200 1950
NoConn ~ 1200 2050
NoConn ~ 1200 2150
NoConn ~ 1200 2250
NoConn ~ 1200 2350
NoConn ~ 1200 2450
Wire Bus Line
	5500 1400 6300 1400
Wire Bus Line
	900  850  900  1750
Wire Bus Line
	2000 850  2000 1550
Wire Bus Line
	5900 3600 6900 3600
$EndSCHEMATC
