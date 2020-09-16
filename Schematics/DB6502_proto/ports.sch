EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "DB6502 Hobby Computer (prototype)"
Date "2020-09-09"
Rev "v002"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Based on Ben Eater's design"
Comment4 "Author: Dawid Buchwald"
$EndDescr
$Comp
L Connector:Conn_01x32_Female J1
U 1 1 6014BD0C
P 4700 6200
F 0 "J1" H 4728 6176 50  0000 L CNN
F 1 "System Bus" H 4728 6085 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x32_P2.54mm_Vertical" H 4700 6200 50  0001 C CNN
F 3 "~" H 4700 6200 50  0001 C CNN
	1    4700 6200
	0    -1   -1   0   
$EndComp
Text Label 3200 6600 1    50   ~ 0
a0
Text Label 3300 6600 1    50   ~ 0
a1
Text Label 3400 6600 1    50   ~ 0
a2
Text Label 3500 6600 1    50   ~ 0
a3
Text Label 3600 6600 1    50   ~ 0
a4
Text Label 3700 6600 1    50   ~ 0
a5
Text Label 3800 6600 1    50   ~ 0
a6
Text Label 3900 6600 1    50   ~ 0
a7
Text Label 4000 6600 1    50   ~ 0
a8
Text Label 4100 6600 1    50   ~ 0
a9
Text Label 4200 6600 1    50   ~ 0
a10
Text Label 4300 6600 1    50   ~ 0
a11
Text Label 4400 6600 1    50   ~ 0
a12
Text Label 4500 6600 1    50   ~ 0
a13
Text Label 4600 6600 1    50   ~ 0
a14
Text Label 4700 6600 1    50   ~ 0
a15
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
a[0..15]
Wire Bus Line
	4600 6800 4600 6700
Text Label 4800 6600 1    50   ~ 0
d0
Text Label 4900 6600 1    50   ~ 0
d1
Text Label 5000 6600 1    50   ~ 0
d2
Text Label 5100 6600 1    50   ~ 0
d3
Text Label 5200 6600 1    50   ~ 0
d4
Text Label 5300 6600 1    50   ~ 0
d5
Text Label 5400 6600 1    50   ~ 0
d6
Text Label 5500 6600 1    50   ~ 0
d7
Wire Wire Line
	4800 6600 4800 6400
Wire Wire Line
	4900 6600 4900 6400
Wire Wire Line
	5000 6600 5000 6400
Wire Wire Line
	5100 6600 5100 6400
Wire Wire Line
	5200 6600 5200 6400
Wire Wire Line
	5300 6600 5300 6400
Wire Wire Line
	5400 6600 5400 6400
Wire Wire Line
	5500 6600 5500 6400
Entry Wire Line
	4700 6700 4800 6600
Entry Wire Line
	4800 6700 4900 6600
Entry Wire Line
	4900 6700 5000 6600
Entry Wire Line
	5000 6700 5100 6600
Entry Wire Line
	5100 6700 5200 6600
Entry Wire Line
	5200 6700 5300 6600
Entry Wire Line
	5300 6700 5400 6600
Entry Wire Line
	5400 6700 5500 6600
Text GLabel 5400 6800 3    50   BiDi ~ 0
d[0..7]
Wire Bus Line
	5400 6800 5400 6700
Text Label 7600 1600 0    50   ~ 0
d0
Text Label 7600 1700 0    50   ~ 0
d1
Text Label 7600 1800 0    50   ~ 0
d2
Text Label 7600 1900 0    50   ~ 0
d3
Text Label 7600 2000 0    50   ~ 0
d4
Text Label 7600 2100 0    50   ~ 0
d5
Text Label 7600 2200 0    50   ~ 0
d6
Text Label 7600 2300 0    50   ~ 0
d7
Wire Wire Line
	7600 1600 7900 1600
Wire Wire Line
	7600 1700 7900 1700
Wire Wire Line
	7600 1800 7900 1800
Wire Wire Line
	7600 1900 7900 1900
Wire Wire Line
	7600 2000 7900 2000
Wire Wire Line
	7600 2100 7900 2100
Wire Wire Line
	7600 2200 7900 2200
Wire Wire Line
	7600 2300 7900 2300
Entry Wire Line
	7500 1500 7600 1600
Entry Wire Line
	7500 1600 7600 1700
Entry Wire Line
	7500 1700 7600 1800
Entry Wire Line
	7500 1800 7600 1900
Entry Wire Line
	7500 1900 7600 2000
Entry Wire Line
	7500 2000 7600 2100
Entry Wire Line
	7500 2100 7600 2200
Entry Wire Line
	7500 2200 7600 2300
Text GLabel 4700 1050 1    50   Input ~ 0
SYNC
Text GLabel 4550 1050 1    50   Input ~ 0
~ML
Text GLabel 4400 1050 1    50   Input ~ 0
~VP
Text GLabel 4250 1050 1    50   Output ~ 0
RDY
Wire Wire Line
	2300 950  2300 1050
Text GLabel 2300 950  1    50   Input ~ 0
+5V
$Comp
L Device:R R6
U 1 1 6017257F
P 2300 1200
F 0 "R6" H 2230 1154 50  0000 R CNN
F 1 "4K7" H 2230 1245 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2230 1200 50  0001 C CNN
F 3 "~" H 2300 1200 50  0001 C CNN
	1    2300 1200
	-1   0    0    1   
$EndComp
Text GLabel 4100 1050 1    50   Output ~ 0
BE
Wire Wire Line
	2000 950  2000 1050
Text GLabel 2000 950  1    50   Input ~ 0
+5V
$Comp
L Device:R R5
U 1 1 6017DC7B
P 2000 1200
F 0 "R5" H 2070 1246 50  0000 L CNN
F 1 "4K7" H 2070 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1930 1200 50  0001 C CNN
F 3 "~" H 2000 1200 50  0001 C CNN
	1    2000 1200
	1    0    0    -1  
$EndComp
Text GLabel 3950 1050 1    50   Output ~ 0
~IRQ
Wire Wire Line
	1700 950  1700 1050
Text GLabel 1700 950  1    50   Input ~ 0
+5V
$Comp
L Device:R R4
U 1 1 601857FE
P 1700 1200
F 0 "R4" H 1770 1246 50  0000 L CNN
F 1 "4K7" H 1770 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1630 1200 50  0001 C CNN
F 3 "~" H 1700 1200 50  0001 C CNN
	1    1700 1200
	1    0    0    -1  
$EndComp
Text GLabel 3800 1050 1    50   Output ~ 0
~NMI
Wire Wire Line
	1400 950  1400 1050
Text GLabel 1400 950  1    50   Input ~ 0
+5V
$Comp
L Device:R R3
U 1 1 601898AB
P 1400 1200
F 0 "R3" H 1470 1246 50  0000 L CNN
F 1 "4K7" H 1470 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1330 1200 50  0001 C CNN
F 3 "~" H 1400 1200 50  0001 C CNN
	1    1400 1200
	1    0    0    -1  
$EndComp
Text GLabel 3650 1050 1    50   Output ~ 0
~SO
Text GLabel 3350 1050 1    50   Output ~ 0
CLK
Text GLabel 3200 1050 1    50   Output ~ 0
R~W
Wire Wire Line
	1100 950  1100 1050
Text GLabel 1100 950  1    50   Input ~ 0
+5V
$Comp
L Device:R R2
U 1 1 601C227D
P 1100 1200
F 0 "R2" H 1170 1246 50  0000 L CNN
F 1 "4K7" H 1170 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1030 1200 50  0001 C CNN
F 3 "~" H 1100 1200 50  0001 C CNN
	1    1100 1200
	1    0    0    -1  
$EndComp
Text GLabel 3500 1050 1    50   Output ~ 0
~6502_RES
Wire Wire Line
	1100 1350 1100 1950
Wire Wire Line
	1400 1350 1400 1850
Wire Wire Line
	1700 1350 1700 1750
Wire Wire Line
	2000 1350 2000 1650
Wire Wire Line
	2300 1350 2300 1550
Wire Wire Line
	3500 2050 4950 2050
Wire Wire Line
	3500 1050 3500 2050
Connection ~ 3650 1950
Wire Wire Line
	3650 1950 4950 1950
Wire Wire Line
	3650 1050 3650 1950
Wire Wire Line
	2300 1550 4250 1550
Wire Wire Line
	3800 1850 4950 1850
Connection ~ 3800 1850
Wire Wire Line
	1400 1850 3800 1850
Wire Wire Line
	3800 1050 3800 1850
Connection ~ 3950 1750
Wire Wire Line
	1700 1750 3950 1750
Wire Wire Line
	3950 1750 4950 1750
Wire Wire Line
	3950 1050 3950 1750
Connection ~ 4100 1650
Wire Wire Line
	2000 1650 4100 1650
Wire Wire Line
	4100 1650 4950 1650
Wire Wire Line
	4100 1050 4100 1650
Wire Wire Line
	4250 1550 4950 1550
Connection ~ 4250 1550
Wire Wire Line
	4250 1050 4250 1550
Wire Wire Line
	4400 1450 4950 1450
Wire Wire Line
	4400 1050 4400 1450
Wire Wire Line
	4550 1350 4950 1350
Wire Wire Line
	4550 1050 4550 1350
Wire Wire Line
	4700 1250 4700 1050
Wire Wire Line
	4700 1250 4950 1250
$Comp
L Connector:Conn_01x32_Female J2
U 1 1 60166003
P 5150 2650
F 0 "J2" H 5178 2626 50  0000 L CNN
F 1 "Controls" H 5178 2535 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x32_P2.54mm_Vertical" H 5150 2650 50  0001 C CNN
F 3 "~" H 5150 2650 50  0001 C CNN
	1    5150 2650
	1    0    0    -1  
$EndComp
Text GLabel 4850 1050 1    50   Input ~ 0
~RES
Wire Wire Line
	4850 1050 4850 1150
Wire Wire Line
	4850 1150 4950 1150
Wire Wire Line
	1100 1950 3650 1950
Wire Wire Line
	800  950  800  1050
Text GLabel 800  950  1    50   Input ~ 0
+5V
$Comp
L Device:R R1
U 1 1 601F1941
P 800 1200
F 0 "R1" H 870 1246 50  0000 L CNN
F 1 "4K7" H 870 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 730 1200 50  0001 C CNN
F 3 "~" H 800 1200 50  0001 C CNN
	1    800  1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  2050 3500 2050
Wire Wire Line
	800  1350 800  2050
Connection ~ 3500 2050
Wire Wire Line
	3350 1050 3350 2150
Wire Wire Line
	3350 2150 4950 2150
Wire Wire Line
	3200 1050 3200 2250
Wire Wire Line
	3200 2250 4950 2250
$Comp
L Connector:Conn_01x32_Female J4
U 1 1 60200164
P 8100 2600
F 0 "J4" H 8128 2576 50  0000 L CNN
F 1 "I/O Bus" H 8128 2485 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x32_P2.54mm_Vertical" H 8100 2600 50  0001 C CNN
F 3 "~" H 8100 2600 50  0001 C CNN
	1    8100 2600
	1    0    0    -1  
$EndComp
Text Label 7750 1100 0    50   ~ 0
a0
Text Label 7750 1200 0    50   ~ 0
a1
Text Label 7750 1300 0    50   ~ 0
a2
Text Label 7750 1400 0    50   ~ 0
a3
Text Label 7750 1500 0    50   ~ 0
a4
Wire Wire Line
	7750 1500 7900 1500
Wire Wire Line
	7750 1400 7900 1400
Wire Wire Line
	7750 1300 7900 1300
Wire Wire Line
	7750 1200 7900 1200
Wire Wire Line
	7750 1100 7900 1100
Entry Wire Line
	7650 1000 7750 1100
Entry Wire Line
	7650 1100 7750 1200
Entry Wire Line
	7650 1200 7750 1300
Entry Wire Line
	7650 1300 7750 1400
Entry Wire Line
	7650 1400 7750 1500
Text GLabel 7250 2300 1    50   Input ~ 0
~LATCH
Text GLabel 7100 2300 1    50   Input ~ 0
~VIA1
Text GLabel 6950 2300 1    50   Input ~ 0
~VIA2
Text GLabel 6800 2300 1    50   Input ~ 0
~UART
Text GLabel 6650 2300 1    50   Input ~ 0
~IOCS0
Text GLabel 6500 2300 1    50   Input ~ 0
~IOCS1
Text GLabel 6350 2300 1    50   Input ~ 0
~IOCS2
Text GLabel 6200 2300 1    50   Input ~ 0
~IOCS3
Wire Wire Line
	7250 2300 7250 2500
Wire Wire Line
	7250 2500 7900 2500
Wire Wire Line
	7100 2300 7100 2600
Wire Wire Line
	7100 2600 7900 2600
Wire Wire Line
	6950 2300 6950 2700
Wire Wire Line
	6950 2700 7900 2700
Wire Wire Line
	6800 2300 6800 2800
Wire Wire Line
	6800 2800 7900 2800
Wire Wire Line
	6650 2300 6650 2900
Wire Wire Line
	6650 2900 7900 2900
Wire Wire Line
	6500 2300 6500 3000
Wire Wire Line
	6500 3000 7900 3000
Wire Wire Line
	6350 2300 6350 3100
Wire Wire Line
	6350 3100 7900 3100
Wire Wire Line
	6200 2300 6200 3200
Wire Wire Line
	6200 3200 7900 3200
Text GLabel 7400 2300 1    50   Input ~ 0
IOCS
Wire Wire Line
	7400 2300 7400 2400
Wire Wire Line
	7400 2400 7900 2400
$Comp
L Connector:AVR-ISP-6 J10
U 1 1 60247D13
P 10350 1600
F 0 "J10" H 10021 1696 50  0000 R CNN
F 1 "AVR-ISP-6" H 10021 1605 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x03_P2.54mm_Vertical" V 10100 1650 50  0001 C CNN
F 3 " ~" H 9075 1050 50  0001 C CNN
	1    10350 1600
	1    0    0    -1  
$EndComp
Text GLabel 10250 2100 3    50   Input ~ 0
GND
Text GLabel 10250 1000 1    50   Input ~ 0
+5V
Text GLabel 10850 1700 2    50   Output ~ 0
~RES
Wire Wire Line
	10750 1700 10850 1700
Text Label 10900 1400 2    50   ~ 0
d6
Text Label 10900 1500 2    50   ~ 0
d5
Text Label 10900 1600 2    50   ~ 0
d7
Wire Wire Line
	10750 1600 10900 1600
Wire Wire Line
	10750 1500 10900 1500
Wire Wire Line
	10750 1400 10900 1400
Entry Wire Line
	10900 1500 11000 1400
Entry Wire Line
	10900 1400 11000 1300
Entry Wire Line
	10900 1600 11000 1500
Wire Wire Line
	10250 1000 10250 1100
Wire Wire Line
	10250 2000 10250 2100
$Comp
L 6502:USB_B J5
U 1 1 60262AB5
P 8950 3000
F 0 "J5" H 9007 3467 50  0000 C CNN
F 1 "USB_B" H 9007 3376 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 9100 2950 50  0001 C CNN
F 3 "" H 9100 2950 50  0001 C CNN
	1    8950 3000
	1    0    0    -1  
$EndComp
NoConn ~ 8850 3400
Text GLabel 8950 3600 3    50   Input ~ 0
GND
Wire Wire Line
	8950 3500 8950 3400
$Comp
L Device:Ferrite_Bead_Small FB1
U 1 1 6026B82D
P 9800 2800
F 0 "FB1" V 9563 2800 50  0000 C CNN
F 1 "FB" V 9654 2800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9730 2800 50  0001 C CNN
F 3 "~" H 9800 2800 50  0001 C CNN
	1    9800 2800
	0    1    1    0   
$EndComp
Text GLabel 10750 2800 2    50   Input ~ 0
+5V
Wire Wire Line
	9250 2800 9450 2800
Wire Wire Line
	9900 2800 10500 2800
Wire Wire Line
	9250 3100 9350 3100
$Comp
L 6502:FT230XS U9
U 1 1 6027C28B
P 9850 4650
F 0 "U9" H 9850 5265 50  0000 C CNN
F 1 "FT230XS" H 9850 5174 50  0000 C CNN
F 2 "Package_SO:SSOP-16_5.3x6.2mm_P0.65mm" H 9850 5150 50  0001 C CNN
F 3 "" H 9850 4650 50  0001 C CNN
	1    9850 4650
	1    0    0    -1  
$EndComp
Text GLabel 9200 4300 0    50   Output ~ 0
RxD_DBG
Text GLabel 9200 4600 0    50   Input ~ 0
TxD_DBG
Wire Wire Line
	9200 4300 9300 4300
Text GLabel 9100 4700 0    50   Input ~ 0
GND
Text GLabel 9200 5100 0    50   BiDi ~ 0
USBD+
Text GLabel 10500 5000 2    50   BiDi ~ 0
USBD-
Text GLabel 10500 4600 2    50   Input ~ 0
GND
Wire Wire Line
	10400 4600 10500 4600
Wire Wire Line
	9100 4700 9200 4700
Text GLabel 10500 4700 2    50   Input ~ 0
+5V
Wire Wire Line
	10500 4700 10400 4700
Wire Wire Line
	9300 4800 9200 4800
Wire Wire Line
	9200 4800 9200 4700
Connection ~ 9200 4700
Wire Wire Line
	9200 4700 9300 4700
NoConn ~ 9300 4400
Wire Wire Line
	9200 4600 9300 4600
Wire Wire Line
	8750 4500 8750 5200
Wire Wire Line
	8750 5200 9850 5200
Wire Wire Line
	10900 5200 10900 4900
Wire Wire Line
	10900 4900 10400 4900
Wire Wire Line
	8750 4500 9300 4500
Wire Wire Line
	10400 5000 10500 5000
Wire Wire Line
	10400 4800 10900 4800
Wire Wire Line
	10900 4800 10900 4900
Connection ~ 10900 4900
$Comp
L Device:C C15
U 1 1 602C1DD4
P 9850 5450
F 0 "C15" H 9965 5496 50  0000 L CNN
F 1 "100nF" H 9965 5405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9888 5300 50  0001 C CNN
F 3 "~" H 9850 5450 50  0001 C CNN
	1    9850 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5200 9850 5300
Connection ~ 9850 5200
Wire Wire Line
	9850 5200 10300 5200
Text GLabel 9850 5700 3    50   Input ~ 0
GND
Wire Wire Line
	9850 5700 9850 5600
Text GLabel 10750 4500 2    50   Output ~ 0
~RXLED
Text GLabel 9200 4900 0    50   Output ~ 0
~TXLED
Wire Wire Line
	9200 5100 9250 5100
Wire Wire Line
	9250 5100 9250 5000
Wire Wire Line
	9250 5000 9300 5000
Wire Wire Line
	9200 4900 9300 4900
Wire Wire Line
	10400 4500 10750 4500
NoConn ~ 10400 4400
NoConn ~ 10400 4300
$Comp
L Device:R R8
U 1 1 602F2771
P 10300 5450
F 0 "R8" H 10370 5496 50  0000 L CNN
F 1 "220" H 10370 5405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10230 5450 50  0001 C CNN
F 3 "~" H 10300 5450 50  0001 C CNN
	1    10300 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 602F30A6
P 10600 5450
F 0 "R11" H 10670 5496 50  0000 L CNN
F 1 "220" H 10670 5405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10530 5450 50  0001 C CNN
F 3 "~" H 10600 5450 50  0001 C CNN
	1    10600 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 5200 10300 5300
Connection ~ 10300 5200
Wire Wire Line
	10300 5200 10600 5200
Wire Wire Line
	10600 5200 10600 5300
Connection ~ 10600 5200
Wire Wire Line
	10600 5200 10900 5200
$Comp
L Device:LED D1
U 1 1 60306900
P 10300 5850
F 0 "D1" V 10339 5733 50  0000 R CNN
F 1 "RX" V 10248 5733 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 10300 5850 50  0001 C CNN
F 3 "~" H 10300 5850 50  0001 C CNN
	1    10300 5850
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D2
U 1 1 603076D2
P 10600 5850
F 0 "D2" V 10639 5732 50  0000 R CNN
F 1 "TX" V 10548 5732 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 10600 5850 50  0001 C CNN
F 3 "~" H 10600 5850 50  0001 C CNN
	1    10600 5850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10600 5600 10600 5700
Wire Wire Line
	10300 5600 10300 5700
Text GLabel 10300 6100 3    50   Input ~ 0
~RXLED
Text GLabel 10600 6100 3    50   Input ~ 0
~TXLED
Wire Wire Line
	10300 6100 10300 6000
Wire Wire Line
	10600 6100 10600 6000
Text GLabel 6050 2300 1    50   Input ~ 0
~OE
Text GLabel 5900 2300 1    50   Input ~ 0
~WE
Wire Wire Line
	5900 2300 5900 3400
Wire Wire Line
	5900 3400 7900 3400
Wire Wire Line
	6050 2300 6050 3300
Wire Wire Line
	6050 3300 7900 3300
Text GLabel 10750 3000 2    50   BiDi ~ 0
USBD-
Text GLabel 10750 3250 2    50   BiDi ~ 0
USBD+
$Comp
L Device:R R10
U 1 1 6038C33D
P 10500 3250
F 0 "R10" V 10600 3250 50  0000 C CNN
F 1 "27" V 10500 3250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10430 3250 50  0001 C CNN
F 3 "~" H 10500 3250 50  0001 C CNN
	1    10500 3250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R9
U 1 1 6038CADA
P 10500 3000
F 0 "R9" V 10600 3000 50  0000 C CNN
F 1 "27" V 10500 3000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10430 3000 50  0001 C CNN
F 3 "~" H 10500 3000 50  0001 C CNN
	1    10500 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10650 3250 10750 3250
Wire Wire Line
	10650 3000 10750 3000
Wire Wire Line
	9350 3100 9350 3250
$Comp
L Device:C_Small C14
U 1 1 603B5D8D
P 9800 3450
F 0 "C14" H 9892 3496 50  0000 L CNN
F 1 "47pF" H 9892 3405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9800 3450 50  0001 C CNN
F 3 "~" H 9800 3450 50  0001 C CNN
	1    9800 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C16
U 1 1 603B6642
P 10150 3450
F 0 "C16" H 10242 3496 50  0000 L CNN
F 1 "47pF" H 10242 3405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 10150 3450 50  0001 C CNN
F 3 "~" H 10150 3450 50  0001 C CNN
	1    10150 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 3000 9800 3000
Wire Wire Line
	9350 3250 10150 3250
Text GLabel 9800 3650 3    50   Input ~ 0
GND
Text GLabel 10150 3650 3    50   Input ~ 0
GND
Wire Wire Line
	9800 3350 9800 3000
Connection ~ 9800 3000
Wire Wire Line
	9800 3000 10350 3000
Wire Wire Line
	9800 3550 9800 3650
Wire Wire Line
	10150 3650 10150 3550
Wire Wire Line
	10150 3350 10150 3250
Connection ~ 10150 3250
Wire Wire Line
	10150 3250 10350 3250
$Comp
L Device:C_Small C13
U 1 1 603FAFBB
P 9450 3450
F 0 "C13" H 9542 3496 50  0000 L CNN
F 1 "10nF" H 9542 3405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9450 3450 50  0001 C CNN
F 3 "~" H 9450 3450 50  0001 C CNN
	1    9450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3350 9450 2800
Connection ~ 9450 2800
Wire Wire Line
	9450 2800 9700 2800
Text GLabel 9450 3650 3    50   Input ~ 0
GND
Wire Wire Line
	9450 3650 9450 3550
$Comp
L power:PWR_FLAG #FLG01
U 1 1 6045BF07
P 10500 2800
F 0 "#FLG01" H 10500 2875 50  0001 C CNN
F 1 "PWR_FLAG" H 10500 2973 50  0000 C CNN
F 2 "" H 10500 2800 50  0001 C CNN
F 3 "~" H 10500 2800 50  0001 C CNN
	1    10500 2800
	1    0    0    -1  
$EndComp
Connection ~ 10500 2800
Wire Wire Line
	10500 2800 10750 2800
Text GLabel 3050 1050 1    50   Output ~ 0
EXRAM
Wire Wire Line
	3050 1050 3050 2350
Wire Wire Line
	3050 2350 4950 2350
Text GLabel 2900 1050 1    50   Input ~ 0
SR_DAT
Text GLabel 2750 1050 1    50   Input ~ 0
SR_CLK
Text GLabel 2600 1050 1    50   Input ~ 0
SR_OUT
Wire Wire Line
	2900 1050 2900 2450
Wire Wire Line
	2900 2450 4950 2450
Wire Wire Line
	2750 1050 2750 2550
Wire Wire Line
	2750 2550 4950 2550
Wire Wire Line
	2600 1050 2600 2650
Wire Wire Line
	2600 2650 4950 2650
$Comp
L Device:R R7
U 1 1 604F21BB
P 2300 2600
F 0 "R7" H 2230 2554 50  0000 R CNN
F 1 "4K7" H 2230 2645 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2230 2600 50  0001 C CNN
F 3 "~" H 2300 2600 50  0001 C CNN
	1    2300 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 2450 2300 2350
Wire Wire Line
	2300 2350 3050 2350
Connection ~ 3050 2350
Text GLabel 2300 2850 3    50   Input ~ 0
GND
Wire Wire Line
	2300 2850 2300 2750
Text GLabel 6400 6950 2    50   Input ~ 0
~OE
Text GLabel 6400 6800 2    50   Input ~ 0
~WE
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
Text GLabel 7800 4200 0    50   Input ~ 0
GND
Text GLabel 7800 4100 0    50   Input ~ 0
+5V
Wire Wire Line
	7800 4100 7900 4100
Wire Wire Line
	7800 4200 7900 4200
Text GLabel 6400 7100 2    50   Input ~ 0
CLK
Wire Wire Line
	6400 7100 5900 7100
Wire Wire Line
	5900 7100 5900 6400
Text GLabel 6400 7250 2    50   Input ~ 0
R~W
Wire Wire Line
	6400 7250 5800 7250
Wire Wire Line
	5800 7250 5800 6400
Text GLabel 6400 7400 2    50   Input ~ 0
~6502_RES
Wire Wire Line
	6400 7400 5700 7400
Wire Wire Line
	5700 7400 5700 6400
Text GLabel 6200 4200 3    50   Input ~ 0
CLK
Wire Wire Line
	6200 4200 6200 3700
Wire Wire Line
	6200 3700 7900 3700
Text GLabel 6050 4200 3    50   Input ~ 0
R~W
Wire Wire Line
	6050 4200 6050 3600
Wire Wire Line
	6050 3600 7900 3600
Text GLabel 5900 4200 3    50   Input ~ 0
~6502_RES
Wire Wire Line
	5900 4200 5900 3500
Wire Wire Line
	5900 3500 7900 3500
Text GLabel 6400 7550 2    50   Input ~ 0
SYNC
Wire Wire Line
	6400 7550 5600 7550
Wire Wire Line
	5600 7550 5600 6400
Text GLabel 4850 2750 0    50   Input ~ 0
CLK_DBG
Wire Wire Line
	4850 2750 4950 2750
Text GLabel 4850 2850 0    50   Output ~ 0
IN12
Text GLabel 4850 2950 0    50   Input ~ 0
IO13
Text GLabel 4850 3050 0    50   Input ~ 0
IO14
Text GLabel 4850 3150 0    50   Input ~ 0
IO15
Text GLabel 4850 3250 0    50   Input ~ 0
IO16
Wire Wire Line
	4850 2850 4950 2850
Wire Wire Line
	4850 2950 4950 2950
Wire Wire Line
	4850 3050 4950 3050
Wire Wire Line
	4850 3150 4950 3150
Wire Wire Line
	4850 3250 4950 3250
Text Label 4450 3350 0    50   ~ 0
d0
Text Label 4450 3450 0    50   ~ 0
d1
Text Label 4450 3550 0    50   ~ 0
d2
Text Label 4450 3650 0    50   ~ 0
d3
Text Label 4450 3750 0    50   ~ 0
d4
Text Label 4450 3850 0    50   ~ 0
d5
Text Label 4450 3950 0    50   ~ 0
d6
Text Label 4450 4050 0    50   ~ 0
d7
Wire Wire Line
	4450 3350 4950 3350
Wire Wire Line
	4450 3450 4950 3450
Wire Wire Line
	4450 3550 4950 3550
Wire Wire Line
	4450 3650 4950 3650
Wire Wire Line
	4450 3750 4950 3750
Wire Wire Line
	4450 3850 4950 3850
Wire Wire Line
	4450 3950 4950 3950
Wire Wire Line
	4450 4050 4950 4050
Entry Wire Line
	4350 3250 4450 3350
Entry Wire Line
	4350 3350 4450 3450
Entry Wire Line
	4350 3450 4450 3550
Entry Wire Line
	4350 3550 4450 3650
Entry Wire Line
	4350 3650 4450 3750
Entry Wire Line
	4350 3750 4450 3850
Entry Wire Line
	4350 3850 4450 3950
Entry Wire Line
	4350 3950 4450 4050
Text GLabel 4850 4250 0    50   Input ~ 0
GND
Text GLabel 4850 4150 0    50   Input ~ 0
+5V
Wire Wire Line
	4850 4150 4950 4150
Wire Wire Line
	4850 4250 4950 4250
$Comp
L Connector:Conn_01x06_Male J3
U 1 1 60961951
P 7850 4850
F 0 "J3" H 7958 5231 50  0000 C CNN
F 1 "Debug UART" H 7958 5140 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 7850 4850 50  0001 C CNN
F 3 "~" H 7850 4850 50  0001 C CNN
	1    7850 4850
	1    0    0    -1  
$EndComp
Text GLabel 8150 4650 2    50   Input ~ 0
GND
Wire Wire Line
	8150 4650 8100 4650
Wire Wire Line
	8050 4750 8100 4750
Wire Wire Line
	8100 4750 8100 4650
Connection ~ 8100 4650
Wire Wire Line
	8100 4650 8050 4650
Text GLabel 8150 4850 2    50   Input ~ 0
+5V
Wire Wire Line
	8150 4850 8050 4850
NoConn ~ 8050 5150
Text GLabel 8150 4950 2    50   Output ~ 0
RxD_DBG
Wire Wire Line
	8150 4950 8050 4950
Text GLabel 8150 5050 2    50   Input ~ 0
TxD_DBG
Wire Wire Line
	8150 5050 8050 5050
Text GLabel 6350 4200 3    50   Input ~ 0
RAM1_~CS
Wire Wire Line
	6350 4200 6350 3800
Wire Wire Line
	6350 3800 7900 3800
Text GLabel 6500 4200 3    50   Input ~ 0
RAM2_~CS
Text GLabel 6650 4200 3    50   Input ~ 0
ROM_~CS
Wire Wire Line
	6500 4200 6500 3900
Wire Wire Line
	6500 3900 7900 3900
Wire Wire Line
	6650 4200 6650 4000
Wire Wire Line
	6650 4000 7900 4000
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 60A13007
P 8950 3500
F 0 "#FLG0101" H 8950 3575 50  0001 C CNN
F 1 "PWR_FLAG" V 8950 3627 50  0000 L CNN
F 2 "" H 8950 3500 50  0001 C CNN
F 3 "~" H 8950 3500 50  0001 C CNN
	1    8950 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8950 3600 8950 3500
Connection ~ 8950 3500
Wire Bus Line
	11000 1300 11000 1500
Wire Bus Line
	7650 1000 7650 1400
Wire Bus Line
	4700 6700 5400 6700
Wire Bus Line
	7500 1500 7500 2200
Wire Bus Line
	4350 3250 4350 3950
Wire Bus Line
	3100 6700 4600 6700
$EndSCHEMATC
