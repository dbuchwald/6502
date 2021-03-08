EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
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
L Device:Crystal_Small Y1
U 1 1 5F942B8E
P 1300 1500
F 0 "Y1" V 1254 1588 50  0000 L CNN
F 1 "20MHz" V 1345 1588 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 1300 1500 50  0001 C CNN
F 3 "~" H 1300 1500 50  0001 C CNN
	1    1300 1500
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C18
U 1 1 5F942B94
P 1050 1400
F 0 "C18" V 1279 1400 50  0000 C CNN
F 1 "22pF" V 1188 1400 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1050 1400 50  0001 C CNN
F 3 "~" H 1050 1400 50  0001 C CNN
	1    1050 1400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C19
U 1 1 5F942B9A
P 1050 1600
F 0 "C19" V 900 1600 50  0000 C CNN
F 1 "22pF" V 800 1600 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1050 1600 50  0001 C CNN
F 3 "~" H 1050 1600 50  0001 C CNN
	1    1050 1600
	0    -1   -1   0   
$EndComp
Text GLabel 850  1750 3    50   Input ~ 0
GND
Wire Wire Line
	850  1600 950  1600
Wire Wire Line
	850  1400 950  1400
Wire Wire Line
	1150 1600 1300 1600
Wire Wire Line
	1150 1400 1300 1400
Wire Wire Line
	1300 1400 1700 1400
Connection ~ 1300 1400
Wire Wire Line
	1300 1600 1700 1600
Connection ~ 1300 1600
$Comp
L Device:C_Small C20
U 1 1 5F942BA9
P 1500 1800
F 0 "C20" V 1350 1800 50  0000 C CNN
F 1 "0,1uF" V 1250 1800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1500 1800 50  0001 C CNN
F 3 "~" H 1500 1800 50  0001 C CNN
	1    1500 1800
	0    -1   -1   0   
$EndComp
Text GLabel 1300 1900 3    50   Input ~ 0
GND
Wire Wire Line
	1300 1900 1300 1800
Wire Wire Line
	1300 1800 1400 1800
Wire Wire Line
	1600 1800 1700 1800
Text GLabel 1600 1200 0    50   Input ~ 0
~RES
Wire Wire Line
	1600 1200 1700 1200
Text Label 3850 1200 2    50   ~ 0
a0
Text Label 3850 1300 2    50   ~ 0
a1
Text Label 3850 1400 2    50   ~ 0
a2
Text Label 3850 1500 2    50   ~ 0
a3
Text Label 3850 1600 2    50   ~ 0
a4
Text Label 3850 1700 2    50   ~ 0
a5
Text Label 3850 1800 2    50   ~ 0
a6
Text Label 3850 1900 2    50   ~ 0
a7
Wire Wire Line
	2900 1200 3850 1200
Wire Wire Line
	2900 1300 3850 1300
Wire Wire Line
	2900 1400 3850 1400
Wire Wire Line
	2900 1500 3850 1500
Wire Wire Line
	2900 1600 3850 1600
Wire Wire Line
	2900 1700 3850 1700
Wire Wire Line
	2900 1800 3850 1800
Wire Wire Line
	2900 1900 3850 1900
Entry Wire Line
	3850 1200 3950 1300
Entry Wire Line
	3850 1300 3950 1400
Entry Wire Line
	3850 1400 3950 1500
Entry Wire Line
	3850 1500 3950 1600
Entry Wire Line
	3850 1600 3950 1700
Entry Wire Line
	3850 1700 3950 1800
Entry Wire Line
	3850 1800 3950 1900
Entry Wire Line
	3850 1900 3950 2000
Text Label 3850 3000 2    50   ~ 0
a8
Text Label 3850 3100 2    50   ~ 0
a9
Text Label 3850 3200 2    50   ~ 0
a10
Text Label 3850 3300 2    50   ~ 0
a11
Text Label 3850 3400 2    50   ~ 0
a12
Text Label 3850 3500 2    50   ~ 0
a13
Text Label 3850 3600 2    50   ~ 0
a14
Text Label 3850 3700 2    50   ~ 0
a15
Wire Wire Line
	2900 3000 3850 3000
Wire Wire Line
	2900 3100 3850 3100
Wire Wire Line
	2900 3200 3850 3200
Wire Wire Line
	2900 3300 3850 3300
Wire Wire Line
	2900 3400 3850 3400
Wire Wire Line
	2900 3500 3850 3500
Wire Wire Line
	2900 3600 3850 3600
Wire Wire Line
	2900 3700 3850 3700
Entry Wire Line
	3850 3000 3950 3100
Entry Wire Line
	3850 3100 3950 3200
Entry Wire Line
	3850 3200 3950 3300
Entry Wire Line
	3850 3300 3950 3400
Entry Wire Line
	3850 3400 3950 3500
Entry Wire Line
	3850 3500 3950 3600
Entry Wire Line
	3850 3600 3950 3700
Entry Wire Line
	3850 3700 3950 3800
Text Label 3100 2100 2    50   ~ 0
d0
Text Label 3100 2200 2    50   ~ 0
d1
Text Label 3100 2300 2    50   ~ 0
d2
Text Label 3100 2400 2    50   ~ 0
d3
Text Label 3100 2500 2    50   ~ 0
d4
Text Label 3100 2600 2    50   ~ 0
d5
Text Label 3100 2700 2    50   ~ 0
d6
Text Label 3100 2800 2    50   ~ 0
d7
Wire Wire Line
	2900 2100 3100 2100
Wire Wire Line
	2900 2200 3100 2200
Wire Wire Line
	2900 2300 3100 2300
Wire Wire Line
	2900 2400 3100 2400
Wire Wire Line
	2900 2500 3100 2500
Wire Wire Line
	2900 2600 3100 2600
Wire Wire Line
	2900 2700 3100 2700
Wire Wire Line
	2900 2800 3100 2800
Entry Wire Line
	3100 2100 3200 2200
Entry Wire Line
	3100 2200 3200 2300
Entry Wire Line
	3100 2300 3200 2400
Entry Wire Line
	3100 2400 3200 2500
Entry Wire Line
	3100 2500 3200 2600
Entry Wire Line
	3100 2600 3200 2700
Entry Wire Line
	3100 2700 3200 2800
Entry Wire Line
	3100 2800 3200 2900
Text GLabel 3000 3900 2    50   Input ~ 0
DBG_RxD
Text GLabel 3000 4000 2    50   Output ~ 0
DBG_TxD
Text GLabel 3000 4100 2    50   Output ~ 0
SR_DAT
Text GLabel 3000 4200 2    50   Output ~ 0
SR_CLK
Text GLabel 3000 4300 2    50   Output ~ 0
SR_OUT
Text GLabel 3000 4400 2    50   Output ~ 0
DBG_CLK
Text GLabel 3000 4700 3    50   Input ~ 0
SYNC
Text GLabel 3150 4700 3    50   BiDi ~ 0
R~W
Wire Wire Line
	3000 4700 3000 4600
Wire Wire Line
	3000 4600 2900 4600
Wire Wire Line
	2900 4500 3150 4500
Wire Wire Line
	3150 4500 3150 4700
Wire Wire Line
	2900 4400 3000 4400
Wire Wire Line
	2900 4300 3000 4300
Wire Wire Line
	2900 4200 3000 4200
Wire Wire Line
	2900 4100 3000 4100
Wire Wire Line
	2900 4000 3000 4000
Wire Wire Line
	2900 3900 3000 3900
Text GLabel 2200 5000 0    50   Input ~ 0
GND
Wire Wire Line
	2300 5000 2300 4900
Text GLabel 2500 800  2    50   Input ~ 0
+5V
Wire Wire Line
	2500 800  2400 800 
Wire Wire Line
	2300 800  2400 800 
Wire Wire Line
	2400 800  2400 900 
Connection ~ 2300 800 
Wire Wire Line
	2300 800  2300 900 
Wire Wire Line
	850  1400 850  1600
Connection ~ 850  1600
Wire Wire Line
	850  1600 850  1750
$Comp
L MCU_Microchip_ATmega:ATmega644PA-PU U13
U 1 1 5F942C1A
P 2300 2900
F 0 "U13" H 2300 3000 50  0000 C CNN
F 1 "ATmega644PA-PU" H 2300 2900 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 2300 2900 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8272-8-bit-AVR-microcontroller-ATmega164A_PA-324A_PA-644A_PA-1284_P_datasheet.pdf" H 2300 2900 50  0001 C CNN
	1    2300 2900
	1    0    0    -1  
$EndComp
Text GLabel 3950 3900 3    50   Input ~ 0
a[0..15]
Text GLabel 3300 2900 2    50   Input ~ 0
d[0..7]
Wire Bus Line
	3200 2900 3300 2900
$Comp
L 6502:FT230XS U?
U 1 1 5F9AD1D3
P 9750 1400
AR Path="/6014B4D9/5F9AD1D3" Ref="U?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD1D3" Ref="U10"  Part="1" 
F 0 "U10" H 9750 2015 50  0000 C CNN
F 1 "FT230XS" H 9750 1924 50  0000 C CNN
F 2 "Package_SO:SSOP-16_5.3x6.2mm_P0.65mm" H 9750 1900 50  0001 C CNN
F 3 "" H 9750 1400 50  0001 C CNN
	1    9750 1400
	1    0    0    -1  
$EndComp
Text GLabel 9100 1050 0    50   Output ~ 0
DBG_USB_RxD
Text GLabel 9100 1350 0    50   Input ~ 0
DBG_TxD
Wire Wire Line
	9100 1050 9200 1050
Text GLabel 9000 1450 0    50   Input ~ 0
GND
Text GLabel 9100 1850 0    50   BiDi ~ 0
DBG_USBD+
Text GLabel 10400 1750 2    50   BiDi ~ 0
DBG_USBD-
Text GLabel 10600 1250 1    50   Input ~ 0
GND
Wire Wire Line
	9000 1450 9100 1450
Text GLabel 11000 1250 1    50   Input ~ 0
+5V
Wire Wire Line
	9200 1550 9100 1550
Wire Wire Line
	9100 1550 9100 1450
Connection ~ 9100 1450
Wire Wire Line
	9100 1450 9200 1450
NoConn ~ 9200 1150
Wire Wire Line
	9100 1350 9200 1350
Wire Wire Line
	8500 1250 8500 1950
Wire Wire Line
	11000 1950 11000 1650
Wire Wire Line
	11000 1650 10300 1650
Wire Wire Line
	8500 1250 9200 1250
Wire Wire Line
	10300 1750 10400 1750
Wire Wire Line
	10300 1550 11000 1550
Wire Wire Line
	11000 1550 11000 1650
Connection ~ 11000 1650
Text GLabel 10450 1150 1    50   Output ~ 0
~DBG_RXLED
Text GLabel 9100 1650 0    50   Output ~ 0
~DBG_TXLED
Wire Wire Line
	9100 1850 9150 1850
Wire Wire Line
	9150 1850 9150 1750
Wire Wire Line
	9150 1750 9200 1750
Wire Wire Line
	9100 1650 9200 1650
Wire Wire Line
	10300 1250 10450 1250
NoConn ~ 10300 1150
$Comp
L 74xx:74HC595 U11
U 1 1 5F9C2188
P 5150 1600
F 0 "U11" H 5150 1600 50  0000 C CNN
F 1 "74HC595" H 5100 1300 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5150 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 5150 1600 50  0001 C CNN
	1    5150 1600
	1    0    0    -1  
$EndComp
Text GLabel 4650 1200 0    50   Input ~ 0
SR_DAT
Wire Wire Line
	4650 1200 4750 1200
Text GLabel 4650 1400 0    50   Input ~ 0
SR_CLK
Text GLabel 4550 2100 0    50   Input ~ 0
GND
Wire Wire Line
	5150 2400 4650 2400
Wire Wire Line
	4650 2400 4650 2100
Wire Wire Line
	4650 1800 4750 1800
Wire Wire Line
	5150 2400 5150 2300
Text GLabel 5250 900  2    50   Input ~ 0
+5V
Wire Wire Line
	5250 900  5150 900 
Text GLabel 5650 1100 1    50   Output ~ 0
CLKSEL
Text GLabel 5800 1100 1    50   Output ~ 0
~DBG_BE
Text GLabel 5950 1100 1    50   Output ~ 0
DBG_WAIT
Text GLabel 5650 1900 2    50   Output ~ 0
DBG_RES
Wire Wire Line
	5550 1900 5650 1900
Wire Wire Line
	4650 1400 4750 1400
Text GLabel 4650 1700 0    50   Input ~ 0
SR_LATCH
Wire Wire Line
	4650 1700 4750 1700
NoConn ~ 5550 2100
$Comp
L 74xx:74LS04 U8
U 2 1 5F92D3FA
P 8300 5600
F 0 "U8" H 8300 5917 50  0000 C CNN
F 1 "74AC04" H 8300 5826 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8300 5600 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 8300 5600 50  0001 C CNN
	2    8300 5600
	1    0    0    -1  
$EndComp
Text GLabel 7900 5600 0    50   Input ~ 0
~DBG_BE
Wire Wire Line
	7900 5600 8000 5600
Text GLabel 8700 5600 2    50   Output ~ 0
BE
Wire Wire Line
	8600 5600 8700 5600
$Comp
L 74xx:74LS04 U8
U 7 1 5F946300
P 900 6700
F 0 "U8" H 900 6750 50  0000 C CNN
F 1 "74AC04" H 900 6650 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 900 6700 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 900 6700 50  0001 C CNN
	7    900  6700
	1    0    0    -1  
$EndComp
Text GLabel 800  7300 0    50   Input ~ 0
GND
Wire Wire Line
	800  7300 900  7300
Text GLabel 800  6100 0    50   Input ~ 0
+5V
Wire Wire Line
	800  6100 900  6100
$Comp
L 74xx:74LS04 U8
U 3 1 5F95A89B
P 8300 6150
F 0 "U8" H 8300 6467 50  0000 C CNN
F 1 "74AC04" H 8300 6376 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8300 6150 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 8300 6150 50  0001 C CNN
	3    8300 6150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U8
U 1 1 5F95B175
P 8300 5050
F 0 "U8" H 8300 5367 50  0000 C CNN
F 1 "74AC04" H 8300 5276 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8300 5050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 8300 5050 50  0001 C CNN
	1    8300 5050
	1    0    0    -1  
$EndComp
Text GLabel 7900 6150 0    50   Input ~ 0
DBG_RES
Wire Wire Line
	7900 6150 8000 6150
Wire Wire Line
	7900 5050 8000 5050
Text GLabel 8700 6150 2    50   Output ~ 0
~DBG_RES
Wire Wire Line
	8600 6150 8700 6150
$Comp
L 74xx:74LS08 U17
U 1 1 5F991189
P 10150 6150
F 0 "U17" H 10150 6475 50  0000 C CNN
F 1 "74AC08" H 10150 6384 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10150 6150 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 10150 6150 50  0001 C CNN
	1    10150 6150
	1    0    0    -1  
$EndComp
Text GLabel 9750 6250 0    50   Input ~ 0
~DBG_RES
Text GLabel 9750 6050 0    50   Input ~ 0
~RES
Wire Wire Line
	9750 6050 9850 6050
Wire Wire Line
	9750 6250 9850 6250
Text GLabel 10550 6150 2    50   Output ~ 0
~6502_RES
Wire Wire Line
	10550 6150 10450 6150
$Comp
L 74xx:74LS157 U12
U 1 1 5F9A90DC
P 7350 1800
F 0 "U12" H 7350 1800 50  0000 C CNN
F 1 "74HC157" H 7350 1600 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 7350 1800 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc157.pdf" H 7350 1800 50  0001 C CNN
	1    7350 1800
	1    0    0    -1  
$EndComp
Text GLabel 7450 800  2    50   Input ~ 0
+5V
Text GLabel 6650 2700 0    50   Input ~ 0
GND
Text GLabel 6750 1300 0    50   Input ~ 0
DBG_CLK
Wire Wire Line
	6750 1200 6850 1200
Wire Wire Line
	6750 1300 6850 1300
Text GLabel 6750 1200 0    50   Input ~ 0
CLK
Text GLabel 7950 1100 1    50   Output ~ 0
6502_CLK_IN
Wire Wire Line
	7850 1200 7950 1200
Wire Wire Line
	7450 800  7350 800 
Wire Wire Line
	6850 2500 6750 2500
Wire Wire Line
	6750 2500 6750 2700
Wire Wire Line
	6750 2900 7350 2900
Wire Wire Line
	7350 2900 7350 2800
Text GLabel 7900 5050 0    50   Input ~ 0
CLK
Text GLabel 8700 5050 2    50   Output ~ 0
~CLK
Wire Wire Line
	8600 5050 8700 5050
$Comp
L 74xx:74HC74 U14
U 3 1 5FA1E8BB
P 1850 6700
F 0 "U14" H 1850 6750 50  0000 C CNN
F 1 "74AC74" H 1850 6650 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1850 6700 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1850 6700 50  0001 C CNN
	3    1850 6700
	1    0    0    -1  
$EndComp
Text GLabel 1750 7200 0    50   Input ~ 0
GND
Text GLabel 1750 6200 0    50   Input ~ 0
+5V
Text GLabel 6750 2400 0    50   Input ~ 0
CLK_TOGGLE
Wire Wire Line
	6750 2400 6850 2400
$Comp
L Device:C_Small C23
U 1 1 5FAB56CF
P 1250 6700
F 0 "C23" H 1342 6746 50  0000 L CNN
F 1 "0,1uF" H 1342 6655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1250 6700 50  0001 C CNN
F 3 "~" H 1250 6700 50  0001 C CNN
	1    1250 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C24
U 1 1 5FAB6000
P 2200 6700
F 0 "C24" H 2292 6746 50  0000 L CNN
F 1 "0,1uF" H 2292 6655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2200 6700 50  0001 C CNN
F 3 "~" H 2200 6700 50  0001 C CNN
	1    2200 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 6600 1250 6100
Wire Wire Line
	1250 6100 900  6100
Connection ~ 900  6100
Wire Wire Line
	900  6100 900  6200
Wire Wire Line
	1250 6800 1250 7300
Wire Wire Line
	1250 7300 900  7300
Connection ~ 900  7300
Wire Wire Line
	900  7300 900  7200
Wire Wire Line
	1850 7200 2200 7200
Wire Wire Line
	2200 7200 2200 6800
Wire Wire Line
	1850 7200 1850 7100
Wire Wire Line
	2200 6600 2200 6200
Wire Wire Line
	2200 6200 1850 6200
Connection ~ 1850 6200
Wire Wire Line
	1850 6200 1850 6300
$Comp
L Device:C_Small C15
U 1 1 5FAF8D14
P 7150 800
F 0 "C15" V 6921 800 50  0000 C CNN
F 1 "0,1uF" V 7012 800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 800 50  0001 C CNN
F 3 "~" H 7150 800 50  0001 C CNN
	1    7150 800 
	0    1    1    0   
$EndComp
Text GLabel 6950 800  0    50   Input ~ 0
GND
Wire Wire Line
	6950 800  7050 800 
Wire Wire Line
	7250 800  7350 800 
Connection ~ 7350 800 
Wire Wire Line
	7350 800  7350 900 
$Comp
L 74xx:74LS08 U17
U 5 1 5FB0D0DC
P 2800 6700
F 0 "U17" H 2800 6750 50  0000 C CNN
F 1 "74AC08" H 2800 6650 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2800 6700 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 2800 6700 50  0001 C CNN
	5    2800 6700
	1    0    0    -1  
$EndComp
Text GLabel 2700 6100 0    50   Input ~ 0
+5V
Text GLabel 2700 7300 0    50   Input ~ 0
GND
Wire Wire Line
	2800 6200 2800 6100
Wire Wire Line
	2800 7200 2800 7300
Wire Wire Line
	3150 6600 3150 6100
Wire Wire Line
	3150 6100 2800 6100
Connection ~ 2800 6100
Wire Wire Line
	2800 6100 2700 6100
Wire Wire Line
	3150 6800 3150 7300
Wire Wire Line
	3150 7300 2800 7300
Connection ~ 2800 7300
Wire Wire Line
	2800 7300 2700 7300
$Comp
L Device:C_Small C14
U 1 1 5FB3967F
P 2100 800
F 0 "C14" V 1871 800 50  0000 C CNN
F 1 "0,1uF" V 1962 800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2100 800 50  0001 C CNN
F 3 "~" H 2100 800 50  0001 C CNN
	1    2100 800 
	0    1    1    0   
$EndComp
Text GLabel 1900 800  0    50   Input ~ 0
GND
Wire Wire Line
	1900 800  2000 800 
Wire Wire Line
	2200 800  2300 800 
$Comp
L Device:C_Small C16
U 1 1 5FB5019A
P 4950 900
F 0 "C16" V 4721 900 50  0000 C CNN
F 1 "0,1uF" V 4812 900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4950 900 50  0001 C CNN
F 3 "~" H 4950 900 50  0001 C CNN
	1    4950 900 
	0    1    1    0   
$EndComp
Text GLabel 4750 900  0    50   Input ~ 0
GND
Wire Wire Line
	4750 900  4850 900 
Wire Wire Line
	5050 900  5150 900 
Connection ~ 5150 900 
Wire Wire Line
	5150 900  5150 1000
$Comp
L Device:C_Small C17
U 1 1 5FC939BD
P 10800 1350
F 0 "C17" H 10708 1304 50  0000 R CNN
F 1 "0,1uF" H 10708 1395 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10800 1350 50  0001 C CNN
F 3 "~" H 10800 1350 50  0001 C CNN
	1    10800 1350
	0    1    1    0   
$EndComp
NoConn ~ 7850 1500
NoConn ~ 7850 1800
NoConn ~ 7850 2100
Text GLabel 6750 1500 0    50   Input ~ 0
GND
Text GLabel 6750 1600 0    50   Input ~ 0
GND
Text GLabel 6750 1800 0    50   Input ~ 0
GND
Text GLabel 6750 1900 0    50   Input ~ 0
GND
Text GLabel 6750 2100 0    50   Input ~ 0
GND
Text GLabel 6750 2200 0    50   Input ~ 0
GND
Wire Wire Line
	6750 2200 6850 2200
Wire Wire Line
	6750 2100 6850 2100
Wire Wire Line
	6750 1900 6850 1900
Wire Wire Line
	6750 1800 6850 1800
Wire Wire Line
	6750 1600 6850 1600
Wire Wire Line
	6750 1500 6850 1500
NoConn ~ 5550 1600
NoConn ~ 5550 1700
NoConn ~ 5550 1800
Wire Wire Line
	5650 1200 5650 1100
Wire Wire Line
	5550 1200 5650 1200
Wire Wire Line
	5550 1300 5800 1300
Wire Wire Line
	5800 1300 5800 1100
Wire Wire Line
	5550 1400 5950 1400
Wire Wire Line
	5950 1400 5950 1100
Text GLabel 4650 1550 0    50   Input ~ 0
~RES
Wire Wire Line
	4650 1550 4700 1550
Wire Wire Line
	4700 1550 4700 1500
Wire Wire Line
	4700 1500 4750 1500
Wire Wire Line
	7950 1200 7950 1100
$Comp
L 74xx:74LS08 U17
U 4 1 5FBB5F74
P 5550 7300
F 0 "U17" H 5550 7625 50  0000 C CNN
F 1 "74AC08" H 5550 7534 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5550 7300 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 5550 7300 50  0001 C CNN
	4    5550 7300
	1    0    0    -1  
$EndComp
Text GLabel 5150 7400 0    50   Input ~ 0
GND
Text GLabel 5150 7200 0    50   Input ~ 0
GND
Wire Wire Line
	5150 7400 5250 7400
Wire Wire Line
	5150 7200 5250 7200
NoConn ~ 5850 7300
Wire Wire Line
	9650 5500 9750 5500
Wire Wire Line
	9750 5700 9850 5700
$Comp
L 74xx:74LS08 U17
U 2 1 5FBB3E3E
P 10150 5600
F 0 "U17" H 10150 5925 50  0000 C CNN
F 1 "74AC08" H 10150 5834 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10150 5600 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 10150 5600 50  0001 C CNN
	2    10150 5600
	1    0    0    -1  
$EndComp
Text GLabel 9750 5700 0    50   Input ~ 0
~RES
Text GLabel 9650 5500 0    50   Input ~ 0
SR_OUT
Text GLabel 10550 5600 2    50   Output ~ 0
SR_LATCH
Wire Wire Line
	10450 5600 10550 5600
$Comp
L Device:R R?
U 1 1 5FCB90E3
P 9750 5250
AR Path="/5FCB90E3" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FCB90E3" Ref="R17"  Part="1" 
F 0 "R17" V 9650 5250 50  0000 C CNN
F 1 "4K7" V 9750 5250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9680 5250 50  0001 C CNN
F 3 "~" H 9750 5250 50  0001 C CNN
	1    9750 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 5400 9750 5500
Connection ~ 9750 5500
Wire Wire Line
	9750 5500 9850 5500
Text GLabel 9650 5000 0    50   Input ~ 0
+5V
Wire Wire Line
	9650 5000 9750 5000
Wire Wire Line
	9750 5000 9750 5100
$Comp
L Jumper:Jumper_2_Open JP9
U 1 1 5FF157D7
P 9800 2950
F 0 "JP9" H 9800 3185 50  0000 C CNN
F 1 "Debug RxD" H 9800 3094 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 9800 2950 50  0001 C CNN
F 3 "~" H 9800 2950 50  0001 C CNN
	1    9800 2950
	1    0    0    -1  
$EndComp
Text GLabel 9500 2950 0    50   Input ~ 0
DBG_USB_RxD
Text GLabel 10100 2950 2    50   Output ~ 0
DBG_RxD
Wire Wire Line
	9500 2950 9600 2950
Wire Wire Line
	10000 2950 10100 2950
Wire Wire Line
	10450 1250 10450 1150
Wire Wire Line
	10300 1350 10600 1350
Wire Wire Line
	10600 1250 10600 1350
Connection ~ 10600 1350
Wire Wire Line
	10600 1350 10700 1350
Wire Wire Line
	11000 1250 11000 1350
Wire Wire Line
	10300 1450 11000 1450
Wire Wire Line
	10900 1350 11000 1350
Connection ~ 11000 1350
Wire Wire Line
	11000 1350 11000 1450
$Comp
L Device:C_Small C?
U 1 1 5FF0FFA6
P 8850 2150
AR Path="/6014B4D9/5FF0FFA6" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5FF0FFA6" Ref="C21"  Part="1" 
AR Path="/5F910E81/5FF0FFA6" Ref="C?"  Part="1" 
F 0 "C21" H 8965 2196 50  0000 L CNN
F 1 "0,1uF" H 8965 2105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8888 2000 50  0001 C CNN
F 3 "~" H 8850 2150 50  0001 C CNN
	1    8850 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 1950 8850 2050
Text GLabel 8950 2350 2    50   Input ~ 0
GND
Wire Wire Line
	8850 2350 8850 2250
$Comp
L Device:R R?
U 1 1 5FF0FFAF
P 9750 2150
AR Path="/6014B4D9/5FF0FFAF" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FF0FFAF" Ref="R15"  Part="1" 
AR Path="/5F910E81/5FF0FFAF" Ref="R?"  Part="1" 
F 0 "R15" V 9850 2150 50  0000 C CNN
F 1 "220" V 9750 2150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9680 2150 50  0001 C CNN
F 3 "~" H 9750 2150 50  0001 C CNN
	1    9750 2150
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5FF0FFB5
P 10150 2450
AR Path="/6014B4D9/5FF0FFB5" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5FF0FFB5" Ref="D3"  Part="1" 
AR Path="/5F910E81/5FF0FFB5" Ref="D?"  Part="1" 
F 0 "D3" H 10150 2350 50  0000 C CNN
F 1 "D_RX" H 10150 2550 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 10150 2450 50  0001 C CNN
F 3 "~" H 10150 2450 50  0001 C CNN
	1    10150 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5FF0FFBB
P 10150 2150
AR Path="/6014B4D9/5FF0FFBB" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5FF0FFBB" Ref="D2"  Part="1" 
AR Path="/5F910E81/5FF0FFBB" Ref="D?"  Part="1" 
F 0 "D2" H 10150 2050 50  0000 C CNN
F 1 "D_TX" H 10150 2250 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 10150 2150 50  0001 C CNN
F 3 "~" H 10150 2150 50  0001 C CNN
	1    10150 2150
	-1   0    0    1   
$EndComp
Text GLabel 10400 2450 2    50   Input ~ 0
~DBG_RXLED
Text GLabel 10400 2150 2    50   Input ~ 0
~DBG_TXLED
Wire Wire Line
	10400 2450 10300 2450
Wire Wire Line
	10400 2150 10300 2150
$Comp
L Device:R R?
U 1 1 5FF0FFC5
P 9750 2450
AR Path="/6014B4D9/5FF0FFC5" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FF0FFC5" Ref="R16"  Part="1" 
AR Path="/5F910E81/5FF0FFC5" Ref="R?"  Part="1" 
F 0 "R16" V 9850 2450 50  0000 C CNN
F 1 "220" V 9750 2450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9680 2450 50  0001 C CNN
F 3 "~" H 9750 2450 50  0001 C CNN
	1    9750 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9900 2150 10000 2150
Wire Wire Line
	9900 2450 10000 2450
Wire Wire Line
	9500 2150 9600 2150
Wire Wire Line
	9500 1950 9500 2150
Wire Wire Line
	9400 2450 9600 2450
Wire Wire Line
	9400 1950 9400 2450
Wire Wire Line
	8850 2350 8950 2350
Wire Wire Line
	8500 1950 8850 1950
Connection ~ 8850 1950
Wire Wire Line
	8850 1950 9400 1950
Connection ~ 9400 1950
Wire Wire Line
	9400 1950 9500 1950
Connection ~ 9500 1950
Wire Wire Line
	9500 1950 11000 1950
Text Label 4600 5300 0    50   ~ 0
meta_sync
NoConn ~ 5650 5500
Wire Wire Line
	5650 5300 5750 5300
Wire Wire Line
	5350 5000 5350 5100
Wire Wire Line
	5450 5000 5350 5000
Text GLabel 5450 5000 2    50   Input ~ 0
+5V
Wire Wire Line
	5350 5800 5350 5700
Wire Wire Line
	5250 5800 5350 5800
Text GLabel 5250 5800 0    50   Input ~ 0
+5V
Wire Wire Line
	4250 5000 4350 5000
Wire Wire Line
	4150 5800 4250 5800
Wire Wire Line
	4950 5400 5050 5400
Wire Wire Line
	4950 5500 4950 5400
Text GLabel 4950 5500 3    50   Input ~ 0
~CLK
$Comp
L 74xx:74HC74 U16
U 2 1 6000C6AE
P 5350 5400
F 0 "U16" H 5050 5800 50  0000 C CNN
F 1 "74AC74" H 5050 5700 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5350 5400 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5350 5400 50  0001 C CNN
	2    5350 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5300 4550 5300
Text GLabel 5750 5300 2    50   Output ~ 0
CLK_TOGGLE
Wire Wire Line
	4250 5000 4250 5100
Wire Wire Line
	4250 5800 4250 5700
Text GLabel 4150 5800 0    50   Input ~ 0
+5V
Text GLabel 4350 5000 2    50   Input ~ 0
+5V
NoConn ~ 4550 5500
Wire Wire Line
	3850 5300 3950 5300
Text GLabel 3850 5300 0    50   Input ~ 0
CLKSEL
Wire Wire Line
	3850 5500 3850 5400
Wire Wire Line
	3850 5400 3950 5400
Text GLabel 3850 5500 3    50   Input ~ 0
~CLK
$Comp
L 74xx:74HC74 U16
U 1 1 5FA3C995
P 4250 5400
F 0 "U16" H 3950 5800 50  0000 C CNN
F 1 "74AC74" H 3950 5700 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4250 5400 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4250 5400 50  0001 C CNN
	1    4250 5400
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 600608DA
P 5000 3950
AR Path="/600608DA" Ref="X?"  Part="1" 
AR Path="/5F8F4E1E/600608DA" Ref="X1"  Part="1" 
F 0 "X1" H 5250 4200 50  0000 L CNN
F 1 "8MHz" H 5250 4100 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 5450 3600 50  0001 C CNN
F 3 "" H 4900 3950 50  0001 C CNN
	1    5000 3950
	1    0    0    -1  
$EndComp
Text GLabel 5100 3550 2    50   Input ~ 0
+5V
Text GLabel 5100 4350 2    50   Input ~ 0
GND
Text GLabel 8200 3950 3    50   Output ~ 0
CLK
Wire Wire Line
	5300 3950 5500 3950
$Comp
L Device:C_Small C?
U 1 1 600608E6
P 4700 3950
AR Path="/600608E6" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/600608E6" Ref="C22"  Part="1" 
F 0 "C22" H 4600 4000 50  0000 R CNN
F 1 "0,1uF" H 4600 3900 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4700 3950 50  0001 C CNN
F 3 "~" H 4700 3950 50  0001 C CNN
	1    4700 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3850 4700 3550
Wire Wire Line
	4700 3550 5000 3550
Wire Wire Line
	5000 3550 5000 3650
Wire Wire Line
	4700 4050 4700 4350
Wire Wire Line
	4700 4350 5000 4350
Wire Wire Line
	5000 4350 5000 4250
$Comp
L Switch:SW_Push SW?
U 1 1 601309D5
P 10550 4300
AR Path="/601309D5" Ref="SW?"  Part="1" 
AR Path="/5F8F4E1E/601309D5" Ref="SW1"  Part="1" 
F 0 "SW1" V 10504 4448 50  0000 L CNN
F 1 "Reset" V 10595 4448 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 10550 4500 50  0001 C CNN
F 3 "~" H 10550 4500 50  0001 C CNN
	1    10550 4300
	0    1    1    0   
$EndComp
Text GLabel 9950 4650 0    50   Input ~ 0
GND
Wire Wire Line
	9950 4650 10050 4650
Wire Wire Line
	10050 4650 10550 4650
Wire Wire Line
	10550 4650 10550 4500
Connection ~ 10050 4650
Wire Wire Line
	10050 4650 10050 4550
Wire Wire Line
	10550 4100 10550 4000
Wire Wire Line
	10550 4000 10450 4000
Text GLabel 10150 3350 2    50   Input ~ 0
+5V
Wire Wire Line
	10050 3350 10050 3450
Text GLabel 10650 4000 2    50   Output ~ 0
~RES
Wire Wire Line
	10650 4000 10550 4000
Connection ~ 10550 4000
$Comp
L 6502:DS1813 U?
U 1 1 601309E8
P 10050 4000
AR Path="/601309E8" Ref="U?"  Part="1" 
AR Path="/5F8F4E1E/601309E8" Ref="U15"  Part="1" 
F 0 "U15" H 10300 4300 50  0000 L CNN
F 1 "DS1813" H 10300 4200 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 10050 3600 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DS1813.pdf" H 10050 4000 50  0001 C CNN
	1    10050 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 7200 1850 7200
Connection ~ 1850 7200
Wire Wire Line
	1750 6200 1850 6200
Wire Wire Line
	10150 3350 10050 3350
Wire Wire Line
	5000 3550 5100 3550
Connection ~ 5000 3550
Wire Wire Line
	5000 4350 5100 4350
Connection ~ 5000 4350
Connection ~ 2400 800 
Wire Wire Line
	6650 2700 6750 2700
Connection ~ 6750 2700
Wire Wire Line
	6750 2700 6750 2900
Wire Wire Line
	4550 2100 4650 2100
Connection ~ 4650 2100
Wire Wire Line
	4650 2100 4650 1800
Wire Wire Line
	2200 5000 2300 5000
$Comp
L 74xx:74LS08 U17
U 3 1 5FA8DB46
P 5550 6750
AR Path="/5F8F4E1E/5FA8DB46" Ref="U17"  Part="3" 
AR Path="/5FA8DB46" Ref="U?"  Part="2" 
F 0 "U17" H 5550 7075 50  0000 C CNN
F 1 "74AC08" H 5550 6984 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5550 6750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 5550 6750 50  0001 C CNN
	3    5550 6750
	1    0    0    -1  
$EndComp
Text GLabel 5150 6650 0    50   Input ~ 0
GND
Text GLabel 5150 6850 0    50   Input ~ 0
GND
Wire Wire Line
	5150 6850 5250 6850
Wire Wire Line
	5150 6650 5250 6650
NoConn ~ 5850 6750
Text GLabel 6100 1100 1    50   Output ~ 0
WS_DISABLE
Wire Wire Line
	6100 1100 6100 1500
Wire Wire Line
	6100 1500 5550 1500
$Comp
L 74xx:74HC74 U14
U 1 1 6083DFAA
P 6000 3950
F 0 "U14" H 5750 4300 50  0000 C CNN
F 1 "74AC74" H 5750 4200 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6000 3950 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6000 3950 50  0001 C CNN
	1    6000 3950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC74 U14
U 2 1 60841867
P 6900 3950
F 0 "U14" H 6650 4300 50  0000 C CNN
F 1 "74AC74" H 6650 4200 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6900 3950 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6900 3950 50  0001 C CNN
	2    6900 3950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC74 U16
U 3 1 608433A0
P 3800 6700
F 0 "U16" H 3800 6750 50  0000 C CNN
F 1 "74AC74" H 3800 6650 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3800 6700 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3800 6700 50  0001 C CNN
	3    3800 6700
	1    0    0    -1  
$EndComp
Text GLabel 3700 7200 0    50   Input ~ 0
GND
Text GLabel 3700 6200 0    50   Input ~ 0
+5V
Wire Wire Line
	3700 6200 3800 6200
Wire Wire Line
	3800 6200 3800 6300
Wire Wire Line
	3800 6200 4150 6200
Wire Wire Line
	4150 6200 4150 6600
Connection ~ 3800 6200
Wire Wire Line
	3700 7200 3800 7200
Wire Wire Line
	3800 7200 3800 7100
Wire Wire Line
	3800 7200 4150 7200
Wire Wire Line
	4150 7200 4150 6800
Connection ~ 3800 7200
Text GLabel 5900 4350 0    50   Input ~ 0
+5V
Wire Wire Line
	5900 4350 6000 4350
Wire Wire Line
	6000 4350 6000 4250
Wire Wire Line
	6000 4350 6900 4350
Wire Wire Line
	6900 4350 6900 4250
Connection ~ 6000 4350
Text GLabel 7000 3550 2    50   Input ~ 0
+5V
Wire Wire Line
	7000 3550 6900 3550
Wire Wire Line
	6900 3550 6900 3650
Wire Wire Line
	6900 3550 6000 3550
Wire Wire Line
	6000 3550 6000 3650
Connection ~ 6900 3550
Wire Wire Line
	6300 3850 6400 3850
Wire Wire Line
	6400 3850 6400 3950
Wire Wire Line
	6400 3950 6600 3950
Wire Wire Line
	6300 4050 6400 4050
Wire Wire Line
	6400 4050 6400 4450
Wire Wire Line
	6400 4450 5600 4450
Wire Wire Line
	5600 4450 5600 3850
Wire Wire Line
	5600 3850 5700 3850
Wire Wire Line
	6600 3850 6500 3850
Wire Wire Line
	6500 3850 6500 4450
Wire Wire Line
	6500 4450 7300 4450
Wire Wire Line
	7300 4450 7300 4050
Wire Wire Line
	7300 4050 7200 4050
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J9
U 1 1 60975E70
P 7800 3750
F 0 "J9" H 7850 4067 50  0000 C CNN
F 1 "Clock divider" H 7850 3976 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 7800 3750 50  0001 C CNN
F 3 "~" H 7800 3750 50  0001 C CNN
	1    7800 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3750 7400 3750
Wire Wire Line
	7400 3750 7400 3450
Wire Wire Line
	7400 3450 6400 3450
Wire Wire Line
	6400 3450 6400 3850
Connection ~ 6400 3850
Wire Wire Line
	5500 3950 5500 3350
Wire Wire Line
	5500 3350 7500 3350
Wire Wire Line
	7500 3350 7500 3650
Wire Wire Line
	7500 3650 7600 3650
Connection ~ 5500 3950
Wire Wire Line
	5500 3950 5700 3950
Wire Wire Line
	8100 3650 8200 3650
Wire Wire Line
	8200 3650 8200 3750
Wire Wire Line
	8100 3850 8200 3850
Connection ~ 8200 3850
Wire Wire Line
	8200 3850 8200 3950
Wire Wire Line
	8100 3750 8200 3750
Connection ~ 8200 3750
Wire Wire Line
	8200 3750 8200 3850
Wire Wire Line
	7200 3850 7600 3850
$Comp
L Device:C_Small C25
U 1 1 5FB0F869
P 3150 6700
F 0 "C25" H 3242 6746 50  0000 L CNN
F 1 "0,1uF" H 3242 6655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3150 6700 50  0001 C CNN
F 3 "~" H 3150 6700 50  0001 C CNN
	1    3150 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C26
U 1 1 60846488
P 4150 6700
F 0 "C26" H 4242 6746 50  0000 L CNN
F 1 "0,1uF" H 4242 6655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4150 6700 50  0001 C CNN
F 3 "~" H 4150 6700 50  0001 C CNN
	1    4150 6700
	1    0    0    -1  
$EndComp
Text GLabel 10200 650  0    50   Input ~ 0
VBUS_SENSE
Wire Wire Line
	10300 1050 10350 1050
Wire Wire Line
	10350 1050 10350 650 
Wire Wire Line
	10350 650  10200 650 
Wire Bus Line
	3200 2200 3200 2900
Wire Bus Line
	3950 1300 3950 3900
$EndSCHEMATC
