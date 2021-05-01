EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title "DB6502 Hobby Computer Version 2"
Date "2020-11-03"
Rev "v003"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Open Source Hardware"
Comment4 "Author: Dawid Buchwald"
$EndDescr
Text GLabel 1650 1150 1    50   Input ~ 0
6502_RDY_IN
NoConn ~ 1900 1450
Text GLabel 1500 1150 1    50   Input ~ 0
~IRQ
Text GLabel 1350 1150 1    50   Output ~ 0
~ML
Text GLabel 1800 1150 1    50   Output ~ 0
~VP
Wire Wire Line
	1800 1150 1800 1250
Wire Wire Line
	1800 1250 1900 1250
Wire Wire Line
	1650 1150 1650 1350
Wire Wire Line
	1650 1350 1900 1350
Wire Wire Line
	1500 1150 1500 1550
Wire Wire Line
	1500 1550 1900 1550
Wire Wire Line
	1350 1150 1350 1650
Wire Wire Line
	1350 1650 1900 1650
Text GLabel 1200 1150 1    50   Input ~ 0
~NMI
Wire Wire Line
	1200 1150 1200 1750
Wire Wire Line
	1200 1750 1900 1750
Text GLabel 1050 1150 1    50   Output ~ 0
SYNC
Wire Wire Line
	1050 1150 1050 1850
Wire Wire Line
	1050 1850 1900 1850
Wire Wire Line
	900  1150 900  1950
Wire Wire Line
	900  1950 1900 1950
Text Label 1700 2050 0    50   ~ 0
a0
Text Label 1700 2150 0    50   ~ 0
a1
Text Label 1700 2250 0    50   ~ 0
a2
Text Label 1700 2350 0    50   ~ 0
a3
Text Label 1700 2450 0    50   ~ 0
a4
Text Label 1700 2550 0    50   ~ 0
a5
Text Label 1700 2650 0    50   ~ 0
a6
Text Label 1700 2750 0    50   ~ 0
a7
Text Label 1700 2850 0    50   ~ 0
a8
Text Label 1700 2950 0    50   ~ 0
a9
Text Label 1700 3050 0    50   ~ 0
a10
Text Label 1700 3150 0    50   ~ 0
a11
Entry Wire Line
	1600 2150 1700 2050
Entry Wire Line
	1600 2250 1700 2150
Entry Wire Line
	1600 2350 1700 2250
Entry Wire Line
	1600 2450 1700 2350
Entry Wire Line
	1600 2550 1700 2450
Entry Wire Line
	1600 2650 1700 2550
Entry Wire Line
	1600 2750 1700 2650
Entry Wire Line
	1600 2850 1700 2750
Entry Wire Line
	1600 2950 1700 2850
Entry Wire Line
	1600 3050 1700 2950
Entry Wire Line
	1600 3150 1700 3050
Entry Wire Line
	1600 3250 1700 3150
Wire Wire Line
	1700 2050 1900 2050
Wire Wire Line
	1700 2150 1900 2150
Wire Wire Line
	1700 2250 1900 2250
Wire Wire Line
	1700 2350 1900 2350
Wire Wire Line
	1700 2450 1900 2450
Wire Wire Line
	1700 2550 1900 2550
Wire Wire Line
	1700 2650 1900 2650
Wire Wire Line
	1700 2750 1900 2750
Wire Wire Line
	1700 2850 1900 2850
Wire Wire Line
	1700 2950 1900 2950
Wire Wire Line
	1700 3050 1900 3050
Wire Wire Line
	1700 3150 1900 3150
Text GLabel 900  1150 1    50   Input ~ 0
+5V
Text Label 3100 3050 2    50   ~ 0
a12
Text Label 3100 2950 2    50   ~ 0
a13
Text Label 3100 2850 2    50   ~ 0
a14
Text Label 3100 2750 2    50   ~ 0
a15
Entry Wire Line
	3100 2750 3200 2850
Entry Wire Line
	3100 2850 3200 2950
Entry Wire Line
	3100 2950 3200 3050
Entry Wire Line
	3100 3050 3200 3150
Wire Wire Line
	2900 2750 3100 2750
Wire Wire Line
	2900 2850 3100 2850
Wire Wire Line
	2900 2950 3100 2950
Wire Wire Line
	2900 3050 3100 3050
Text Label 3100 1950 2    50   ~ 0
d0
Text Label 3100 2050 2    50   ~ 0
d1
Text Label 3100 2150 2    50   ~ 0
d2
Text Label 3100 2250 2    50   ~ 0
d3
Text Label 3100 2350 2    50   ~ 0
d4
Text Label 3100 2450 2    50   ~ 0
d5
Text Label 3100 2550 2    50   ~ 0
d6
Text Label 3100 2650 2    50   ~ 0
d7
Entry Wire Line
	3100 1950 3200 2050
Entry Wire Line
	3100 2050 3200 2150
Entry Wire Line
	3100 2150 3200 2250
Entry Wire Line
	3100 2250 3200 2350
Entry Wire Line
	3100 2350 3200 2450
Entry Wire Line
	3100 2450 3200 2550
Entry Wire Line
	3100 2550 3200 2650
Entry Wire Line
	3100 2650 3200 2750
Wire Wire Line
	2900 2650 3100 2650
Wire Wire Line
	2900 2550 3100 2550
Wire Wire Line
	2900 2450 3100 2450
Wire Wire Line
	2900 2350 3100 2350
Wire Wire Line
	2900 2250 3100 2250
Wire Wire Line
	2900 2150 3100 2150
Wire Wire Line
	2900 2050 3100 2050
Wire Wire Line
	2900 1950 3100 1950
Text GLabel 3000 3250 3    50   Input ~ 0
GND
Wire Wire Line
	2900 3150 3000 3150
Wire Wire Line
	3000 3150 3000 3250
Wire Bus Line
	1600 3550 3200 3550
Text GLabel 1750 3400 2    50   Input ~ 0
a[0..15]
Wire Bus Line
	1750 3400 1600 3400
Connection ~ 1600 3400
Wire Bus Line
	1600 3400 1600 3550
Text GLabel 3300 2750 2    50   Input ~ 0
d[0..7]
Text GLabel 3000 1150 1    50   Input ~ 0
~6502_RES
Wire Wire Line
	3000 1150 3000 1250
Wire Wire Line
	3000 1250 2900 1250
NoConn ~ 2900 1350
Text GLabel 3150 1150 1    50   Input ~ 0
~SO
Wire Wire Line
	3150 1150 3150 1450
Wire Wire Line
	3150 1450 2900 1450
Text GLabel 3300 1150 1    50   Input ~ 0
6502_CLK
Wire Wire Line
	3300 1150 3300 1550
Wire Wire Line
	3300 1550 2900 1550
Text GLabel 3450 1150 1    50   Input ~ 0
BE
Wire Wire Line
	3450 1150 3450 1650
Wire Wire Line
	3450 1650 2900 1650
Text GLabel 3600 1150 1    50   Output ~ 0
R~W
Wire Wire Line
	3600 1150 3600 1850
Wire Wire Line
	3600 1850 2900 1850
$Comp
L 6502:22V10C U7
U 1 1 5F680A6E
P 6950 4500
F 0 "U7" H 6700 5300 50  0000 C CNN
F 1 "22V10C" H 6700 5200 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W7.62mm_Socket" H 6950 3800 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1627189.pdf" H 6950 4500 50  0001 C CNN
	1    6950 4500
	1    0    0    -1  
$EndComp
Text GLabel 6200 3850 1    50   Input ~ 0
R~W
Wire Wire Line
	6350 3950 6450 3950
Wire Wire Line
	6200 3850 6200 4050
Wire Wire Line
	6200 4050 6450 4050
Text Label 6250 4250 0    50   ~ 0
a15
Text Label 6250 4350 0    50   ~ 0
a14
Text Label 6250 4450 0    50   ~ 0
a13
Text Label 6250 4550 0    50   ~ 0
a12
Text Label 6250 4650 0    50   ~ 0
a11
Text Label 6250 4750 0    50   ~ 0
a10
Text Label 6250 4850 0    50   ~ 0
a9
Text Label 6250 4950 0    50   ~ 0
a8
Text GLabel 6050 3850 1    50   Input ~ 0
EXRAM
Wire Wire Line
	6250 4950 6450 4950
Wire Wire Line
	6250 4850 6450 4850
Wire Wire Line
	6250 4750 6450 4750
Wire Wire Line
	6250 4650 6450 4650
Wire Wire Line
	6250 4550 6450 4550
Wire Wire Line
	6250 4450 6450 4450
Wire Wire Line
	6250 4350 6450 4350
Wire Wire Line
	6250 4250 6450 4250
Entry Wire Line
	6150 4350 6250 4250
Entry Wire Line
	6150 4450 6250 4350
Entry Wire Line
	6150 4550 6250 4450
Entry Wire Line
	6150 4650 6250 4550
Entry Wire Line
	6150 4750 6250 4650
Entry Wire Line
	6150 4850 6250 4750
Entry Wire Line
	6150 4950 6250 4850
Entry Wire Line
	6150 5050 6250 4950
Wire Wire Line
	7450 3950 7550 3950
Wire Wire Line
	7550 3950 7550 3750
Text GLabel 6350 5150 3    50   Input ~ 0
GND
Wire Wire Line
	6350 5150 6350 5050
Wire Wire Line
	6350 5050 6450 5050
Wire Wire Line
	6050 3850 6050 4150
Wire Wire Line
	6050 4150 6450 4150
Text GLabel 7700 3850 1    50   Output ~ 0
~PLD_WR
Text GLabel 7850 3850 1    50   Output ~ 0
~PLD_RD
Wire Wire Line
	7700 3850 7700 4050
Wire Wire Line
	7700 4050 7450 4050
Wire Wire Line
	7850 3850 7850 4150
Wire Wire Line
	7850 4150 7450 4150
Text GLabel 8000 3850 1    50   Output ~ 0
RAM1_~CS
Wire Wire Line
	8000 3850 8000 4250
Wire Wire Line
	8000 4250 7450 4250
Text GLabel 8150 3850 1    50   Output ~ 0
RAM2_~CS
Wire Wire Line
	8150 3850 8150 4350
Wire Wire Line
	8150 4350 7450 4350
Text GLabel 8300 3850 1    50   Output ~ 0
ROM_~CS
Wire Wire Line
	8300 3850 8300 4450
Wire Wire Line
	8300 4450 7450 4450
Text Label 8600 4250 0    50   ~ 0
a7
Text Label 8600 4150 0    50   ~ 0
a6
Text Label 8600 4050 0    50   ~ 0
a5
Entry Wire Line
	8500 4150 8600 4050
Entry Wire Line
	8500 4250 8600 4150
Entry Wire Line
	8500 4350 8600 4250
Wire Wire Line
	8600 4050 8750 4050
Wire Wire Line
	8600 4150 8750 4150
Wire Wire Line
	8600 4250 8750 4250
Text GLabel 9350 3700 2    50   Input ~ 0
+5V
Wire Wire Line
	9350 3700 9250 3700
Text GLabel 9350 5150 2    50   Input ~ 0
GND
Wire Wire Line
	9350 5150 9250 5150
Wire Wire Line
	9250 5150 8650 5150
Wire Wire Line
	8650 5150 8650 4750
Wire Wire Line
	8650 4750 8750 4750
Connection ~ 9250 5150
Wire Wire Line
	9250 5150 9250 5050
Wire Wire Line
	8650 4750 8650 4650
Wire Wire Line
	8650 4650 8750 4650
Connection ~ 8650 4750
Text GLabel 9850 3950 1    50   Output ~ 0
~LATCH
Wire Wire Line
	9750 4050 9850 4050
Wire Wire Line
	9850 4050 9850 3950
Text GLabel 10000 3950 1    50   Output ~ 0
~VIA1
Wire Wire Line
	10000 3950 10000 4150
Wire Wire Line
	10000 4150 9750 4150
Text GLabel 10150 3950 1    50   Output ~ 0
~VIA2
Wire Wire Line
	10150 3950 10150 4250
Wire Wire Line
	10150 4250 9750 4250
Text GLabel 10300 3950 1    50   Output ~ 0
~UART
Wire Wire Line
	10300 3950 10300 4350
Wire Wire Line
	10300 4350 9750 4350
Text GLabel 9850 4850 3    50   Output ~ 0
~IOCS3
Text GLabel 10000 4850 3    50   Output ~ 0
~IOCS2
Text GLabel 10150 4850 3    50   Output ~ 0
~IOCS1
Text GLabel 10300 4850 3    50   Output ~ 0
~IOCS0
Wire Wire Line
	9850 4850 9850 4750
Wire Wire Line
	9850 4750 9750 4750
Wire Wire Line
	9750 4650 10000 4650
Wire Wire Line
	10000 4650 10000 4850
Wire Wire Line
	9750 4550 10150 4550
Wire Wire Line
	10150 4550 10150 4850
Wire Wire Line
	9750 4450 10300 4450
Wire Wire Line
	10300 4450 10300 4850
Text GLabel 7550 5050 2    50   Input ~ 0
IN12
Text GLabel 7550 4950 2    50   Input ~ 0
IO13
Text GLabel 7550 4750 2    50   Input ~ 0
IO15
Text GLabel 7550 4650 2    50   Output ~ 0
IO16
$Sheet
S 8700 5950 750  350 
U 6014B4D9
F0 "ports" 50
F1 "ports.sch" 50
$EndSheet
$Comp
L 74xx:74LS138 U6
U 1 1 5F9A1F2C
P 9250 4350
F 0 "U6" H 9250 4350 50  0000 C CNN
F 1 "74AC138" H 9150 4250 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 9250 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 9250 4350 50  0001 C CNN
	1    9250 4350
	1    0    0    -1  
$EndComp
$Comp
L 6502:65C02S U4
U 1 1 5F5A65C1
P 2400 2150
F 0 "U4" H 2400 3315 50  0000 C CNN
F 1 "65C02S" H 2400 3224 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 2400 3200 50  0001 C CNN
F 3 "" H 2250 3100 50  0001 C CNN
	1    2400 2150
	1    0    0    -1  
$EndComp
Wire Bus Line
	3200 2750 3300 2750
$Sheet
S 6950 5950 700  350 
U 5F8F4E1E
F0 "supervisor" 50
F1 "supervisor.sch" 50
$EndSheet
$Comp
L Device:C_Small C4
U 1 1 5FFF1E28
P 900 2150
F 0 "C4" H 992 2196 50  0000 L CNN
F 1 "0,1uF" H 992 2105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 900 2150 50  0001 C CNN
F 3 "~" H 900 2150 50  0001 C CNN
	1    900  2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  2050 900  1950
Connection ~ 900  1950
Text GLabel 900  2350 3    50   Input ~ 0
GND
Wire Wire Line
	900  2350 900  2250
Text GLabel 7550 3650 1    50   Input ~ 0
+5V
$Comp
L Device:C_Small C6
U 1 1 600EDE42
P 7350 3750
F 0 "C6" V 7121 3750 50  0000 C CNN
F 1 "0,1uF" V 7212 3750 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7350 3750 50  0001 C CNN
F 3 "~" H 7350 3750 50  0001 C CNN
	1    7350 3750
	0    1    1    0   
$EndComp
Text GLabel 7150 3750 0    50   Input ~ 0
GND
Wire Wire Line
	7150 3750 7250 3750
Wire Wire Line
	7450 3750 7550 3750
Connection ~ 7550 3750
Wire Wire Line
	7550 3750 7550 3650
$Comp
L Device:C_Small C5
U 1 1 60156577
P 9050 3700
F 0 "C5" V 8821 3700 50  0000 C CNN
F 1 "0,1uF" V 8912 3700 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9050 3700 50  0001 C CNN
F 3 "~" H 9050 3700 50  0001 C CNN
	1    9050 3700
	0    1    1    0   
$EndComp
Text GLabel 8850 3700 0    50   Input ~ 0
GND
Wire Wire Line
	8850 3700 8950 3700
Wire Wire Line
	9150 3700 9250 3700
Connection ~ 9250 3700
Wire Wire Line
	9250 3700 9250 3750
$Sheet
S 7800 5950 750  350 
U 5F910E81
F0 "serial" 50
F1 "serial.sch" 50
$EndSheet
$Comp
L 74xx:74LS21 U9
U 1 1 5FB20233
P 5950 7300
F 0 "U9" H 5950 7675 50  0000 C CNN
F 1 "74HC21" H 5950 7584 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5950 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 5950 7300 50  0001 C CNN
	1    5950 7300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS21 U9
U 2 1 5FB22533
P 3250 7300
F 0 "U9" H 3250 7675 50  0000 C CNN
F 1 "74HC21" H 3250 7584 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3250 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 3250 7300 50  0001 C CNN
	2    3250 7300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS21 U9
U 3 1 5FB2300D
P 1000 7000
F 0 "U9" H 1000 7050 50  0000 C CNN
F 1 "74HC21" H 1000 6950 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1000 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 1000 7000 50  0001 C CNN
	3    1000 7000
	1    0    0    -1  
$EndComp
Text GLabel 900  6450 0    50   Input ~ 0
+5V
Text GLabel 900  7550 0    50   Input ~ 0
GND
Wire Wire Line
	900  7550 1000 7550
Wire Wire Line
	1000 6500 1000 6450
$Comp
L Device:C_Small C8
U 1 1 5FB8CE95
P 1300 7000
F 0 "C8" H 1392 7046 50  0000 L CNN
F 1 "0,1uF" H 1392 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1300 7000 50  0001 C CNN
F 3 "~" H 1300 7000 50  0001 C CNN
	1    1300 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 6900 1300 6450
Wire Wire Line
	1300 6450 1000 6450
Connection ~ 1000 6450
Wire Wire Line
	1000 6450 900  6450
Wire Wire Line
	1000 7550 1300 7550
Wire Wire Line
	1300 7550 1300 7100
Connection ~ 1000 7550
Wire Wire Line
	1000 7550 1000 7500
Text GLabel 5550 7050 1    50   Input ~ 0
~VIA1_IRQ
Wire Wire Line
	5550 7050 5550 7150
Wire Wire Line
	5550 7150 5650 7150
Text GLabel 5250 7050 1    50   Input ~ 0
~UART_IRQ
Text GLabel 5100 7050 1    50   Input ~ 0
~EXT_IRQ
Text GLabel 6350 7300 2    50   Output ~ 0
~IRQ
Wire Wire Line
	6250 7300 6350 7300
Wire Wire Line
	5400 7250 5650 7250
Wire Wire Line
	5250 7050 5250 7350
Wire Wire Line
	5250 7350 5650 7350
Wire Wire Line
	5100 7050 5100 7450
Wire Wire Line
	5100 7450 5650 7450
Text GLabel 3800 5950 1    50   Input ~ 0
+5V
Text GLabel 2850 7150 0    50   Input ~ 0
GND
Text GLabel 2850 7250 0    50   Input ~ 0
GND
Text GLabel 2850 7350 0    50   Input ~ 0
GND
Text GLabel 2850 7450 0    50   Input ~ 0
GND
Wire Wire Line
	2850 7450 2950 7450
Wire Wire Line
	2850 7350 2950 7350
Wire Wire Line
	2850 7250 2950 7250
Wire Wire Line
	2850 7150 2950 7150
NoConn ~ 3550 7300
$Comp
L 74xx:74HC74 U?
U 3 1 5FDF80F5
P 1850 7000
AR Path="/5F8F4E1E/5FDF80F5" Ref="U?"  Part="3" 
AR Path="/5FDF80F5" Ref="U5"  Part="3" 
F 0 "U5" H 1850 7050 50  0000 C CNN
F 1 "74AC74" H 1850 6950 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1850 7000 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1850 7000 50  0001 C CNN
	3    1850 7000
	1    0    0    -1  
$EndComp
Text GLabel 1750 7450 0    50   Input ~ 0
GND
Wire Wire Line
	1750 7450 1850 7450
Text GLabel 1750 6550 0    50   Input ~ 0
+5V
Wire Wire Line
	1750 6550 1850 6550
$Comp
L Device:C_Small C?
U 1 1 5FDF80FF
P 2200 7000
AR Path="/5F8F4E1E/5FDF80FF" Ref="C?"  Part="1" 
AR Path="/5FDF80FF" Ref="C9"  Part="1" 
F 0 "C9" H 2292 7046 50  0000 L CNN
F 1 "0,1uF" H 2292 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2200 7000 50  0001 C CNN
F 3 "~" H 2200 7000 50  0001 C CNN
	1    2200 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 7450 2200 7450
Wire Wire Line
	2200 7450 2200 7100
Connection ~ 1850 7450
Wire Wire Line
	1850 7450 1850 7400
Wire Wire Line
	2200 6900 2200 6550
Wire Wire Line
	2200 6550 1850 6550
Connection ~ 1850 6550
Wire Wire Line
	1850 6550 1850 6600
Wire Wire Line
	7450 4550 8450 4550
Text Label 8750 4550 2    50   ~ 0
io_cs
Text GLabel 8450 4650 3    50   Output ~ 0
IOCS
Wire Wire Line
	8450 4650 8450 4550
Connection ~ 8450 4550
Wire Wire Line
	8450 4550 8750 4550
Wire Wire Line
	7450 4850 7550 4850
Wire Wire Line
	7450 5050 7550 5050
Wire Wire Line
	7450 4950 7550 4950
Wire Wire Line
	7450 4650 7550 4650
Wire Wire Line
	7450 4750 7550 4750
Text GLabel 4250 2650 3    50   Input ~ 0
GND
Wire Wire Line
	4250 2650 4250 2550
Wire Wire Line
	4250 2550 4350 2550
Text GLabel 5450 900  1    50   Input ~ 0
+5V
Wire Wire Line
	5450 900  5450 1000
Wire Wire Line
	5450 1250 5350 1250
Text GLabel 5600 1150 1    50   Input ~ 0
~WR
Wire Wire Line
	5600 1150 5600 1350
Wire Wire Line
	5600 1350 5350 1350
Text GLabel 5750 1150 1    50   Input ~ 0
~RD
Text GLabel 5900 1150 1    50   Input ~ 0
RAM1_~CS
Wire Wire Line
	5900 1150 5900 2050
Wire Wire Line
	5900 2050 5350 2050
Wire Wire Line
	5750 1150 5750 1850
Wire Wire Line
	5750 1850 5350 1850
Text Label 4150 2250 0    50   ~ 0
d0
Text Label 4150 2350 0    50   ~ 0
d1
Text Label 4150 2450 0    50   ~ 0
d2
Entry Wire Line
	4050 2350 4150 2250
Entry Wire Line
	4050 2450 4150 2350
Entry Wire Line
	4050 2550 4150 2450
Text Label 5550 2550 2    50   ~ 0
d3
Text Label 5550 2450 2    50   ~ 0
d4
Text Label 5550 2350 2    50   ~ 0
d5
Text Label 5550 2250 2    50   ~ 0
d6
Text Label 5550 2150 2    50   ~ 0
d7
Wire Wire Line
	4150 2250 4350 2250
Wire Wire Line
	4150 2350 4350 2350
Wire Wire Line
	4150 2450 4350 2450
Wire Wire Line
	5350 2550 5550 2550
Wire Wire Line
	5350 2450 5550 2450
Wire Wire Line
	5350 2350 5550 2350
Wire Wire Line
	5350 2250 5550 2250
Wire Wire Line
	5350 2150 5550 2150
Entry Wire Line
	5550 2150 5650 2250
Entry Wire Line
	5550 2250 5650 2350
Entry Wire Line
	5550 2350 5650 2450
Entry Wire Line
	5550 2450 5650 2550
Entry Wire Line
	5550 2550 5650 2650
Wire Bus Line
	4050 2950 5650 2950
Text Label 4150 2150 0    50   ~ 0
a0
Text Label 4150 2050 0    50   ~ 0
a1
Text Label 4150 1950 0    50   ~ 0
a2
Text Label 4150 1850 0    50   ~ 0
a3
Text Label 4150 1750 0    50   ~ 0
a4
Text Label 4150 1650 0    50   ~ 0
a5
Text Label 4150 1550 0    50   ~ 0
a6
Text Label 4150 1450 0    50   ~ 0
a7
Text Label 4150 1350 0    50   ~ 0
a12
Text Label 4150 1250 0    50   ~ 0
a14
Text Label 6100 1450 2    50   ~ 0
a13
Text Label 6100 1550 2    50   ~ 0
a8
Text Label 6100 1650 2    50   ~ 0
a9
Text Label 6100 1750 2    50   ~ 0
a11
Text Label 6100 1950 2    50   ~ 0
a10
Wire Wire Line
	5350 1950 6100 1950
Wire Wire Line
	5350 1750 6100 1750
Wire Wire Line
	5350 1650 6100 1650
Wire Wire Line
	5350 1550 6100 1550
Wire Wire Line
	5350 1450 6100 1450
Wire Wire Line
	4150 2150 4350 2150
Wire Wire Line
	4150 2050 4350 2050
Wire Wire Line
	4150 1950 4350 1950
Wire Wire Line
	4150 1850 4350 1850
Wire Wire Line
	4150 1750 4350 1750
Wire Wire Line
	4150 1650 4350 1650
Wire Wire Line
	4150 1550 4350 1550
Wire Wire Line
	4150 1450 4350 1450
Wire Wire Line
	4150 1350 4350 1350
Wire Wire Line
	4150 1250 4350 1250
Entry Wire Line
	6100 1450 6200 1350
Entry Wire Line
	6200 1450 6100 1550
Entry Wire Line
	6100 1650 6200 1550
Entry Wire Line
	6100 1750 6200 1650
Entry Wire Line
	6100 1950 6200 1850
Entry Wire Line
	4050 1150 4150 1250
Entry Wire Line
	4050 1250 4150 1350
Entry Wire Line
	4050 1350 4150 1450
Entry Wire Line
	4050 1450 4150 1550
Entry Wire Line
	4050 1550 4150 1650
Entry Wire Line
	4050 1650 4150 1750
Entry Wire Line
	4050 1750 4150 1850
Entry Wire Line
	4050 1850 4150 1950
Entry Wire Line
	4050 1950 4150 2050
Entry Wire Line
	4050 2050 4150 2150
Wire Bus Line
	4050 650  6200 650 
Text GLabel 6600 2650 3    50   Input ~ 0
GND
Wire Wire Line
	6600 2650 6600 2550
Wire Wire Line
	6600 2550 6700 2550
Text GLabel 7800 900  1    50   Input ~ 0
+5V
Wire Wire Line
	7800 900  7800 1000
Wire Wire Line
	7800 1250 7700 1250
Text GLabel 7950 1150 1    50   Input ~ 0
~WR
Wire Wire Line
	7950 1150 7950 1350
Wire Wire Line
	7950 1350 7700 1350
Text GLabel 8100 1150 1    50   Input ~ 0
~RD
Text GLabel 8250 1150 1    50   Input ~ 0
RAM2_~CS
Wire Wire Line
	8250 1150 8250 2050
Wire Wire Line
	8250 2050 7700 2050
Wire Wire Line
	8100 1150 8100 1850
Wire Wire Line
	8100 1850 7700 1850
Text Label 6500 2250 0    50   ~ 0
d0
Text Label 6500 2350 0    50   ~ 0
d1
Text Label 6500 2450 0    50   ~ 0
d2
Entry Wire Line
	6400 2350 6500 2250
Entry Wire Line
	6400 2450 6500 2350
Entry Wire Line
	6400 2550 6500 2450
Text Label 7900 2550 2    50   ~ 0
d3
Text Label 7900 2450 2    50   ~ 0
d4
Text Label 7900 2350 2    50   ~ 0
d5
Text Label 7900 2250 2    50   ~ 0
d6
Text Label 7900 2150 2    50   ~ 0
d7
Wire Wire Line
	6500 2250 6700 2250
Wire Wire Line
	6500 2350 6700 2350
Wire Wire Line
	6500 2450 6700 2450
Wire Wire Line
	7700 2550 7900 2550
Wire Wire Line
	7700 2450 7900 2450
Wire Wire Line
	7700 2350 7900 2350
Wire Wire Line
	7700 2250 7900 2250
Wire Wire Line
	7700 2150 7900 2150
Entry Wire Line
	7900 2150 8000 2250
Entry Wire Line
	7900 2250 8000 2350
Entry Wire Line
	7900 2350 8000 2450
Entry Wire Line
	7900 2450 8000 2550
Entry Wire Line
	7900 2550 8000 2650
Wire Bus Line
	6400 2950 8000 2950
Text Label 6500 2150 0    50   ~ 0
a0
Text Label 6500 2050 0    50   ~ 0
a1
Text Label 6500 1950 0    50   ~ 0
a2
Text Label 6500 1850 0    50   ~ 0
a3
Text Label 6500 1750 0    50   ~ 0
a4
Text Label 6500 1650 0    50   ~ 0
a5
Text Label 6500 1550 0    50   ~ 0
a6
Text Label 6500 1450 0    50   ~ 0
a7
Text Label 6500 1350 0    50   ~ 0
a12
Text Label 6500 1250 0    50   ~ 0
a14
Text Label 8450 1450 2    50   ~ 0
a13
Text Label 8450 1550 2    50   ~ 0
a8
Text Label 8450 1650 2    50   ~ 0
a9
Text Label 8450 1750 2    50   ~ 0
a11
Text Label 8450 1950 2    50   ~ 0
a10
Wire Wire Line
	7700 1950 8450 1950
Wire Wire Line
	7700 1750 8450 1750
Wire Wire Line
	7700 1650 8450 1650
Wire Wire Line
	7700 1550 8450 1550
Wire Wire Line
	7700 1450 8450 1450
Wire Wire Line
	6500 2150 6700 2150
Wire Wire Line
	6500 2050 6700 2050
Wire Wire Line
	6500 1950 6700 1950
Wire Wire Line
	6500 1850 6700 1850
Wire Wire Line
	6500 1750 6700 1750
Wire Wire Line
	6500 1650 6700 1650
Wire Wire Line
	6500 1550 6700 1550
Wire Wire Line
	6500 1450 6700 1450
Wire Wire Line
	6500 1350 6700 1350
Wire Wire Line
	6500 1250 6700 1250
Entry Wire Line
	8450 1450 8550 1350
Entry Wire Line
	8550 1450 8450 1550
Entry Wire Line
	8450 1650 8550 1550
Entry Wire Line
	8450 1750 8550 1650
Entry Wire Line
	8450 1950 8550 1850
Entry Wire Line
	6400 1150 6500 1250
Entry Wire Line
	6400 1250 6500 1350
Entry Wire Line
	6400 1350 6500 1450
Entry Wire Line
	6400 1450 6500 1550
Entry Wire Line
	6400 1550 6500 1650
Entry Wire Line
	6400 1650 6500 1750
Entry Wire Line
	6400 1750 6500 1850
Entry Wire Line
	6400 1850 6500 1950
Entry Wire Line
	6400 1950 6500 2050
Entry Wire Line
	6400 2050 6500 2150
Wire Bus Line
	6400 650  8550 650 
Text GLabel 9000 2650 3    50   Input ~ 0
GND
Wire Wire Line
	9000 2650 9000 2550
Wire Wire Line
	9000 2550 9100 2550
Text GLabel 10200 900  1    50   Input ~ 0
+5V
Wire Wire Line
	10200 900  10200 1000
Wire Wire Line
	10200 1250 10100 1250
Text GLabel 10350 1150 1    50   Input ~ 0
~WR
Wire Wire Line
	10350 1150 10350 1350
Wire Wire Line
	10350 1350 10100 1350
Text GLabel 10500 1150 1    50   Input ~ 0
~RD
Text GLabel 10650 1150 1    50   Input ~ 0
ROM_~CS
Wire Wire Line
	10650 1150 10650 2050
Wire Wire Line
	10650 2050 10100 2050
Wire Wire Line
	10500 1150 10500 1850
Wire Wire Line
	10500 1850 10100 1850
Text Label 8900 2250 0    50   ~ 0
d0
Text Label 8900 2350 0    50   ~ 0
d1
Text Label 8900 2450 0    50   ~ 0
d2
Entry Wire Line
	8800 2350 8900 2250
Entry Wire Line
	8800 2450 8900 2350
Entry Wire Line
	8800 2550 8900 2450
Text Label 10300 2550 2    50   ~ 0
d3
Text Label 10300 2450 2    50   ~ 0
d4
Text Label 10300 2350 2    50   ~ 0
d5
Text Label 10300 2250 2    50   ~ 0
d6
Text Label 10300 2150 2    50   ~ 0
d7
Wire Wire Line
	8900 2250 9100 2250
Wire Wire Line
	8900 2350 9100 2350
Wire Wire Line
	8900 2450 9100 2450
Wire Wire Line
	10100 2550 10300 2550
Wire Wire Line
	10100 2450 10300 2450
Wire Wire Line
	10100 2350 10300 2350
Wire Wire Line
	10100 2250 10300 2250
Wire Wire Line
	10100 2150 10300 2150
Entry Wire Line
	10300 2150 10400 2250
Entry Wire Line
	10300 2250 10400 2350
Entry Wire Line
	10300 2350 10400 2450
Entry Wire Line
	10300 2450 10400 2550
Entry Wire Line
	10300 2550 10400 2650
Wire Bus Line
	8800 2950 10400 2950
Text Label 8900 2150 0    50   ~ 0
a0
Text Label 8900 2050 0    50   ~ 0
a1
Text Label 8900 1950 0    50   ~ 0
a2
Text Label 8900 1850 0    50   ~ 0
a3
Text Label 8900 1750 0    50   ~ 0
a4
Text Label 8900 1650 0    50   ~ 0
a5
Text Label 8900 1550 0    50   ~ 0
a6
Text Label 8900 1450 0    50   ~ 0
a7
Text Label 8900 1350 0    50   ~ 0
a12
Text Label 8900 1250 0    50   ~ 0
a14
Text Label 10850 1450 2    50   ~ 0
a13
Text Label 10850 1550 2    50   ~ 0
a8
Text Label 10850 1650 2    50   ~ 0
a9
Text Label 10850 1750 2    50   ~ 0
a11
Text Label 10850 1950 2    50   ~ 0
a10
Wire Wire Line
	10100 1950 10850 1950
Wire Wire Line
	10100 1750 10850 1750
Wire Wire Line
	10100 1650 10850 1650
Wire Wire Line
	10100 1550 10850 1550
Wire Wire Line
	10100 1450 10850 1450
Wire Wire Line
	8900 2150 9100 2150
Wire Wire Line
	8900 2050 9100 2050
Wire Wire Line
	8900 1950 9100 1950
Wire Wire Line
	8900 1850 9100 1850
Wire Wire Line
	8900 1750 9100 1750
Wire Wire Line
	8900 1650 9100 1650
Wire Wire Line
	8900 1550 9100 1550
Wire Wire Line
	8900 1450 9100 1450
Wire Wire Line
	8900 1350 9100 1350
Wire Wire Line
	8900 1250 9100 1250
Entry Wire Line
	10850 1450 10950 1350
Entry Wire Line
	10950 1450 10850 1550
Entry Wire Line
	10850 1650 10950 1550
Entry Wire Line
	10850 1750 10950 1650
Entry Wire Line
	10850 1950 10950 1850
Entry Wire Line
	8800 1150 8900 1250
Entry Wire Line
	8800 1250 8900 1350
Entry Wire Line
	8800 1350 8900 1450
Entry Wire Line
	8800 1450 8900 1550
Entry Wire Line
	8800 1550 8900 1650
Entry Wire Line
	8800 1650 8900 1750
Entry Wire Line
	8800 1750 8900 1850
Entry Wire Line
	8800 1850 8900 1950
Entry Wire Line
	8800 1950 8900 2050
Entry Wire Line
	8800 2050 8900 2150
Wire Bus Line
	8800 650  10950 650 
$Comp
L 6502:62256 U2
U 1 1 5FD9D8A1
P 7200 1900
AR Path="/5FD9D8A1" Ref="U2"  Part="1" 
AR Path="/5FE5FF2A/5FD9D8A1" Ref="U?"  Part="1" 
F 0 "U2" H 7200 2000 50  0000 C CNN
F 1 "71256" H 7200 1900 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm_Socket" H 7150 2700 50  0001 C CNN
F 3 "" H 7200 1900 50  0001 C CNN
	1    7200 1900
	1    0    0    -1  
$EndComp
$Comp
L 6502:62256 U1
U 1 1 5FD9D8A7
P 4850 1900
AR Path="/5FD9D8A7" Ref="U1"  Part="1" 
AR Path="/5FE5FF2A/5FD9D8A7" Ref="U?"  Part="1" 
F 0 "U1" H 4850 2000 50  0000 C CNN
F 1 "71256" H 4850 1900 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm_Socket" H 4800 2700 50  0001 C CNN
F 3 "" H 4850 1900 50  0001 C CNN
	1    4850 1900
	1    0    0    -1  
$EndComp
$Comp
L 6502:28C256 U3
U 1 1 5FD9D8AD
P 9600 1900
AR Path="/5FD9D8AD" Ref="U3"  Part="1" 
AR Path="/5FE5FF2A/5FD9D8AD" Ref="U?"  Part="1" 
F 0 "U3" H 9600 2000 50  0000 C CNN
F 1 "28C256" H 9600 1900 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 9550 2700 50  0001 C CNN
F 3 "" H 9600 1900 50  0001 C CNN
	1    9600 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5FD9D8B3
P 5250 1000
AR Path="/5FD9D8B3" Ref="C1"  Part="1" 
AR Path="/5FE5FF2A/5FD9D8B3" Ref="C?"  Part="1" 
F 0 "C1" V 5021 1000 50  0000 C CNN
F 1 "0,1uF" V 5112 1000 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5250 1000 50  0001 C CNN
F 3 "~" H 5250 1000 50  0001 C CNN
	1    5250 1000
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 1000 5450 1000
Connection ~ 5450 1000
Wire Wire Line
	5450 1000 5450 1250
Text GLabel 5050 1000 0    50   Input ~ 0
GND
Wire Wire Line
	5050 1000 5150 1000
$Comp
L Device:C_Small C2
U 1 1 5FD9D8BE
P 7600 1000
AR Path="/5FD9D8BE" Ref="C2"  Part="1" 
AR Path="/5FE5FF2A/5FD9D8BE" Ref="C?"  Part="1" 
F 0 "C2" V 7371 1000 50  0000 C CNN
F 1 "0,1uF" V 7462 1000 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7600 1000 50  0001 C CNN
F 3 "~" H 7600 1000 50  0001 C CNN
	1    7600 1000
	0    1    1    0   
$EndComp
Text GLabel 7400 1000 0    50   Input ~ 0
GND
Wire Wire Line
	7400 1000 7500 1000
$Comp
L Device:C_Small C3
U 1 1 5FD9D8C6
P 10000 1000
AR Path="/5FD9D8C6" Ref="C3"  Part="1" 
AR Path="/5FE5FF2A/5FD9D8C6" Ref="C?"  Part="1" 
F 0 "C3" V 9771 1000 50  0000 C CNN
F 1 "0,1uF" V 9862 1000 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 10000 1000 50  0001 C CNN
F 3 "~" H 10000 1000 50  0001 C CNN
	1    10000 1000
	0    1    1    0   
$EndComp
Text GLabel 9800 1000 0    50   Input ~ 0
GND
Wire Wire Line
	9800 1000 9900 1000
Wire Wire Line
	7700 1000 7800 1000
Connection ~ 7800 1000
Wire Wire Line
	7800 1000 7800 1250
Wire Wire Line
	10100 1000 10200 1000
Connection ~ 10200 1000
Wire Wire Line
	10200 1000 10200 1250
Text GLabel 5400 7050 1    50   Input ~ 0
~VIA2_IRQ
Wire Wire Line
	5400 7050 5400 7250
Wire Wire Line
	3400 4100 3250 4100
Wire Wire Line
	3400 4200 3400 4100
Text GLabel 3400 4200 3    50   Output ~ 0
RDY_M2F
Wire Wire Line
	2300 4100 2650 4100
Connection ~ 2300 4100
Wire Wire Line
	2300 4200 2300 4100
Text GLabel 2300 4200 3    50   Output ~ 0
RDY_M1F
Text GLabel 3050 3800 2    50   Input ~ 0
~6502_RES
Wire Wire Line
	1850 3800 1850 3900
Wire Wire Line
	1950 3800 1850 3800
Text GLabel 1950 3800 2    50   Input ~ 0
~6502_RES
Wire Wire Line
	1350 4100 1550 4100
Text GLabel 1350 4100 0    50   Input ~ 0
6502_RDY
NoConn ~ 2150 4300
Wire Wire Line
	2150 4100 2300 4100
Connection ~ 1450 4750
Wire Wire Line
	2450 4200 2650 4200
Wire Wire Line
	2450 4750 2450 4200
Wire Wire Line
	1450 4750 2450 4750
Wire Wire Line
	1450 4200 1550 4200
Wire Wire Line
	1450 4750 1450 4200
Wire Wire Line
	1350 4750 1450 4750
Wire Wire Line
	1850 4600 1850 4500
Wire Wire Line
	1750 4600 1850 4600
Text GLabel 1750 4600 0    50   Input ~ 0
+5V
Wire Wire Line
	2950 3800 3050 3800
Wire Wire Line
	2950 3900 2950 3800
Wire Wire Line
	2950 4600 2950 4500
Wire Wire Line
	2850 4600 2950 4600
NoConn ~ 3250 4300
Text GLabel 2850 4600 0    50   Input ~ 0
+5V
$Comp
L 74xx:74HC74 U?
U 2 1 5FE82338
P 2950 4200
AR Path="/5F8F4E1E/5FE82338" Ref="U?"  Part="2" 
AR Path="/5FE82338" Ref="U5"  Part="2" 
F 0 "U5" H 2650 4600 50  0000 C CNN
F 1 "74AC74" H 2650 4500 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2950 4200 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2950 4200 50  0001 C CNN
	2    2950 4200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC74 U?
U 1 1 5FE3D22B
P 1850 4200
AR Path="/5F8F4E1E/5FE3D22B" Ref="U?"  Part="2" 
AR Path="/5FE3D22B" Ref="U5"  Part="1" 
F 0 "U5" H 1550 4600 50  0000 C CNN
F 1 "74AC74" H 1550 4500 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1850 4200 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1850 4200 50  0001 C CNN
	1    1850 4200
	1    0    0    -1  
$EndComp
Text GLabel 3050 5200 2    50   Output ~ 0
6502_CLK
$Comp
L 74xx:74LS04 U?
U 4 1 5FD6D1DD
P 2650 5200
AR Path="/5F8F4E1E/5FD6D1DD" Ref="U?"  Part="5" 
AR Path="/5FD6D1DD" Ref="U8"  Part="4" 
F 0 "U8" H 2650 5517 50  0000 C CNN
F 1 "74AC04" H 2650 5426 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2650 5200 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 2650 5200 50  0001 C CNN
	4    2650 5200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 6 1 602942AC
P 1850 5200
AR Path="/5F8F4E1E/602942AC" Ref="U?"  Part="6" 
AR Path="/602942AC" Ref="U8"  Part="6" 
F 0 "U8" H 1850 5517 50  0000 C CNN
F 1 "74AC04" H 1850 5426 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1850 5200 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 1850 5200 50  0001 C CNN
	6    1850 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 5200 2950 5200
Text GLabel 1450 5200 0    50   Input ~ 0
6502_CLK_IN
Wire Wire Line
	1450 5200 1550 5200
Wire Wire Line
	2150 5200 2250 5200
Text GLabel 3050 5450 2    50   Output ~ 0
~6502_CLK
Wire Wire Line
	2250 5200 2250 5450
Wire Wire Line
	2250 5450 3050 5450
Connection ~ 2250 5200
Wire Wire Line
	2250 5200 2350 5200
Text GLabel 1350 4750 0    50   Input ~ 0
~6502_CLK
Text GLabel 1350 5900 0    50   Input ~ 0
6502_RDY
$Comp
L Device:R R1
U 1 1 603D7C7F
P 1800 5800
F 0 "R1" V 1700 5800 50  0000 C CNN
F 1 "470" V 1800 5800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1730 5800 50  0001 C CNN
F 3 "~" H 1800 5800 50  0001 C CNN
	1    1800 5800
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 603D8F83
P 1800 6000
AR Path="/5F8F4E1E/603D8F83" Ref="C?"  Part="1" 
AR Path="/603D8F83" Ref="C7"  Part="1" 
F 0 "C7" V 1950 6000 50  0000 C CNN
F 1 "22pF" V 2050 6000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1800 6000 50  0001 C CNN
F 3 "~" H 1800 6000 50  0001 C CNN
	1    1800 6000
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 5900 1450 5900
Wire Wire Line
	1550 5900 1550 5800
Wire Wire Line
	1550 5800 1650 5800
Wire Wire Line
	1550 5900 1550 6000
Wire Wire Line
	1550 6000 1700 6000
Connection ~ 1550 5900
Wire Wire Line
	1950 5800 2050 5800
Wire Wire Line
	2050 5800 2050 5900
Wire Wire Line
	2050 6000 1900 6000
Text GLabel 2250 5900 2    50   Output ~ 0
6502_RDY_IN
Wire Wire Line
	2050 5900 2150 5900
Connection ~ 2050 5900
Wire Wire Line
	2050 5900 2050 6000
$Comp
L Connector:TestPoint TP1
U 1 1 604AAD74
P 1450 5900
F 0 "TP1" H 1450 6200 50  0000 R CNN
F 1 "TestPoint" H 1450 6100 50  0000 R CNN
F 2 "TestPoint:TestPoint_Keystone_5005-5009_Compact" H 1650 5900 50  0001 C CNN
F 3 "~" H 1650 5900 50  0001 C CNN
	1    1450 5900
	1    0    0    -1  
$EndComp
Connection ~ 1450 5900
Wire Wire Line
	1450 5900 1550 5900
$Comp
L Connector:TestPoint TP2
U 1 1 604ABD44
P 2150 5900
F 0 "TP2" H 2150 6200 50  0000 L CNN
F 1 "TestPoint" H 2150 6100 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5005-5009_Compact" H 2350 5900 50  0001 C CNN
F 3 "~" H 2350 5900 50  0001 C CNN
	1    2150 5900
	1    0    0    -1  
$EndComp
Connection ~ 2150 5900
Wire Wire Line
	2150 5900 2250 5900
Text GLabel 7550 4850 2    50   Input ~ 0
IO14
Wire Wire Line
	6350 3850 6350 3950
Wire Wire Line
	4750 3500 4750 3600
Wire Wire Line
	5100 3350 5000 3350
Wire Wire Line
	4400 3350 4500 3350
Text GLabel 5100 3350 2    50   Input ~ 0
~6502_CLK
Text GLabel 4400 3350 0    50   Input ~ 0
6502_CLK
$Comp
L Jumper:Jumper_3_Open JP1
U 1 1 6034332B
P 4750 3350
F 0 "JP1" H 4750 3574 50  0000 C CNN
F 1 "PLD CLK Selector" H 4750 3483 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4750 3350 50  0001 C CNN
F 3 "~" H 4750 3350 50  0001 C CNN
	1    4750 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3600 5100 3600
Text GLabel 5100 3600 2    50   Output ~ 0
PLD_CLK
Text GLabel 6350 3850 1    50   Input ~ 0
PLD_CLK
$Comp
L Device:R_Network08 RN1
U 1 1 6054D542
P 4200 6250
F 0 "RN1" H 4600 6300 50  0000 L CNN
F 1 "4K7" H 4600 6200 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4475 6250 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4200 6250 50  0001 C CNN
	1    4200 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 5950 3800 6050
Wire Wire Line
	4100 6450 4100 7150
Wire Wire Line
	4100 7150 5550 7150
Connection ~ 5550 7150
Wire Wire Line
	4000 6450 4000 7250
Wire Wire Line
	4000 7250 5400 7250
Connection ~ 5400 7250
Wire Wire Line
	3900 6450 3900 7350
Wire Wire Line
	3900 7350 5250 7350
Connection ~ 5250 7350
Wire Wire Line
	3800 6450 3800 7450
Wire Wire Line
	3800 7450 5100 7450
Connection ~ 5100 7450
Text GLabel 4600 6700 2    50   Output ~ 0
~NMI
Wire Wire Line
	4600 6700 4400 6700
Wire Wire Line
	4400 6700 4400 6450
Text GLabel 4600 6850 2    50   Output ~ 0
~SO
Wire Wire Line
	4300 6450 4300 6850
Wire Wire Line
	4300 6850 4600 6850
Text GLabel 4600 7000 2    50   Output ~ 0
SR_OUT
Wire Wire Line
	4600 7000 4200 7000
Wire Wire Line
	4200 7000 4200 6450
Wire Bus Line
	8500 4150 8500 4350
Wire Bus Line
	4050 2350 4050 2950
Wire Bus Line
	6400 2350 6400 2950
Wire Bus Line
	8800 2350 8800 2950
Wire Bus Line
	10950 650  10950 1850
Wire Bus Line
	10400 2250 10400 2950
Wire Bus Line
	8550 650  8550 1850
Wire Bus Line
	8000 2250 8000 2950
Wire Bus Line
	6200 650  6200 1850
Wire Bus Line
	5650 2250 5650 2950
Wire Bus Line
	3200 2850 3200 3550
Wire Bus Line
	3200 2050 3200 2750
Wire Bus Line
	6150 4350 6150 5050
Wire Bus Line
	8800 650  8800 2050
Wire Bus Line
	6400 650  6400 2050
Wire Bus Line
	4050 650  4050 2050
Wire Bus Line
	1600 2150 1600 3400
$EndSCHEMATC
