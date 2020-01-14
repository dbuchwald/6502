EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "65C02 Hobby Computer"
Date "2020-01-07"
Rev "v001"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Based on Ben Eater's design"
Comment4 "Author: Dawid Buchwald"
$EndDescr
Text GLabel 1600 2500 1    50   Input ~ 0
IRQ
Wire Wire Line
	1600 2500 1600 2900
Text GLabel 2950 2500 1    50   Input ~ 0
CLK
Wire Wire Line
	2950 2900 2700 2900
Text GLabel 2800 4650 3    50   Input ~ 0
GND
Text Label 1500 3400 0    50   ~ 0
a0
Text Label 1500 3500 0    50   ~ 0
a1
Text Label 1500 3600 0    50   ~ 0
a2
Text Label 1500 3700 0    50   ~ 0
a3
Text Label 1500 3800 0    50   ~ 0
a4
Text Label 1500 3900 0    50   ~ 0
a5
Text Label 1500 4000 0    50   ~ 0
a6
Text Label 1500 4100 0    50   ~ 0
a7
Text Label 1500 4200 0    50   ~ 0
a8
Text Label 1500 4300 0    50   ~ 0
a9
Text Label 1500 4400 0    50   ~ 0
a10
Text Label 1500 4500 0    50   ~ 0
a11
Text Label 2900 4400 2    50   ~ 0
a12
Text Label 2900 4300 2    50   ~ 0
a13
Text Label 2900 4200 2    50   ~ 0
a14
Text Label 2900 4100 2    50   ~ 0
a15
Text Label 2900 4000 2    50   ~ 0
d7
Text Label 2900 3900 2    50   ~ 0
d6
Text Label 2900 3800 2    50   ~ 0
d5
Text Label 2900 3700 2    50   ~ 0
d4
Text Label 2900 3600 2    50   ~ 0
d3
Text Label 2900 3500 2    50   ~ 0
d2
Text Label 2900 3400 2    50   ~ 0
d1
Text Label 2900 3300 2    50   ~ 0
d0
Wire Wire Line
	1700 3400 1500 3400
Wire Wire Line
	1700 3500 1500 3500
Wire Wire Line
	1700 3600 1500 3600
Wire Wire Line
	1700 3700 1500 3700
Wire Wire Line
	1700 3800 1500 3800
Wire Wire Line
	1700 3900 1500 3900
Wire Wire Line
	1700 4000 1500 4000
Wire Wire Line
	1700 4100 1500 4100
Wire Wire Line
	1700 4200 1500 4200
Wire Wire Line
	1700 4300 1500 4300
Wire Wire Line
	1700 4400 1500 4400
Wire Wire Line
	1700 4500 1500 4500
Wire Wire Line
	2700 4400 2900 4400
Wire Wire Line
	2700 4300 2900 4300
Wire Wire Line
	2700 4200 2900 4200
Wire Wire Line
	2700 4100 2900 4100
Wire Wire Line
	2700 4000 2900 4000
Wire Wire Line
	2700 3900 2900 3900
Wire Wire Line
	2700 3800 2900 3800
Wire Wire Line
	2700 3700 2900 3700
Wire Wire Line
	2700 3600 2900 3600
Wire Wire Line
	2700 3500 2900 3500
Wire Wire Line
	2700 3400 2900 3400
Wire Wire Line
	2700 3300 2900 3300
Text GLabel 3100 2500 1    50   Input ~ 0
R~W
Wire Wire Line
	3100 3200 2700 3200
NoConn ~ 2700 2800
NoConn ~ 2700 2700
NoConn ~ 1700 3200
NoConn ~ 1700 3000
NoConn ~ 1700 2800
Wire Wire Line
	1700 3100 1550 3100
Wire Wire Line
	1700 2700 1550 2700
Wire Wire Line
	1250 3100 1150 3100
Wire Wire Line
	1150 3100 1150 2700
Wire Wire Line
	1150 2700 1250 2700
Wire Wire Line
	1150 2500 1150 2700
Connection ~ 1150 2700
Text GLabel 1150 2500 1    50   Input ~ 0
+5V
Text GLabel 2800 2500 1    50   Input ~ 0
~RES
Wire Wire Line
	2800 2600 2700 2600
Wire Wire Line
	2700 4500 2800 4500
Wire Wire Line
	2800 4500 2800 4650
Entry Wire Line
	1400 3500 1500 3400
Entry Wire Line
	1400 3600 1500 3500
Entry Wire Line
	1400 3700 1500 3600
Entry Wire Line
	1400 3800 1500 3700
Entry Wire Line
	1400 3900 1500 3800
Entry Wire Line
	1400 4000 1500 3900
Entry Wire Line
	1400 4100 1500 4000
Entry Wire Line
	1400 4200 1500 4100
Entry Wire Line
	1400 4300 1500 4200
Entry Wire Line
	1400 4400 1500 4300
Entry Wire Line
	1400 4500 1500 4400
Entry Wire Line
	1400 4600 1500 4500
Entry Wire Line
	2900 4400 3000 4500
Entry Wire Line
	2900 4300 3000 4400
Entry Wire Line
	2900 4200 3000 4300
Entry Wire Line
	2900 4100 3000 4200
Entry Wire Line
	2900 3300 3000 3400
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
NoConn ~ 1700 2600
Wire Wire Line
	1300 1200 1300 1250
Wire Wire Line
	1300 1600 1300 1650
Text GLabel 1400 1250 2    50   Output ~ 0
+5V
Text GLabel 1400 1650 2    50   Output ~ 0
GND
Wire Wire Line
	1300 1650 1400 1650
Connection ~ 1300 1650
Wire Wire Line
	1300 1650 1300 1700
Wire Wire Line
	1300 1250 1400 1250
Connection ~ 1300 1250
Wire Wire Line
	1300 1250 1300 1300
Text GLabel 3650 4600 3    50   Input ~ 0
+5V
Text GLabel 5950 4600 3    50   Input ~ 0
+5V
Wire Wire Line
	5950 4500 6050 4500
Text GLabel 4850 2500 1    50   Input ~ 0
~RES
Text GLabel 7150 2500 1    50   Input ~ 0
~RES
Wire Wire Line
	4750 3200 4850 3200
Wire Wire Line
	7050 3200 7150 3200
Text GLabel 5000 2500 1    50   Input ~ 0
CLK
Text GLabel 7300 2500 1    50   Input ~ 0
CLK
Text GLabel 5950 2500 1    50   Input ~ 0
GND
Text Label 7500 2800 2    50   ~ 0
a0
Text Label 7500 2900 2    50   ~ 0
a1
Text Label 7500 3000 2    50   ~ 0
a2
Text Label 7500 3100 2    50   ~ 0
a3
Wire Wire Line
	7050 2800 7500 2800
Wire Wire Line
	7050 2900 7500 2900
Wire Wire Line
	7050 3000 7500 3000
Wire Wire Line
	7050 3100 7500 3100
Text Label 5200 2800 2    50   ~ 0
a0
Text Label 5200 2900 2    50   ~ 0
a1
Text Label 5200 3000 2    50   ~ 0
a2
Text Label 5200 3100 2    50   ~ 0
a3
Wire Wire Line
	4750 3100 5200 3100
Wire Wire Line
	4750 3000 5200 3000
Wire Wire Line
	4750 2900 5200 2900
Wire Wire Line
	4750 2800 5200 2800
NoConn ~ 4750 2600
NoConn ~ 4750 2700
NoConn ~ 3750 4300
NoConn ~ 3750 4400
NoConn ~ 6050 4400
NoConn ~ 6050 4300
NoConn ~ 7050 2700
NoConn ~ 7050 2600
Entry Wire Line
	5200 2800 5300 2700
Entry Wire Line
	5200 2900 5300 2800
Entry Wire Line
	5200 3000 5300 2900
Entry Wire Line
	5200 3100 5300 3000
Entry Wire Line
	7500 2800 7600 2700
Entry Wire Line
	7500 2900 7600 2800
Entry Wire Line
	7500 3000 7600 2900
Entry Wire Line
	7500 3100 7600 3000
Text Label 5200 3300 2    50   ~ 0
d0
Text Label 7500 3300 2    50   ~ 0
d0
Text Label 5200 3400 2    50   ~ 0
d1
Text Label 7500 3400 2    50   ~ 0
d1
Text Label 5200 3500 2    50   ~ 0
d2
Text Label 7500 3500 2    50   ~ 0
d2
Text Label 5200 3600 2    50   ~ 0
d3
Text Label 7500 3600 2    50   ~ 0
d3
Text Label 5200 3700 2    50   ~ 0
d4
Text Label 7500 3700 2    50   ~ 0
d4
Text Label 5200 3800 2    50   ~ 0
d5
Text Label 7500 3800 2    50   ~ 0
d5
Text Label 5200 3900 2    50   ~ 0
d6
Text Label 7500 3900 2    50   ~ 0
d6
Text Label 5200 4000 2    50   ~ 0
d7
Text Label 7500 4000 2    50   ~ 0
d7
Wire Wire Line
	4750 3300 5200 3300
Wire Wire Line
	4750 3400 5200 3400
Wire Wire Line
	4750 3500 5200 3500
Wire Wire Line
	4750 3600 5200 3600
Wire Wire Line
	4750 3700 5200 3700
Wire Wire Line
	4750 3800 5200 3800
Wire Wire Line
	4750 3900 5200 3900
Wire Wire Line
	4750 4000 5200 4000
Wire Wire Line
	7050 4000 7500 4000
Wire Wire Line
	7050 3900 7500 3900
Wire Wire Line
	7050 3800 7500 3800
Wire Wire Line
	7050 3700 7500 3700
Wire Wire Line
	7050 3600 7500 3600
Wire Wire Line
	7050 3500 7500 3500
Wire Wire Line
	7050 3400 7500 3400
Wire Wire Line
	7050 3300 7500 3300
Entry Wire Line
	5200 3300 5300 3200
Entry Wire Line
	5200 3400 5300 3300
Entry Wire Line
	5200 3500 5300 3400
Entry Wire Line
	5200 3600 5300 3500
Entry Wire Line
	5200 3700 5300 3600
Entry Wire Line
	5200 3800 5300 3700
Entry Wire Line
	5200 3900 5300 3800
Entry Wire Line
	5200 4000 5300 3900
Entry Wire Line
	7500 3300 7600 3200
Entry Wire Line
	7500 3400 7600 3300
Entry Wire Line
	7500 3500 7600 3400
Entry Wire Line
	7500 3600 7600 3500
Entry Wire Line
	7500 3700 7600 3600
Entry Wire Line
	7500 3800 7600 3700
Entry Wire Line
	7500 3900 7600 3800
Entry Wire Line
	7500 4000 7600 3900
Text GLabel 5050 4600 3    50   Input ~ 0
R~W
Text GLabel 7350 4600 3    50   Input ~ 0
R~W
Text GLabel 5250 4600 3    50   Input ~ 0
~IOCS
Text GLabel 7550 4600 3    50   Input ~ 0
~IOCS
Text Label 5200 4200 2    50   ~ 0
a12
Wire Wire Line
	5200 4200 4750 4200
Text Label 7500 4200 2    50   ~ 0
a11
Wire Wire Line
	7500 4200 7050 4200
Entry Wire Line
	5200 4200 5300 4100
Entry Wire Line
	7500 4200 7600 4100
Text GLabel 3650 2500 1    50   Input ~ 0
GND
Text Label 3450 2700 0    50   ~ 0
v1pa0
Text Label 3450 2800 0    50   ~ 0
v1pa1
Text Label 3450 2900 0    50   ~ 0
v1pa2
Text Label 3450 3000 0    50   ~ 0
v1pa3
Text Label 3450 3100 0    50   ~ 0
v1pa4
Text Label 3450 3200 0    50   ~ 0
v1pa5
Text Label 3450 3300 0    50   ~ 0
v1pa6
Text Label 3450 3400 0    50   ~ 0
v1pa7
Text Label 3450 3500 0    50   ~ 0
v1pb0
Text Label 3450 3600 0    50   ~ 0
v1pb1
Text Label 3450 3700 0    50   ~ 0
v1pb2
Text Label 3450 3800 0    50   ~ 0
v1pb3
Text Label 3450 3900 0    50   ~ 0
v1pb4
Text Label 3450 4000 0    50   ~ 0
v1pb5
Text Label 3450 4100 0    50   ~ 0
v1pb6
Text Label 3450 4200 0    50   ~ 0
v1pb7
Text Label 5750 2700 0    50   ~ 0
v2pa0
Text Label 5750 2800 0    50   ~ 0
v2pa1
Text Label 5750 2900 0    50   ~ 0
v2pa2
Text Label 5750 3000 0    50   ~ 0
v2pa3
Text Label 5750 3100 0    50   ~ 0
v2pa4
Text Label 5750 3200 0    50   ~ 0
v2pa5
Text Label 5750 3300 0    50   ~ 0
v2pa6
Text Label 5750 3400 0    50   ~ 0
v2pa7
Text Label 5750 3500 0    50   ~ 0
v2pb0
Text Label 5750 3600 0    50   ~ 0
v2pb1
Text Label 5750 3700 0    50   ~ 0
v2pb2
Text Label 5750 3800 0    50   ~ 0
v2pb3
Text Label 5750 3900 0    50   ~ 0
v2pb4
Text Label 5750 4000 0    50   ~ 0
v2pb5
Text Label 5750 4100 0    50   ~ 0
v2pb6
Text Label 5750 4200 0    50   ~ 0
v2pb7
Wire Wire Line
	3650 4500 3750 4500
Wire Wire Line
	5750 2700 6050 2700
Wire Wire Line
	5750 2800 6050 2800
Wire Wire Line
	5750 2900 6050 2900
Wire Wire Line
	5750 3000 6050 3000
Wire Wire Line
	5750 3100 6050 3100
Wire Wire Line
	5750 3200 6050 3200
Wire Wire Line
	5750 3300 6050 3300
Wire Wire Line
	5750 3400 6050 3400
Wire Wire Line
	5750 3500 6050 3500
Wire Wire Line
	5750 3600 6050 3600
Wire Wire Line
	5750 3700 6050 3700
Wire Wire Line
	5750 3800 6050 3800
Wire Wire Line
	5750 3900 6050 3900
Wire Wire Line
	5750 4000 6050 4000
Wire Wire Line
	5750 4100 6050 4100
Wire Wire Line
	5750 4200 6050 4200
Wire Wire Line
	3450 2700 3750 2700
Wire Wire Line
	3450 2800 3750 2800
Wire Wire Line
	3450 2900 3750 2900
Wire Wire Line
	3450 3000 3750 3000
Wire Wire Line
	3450 3100 3750 3100
Wire Wire Line
	3450 3200 3750 3200
Wire Wire Line
	3450 3300 3750 3300
Wire Wire Line
	3450 3400 3750 3400
Wire Wire Line
	3450 3500 3750 3500
Wire Wire Line
	3450 3600 3750 3600
Wire Wire Line
	3450 3700 3750 3700
Wire Wire Line
	3450 3800 3750 3800
Wire Wire Line
	3450 3900 3750 3900
Wire Wire Line
	3450 4000 3750 4000
Wire Wire Line
	3450 4100 3750 4100
Wire Wire Line
	3450 4200 3750 4200
Wire Wire Line
	3650 2500 3650 2600
Wire Wire Line
	3650 2600 3750 2600
Wire Wire Line
	5950 2500 5950 2600
Wire Wire Line
	5950 2600 6050 2600
Entry Wire Line
	3350 2600 3450 2700
Entry Wire Line
	3350 2700 3450 2800
Entry Wire Line
	3350 2800 3450 2900
Entry Wire Line
	3350 2900 3450 3000
Entry Wire Line
	3350 3000 3450 3100
Entry Wire Line
	3350 3100 3450 3200
Entry Wire Line
	3350 3200 3450 3300
Entry Wire Line
	3350 3300 3450 3400
Entry Wire Line
	3350 3600 3450 3500
Entry Wire Line
	3350 3700 3450 3600
Entry Wire Line
	3350 3800 3450 3700
Entry Wire Line
	3350 3900 3450 3800
Entry Wire Line
	3350 4000 3450 3900
Entry Wire Line
	3350 4100 3450 4000
Entry Wire Line
	3350 4200 3450 4100
Entry Wire Line
	3350 4300 3450 4200
Entry Wire Line
	5650 2600 5750 2700
Entry Wire Line
	5650 2700 5750 2800
Entry Wire Line
	5650 2800 5750 2900
Entry Wire Line
	5650 2900 5750 3000
Entry Wire Line
	5650 3000 5750 3100
Entry Wire Line
	5650 3100 5750 3200
Entry Wire Line
	5650 3200 5750 3300
Entry Wire Line
	5650 3300 5750 3400
Entry Wire Line
	5650 3600 5750 3500
Entry Wire Line
	5650 3700 5750 3600
Entry Wire Line
	5650 3800 5750 3700
Entry Wire Line
	5650 3900 5750 3800
Entry Wire Line
	5650 4000 5750 3900
Entry Wire Line
	5650 4100 5750 4000
Entry Wire Line
	5650 4200 5750 4100
Entry Wire Line
	5650 4300 5750 4200
Text GLabel 4850 4600 3    50   Input ~ 0
~V1IRQ
Text GLabel 7150 4600 3    50   Input ~ 0
~V2IRQ
Wire Wire Line
	4750 4500 4850 4500
Wire Wire Line
	4850 4500 4850 4600
Wire Wire Line
	4750 4400 5050 4400
Wire Wire Line
	5050 4400 5050 4600
Wire Wire Line
	4750 4300 5250 4300
Wire Wire Line
	5250 4300 5250 4600
Wire Wire Line
	7050 4500 7150 4500
Wire Wire Line
	7150 4500 7150 4600
Wire Wire Line
	7050 4400 7350 4400
Wire Wire Line
	7350 4400 7350 4600
Wire Wire Line
	7050 4300 7550 4300
Wire Wire Line
	7550 4300 7550 4600
Wire Wire Line
	7150 2500 7150 3200
Wire Wire Line
	7300 4100 7300 2500
Wire Wire Line
	7050 4100 7300 4100
Wire Wire Line
	4850 2500 4850 3200
Wire Wire Line
	5000 4100 5000 2500
Wire Wire Line
	4750 4100 5000 4100
Wire Wire Line
	1150 3300 1150 3100
Wire Wire Line
	1150 3300 1700 3300
Connection ~ 1150 3100
Wire Wire Line
	1600 2900 1700 2900
Wire Wire Line
	3100 3200 3100 2500
Wire Wire Line
	2950 2900 2950 2500
Wire Wire Line
	2800 2600 2800 2500
Text GLabel 2200 1850 3    50   Input ~ 0
GND
Text GLabel 2200 1050 1    50   Input ~ 0
+5V
Wire Wire Line
	2200 1750 2200 1850
Wire Wire Line
	2200 1150 2200 1050
Text GLabel 2600 1450 2    50   Output ~ 0
CLK
Wire Wire Line
	2500 1450 2600 1450
Text GLabel 3550 1050 1    50   Input ~ 0
+5V
Text GLabel 3550 1850 3    50   Input ~ 0
GND
Wire Wire Line
	3550 1850 3550 1750
Wire Wire Line
	3550 1050 3550 1150
Text GLabel 3950 1450 2    50   Output ~ 0
RS232CLK
Wire Wire Line
	3850 1450 3950 1450
Wire Wire Line
	3650 4500 3650 4600
Wire Wire Line
	5950 4600 5950 4500
Text GLabel 9600 4400 3    50   Input ~ 0
+5V
Wire Wire Line
	9500 4300 9600 4300
Wire Wire Line
	9600 4300 9600 4400
Text GLabel 8400 2900 1    50   Input ~ 0
GND
Wire Wire Line
	8400 2900 8400 3000
Wire Wire Line
	8400 3000 8500 3000
NoConn ~ 8500 3600
NoConn ~ 9500 3200
NoConn ~ 8500 3700
NoConn ~ 8500 4000
NoConn ~ 8500 3400
Wire Wire Line
	9500 4200 9600 4200
Wire Wire Line
	9600 4200 9600 4300
Connection ~ 9600 4300
Wire Wire Line
	9500 4100 9600 4100
Wire Wire Line
	9600 4100 9600 4200
Connection ~ 9600 4200
Text GLabel 9600 2900 1    50   Input ~ 0
R~W
Wire Wire Line
	9600 2900 9600 3000
Wire Wire Line
	9600 3000 9500 3000
Text GLabel 9750 2900 1    50   Input ~ 0
CLK
Wire Wire Line
	9750 2900 9750 3100
Wire Wire Line
	9750 3100 9500 3100
Text Label 9650 4000 2    50   ~ 0
d0
Text Label 9650 3900 2    50   ~ 0
d1
Text Label 9650 3800 2    50   ~ 0
d2
Text Label 9650 3700 2    50   ~ 0
d3
Text Label 9650 3600 2    50   ~ 0
d4
Text Label 9650 3500 2    50   ~ 0
d5
Text Label 9650 3400 2    50   ~ 0
d6
Text Label 9650 3300 2    50   ~ 0
d7
Wire Wire Line
	9500 3300 9650 3300
Wire Wire Line
	9500 3400 9650 3400
Wire Wire Line
	9500 3500 9650 3500
Wire Wire Line
	9500 3600 9650 3600
Wire Wire Line
	9500 3700 9650 3700
Wire Wire Line
	9500 3800 9650 3800
Wire Wire Line
	9500 3900 9650 3900
Wire Wire Line
	9500 4000 9650 4000
Entry Wire Line
	9650 3300 9750 3200
Entry Wire Line
	9650 3400 9750 3300
Entry Wire Line
	9650 3500 9750 3400
Entry Wire Line
	9650 3600 9750 3500
Entry Wire Line
	9650 3700 9750 3600
Entry Wire Line
	9650 3800 9750 3700
Entry Wire Line
	9650 3900 9750 3800
Entry Wire Line
	9650 4000 9750 3900
Text Label 8350 3100 0    50   ~ 0
a10
Text GLabel 8100 2900 1    50   Input ~ 0
~IOCS
Wire Wire Line
	8100 2900 8100 3200
Wire Wire Line
	8100 3200 8500 3200
Wire Wire Line
	8500 3100 8350 3100
Entry Wire Line
	8250 3000 8350 3100
Text GLabel 7950 2900 1    50   Input ~ 0
~RES
Wire Wire Line
	7950 2900 7950 3300
Wire Wire Line
	7950 3300 8500 3300
Text GLabel 8400 3500 0    50   Input ~ 0
RS232CLK
Wire Wire Line
	8400 3500 8500 3500
Text Label 8350 4200 0    50   ~ 0
a0
Text Label 8350 4300 0    50   ~ 0
a1
Wire Wire Line
	8350 4300 8500 4300
Wire Wire Line
	8350 4200 8500 4200
Entry Wire Line
	8250 4300 8350 4200
Entry Wire Line
	8250 4400 8350 4300
Wire Bus Line
	8250 4300 8250 4400
Text GLabel 8400 3800 0    50   Input ~ 0
GND
Wire Wire Line
	8400 3800 8500 3800
Text GLabel 8400 3900 0    50   Output ~ 0
TxD
Wire Wire Line
	8500 3900 8400 3900
Text GLabel 8400 4050 0    50   Input ~ 0
RxD
Wire Wire Line
	8400 4050 8450 4050
Wire Wire Line
	8450 4050 8450 4100
Wire Wire Line
	8450 4100 8500 4100
Wire Wire Line
	5500 1800 5600 1800
Text Label 4600 1100 0    50   ~ 0
a15
Wire Wire Line
	4900 1200 4800 1200
Wire Wire Line
	4800 1200 4800 1100
Wire Wire Line
	4800 1000 4900 1000
Wire Wire Line
	4600 1100 4800 1100
Connection ~ 4800 1100
Wire Wire Line
	4800 1100 4800 1000
Text Label 4600 1700 0    50   ~ 0
a13
Text Label 4600 1900 0    50   ~ 0
a14
Text Label 4600 2000 0    50   ~ 0
a13
Wire Wire Line
	5700 2000 4600 2000
Wire Wire Line
	4900 1900 4600 1900
Wire Wire Line
	4900 1700 4600 1700
Wire Wire Line
	5500 1100 5600 1100
Text GLabel 5600 1300 0    50   Input ~ 0
CLK
Wire Wire Line
	5600 1300 5700 1300
Entry Wire Line
	4500 1800 4600 1700
Entry Wire Line
	4500 2000 4600 1900
Entry Wire Line
	4500 2100 4600 2000
Entry Wire Line
	4500 1200 4600 1100
Text GLabel 6400 1900 2    50   Output ~ 0
~IOCS
Wire Wire Line
	6300 1900 6400 1900
Text GLabel 6400 1200 2    50   Output ~ 0
~RAM_CS
Wire Wire Line
	6300 1200 6400 1200
Text GLabel 6400 1500 2    50   Output ~ 0
~ROM_CS
Wire Wire Line
	5600 1800 5600 1500
Wire Wire Line
	5600 1500 6400 1500
Connection ~ 5600 1800
Wire Wire Line
	5600 1800 5700 1800
Text GLabel 6400 800  2    50   Output ~ 0
~ROM_OE
Wire Wire Line
	6400 800  5600 800 
Wire Wire Line
	5600 800  5600 1100
Connection ~ 5600 1100
Wire Wire Line
	5600 1100 5700 1100
Wire Bus Line
	8250 2900 8250 3000
Wire Bus Line
	7600 4100 7600 4000
$Comp
L 74xx:74HC02 U?
U 4 1 5E1744DD
P 5200 1800
F 0 "U?" H 5200 2125 50  0000 C CNN
F 1 "74HC02" H 5200 2034 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5200 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc02" H 5200 1800 50  0001 C CNN
	4    5200 1800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 3 1 5E171DC1
P 6000 1900
F 0 "U?" H 6000 2225 50  0000 C CNN
F 1 "74HC00" H 6000 2134 50  0000 C CNN
F 2 "" H 6000 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 6000 1900 50  0001 C CNN
	3    6000 1900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 2 1 5E16FD0A
P 6000 1200
F 0 "U?" H 6000 1525 50  0000 C CNN
F 1 "74HC00" H 6000 1434 50  0000 C CNN
F 2 "" H 6000 1200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 6000 1200 50  0001 C CNN
	2    6000 1200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 1 1 5E16D50B
P 5200 1100
F 0 "U?" H 5200 1425 50  0000 C CNN
F 1 "74HC00" H 5200 1334 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5200 1100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5200 1100 50  0001 C CNN
	1    5200 1100
	1    0    0    -1  
$EndComp
$Comp
L 6502:65C51N U?
U 1 1 5E222305
P 9000 3650
F 0 "U?" H 9000 4550 50  0000 C CNN
F 1 "65C51N" H 9000 4450 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 9000 3650 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c51n.pdf" H 9000 3650 50  0001 C CNN
	1    9000 3650
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 5E1E750E
P 3550 1450
F 0 "X?" H 3300 1500 50  0000 R CNN
F 1 "1.8432MHz" H 3300 1400 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 4000 1100 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 3450 1450 50  0001 C CNN
	1    3550 1450
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 5E1CCFB4
P 2200 1450
F 0 "X?" H 1950 1500 50  0000 R CNN
F 1 "8MHz" H 1950 1400 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 2650 1100 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 2100 1450 50  0001 C CNN
	1    2200 1450
	1    0    0    -1  
$EndComp
$Comp
L 6502:65C22S U?
U 1 1 5E173F5E
P 6550 3500
F 0 "U?" H 6550 4650 50  0000 C CNN
F 1 "65C22S" H 6550 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 6650 3500 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c22.pdf" H 6650 3500 50  0001 C CNN
	1    6550 3500
	1    0    0    -1  
$EndComp
$Comp
L 6502:65C22S U?
U 1 1 5E171BBD
P 4250 3500
F 0 "U?" H 4250 4650 50  0000 C CNN
F 1 "65C22S" H 4250 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 4350 3500 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c22.pdf" H 4350 3500 50  0001 C CNN
	1    4250 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E15B54A
P 1300 1450
F 0 "C?" H 1415 1496 50  0000 L CNN
F 1 "0.1uF" H 1415 1405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 1338 1300 50  0001 C CNN
F 3 "~" H 1300 1450 50  0001 C CNN
	1    1300 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5E15AF3A
P 1300 1700
F 0 "#PWR0101" H 1300 1450 50  0001 C CNN
F 1 "GND" H 1305 1527 50  0000 C CNN
F 2 "" H 1300 1700 50  0001 C CNN
F 3 "" H 1300 1700 50  0001 C CNN
	1    1300 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5E15AAC6
P 1300 1200
F 0 "#PWR0102" H 1300 1050 50  0001 C CNN
F 1 "+5V" H 1315 1373 50  0000 C CNN
F 2 "" H 1300 1200 50  0001 C CNN
F 3 "" H 1300 1200 50  0001 C CNN
	1    1300 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E14ABB7
P 1400 3100
F 0 "R?" V 1300 3100 50  0000 C CNN
F 1 "1K" V 1400 3100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1330 3100 50  0001 C CNN
F 3 "~" H 1400 3100 50  0001 C CNN
	1    1400 3100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E14A45B
P 1400 2700
F 0 "R?" V 1300 2700 50  0000 C CNN
F 1 "1K" V 1400 2700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1330 2700 50  0001 C CNN
F 3 "~" H 1400 2700 50  0001 C CNN
	1    1400 2700
	0    1    1    0   
$EndComp
$Comp
L 6502:65C02S U?
U 1 1 5E135500
P 2200 3500
F 0 "U?" H 2200 4650 50  0000 C CNN
F 1 "65C02S" H 2200 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 2050 4450 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c02s.pdf" H 2050 4450 50  0001 C CNN
	1    2200 3500
	1    0    0    -1  
$EndComp
Wire Bus Line
	5300 4100 5300 4000
$Comp
L 6502:28C256 U?
U 1 1 5E3D4005
P 2200 6300
F 0 "U?" H 2200 7215 50  0000 C CNN
F 1 "28C256" H 2200 7124 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 2150 7100 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 2200 6300 50  0001 C CNN
	1    2200 6300
	1    0    0    -1  
$EndComp
Text GLabel 2800 5550 1    50   Input ~ 0
+5V
Text GLabel 2950 5550 1    50   Input ~ 0
~ROM_OE
Text GLabel 3100 5550 1    50   Input ~ 0
~ROM_CS
Wire Wire Line
	2800 5550 2800 5650
Wire Wire Line
	2800 5650 2700 5650
Wire Wire Line
	2700 5750 2800 5750
Wire Wire Line
	2800 5750 2800 5650
Connection ~ 2800 5650
Wire Wire Line
	2950 5550 2950 6250
Wire Wire Line
	2950 6250 2700 6250
Wire Wire Line
	3100 5550 3100 6450
Wire Wire Line
	3100 6450 2700 6450
Text Label 2850 6550 2    50   ~ 0
d7
Text Label 2850 6650 2    50   ~ 0
d6
Text Label 2850 6750 2    50   ~ 0
d5
Text Label 2850 6850 2    50   ~ 0
d4
Text Label 2850 6950 2    50   ~ 0
d3
Wire Wire Line
	2700 6950 2850 6950
Wire Wire Line
	2700 6850 2850 6850
Wire Wire Line
	2700 6750 2850 6750
Wire Wire Line
	2700 6650 2850 6650
Wire Wire Line
	2700 6550 2850 6550
Text GLabel 1600 7050 3    50   Input ~ 0
GND
Wire Wire Line
	1600 7050 1600 6950
Wire Wire Line
	1600 6950 1700 6950
Text Label 1550 6850 0    50   ~ 0
d2
Text Label 1550 6750 0    50   ~ 0
d1
Text Label 1550 6650 0    50   ~ 0
d0
Wire Wire Line
	1550 6650 1700 6650
Wire Wire Line
	1550 6750 1700 6750
Wire Wire Line
	1550 6850 1700 6850
Entry Wire Line
	2850 6550 2950 6650
Entry Wire Line
	2850 6650 2950 6750
Entry Wire Line
	2850 6750 2950 6850
Entry Wire Line
	2850 6850 2950 6950
Entry Wire Line
	2850 6950 2950 7050
Entry Wire Line
	1450 6950 1550 6850
Entry Wire Line
	1450 6850 1550 6750
Entry Wire Line
	1450 6750 1550 6650
Text Label 1550 5650 0    50   ~ 0
a14
Text Label 1550 5750 0    50   ~ 0
a12
Text Label 1550 5850 0    50   ~ 0
a7
Text Label 1550 5950 0    50   ~ 0
a6
Text Label 1550 6050 0    50   ~ 0
a5
Text Label 1550 6150 0    50   ~ 0
a4
Text Label 1550 6250 0    50   ~ 0
a3
Text Label 1550 6350 0    50   ~ 0
a2
Text Label 1550 6450 0    50   ~ 0
a1
Text Label 1550 6550 0    50   ~ 0
a0
Text Label 3250 5850 2    50   ~ 0
a13
Text Label 3250 5950 2    50   ~ 0
a8
Text Label 3250 6050 2    50   ~ 0
a9
Text Label 3250 6150 2    50   ~ 0
a11
Text Label 3250 6350 2    50   ~ 0
a10
Wire Wire Line
	2700 5850 3250 5850
Wire Wire Line
	2700 5950 3250 5950
Wire Wire Line
	2700 6050 3250 6050
Wire Wire Line
	2700 6150 3250 6150
Wire Wire Line
	2700 6350 3250 6350
Wire Wire Line
	1700 5650 1550 5650
Wire Wire Line
	1700 5750 1550 5750
Wire Wire Line
	1700 5850 1550 5850
Wire Wire Line
	1700 5950 1550 5950
Wire Wire Line
	1700 6050 1550 6050
Wire Wire Line
	1700 6150 1550 6150
Wire Wire Line
	1700 6250 1550 6250
Wire Wire Line
	1700 6350 1550 6350
Wire Wire Line
	1700 6450 1550 6450
Wire Wire Line
	1700 6550 1550 6550
Entry Wire Line
	1450 5550 1550 5650
Entry Wire Line
	1450 5650 1550 5750
Entry Wire Line
	1450 5750 1550 5850
Entry Wire Line
	1450 5850 1550 5950
Entry Wire Line
	1450 5950 1550 6050
Entry Wire Line
	1450 6050 1550 6150
Entry Wire Line
	1450 6150 1550 6250
Entry Wire Line
	1450 6250 1550 6350
Entry Wire Line
	1450 6350 1550 6450
Entry Wire Line
	1450 6450 1550 6550
Entry Wire Line
	3250 5850 3350 5950
Entry Wire Line
	3250 5950 3350 6050
Entry Wire Line
	3250 6050 3350 6150
Entry Wire Line
	3250 6150 3350 6250
Entry Wire Line
	3250 6350 3350 6450
$Comp
L 6502:62256 U?
U 1 1 5E37B16A
P 4250 6300
F 0 "U?" H 4250 7215 50  0000 C CNN
F 1 "62256" H 4250 7124 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 4200 7100 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 4250 6300 50  0001 C CNN
	1    4250 6300
	1    0    0    -1  
$EndComp
Text GLabel 4850 5550 1    50   Input ~ 0
+5V
Wire Wire Line
	4850 5550 4850 5650
Wire Wire Line
	4850 5650 4750 5650
Wire Wire Line
	5150 5550 5150 6250
Wire Wire Line
	5150 6250 4750 6250
Text Label 4900 6550 2    50   ~ 0
d7
Text Label 4900 6650 2    50   ~ 0
d6
Text Label 4900 6750 2    50   ~ 0
d5
Text Label 4900 6850 2    50   ~ 0
d4
Text Label 4900 6950 2    50   ~ 0
d3
Wire Wire Line
	4750 6950 4900 6950
Wire Wire Line
	4750 6850 4900 6850
Wire Wire Line
	4750 6750 4900 6750
Wire Wire Line
	4750 6650 4900 6650
Wire Wire Line
	4750 6550 4900 6550
Text GLabel 3650 7050 3    50   Input ~ 0
GND
Wire Wire Line
	3650 7050 3650 6950
Wire Wire Line
	3650 6950 3750 6950
Text Label 3600 6850 0    50   ~ 0
d2
Text Label 3600 6750 0    50   ~ 0
d1
Text Label 3600 6650 0    50   ~ 0
d0
Wire Wire Line
	3600 6650 3750 6650
Wire Wire Line
	3600 6750 3750 6750
Wire Wire Line
	3600 6850 3750 6850
Entry Wire Line
	4900 6550 5000 6650
Entry Wire Line
	4900 6650 5000 6750
Entry Wire Line
	4900 6750 5000 6850
Entry Wire Line
	4900 6850 5000 6950
Entry Wire Line
	4900 6950 5000 7050
Entry Wire Line
	3500 6950 3600 6850
Entry Wire Line
	3500 6850 3600 6750
Entry Wire Line
	3500 6750 3600 6650
Text Label 3600 5650 0    50   ~ 0
a14
Text Label 3600 5750 0    50   ~ 0
a12
Text Label 3600 5850 0    50   ~ 0
a7
Text Label 3600 5950 0    50   ~ 0
a6
Text Label 3600 6050 0    50   ~ 0
a5
Text Label 3600 6150 0    50   ~ 0
a4
Text Label 3600 6250 0    50   ~ 0
a3
Text Label 3600 6350 0    50   ~ 0
a2
Text Label 3600 6450 0    50   ~ 0
a1
Text Label 3600 6550 0    50   ~ 0
a0
Wire Wire Line
	3750 5650 3600 5650
Wire Wire Line
	3750 5750 3600 5750
Wire Wire Line
	3750 5850 3600 5850
Wire Wire Line
	3750 5950 3600 5950
Wire Wire Line
	3750 6050 3600 6050
Wire Wire Line
	3750 6150 3600 6150
Wire Wire Line
	3750 6250 3600 6250
Wire Wire Line
	3750 6350 3600 6350
Wire Wire Line
	3750 6450 3600 6450
Wire Wire Line
	3750 6550 3600 6550
Entry Wire Line
	3500 5550 3600 5650
Entry Wire Line
	3500 5650 3600 5750
Entry Wire Line
	3500 5750 3600 5850
Entry Wire Line
	3500 5850 3600 5950
Entry Wire Line
	3500 5950 3600 6050
Entry Wire Line
	3500 6050 3600 6150
Entry Wire Line
	3500 6150 3600 6250
Entry Wire Line
	3500 6250 3600 6350
Entry Wire Line
	3500 6350 3600 6450
Entry Wire Line
	3500 6450 3600 6550
Text GLabel 5150 5550 1    50   Input ~ 0
~RAM_CS
Entry Wire Line
	5300 6350 5400 6450
Entry Wire Line
	5300 6150 5400 6250
Entry Wire Line
	5300 6050 5400 6150
Entry Wire Line
	5300 5950 5400 6050
Entry Wire Line
	5300 5850 5400 5950
Wire Wire Line
	4750 6350 5300 6350
Text Label 5300 6350 2    50   ~ 0
a10
Wire Wire Line
	4750 6150 5300 6150
Text Label 5300 6150 2    50   ~ 0
a11
Wire Wire Line
	4750 6050 5300 6050
Text Label 5300 6050 2    50   ~ 0
a9
Wire Wire Line
	4750 5950 5300 5950
Text Label 5300 5950 2    50   ~ 0
a8
Wire Wire Line
	4750 5850 5300 5850
Text Label 5300 5850 2    50   ~ 0
a13
Wire Wire Line
	5150 6250 5150 6450
Wire Wire Line
	5150 6450 4750 6450
Connection ~ 5150 6250
Text GLabel 5000 5550 1    50   Input ~ 0
R~W
Wire Wire Line
	5000 5750 5000 5550
Wire Wire Line
	4750 5750 5000 5750
$Comp
L Timer:NE555 U?
U 1 1 5E17C676
P 8700 1400
F 0 "U?" H 8700 1450 50  0000 C CNN
F 1 "NE555" H 8700 1350 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 8700 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne555.pdf" H 8700 1400 50  0001 C CNN
	1    8700 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 1600 8100 1600
Wire Wire Line
	8700 1800 8700 2100
Wire Wire Line
	9200 1400 9300 1400
Wire Wire Line
	9300 1400 9300 1600
Wire Wire Line
	9300 1600 9200 1600
$Comp
L Device:R R?
U 1 1 5E1F5B26
P 9300 950
F 0 "R?" V 9200 950 50  0000 C CNN
F 1 "47K" V 9300 950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9230 950 50  0001 C CNN
F 3 "~" H 9300 950 50  0001 C CNN
	1    9300 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5E2337BD
P 9300 1850
F 0 "C?" H 9418 1896 50  0000 L CNN
F 1 "10uF" H 9418 1805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 9338 1700 50  0001 C CNN
F 3 "~" H 9300 1850 50  0001 C CNN
	1    9300 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 1700 9300 1600
Connection ~ 9300 1600
Wire Wire Line
	9300 2000 9300 2100
Wire Wire Line
	9300 2100 8700 2100
Connection ~ 8700 2100
NoConn ~ 8200 1400
$Comp
L Switch:SW_Push SW?
U 1 1 5E2CBD4E
P 7800 1650
F 0 "SW?" V 7850 1950 50  0000 R CNN
F 1 "RESET" V 7750 2000 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 7800 1850 50  0001 C CNN
F 3 "~" H 7800 1850 50  0001 C CNN
	1    7800 1650
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E2ECA64
P 7950 1850
F 0 "C?" H 8065 1896 50  0000 L CNN
F 1 "0.1uF" H 8065 1805 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 7988 1700 50  0001 C CNN
F 3 "~" H 7950 1850 50  0001 C CNN
	1    7950 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 1850 7800 2100
Wire Wire Line
	7800 2100 7950 2100
Wire Wire Line
	7950 2000 7950 2100
Connection ~ 7950 2100
Wire Wire Line
	7950 2100 8700 2100
Wire Wire Line
	7950 1700 7950 1200
Wire Wire Line
	7950 1200 8200 1200
Wire Wire Line
	7800 1450 7800 1200
Wire Wire Line
	7800 1200 7950 1200
Connection ~ 7950 1200
$Comp
L Device:R R?
U 1 1 5E3A85D8
P 7950 950
F 0 "R?" V 7850 950 50  0000 C CNN
F 1 "1M" V 7950 950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7880 950 50  0001 C CNN
F 3 "~" H 7950 950 50  0001 C CNN
	1    7950 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 1200 7950 1100
Wire Wire Line
	7950 800  7950 700 
Wire Wire Line
	7950 700  8100 700 
Wire Wire Line
	9200 1200 9400 1200
Text GLabel 10300 1200 2    50   Output ~ 0
~RES
Wire Wire Line
	10100 1200 10200 1200
$Comp
L Device:R R?
U 1 1 5E552FBE
P 10200 950
F 0 "R?" V 10100 950 50  0000 C CNN
F 1 "1K" V 10200 950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 10130 950 50  0001 C CNN
F 3 "~" H 10200 950 50  0001 C CNN
	1    10200 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 700  8100 1600
Wire Wire Line
	9300 1400 9300 1100
Connection ~ 9300 1400
Wire Wire Line
	9300 800  9300 700 
Wire Wire Line
	9300 700  8700 700 
Wire Wire Line
	8100 700  8700 700 
Connection ~ 8100 700 
Connection ~ 8700 700 
Wire Wire Line
	10200 800  10200 700 
Wire Wire Line
	10200 700  9300 700 
Connection ~ 9300 700 
Wire Wire Line
	10200 1100 10200 1200
Connection ~ 10200 1200
Wire Wire Line
	10200 1200 10300 1200
Wire Wire Line
	8700 1000 8700 700 
Text GLabel 7300 700  0    50   Input ~ 0
+5V
Connection ~ 7800 2100
Wire Wire Line
	7300 700  7400 700 
Connection ~ 7950 700 
Wire Wire Line
	7250 2100 7400 2100
Text GLabel 7250 2100 0    50   Input ~ 0
GND
$Comp
L Device:C C?
U 1 1 5E7C431C
P 7400 1400
F 0 "C?" H 7515 1446 50  0000 L CNN
F 1 "0.1uF" H 7515 1355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 7438 1250 50  0001 C CNN
F 3 "~" H 7400 1400 50  0001 C CNN
	1    7400 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 1550 7400 2100
Connection ~ 7400 2100
Wire Wire Line
	7400 2100 7800 2100
Wire Wire Line
	7400 1250 7400 700 
Connection ~ 7400 700 
Wire Wire Line
	7400 700  7950 700 
Text GLabel 3250 2500 1    50   Input ~ 0
+5V
Wire Wire Line
	2700 3000 3250 3000
Wire Wire Line
	3250 3000 3250 2500
$Comp
L 74xx:74HC00 U?
U 4 1 5E218D59
P 9800 1200
F 0 "U?" H 9800 1525 50  0000 C CNN
F 1 "74HC00" H 9800 1434 50  0000 C CNN
F 2 "" H 9800 1200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 9800 1200 50  0001 C CNN
	4    9800 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 1100 9400 1100
Wire Wire Line
	9400 1100 9400 1200
Wire Wire Line
	9400 1300 9500 1300
Connection ~ 9400 1200
Wire Wire Line
	9400 1200 9400 1300
Wire Bus Line
	3500 6750 3500 6950
Wire Bus Line
	1450 6750 1450 6950
Wire Bus Line
	3000 4200 3000 4500
Wire Bus Line
	5300 2700 5300 3000
Wire Bus Line
	7600 2700 7600 3000
Wire Bus Line
	4500 1200 4500 2100
Wire Bus Line
	5400 5950 5400 6450
Wire Bus Line
	5000 6650 5000 7050
Wire Bus Line
	3350 5950 3350 6450
Wire Bus Line
	2950 6650 2950 7050
Wire Bus Line
	3000 3400 3000 4100
Wire Bus Line
	5300 3200 5300 3900
Wire Bus Line
	7600 3200 7600 3900
Wire Bus Line
	3350 2600 3350 3300
Wire Bus Line
	3350 3600 3350 4300
Wire Bus Line
	5650 2600 5650 3300
Wire Bus Line
	5650 3600 5650 4300
Wire Bus Line
	9750 3200 9750 3900
Wire Bus Line
	3500 5550 3500 6450
Wire Bus Line
	1450 5550 1450 6450
Wire Bus Line
	1400 3500 1400 4600
$EndSCHEMATC
