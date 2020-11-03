EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title "DB6502 Hobby Computer Version 2"
Date "2020-10-30"
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
L Device:C_Small C16
U 1 1 5F942B94
P 1050 1400
F 0 "C16" V 1279 1400 50  0000 C CNN
F 1 "22pF" V 1188 1400 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1050 1400 50  0001 C CNN
F 3 "~" H 1050 1400 50  0001 C CNN
	1    1050 1400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C17
U 1 1 5F942B9A
P 1050 1600
F 0 "C17" V 900 1600 50  0000 C CNN
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
L Device:C_Small C19
U 1 1 5F942BA9
P 1500 1800
F 0 "C19" V 1350 1800 50  0000 C CNN
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
L Connector:AVR-ISP-6 J?
U 1 1 5F9AD1AB
P 950 2950
AR Path="/6014B4D9/5F9AD1AB" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD1AB" Ref="J10"  Part="1" 
F 0 "J10" H 850 3050 50  0000 C CNN
F 1 "AVR ISP" H 850 2950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 700 3000 50  0001 C CNN
F 3 " ~" H -325 2400 50  0001 C CNN
	1    950  2950
	1    0    0    -1  
$EndComp
Text GLabel 950  3450 2    50   Input ~ 0
GND
Text GLabel 950  2350 2    50   Input ~ 0
+5V
Text GLabel 1450 3050 2    50   Output ~ 0
~RES
Wire Wire Line
	1350 3050 1450 3050
Text Label 1500 2750 2    50   ~ 0
d6
Text Label 1500 2850 2    50   ~ 0
d5
Text Label 1500 2950 2    50   ~ 0
d7
Wire Wire Line
	1350 2950 1500 2950
Wire Wire Line
	1350 2850 1500 2850
Wire Wire Line
	1350 2750 1500 2750
Entry Wire Line
	1500 2850 1600 2750
Entry Wire Line
	1500 2750 1600 2650
Entry Wire Line
	1500 2950 1600 2850
Wire Wire Line
	850  2350 850  2450
Wire Wire Line
	850  3350 850  3450
$Comp
L 6502:FT230XS U?
U 1 1 5F9AD1D3
P 9450 1350
AR Path="/6014B4D9/5F9AD1D3" Ref="U?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD1D3" Ref="U12"  Part="1" 
F 0 "U12" H 9450 1965 50  0000 C CNN
F 1 "FT230XS" H 9450 1874 50  0000 C CNN
F 2 "Package_SO:SSOP-16_5.3x6.2mm_P0.65mm" H 9450 1850 50  0001 C CNN
F 3 "" H 9450 1350 50  0001 C CNN
	1    9450 1350
	1    0    0    -1  
$EndComp
Text GLabel 8800 1000 0    50   Output ~ 0
DBG_USB_RxD
Text GLabel 8800 1300 0    50   Input ~ 0
DBG_TxD
Wire Wire Line
	8800 1000 8900 1000
Text GLabel 8700 1400 0    50   Input ~ 0
GND
Text GLabel 8800 1800 0    50   BiDi ~ 0
DBG_USBD+
Text GLabel 10100 1700 2    50   BiDi ~ 0
DBG_USBD-
Text GLabel 10300 1100 1    50   Input ~ 0
GND
Wire Wire Line
	8700 1400 8800 1400
Text GLabel 10700 1100 1    50   Input ~ 0
+5V
Wire Wire Line
	8900 1500 8800 1500
Wire Wire Line
	8800 1500 8800 1400
Connection ~ 8800 1400
Wire Wire Line
	8800 1400 8900 1400
NoConn ~ 8900 1100
Wire Wire Line
	8800 1300 8900 1300
Wire Wire Line
	8200 1200 8200 1900
Wire Wire Line
	8200 1900 8450 1900
Wire Wire Line
	10700 1900 10700 1600
Wire Wire Line
	10700 1600 10000 1600
Wire Wire Line
	8200 1200 8900 1200
Wire Wire Line
	10000 1700 10100 1700
Wire Wire Line
	10000 1500 10700 1500
Wire Wire Line
	10700 1500 10700 1600
Connection ~ 10700 1600
$Comp
L Device:C_Small C?
U 1 1 5F9AD1F3
P 8450 2100
AR Path="/6014B4D9/5F9AD1F3" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD1F3" Ref="C24"  Part="1" 
F 0 "C24" H 8565 2146 50  0000 L CNN
F 1 "0,1uF" H 8565 2055 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8488 1950 50  0001 C CNN
F 3 "~" H 8450 2100 50  0001 C CNN
	1    8450 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1900 8450 2000
Connection ~ 8450 1900
Text GLabel 8550 2300 2    50   Input ~ 0
GND
Wire Wire Line
	8450 2300 8450 2200
Text GLabel 10150 1100 1    50   Output ~ 0
~DBG_RXLED
Text GLabel 8800 1600 0    50   Output ~ 0
~DBG_TXLED
Wire Wire Line
	8800 1800 8850 1800
Wire Wire Line
	8850 1800 8850 1700
Wire Wire Line
	8850 1700 8900 1700
Wire Wire Line
	8800 1600 8900 1600
NoConn ~ 10000 1100
NoConn ~ 10000 1000
Text GLabel 9950 2400 2    50   Input ~ 0
~DBG_RXLED
Text GLabel 9950 2100 2    50   Input ~ 0
~DBG_TXLED
$Comp
L 74xx:74HC595 U11
U 1 1 5F9C2188
P 5150 1500
F 0 "U11" H 5150 1500 50  0000 C CNN
F 1 "74HC595" H 5100 1200 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 5150 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 5150 1500 50  0001 C CNN
	1    5150 1500
	1    0    0    -1  
$EndComp
Text GLabel 4650 1100 0    50   Input ~ 0
SR_DAT
Wire Wire Line
	4650 1100 4750 1100
Text GLabel 4650 1300 0    50   Input ~ 0
SR_CLK
Text GLabel 5150 2400 3    50   Input ~ 0
GND
Wire Wire Line
	5150 2400 5150 2300
Wire Wire Line
	5150 2300 4650 2300
Wire Wire Line
	4650 2300 4650 1700
Wire Wire Line
	4650 1700 4750 1700
Connection ~ 5150 2300
Wire Wire Line
	5150 2300 5150 2200
Text GLabel 5150 800  1    50   Input ~ 0
+5V
Wire Wire Line
	5150 800  5150 850 
Text GLabel 5650 1000 1    50   Output ~ 0
CLKSEL
Text GLabel 5800 1000 1    50   Output ~ 0
~DBG_BE
Text GLabel 5950 1000 1    50   Output ~ 0
~DBG_RDY
Text GLabel 5650 1800 2    50   Output ~ 0
DBG_RES
Wire Wire Line
	5550 1800 5650 1800
Wire Wire Line
	4650 1300 4750 1300
Text GLabel 4650 1600 0    50   Input ~ 0
SR_LATCH
Wire Wire Line
	4650 1600 4750 1600
NoConn ~ 5550 2000
$Comp
L 74xx:74LS04 U8
U 1 1 5F92D3FA
P 7100 950
F 0 "U8" H 7100 1267 50  0000 C CNN
F 1 "74AC04" H 7100 1176 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7100 950 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 7100 950 50  0001 C CNN
	1    7100 950 
	1    0    0    -1  
$EndComp
Text GLabel 6700 950  0    50   Input ~ 0
~DBG_BE
Wire Wire Line
	6700 950  6800 950 
Text GLabel 7500 950  2    50   Output ~ 0
BE
Wire Wire Line
	7400 950  7500 950 
$Comp
L 74xx:74LS04 U8
U 2 1 5F93AD6D
P 7100 1500
F 0 "U8" H 7100 1817 50  0000 C CNN
F 1 "74AC04" H 7100 1726 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7100 1500 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 7100 1500 50  0001 C CNN
	2    7100 1500
	1    0    0    -1  
$EndComp
Text GLabel 6700 1500 0    50   Input ~ 0
~DBG_RDY
Wire Wire Line
	6700 1500 6800 1500
Text GLabel 7500 1500 2    50   Output ~ 0
DBG_RDY
Wire Wire Line
	7400 1500 7500 1500
$Comp
L 74xx:74LS04 U8
U 7 1 5F946300
P 850 6800
F 0 "U8" H 850 6850 50  0000 C CNN
F 1 "74AC04" H 850 6750 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 850 6800 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 850 6800 50  0001 C CNN
	7    850  6800
	1    0    0    -1  
$EndComp
Text GLabel 850  7400 3    50   Input ~ 0
GND
Wire Wire Line
	850  7400 850  7350
Text GLabel 850  6200 1    50   Input ~ 0
+5V
Wire Wire Line
	850  6200 850  6250
$Comp
L 74xx:74LS04 U8
U 3 1 5F95A89B
P 7100 2050
F 0 "U8" H 7100 2367 50  0000 C CNN
F 1 "74AC04" H 7100 2276 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7100 2050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 7100 2050 50  0001 C CNN
	3    7100 2050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U8
U 4 1 5F95B175
P 7100 2600
F 0 "U8" H 7100 2917 50  0000 C CNN
F 1 "74AC04" H 7100 2826 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7100 2600 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 7100 2600 50  0001 C CNN
	4    7100 2600
	1    0    0    -1  
$EndComp
Text GLabel 6700 2050 0    50   Input ~ 0
DBG_RES
Wire Wire Line
	6700 2050 6800 2050
Wire Wire Line
	6700 2600 6800 2600
Text GLabel 7500 2050 2    50   Output ~ 0
~DBG_RES
Wire Wire Line
	7400 2050 7500 2050
$Comp
L 74xx:74LS08 U6
U 1 1 5F991189
P 5150 3900
F 0 "U6" H 5150 4225 50  0000 C CNN
F 1 "74AC08" H 5150 4134 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5150 3900 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 5150 3900 50  0001 C CNN
	1    5150 3900
	1    0    0    -1  
$EndComp
Text GLabel 4750 4000 0    50   Input ~ 0
~DBG_RES
Text GLabel 4750 3800 0    50   Input ~ 0
~RES
Wire Wire Line
	4750 3800 4850 3800
Wire Wire Line
	4750 4000 4850 4000
Text GLabel 5550 3900 2    50   Output ~ 0
~6502_RES
Wire Wire Line
	5550 3900 5450 3900
$Comp
L 74xx:74LS157 U13
U 1 1 5F9A90DC
P 10300 5050
F 0 "U13" H 10300 5050 50  0000 C CNN
F 1 "74HC157" H 10300 4850 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 10300 5050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc157.pdf" H 10300 5050 50  0001 C CNN
	1    10300 5050
	1    0    0    -1  
$EndComp
Text GLabel 10300 4050 1    50   Input ~ 0
+5V
Text GLabel 10300 6150 3    50   Input ~ 0
GND
Text GLabel 9700 4550 0    50   Input ~ 0
DBG_CLK
Wire Wire Line
	9700 4450 9800 4450
Wire Wire Line
	9700 4550 9800 4550
Text GLabel 9700 4450 0    50   Input ~ 0
CLK
Text GLabel 10900 4350 1    50   Output ~ 0
6502_CLK
Wire Wire Line
	10800 4450 10900 4450
Wire Wire Line
	10300 4050 10300 4100
Wire Wire Line
	10300 6150 10300 6100
Wire Wire Line
	9800 5750 9700 5750
Wire Wire Line
	9700 5750 9700 6100
Wire Wire Line
	9700 6100 10300 6100
Connection ~ 10300 6100
Wire Wire Line
	10300 6100 10300 6050
Text GLabel 6700 2600 0    50   Input ~ 0
CLK
Text GLabel 7500 2600 2    50   Output ~ 0
~CLK
Wire Wire Line
	7400 2600 7500 2600
$Comp
L 74xx:74HC74 U9
U 3 1 5FA1E8BB
P 1800 6800
F 0 "U9" H 1800 6850 50  0000 C CNN
F 1 "74AC74" H 1800 6750 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 1800 6800 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1800 6800 50  0001 C CNN
	3    1800 6800
	1    0    0    -1  
$EndComp
Text GLabel 1800 7300 3    50   Input ~ 0
GND
Wire Wire Line
	1800 7300 1800 7250
Text GLabel 1800 6300 1    50   Input ~ 0
+5V
Wire Wire Line
	1800 6300 1800 6350
$Comp
L 74xx:74HC74 U9
U 1 1 5FA3C995
P 7000 5500
F 0 "U9" H 6700 5900 50  0000 C CNN
F 1 "74AC74" H 6700 5800 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7000 5500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7000 5500 50  0001 C CNN
	1    7000 5500
	1    0    0    -1  
$EndComp
Text GLabel 6600 5600 3    50   Input ~ 0
~CLK
Wire Wire Line
	6600 5500 6700 5500
Wire Wire Line
	6600 5600 6600 5500
Text GLabel 6600 5400 0    50   Input ~ 0
CLKSEL
Wire Wire Line
	6600 5400 6700 5400
NoConn ~ 7300 5600
Text GLabel 7100 5100 2    50   Input ~ 0
+5V
Text GLabel 6900 5900 0    50   Input ~ 0
+5V
Wire Wire Line
	7000 5900 7000 5800
Wire Wire Line
	7000 5100 7000 5200
Text GLabel 8500 5400 2    50   Output ~ 0
CLK_TOGGLE
Wire Wire Line
	7800 5400 7300 5400
Text GLabel 9700 5650 0    50   Input ~ 0
CLK_TOGGLE
Wire Wire Line
	9700 5650 9800 5650
$Comp
L Device:C_Small C18
U 1 1 5FAB56CF
P 1200 6800
F 0 "C18" H 1292 6846 50  0000 L CNN
F 1 "0,1uF" H 1292 6755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1200 6800 50  0001 C CNN
F 3 "~" H 1200 6800 50  0001 C CNN
	1    1200 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C21
U 1 1 5FAB6000
P 2150 6800
F 0 "C21" H 2242 6846 50  0000 L CNN
F 1 "0,1uF" H 2242 6755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2150 6800 50  0001 C CNN
F 3 "~" H 2150 6800 50  0001 C CNN
	1    2150 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 6700 1200 6250
Wire Wire Line
	1200 6250 850  6250
Connection ~ 850  6250
Wire Wire Line
	850  6250 850  6300
Wire Wire Line
	1200 6900 1200 7350
Wire Wire Line
	1200 7350 850  7350
Connection ~ 850  7350
Wire Wire Line
	850  7350 850  7300
Wire Wire Line
	1800 7250 2150 7250
Wire Wire Line
	2150 7250 2150 6900
Connection ~ 1800 7250
Wire Wire Line
	1800 7250 1800 7200
Wire Wire Line
	2150 6700 2150 6350
Wire Wire Line
	2150 6350 1800 6350
Connection ~ 1800 6350
Wire Wire Line
	1800 6350 1800 6400
$Comp
L Device:C_Small C26
U 1 1 5FAF8D14
P 10100 4100
F 0 "C26" V 9871 4100 50  0000 C CNN
F 1 "0,1uF" V 9962 4100 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 10100 4100 50  0001 C CNN
F 3 "~" H 10100 4100 50  0001 C CNN
	1    10100 4100
	0    1    1    0   
$EndComp
Text GLabel 9900 4100 0    50   Input ~ 0
GND
Wire Wire Line
	9900 4100 10000 4100
Wire Wire Line
	10200 4100 10300 4100
Connection ~ 10300 4100
Wire Wire Line
	10300 4100 10300 4150
$Comp
L 74xx:74LS08 U6
U 5 1 5FB0D0DC
P 2750 6800
F 0 "U6" H 2750 6850 50  0000 C CNN
F 1 "74AC08" H 2750 6750 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2750 6800 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 2750 6800 50  0001 C CNN
	5    2750 6800
	1    0    0    -1  
$EndComp
Text GLabel 2750 6200 1    50   Input ~ 0
+5V
Text GLabel 2750 7400 3    50   Input ~ 0
GND
$Comp
L Device:C_Small C22
U 1 1 5FB0F869
P 3100 6800
F 0 "C22" H 3192 6846 50  0000 L CNN
F 1 "0,1uF" H 3192 6755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3100 6800 50  0001 C CNN
F 3 "~" H 3100 6800 50  0001 C CNN
	1    3100 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 6300 2750 6250
Wire Wire Line
	2750 7300 2750 7350
Wire Wire Line
	3100 6700 3100 6250
Wire Wire Line
	3100 6250 2750 6250
Connection ~ 2750 6250
Wire Wire Line
	2750 6250 2750 6200
Wire Wire Line
	3100 6900 3100 7350
Wire Wire Line
	3100 7350 2750 7350
Connection ~ 2750 7350
Wire Wire Line
	2750 7350 2750 7400
$Comp
L Device:C_Small C20
U 1 1 5FB3967F
P 2100 800
F 0 "C20" V 1871 800 50  0000 C CNN
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
L Device:C_Small C23
U 1 1 5FB5019A
P 4950 850
F 0 "C23" V 4721 850 50  0000 C CNN
F 1 "0,1uF" V 4812 850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4950 850 50  0001 C CNN
F 3 "~" H 4950 850 50  0001 C CNN
	1    4950 850 
	0    1    1    0   
$EndComp
Text GLabel 4750 850  0    50   Input ~ 0
GND
Wire Wire Line
	4750 850  4850 850 
Wire Wire Line
	5050 850  5150 850 
Connection ~ 5150 850 
Wire Wire Line
	5150 850  5150 900 
$Comp
L Device:C_Small C27
U 1 1 5FC939BD
P 10500 1300
F 0 "C27" H 10408 1254 50  0000 R CNN
F 1 "0,1uF" H 10408 1345 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 10500 1300 50  0001 C CNN
F 3 "~" H 10500 1300 50  0001 C CNN
	1    10500 1300
	0    1    1    0   
$EndComp
NoConn ~ 10800 4750
NoConn ~ 10800 5050
NoConn ~ 10800 5350
Text GLabel 9700 4750 0    50   Input ~ 0
GND
Text GLabel 9700 4850 0    50   Input ~ 0
GND
Text GLabel 9700 5050 0    50   Input ~ 0
GND
Text GLabel 9700 5150 0    50   Input ~ 0
GND
Text GLabel 9700 5350 0    50   Input ~ 0
GND
Text GLabel 9700 5450 0    50   Input ~ 0
GND
Wire Wire Line
	9700 5450 9800 5450
Wire Wire Line
	9700 5350 9800 5350
Wire Wire Line
	9700 5150 9800 5150
Wire Wire Line
	9700 5050 9800 5050
Wire Wire Line
	9700 4850 9800 4850
Wire Wire Line
	9700 4750 9800 4750
NoConn ~ 5550 1400
NoConn ~ 5550 1500
NoConn ~ 5550 1600
NoConn ~ 5550 1700
Wire Wire Line
	5650 1100 5650 1000
Wire Wire Line
	5550 1100 5650 1100
Wire Wire Line
	5550 1200 5800 1200
Wire Wire Line
	5800 1200 5800 1000
Wire Wire Line
	5550 1300 5950 1300
Wire Wire Line
	5950 1300 5950 1000
Text GLabel 4650 1450 0    50   Input ~ 0
~RES
Wire Wire Line
	4650 1450 4700 1450
Wire Wire Line
	4700 1450 4700 1400
Wire Wire Line
	4700 1400 4750 1400
$Comp
L 74xx:74HC74 U9
U 2 1 6000C6AE
P 8100 5500
F 0 "U9" H 7800 5900 50  0000 C CNN
F 1 "74AC74" H 7800 5800 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8100 5500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 8100 5500 50  0001 C CNN
	2    8100 5500
	1    0    0    -1  
$EndComp
Text GLabel 7700 5600 3    50   Input ~ 0
~CLK
Wire Wire Line
	7700 5600 7700 5500
Wire Wire Line
	7700 5500 7800 5500
Wire Wire Line
	6900 5900 7000 5900
Wire Wire Line
	7000 5100 7100 5100
Text GLabel 8000 5900 0    50   Input ~ 0
+5V
Wire Wire Line
	8000 5900 8100 5900
Wire Wire Line
	8100 5900 8100 5800
Text GLabel 8200 5100 2    50   Input ~ 0
+5V
Wire Wire Line
	8200 5100 8100 5100
Wire Wire Line
	8100 5100 8100 5200
Wire Wire Line
	8400 5400 8500 5400
NoConn ~ 8400 5600
Text Label 7350 5400 0    50   ~ 0
meta_sync
Wire Wire Line
	10900 4450 10900 4350
$Comp
L 74xx:74LS08 U6
U 4 1 5FBB5F74
P 5150 4500
F 0 "U6" H 5150 4825 50  0000 C CNN
F 1 "74AC08" H 5150 4734 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5150 4500 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 5150 4500 50  0001 C CNN
	4    5150 4500
	1    0    0    -1  
$EndComp
Text GLabel 4750 4600 0    50   Input ~ 0
GND
Text GLabel 4750 4400 0    50   Input ~ 0
GND
Wire Wire Line
	4750 4600 4850 4600
Wire Wire Line
	4750 4400 4850 4400
NoConn ~ 5450 4500
Wire Wire Line
	4650 3200 4750 3200
Wire Wire Line
	4750 3400 4850 3400
$Comp
L 74xx:74LS08 U6
U 3 1 5FBB3E3E
P 5150 3300
F 0 "U6" H 5150 3625 50  0000 C CNN
F 1 "74AC08" H 5150 3534 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5150 3300 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac08.pdf" H 5150 3300 50  0001 C CNN
	3    5150 3300
	1    0    0    -1  
$EndComp
Text GLabel 4750 3400 0    50   Input ~ 0
~RES
Text GLabel 4650 3200 0    50   Input ~ 0
SR_OUT
Text GLabel 5550 3300 2    50   Output ~ 0
SR_LATCH
Wire Wire Line
	5450 3300 5550 3300
$Comp
L Device:R R?
U 1 1 5FCB90E3
P 4750 2950
AR Path="/5FCB90E3" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5FCB90E3" Ref="R17"  Part="1" 
F 0 "R17" V 4650 2950 50  0000 C CNN
F 1 "4K7" V 4750 2950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4680 2950 50  0001 C CNN
F 3 "~" H 4750 2950 50  0001 C CNN
	1    4750 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3100 4750 3200
Connection ~ 4750 3200
Wire Wire Line
	4750 3200 4850 3200
Text GLabel 4650 2700 0    50   Input ~ 0
+5V
Wire Wire Line
	4650 2700 4750 2700
Wire Wire Line
	4750 2700 4750 2800
$Comp
L Switch:SW_Push SW?
U 1 1 5FF5F7EF
P 1350 4600
AR Path="/5FF5F7EF" Ref="SW?"  Part="1" 
AR Path="/5F8F4E1E/5FF5F7EF" Ref="SW1"  Part="1" 
F 0 "SW1" V 1304 4748 50  0000 L CNN
F 1 "Reset" V 1395 4748 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 1350 4800 50  0001 C CNN
F 3 "~" H 1350 4800 50  0001 C CNN
	1    1350 4600
	0    1    1    0   
$EndComp
Text GLabel 750  4900 0    50   Input ~ 0
GND
Wire Wire Line
	850  4900 1350 4900
Wire Wire Line
	1350 4900 1350 4800
Connection ~ 850  4900
Wire Wire Line
	850  4900 850  4850
Wire Wire Line
	1350 4400 1350 4300
Wire Wire Line
	1350 4300 1250 4300
Text GLabel 950  3650 2    50   Input ~ 0
+5V
Wire Wire Line
	850  3650 850  3750
Text GLabel 1450 4300 2    50   Output ~ 0
~RES
Wire Wire Line
	1450 4300 1350 4300
Connection ~ 1350 4300
$Comp
L 6502:DS1813 U?
U 1 1 5FF5F802
P 850 4300
AR Path="/5FF5F802" Ref="U?"  Part="1" 
AR Path="/5F8F4E1E/5FF5F802" Ref="U7"  Part="1" 
F 0 "U7" H 1100 4600 50  0000 L CNN
F 1 "DS1813" H 1100 4500 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 850 3900 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DS1813.pdf" H 850 4300 50  0001 C CNN
	1    850  4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  3450 850  3450
Wire Wire Line
	850  2350 950  2350
Wire Wire Line
	850  3650 950  3650
Wire Wire Line
	750  4900 850  4900
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 60028A30
P 8950 3450
AR Path="/60028A30" Ref="X?"  Part="1" 
AR Path="/5F8F4E1E/60028A30" Ref="X1"  Part="1" 
F 0 "X1" H 9300 3700 50  0000 R CNN
F 1 "14MHz" H 9450 3600 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 9400 3100 50  0001 C CNN
F 3 "" H 8850 3450 50  0001 C CNN
	1    8950 3450
	1    0    0    -1  
$EndComp
Text GLabel 8950 3050 1    50   Input ~ 0
+5V
Text GLabel 8950 3850 3    50   Input ~ 0
GND
Text GLabel 9350 3450 2    50   Output ~ 0
CLK
Wire Wire Line
	8950 3050 8950 3100
Wire Wire Line
	8950 3850 8950 3800
Wire Wire Line
	9250 3450 9350 3450
$Comp
L Device:C_Small C?
U 1 1 60028A3C
P 8650 3450
AR Path="/60028A3C" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/60028A3C" Ref="C25"  Part="1" 
F 0 "C25" H 8550 3500 50  0000 R CNN
F 1 "0,1uF" H 8550 3400 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8650 3450 50  0001 C CNN
F 3 "~" H 8650 3450 50  0001 C CNN
	1    8650 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3350 8650 3100
Wire Wire Line
	8650 3100 8950 3100
Connection ~ 8950 3100
Wire Wire Line
	8950 3100 8950 3150
Wire Wire Line
	8650 3550 8650 3800
Wire Wire Line
	8650 3800 8950 3800
Connection ~ 8950 3800
Wire Wire Line
	8950 3800 8950 3750
$Comp
L 74xx:74LS04 U8
U 5 1 60229A50
P 5150 5050
AR Path="/5F8F4E1E/60229A50" Ref="U8"  Part="5" 
AR Path="/60229A50" Ref="U?"  Part="5" 
F 0 "U8" H 5150 5367 50  0000 C CNN
F 1 "74AC04" H 5150 5276 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5150 5050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ac04.pdf" H 5150 5050 50  0001 C CNN
	5    5150 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5050 4850 5050
Wire Wire Line
	10000 1200 10150 1200
Wire Wire Line
	10150 1200 10150 1100
Wire Wire Line
	10700 1400 10700 1300
Wire Wire Line
	10000 1400 10700 1400
Wire Wire Line
	10300 1300 10300 1100
Wire Wire Line
	10000 1300 10300 1300
Wire Wire Line
	10300 1300 10400 1300
Connection ~ 10300 1300
Wire Wire Line
	10600 1300 10700 1300
Connection ~ 10700 1300
Wire Wire Line
	10700 1300 10700 1100
$Comp
L Device:R R?
U 1 1 603826AE
P 9300 2100
AR Path="/6014B4D9/603826AE" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/603826AE" Ref="R18"  Part="1" 
AR Path="/5F910E81/603826AE" Ref="R?"  Part="1" 
F 0 "R18" V 9400 2100 50  0000 C CNN
F 1 "220" V 9300 2100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9230 2100 50  0001 C CNN
F 3 "~" H 9300 2100 50  0001 C CNN
	1    9300 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 603826B4
P 9700 2400
AR Path="/6014B4D9/603826B4" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/603826B4" Ref="D3"  Part="1" 
AR Path="/5F910E81/603826B4" Ref="D?"  Part="1" 
F 0 "D3" H 9700 2300 50  0000 C CNN
F 1 "D_RX" H 9700 2500 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9700 2400 50  0001 C CNN
F 3 "~" H 9700 2400 50  0001 C CNN
	1    9700 2400
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 603826BA
P 9700 2100
AR Path="/6014B4D9/603826BA" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/603826BA" Ref="D2"  Part="1" 
AR Path="/5F910E81/603826BA" Ref="D?"  Part="1" 
F 0 "D2" H 9700 2000 50  0000 C CNN
F 1 "D_TX" H 9700 2200 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9700 2100 50  0001 C CNN
F 3 "~" H 9700 2100 50  0001 C CNN
	1    9700 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	9950 2400 9850 2400
Wire Wire Line
	9950 2100 9850 2100
$Comp
L Device:R R?
U 1 1 603826C4
P 9300 2400
AR Path="/6014B4D9/603826C4" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/603826C4" Ref="R19"  Part="1" 
AR Path="/5F910E81/603826C4" Ref="R?"  Part="1" 
F 0 "R19" V 9400 2400 50  0000 C CNN
F 1 "220" V 9300 2400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9230 2400 50  0001 C CNN
F 3 "~" H 9300 2400 50  0001 C CNN
	1    9300 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9450 2100 9550 2100
Wire Wire Line
	9450 2400 9550 2400
Wire Wire Line
	9050 2100 9150 2100
Wire Wire Line
	9050 1900 9050 2100
Wire Wire Line
	8950 2400 9150 2400
Wire Wire Line
	8950 1900 8950 2400
Wire Wire Line
	8550 2300 8450 2300
Wire Wire Line
	8450 1900 8950 1900
Connection ~ 8950 1900
Wire Wire Line
	8950 1900 9050 1900
Connection ~ 9050 1900
Wire Wire Line
	9050 1900 10700 1900
Text GLabel 4750 5050 0    50   Input ~ 0
GND
NoConn ~ 5450 5050
Wire Bus Line
	1600 2650 1600 2850
Wire Bus Line
	3200 2200 3200 2900
Wire Bus Line
	3950 1300 3950 3900
$EndSCHEMATC
