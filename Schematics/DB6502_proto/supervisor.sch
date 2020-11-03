EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
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
L Device:C_Small C17
U 1 1 5F942B94
P 1050 1400
F 0 "C17" V 1279 1400 50  0000 C CNN
F 1 "22pF" V 1188 1400 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1050 1400 50  0001 C CNN
F 3 "~" H 1050 1400 50  0001 C CNN
	1    1050 1400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C18
U 1 1 5F942B9A
P 1050 1600
F 0 "C18" V 900 1600 50  0000 C CNN
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
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1500 1800 50  0001 C CNN
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
Text GLabel 2300 5000 3    50   Input ~ 0
GND
Wire Wire Line
	2300 5000 2300 4900
Text GLabel 2300 750  1    50   Input ~ 0
+5V
Wire Wire Line
	2300 750  2300 800 
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
L MCU_Microchip_ATmega:ATmega644PA-PU U10
U 1 1 5F942C1A
P 2300 2900
F 0 "U10" H 2300 3000 50  0000 C CNN
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
AR Path="/5F8F4E1E/5F9AD1D3" Ref="U14"  Part="1" 
F 0 "U14" H 9750 2015 50  0000 C CNN
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
NoConn ~ 10300 1050
$Comp
L 74xx:74HC595 U11
U 1 1 5F9C2188
P 5150 1600
F 0 "U11" H 5150 1600 50  0000 C CNN
F 1 "74HC595" H 5100 1300 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 5150 1600 50  0001 C CNN
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
Text GLabel 5150 2500 3    50   Input ~ 0
GND
Wire Wire Line
	5150 2500 5150 2400
Wire Wire Line
	5150 2400 4650 2400
Wire Wire Line
	4650 2400 4650 1800
Wire Wire Line
	4650 1800 4750 1800
Connection ~ 5150 2400
Wire Wire Line
	5150 2400 5150 2300
Text GLabel 5150 900  1    50   Input ~ 0
+5V
Wire Wire Line
	5150 900  5150 950 
Text GLabel 5650 1100 1    50   Output ~ 0
CLKSEL
Text GLabel 5800 1100 1    50   Output ~ 0
~DBG_BE
Text GLabel 5950 1100 1    50   Output ~ 0
~DBG_RDY
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
L 74xx:74LS04 U4
U 1 1 5F92D3FA
P 8300 5050
F 0 "U4" H 8300 5367 50  0000 C CNN
F 1 "74AC04" H 8300 5276 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8300 5050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 8300 5050 50  0001 C CNN
	1    8300 5050
	1    0    0    -1  
$EndComp
Text GLabel 7900 5050 0    50   Input ~ 0
~DBG_BE
Wire Wire Line
	7900 5050 8000 5050
Text GLabel 8700 5050 2    50   Output ~ 0
BE
Wire Wire Line
	8600 5050 8700 5050
$Comp
L 74xx:74LS04 U4
U 2 1 5F93AD6D
P 8300 5600
F 0 "U4" H 8300 5917 50  0000 C CNN
F 1 "74AC04" H 8300 5826 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8300 5600 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 8300 5600 50  0001 C CNN
	2    8300 5600
	1    0    0    -1  
$EndComp
Text GLabel 7900 5600 0    50   Input ~ 0
~DBG_RDY
Wire Wire Line
	7900 5600 8000 5600
Text GLabel 8700 5600 2    50   Output ~ 0
DBG_RDY
Wire Wire Line
	8600 5600 8700 5600
$Comp
L 74xx:74LS04 U4
U 7 1 5F946300
P 900 6700
F 0 "U4" H 900 6750 50  0000 C CNN
F 1 "74AC04" H 900 6650 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 900 6700 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 900 6700 50  0001 C CNN
	7    900  6700
	1    0    0    -1  
$EndComp
Text GLabel 900  7300 3    50   Input ~ 0
GND
Wire Wire Line
	900  7300 900  7250
Text GLabel 900  6100 1    50   Input ~ 0
+5V
Wire Wire Line
	900  6100 900  6150
$Comp
L 74xx:74LS04 U4
U 3 1 5F95A89B
P 8300 6150
F 0 "U4" H 8300 6467 50  0000 C CNN
F 1 "74AC04" H 8300 6376 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8300 6150 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 8300 6150 50  0001 C CNN
	3    8300 6150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 4 1 5F95B175
P 10150 5600
F 0 "U4" H 10150 5917 50  0000 C CNN
F 1 "74AC04" H 10150 5826 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 10150 5600 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 10150 5600 50  0001 C CNN
	4    10150 5600
	1    0    0    -1  
$EndComp
Text GLabel 7900 6150 0    50   Input ~ 0
DBG_RES
Wire Wire Line
	7900 6150 8000 6150
Wire Wire Line
	9750 5600 9850 5600
Text GLabel 8700 6150 2    50   Output ~ 0
~DBG_RES
Wire Wire Line
	8600 6150 8700 6150
$Comp
L 74xx:74LS08 U6
U 1 1 5F991189
P 10150 6150
F 0 "U6" H 10150 6475 50  0000 C CNN
F 1 "74AC08" H 10150 6384 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 10150 6150 50  0001 C CNN
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
L 74xx:74LS157 U13
U 1 1 5F9A90DC
P 7350 1800
F 0 "U13" H 7350 1800 50  0000 C CNN
F 1 "74HC157" H 7350 1600 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 7350 1800 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc157.pdf" H 7350 1800 50  0001 C CNN
	1    7350 1800
	1    0    0    -1  
$EndComp
Text GLabel 7350 800  1    50   Input ~ 0
+5V
Text GLabel 7350 2900 3    50   Input ~ 0
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
6502_CLK
Wire Wire Line
	7850 1200 7950 1200
Wire Wire Line
	7350 800  7350 850 
Wire Wire Line
	7350 2900 7350 2850
Wire Wire Line
	6850 2500 6750 2500
Wire Wire Line
	6750 2500 6750 2850
Wire Wire Line
	6750 2850 7350 2850
Connection ~ 7350 2850
Wire Wire Line
	7350 2850 7350 2800
Text GLabel 9750 5600 0    50   Input ~ 0
CLK
Text GLabel 10550 5600 2    50   Output ~ 0
~CLK
Wire Wire Line
	10450 5600 10550 5600
$Comp
L 74xx:74HC74 U9
U 3 1 5FA1E8BB
P 1850 6700
F 0 "U9" H 1850 6750 50  0000 C CNN
F 1 "74AC74" H 1850 6650 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 1850 6700 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1850 6700 50  0001 C CNN
	3    1850 6700
	1    0    0    -1  
$EndComp
Text GLabel 1850 7200 3    50   Input ~ 0
GND
Wire Wire Line
	1850 7200 1850 7150
Text GLabel 1850 6200 1    50   Input ~ 0
+5V
Wire Wire Line
	1850 6200 1850 6250
Text GLabel 6750 2400 0    50   Input ~ 0
CLK_TOGGLE
Wire Wire Line
	6750 2400 6850 2400
$Comp
L Device:C_Small C19
U 1 1 5FAB56CF
P 1250 6700
F 0 "C19" H 1342 6746 50  0000 L CNN
F 1 "0,1uF" H 1342 6655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1250 6700 50  0001 C CNN
F 3 "~" H 1250 6700 50  0001 C CNN
	1    1250 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C22
U 1 1 5FAB6000
P 2200 6700
F 0 "C22" H 2292 6746 50  0000 L CNN
F 1 "0,1uF" H 2292 6655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2200 6700 50  0001 C CNN
F 3 "~" H 2200 6700 50  0001 C CNN
	1    2200 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 6600 1250 6150
Wire Wire Line
	1250 6150 900  6150
Connection ~ 900  6150
Wire Wire Line
	900  6150 900  6200
Wire Wire Line
	1250 6800 1250 7250
Wire Wire Line
	1250 7250 900  7250
Connection ~ 900  7250
Wire Wire Line
	900  7250 900  7200
Wire Wire Line
	1850 7150 2200 7150
Wire Wire Line
	2200 7150 2200 6800
Connection ~ 1850 7150
Wire Wire Line
	1850 7150 1850 7100
Wire Wire Line
	2200 6600 2200 6250
Wire Wire Line
	2200 6250 1850 6250
Connection ~ 1850 6250
Wire Wire Line
	1850 6250 1850 6300
$Comp
L Device:C_Small C26
U 1 1 5FAF8D14
P 7150 850
F 0 "C26" V 6921 850 50  0000 C CNN
F 1 "0,1uF" V 7012 850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7150 850 50  0001 C CNN
F 3 "~" H 7150 850 50  0001 C CNN
	1    7150 850 
	0    1    1    0   
$EndComp
Text GLabel 6950 850  0    50   Input ~ 0
GND
Wire Wire Line
	6950 850  7050 850 
Wire Wire Line
	7250 850  7350 850 
Connection ~ 7350 850 
Wire Wire Line
	7350 850  7350 900 
$Comp
L 74xx:74LS08 U6
U 5 1 5FB0D0DC
P 2800 6700
F 0 "U6" H 2800 6750 50  0000 C CNN
F 1 "74AC08" H 2800 6650 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2800 6700 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 2800 6700 50  0001 C CNN
	5    2800 6700
	1    0    0    -1  
$EndComp
Text GLabel 2800 6100 1    50   Input ~ 0
+5V
Text GLabel 2800 7300 3    50   Input ~ 0
GND
$Comp
L Device:C_Small C23
U 1 1 5FB0F869
P 3150 6700
F 0 "C23" H 3242 6746 50  0000 L CNN
F 1 "0,1uF" H 3242 6655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3150 6700 50  0001 C CNN
F 3 "~" H 3150 6700 50  0001 C CNN
	1    3150 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 6200 2800 6150
Wire Wire Line
	2800 7200 2800 7250
Wire Wire Line
	3150 6600 3150 6150
Wire Wire Line
	3150 6150 2800 6150
Connection ~ 2800 6150
Wire Wire Line
	2800 6150 2800 6100
Wire Wire Line
	3150 6800 3150 7250
Wire Wire Line
	3150 7250 2800 7250
Connection ~ 2800 7250
Wire Wire Line
	2800 7250 2800 7300
$Comp
L Device:C_Small C21
U 1 1 5FB3967F
P 2100 800
F 0 "C21" V 1871 800 50  0000 C CNN
F 1 "0,1uF" V 1962 800 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2100 800 50  0001 C CNN
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
L Device:C_Small C25
U 1 1 5FB5019A
P 4950 950
F 0 "C25" V 4721 950 50  0000 C CNN
F 1 "0,1uF" V 4812 950 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4950 950 50  0001 C CNN
F 3 "~" H 4950 950 50  0001 C CNN
	1    4950 950 
	0    1    1    0   
$EndComp
Text GLabel 4750 950  0    50   Input ~ 0
GND
Wire Wire Line
	4750 950  4850 950 
Wire Wire Line
	5050 950  5150 950 
Connection ~ 5150 950 
Wire Wire Line
	5150 950  5150 1000
$Comp
L Device:C_Small C28
U 1 1 5FC939BD
P 10800 1350
F 0 "C28" H 10708 1304 50  0000 R CNN
F 1 "0,1uF" H 10708 1395 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 10800 1350 50  0001 C CNN
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
NoConn ~ 5550 1500
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
L 74xx:74LS08 U6
U 4 1 5FBB5F74
P 4300 7250
F 0 "U6" H 4300 7575 50  0000 C CNN
F 1 "74AC08" H 4300 7484 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4300 7250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 4300 7250 50  0001 C CNN
	4    4300 7250
	1    0    0    -1  
$EndComp
Text GLabel 3900 7350 0    50   Input ~ 0
GND
Text GLabel 3900 7150 0    50   Input ~ 0
GND
Wire Wire Line
	3900 7350 4000 7350
Wire Wire Line
	3900 7150 4000 7150
NoConn ~ 4600 7250
Wire Wire Line
	9650 4950 9750 4950
Wire Wire Line
	9750 5150 9850 5150
$Comp
L 74xx:74LS08 U6
U 3 1 5FBB3E3E
P 10150 5050
F 0 "U6" H 10150 5375 50  0000 C CNN
F 1 "74AC08" H 10150 5284 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 10150 5050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 10150 5050 50  0001 C CNN
	3    10150 5050
	1    0    0    -1  
$EndComp
Text GLabel 9750 5150 0    50   Input ~ 0
~RES
Text GLabel 9650 4950 0    50   Input ~ 0
SR_OUT
Text GLabel 10550 5050 2    50   Output ~ 0
SR_LATCH
Wire Wire Line
	10450 5050 10550 5050
$Comp
L Device:R R?
U 1 1 5FCB90E3
P 9750 4700
AR Path="/5FCB90E3" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FCB90E3" Ref="R19"  Part="1" 
F 0 "R19" V 9650 4700 50  0000 C CNN
F 1 "4K7" V 9750 4700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9680 4700 50  0001 C CNN
F 3 "~" H 9750 4700 50  0001 C CNN
	1    9750 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 4850 9750 4950
Connection ~ 9750 4950
Wire Wire Line
	9750 4950 9850 4950
Text GLabel 9650 4450 0    50   Input ~ 0
+5V
Wire Wire Line
	9650 4450 9750 4450
Wire Wire Line
	9750 4450 9750 4550
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 5FF157D7
P 9800 2950
F 0 "JP1" H 9800 3185 50  0000 C CNN
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
AR Path="/5F8F4E1E/5FF0FFA6" Ref="C27"  Part="1" 
AR Path="/5F910E81/5FF0FFA6" Ref="C?"  Part="1" 
F 0 "C27" H 8965 2196 50  0000 L CNN
F 1 "0,1uF" H 8965 2105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8888 2000 50  0001 C CNN
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
AR Path="/5F8F4E1E/5FF0FFAF" Ref="R17"  Part="1" 
AR Path="/5F910E81/5FF0FFAF" Ref="R?"  Part="1" 
F 0 "R17" V 9850 2150 50  0000 C CNN
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
AR Path="/5F8F4E1E/5FF0FFC5" Ref="R18"  Part="1" 
AR Path="/5F910E81/5FF0FFC5" Ref="R?"  Part="1" 
F 0 "R18" V 9850 2450 50  0000 C CNN
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
Text Label 7150 3650 0    50   ~ 0
meta_sync
NoConn ~ 8200 3850
Wire Wire Line
	8200 3650 8300 3650
Wire Wire Line
	7900 3350 7900 3450
Wire Wire Line
	8000 3350 7900 3350
Text GLabel 8000 3350 2    50   Input ~ 0
+5V
Wire Wire Line
	7900 4150 7900 4050
Wire Wire Line
	7800 4150 7900 4150
Text GLabel 7800 4150 0    50   Input ~ 0
+5V
Wire Wire Line
	6800 3350 6900 3350
Wire Wire Line
	6700 4150 6800 4150
Wire Wire Line
	7500 3750 7600 3750
Wire Wire Line
	7500 3850 7500 3750
Text GLabel 7500 3850 3    50   Input ~ 0
~CLK
$Comp
L 74xx:74HC74 U9
U 2 1 6000C6AE
P 7900 3750
F 0 "U9" H 7600 4150 50  0000 C CNN
F 1 "74AC74" H 7600 4050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7900 3750 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7900 3750 50  0001 C CNN
	2    7900 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3650 7100 3650
Text GLabel 8300 3650 2    50   Output ~ 0
CLK_TOGGLE
Wire Wire Line
	6800 3350 6800 3450
Wire Wire Line
	6800 4150 6800 4050
Text GLabel 6700 4150 0    50   Input ~ 0
+5V
Text GLabel 6900 3350 2    50   Input ~ 0
+5V
NoConn ~ 7100 3850
Wire Wire Line
	6400 3650 6500 3650
Text GLabel 6400 3650 0    50   Input ~ 0
CLKSEL
Wire Wire Line
	6400 3850 6400 3750
Wire Wire Line
	6400 3750 6500 3750
Text GLabel 6400 3850 3    50   Input ~ 0
~CLK
$Comp
L 74xx:74HC74 U9
U 1 1 5FA3C995
P 6800 3750
F 0 "U9" H 6500 4150 50  0000 C CNN
F 1 "74AC74" H 6500 4050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 6800 3750 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6800 3750 50  0001 C CNN
	1    6800 3750
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 600608DA
P 5150 3650
AR Path="/600608DA" Ref="X?"  Part="1" 
AR Path="/5F8F4E1E/600608DA" Ref="X1"  Part="1" 
F 0 "X1" H 5400 3900 50  0000 L CNN
F 1 "8MHz" H 5400 3800 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 5600 3300 50  0001 C CNN
F 3 "" H 5050 3650 50  0001 C CNN
	1    5150 3650
	1    0    0    -1  
$EndComp
Text GLabel 5150 3250 1    50   Input ~ 0
+5V
Text GLabel 5150 4050 3    50   Input ~ 0
GND
Text GLabel 5550 3650 2    50   Output ~ 0
CLK
Wire Wire Line
	5150 3250 5150 3300
Wire Wire Line
	5150 4050 5150 4000
Wire Wire Line
	5450 3650 5550 3650
$Comp
L Device:C_Small C?
U 1 1 600608E6
P 4850 3650
AR Path="/600608E6" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/600608E6" Ref="C24"  Part="1" 
F 0 "C24" H 4750 3700 50  0000 R CNN
F 1 "0,1uF" H 4750 3600 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4850 3650 50  0001 C CNN
F 3 "~" H 4850 3650 50  0001 C CNN
	1    4850 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3550 4850 3300
Wire Wire Line
	4850 3300 5150 3300
Connection ~ 5150 3300
Wire Wire Line
	5150 3300 5150 3350
Wire Wire Line
	4850 3750 4850 4000
Wire Wire Line
	4850 4000 5150 4000
Connection ~ 5150 4000
Wire Wire Line
	5150 4000 5150 3950
$Comp
L Switch:SW_Push SW?
U 1 1 601309D5
P 5650 5750
AR Path="/601309D5" Ref="SW?"  Part="1" 
AR Path="/5F8F4E1E/601309D5" Ref="SW1"  Part="1" 
F 0 "SW1" V 5604 5898 50  0000 L CNN
F 1 "Reset" V 5695 5898 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 5650 5950 50  0001 C CNN
F 3 "~" H 5650 5950 50  0001 C CNN
	1    5650 5750
	0    1    1    0   
$EndComp
Text GLabel 5150 6100 3    50   Input ~ 0
GND
Wire Wire Line
	5150 6100 5150 6050
Wire Wire Line
	5150 6050 5650 6050
Wire Wire Line
	5650 6050 5650 5950
Connection ~ 5150 6050
Wire Wire Line
	5150 6050 5150 6000
Wire Wire Line
	5650 5550 5650 5450
Wire Wire Line
	5650 5450 5550 5450
Text GLabel 5150 4800 1    50   Input ~ 0
+5V
Wire Wire Line
	5150 4800 5150 4900
Text GLabel 5750 5450 2    50   Output ~ 0
~RES
Wire Wire Line
	5750 5450 5650 5450
Connection ~ 5650 5450
$Comp
L 6502:DS1813 U?
U 1 1 601309E8
P 5150 5450
AR Path="/601309E8" Ref="U?"  Part="1" 
AR Path="/5F8F4E1E/601309E8" Ref="U12"  Part="1" 
F 0 "U12" H 5400 5750 50  0000 L CNN
F 1 "DS1813" H 5400 5650 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 5150 5050 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DS1813.pdf" H 5150 5450 50  0001 C CNN
	1    5150 5450
	1    0    0    -1  
$EndComp
Wire Bus Line
	3200 2200 3200 2900
Wire Bus Line
	3950 1300 3950 3900
$EndSCHEMATC
