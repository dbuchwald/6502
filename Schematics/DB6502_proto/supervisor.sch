EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title "DB6502 Hobby Computer Version 2"
Date "2020-10-13"
Rev "v003"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Open Source Hardware"
Comment4 "Author: Dawid Buchwald"
$EndDescr
$Comp
L Device:Crystal_Small Y?
U 1 1 5F942B8E
P 1300 1500
F 0 "Y?" V 1254 1588 50  0000 L CNN
F 1 "20MHz" V 1345 1588 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 1300 1500 50  0001 C CNN
F 3 "~" H 1300 1500 50  0001 C CNN
	1    1300 1500
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F942B94
P 1050 1400
F 0 "C?" V 1279 1400 50  0000 C CNN
F 1 "22pF" V 1188 1400 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1050 1400 50  0001 C CNN
F 3 "~" H 1050 1400 50  0001 C CNN
	1    1050 1400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F942B9A
P 1050 1600
F 0 "C?" V 900 1600 50  0000 C CNN
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
L Device:C_Small C?
U 1 1 5F942BA9
P 1500 1800
F 0 "C?" V 1350 1800 50  0000 C CNN
F 1 "100nF" V 1250 1800 50  0000 C CNN
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
RxD_DBG
Text GLabel 3000 4000 2    50   Output ~ 0
TxD_DBG
Text GLabel 3000 4100 2    50   Output ~ 0
SR_DAT
Text GLabel 3000 4200 2    50   Output ~ 0
SR_CLK
Text GLabel 3000 4300 2    50   Output ~ 0
SR_OUT
Text GLabel 3000 4400 2    50   Output ~ 0
CLK_DBG
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
L MCU_Microchip_ATmega:ATmega644PA-PU U?
U 1 1 5F942C1A
P 2300 2900
F 0 "U?" H 2300 3000 50  0000 C CNN
F 1 "ATmega644PA-PU" H 2300 2900 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 2300 2900 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8272-8-bit-AVR-microcontroller-ATmega164A_PA-324A_PA-644A_PA-1284_P_datasheet.pdf" H 2300 2900 50  0001 C CNN
	1    2300 2900
	1    0    0    -1  
$EndComp
Text GLabel 4050 3800 2    50   Input ~ 0
a[0..15]
Text GLabel 3300 2900 2    50   Input ~ 0
d[0..7]
Wire Bus Line
	3200 2900 3300 2900
Wire Bus Line
	3950 3800 4050 3800
$Comp
L Connector:AVR-ISP-6 J?
U 1 1 5F9AD1AB
P 10000 1500
AR Path="/6014B4D9/5F9AD1AB" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD1AB" Ref="J?"  Part="1" 
F 0 "J?" H 9671 1596 50  0000 R CNN
F 1 "AVR-ISP-6" H 9671 1505 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 9750 1550 50  0001 C CNN
F 3 " ~" H 8725 950 50  0001 C CNN
	1    10000 1500
	1    0    0    -1  
$EndComp
Text GLabel 9900 2000 3    50   Input ~ 0
GND
Text GLabel 9900 900  1    50   Input ~ 0
+5V
Text GLabel 10500 1600 2    50   Output ~ 0
~RES
Wire Wire Line
	10400 1600 10500 1600
Text Label 10550 1300 2    50   ~ 0
d6
Text Label 10550 1400 2    50   ~ 0
d5
Text Label 10550 1500 2    50   ~ 0
d7
Wire Wire Line
	10400 1500 10550 1500
Wire Wire Line
	10400 1400 10550 1400
Wire Wire Line
	10400 1300 10550 1300
Entry Wire Line
	10550 1400 10650 1300
Entry Wire Line
	10550 1300 10650 1200
Entry Wire Line
	10550 1500 10650 1400
Wire Wire Line
	9900 900  9900 1000
Wire Wire Line
	9900 1900 9900 2000
$Comp
L 6502:USB_B J?
U 1 1 5F9AD1C0
P 8600 2900
AR Path="/6014B4D9/5F9AD1C0" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD1C0" Ref="J?"  Part="1" 
F 0 "J?" H 8657 3367 50  0000 C CNN
F 1 "USB_B" H 8657 3276 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 8750 2850 50  0001 C CNN
F 3 "" H 8750 2850 50  0001 C CNN
	1    8600 2900
	1    0    0    -1  
$EndComp
NoConn ~ 8500 3300
Text GLabel 8600 3500 3    50   Input ~ 0
GND
Wire Wire Line
	8600 3400 8600 3300
$Comp
L Device:Ferrite_Bead_Small FB?
U 1 1 5F9AD1C9
P 9450 2700
AR Path="/6014B4D9/5F9AD1C9" Ref="FB?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD1C9" Ref="FB?"  Part="1" 
F 0 "FB?" V 9213 2700 50  0000 C CNN
F 1 "FB" V 9304 2700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9380 2700 50  0001 C CNN
F 3 "~" H 9450 2700 50  0001 C CNN
	1    9450 2700
	0    1    1    0   
$EndComp
Text GLabel 10400 2700 2    50   Input ~ 0
+5V
Wire Wire Line
	8900 2700 9100 2700
Wire Wire Line
	9550 2700 10150 2700
Wire Wire Line
	8900 3000 9000 3000
$Comp
L 6502:FT230XS U?
U 1 1 5F9AD1D3
P 9500 4550
AR Path="/6014B4D9/5F9AD1D3" Ref="U?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD1D3" Ref="U?"  Part="1" 
F 0 "U?" H 9500 5165 50  0000 C CNN
F 1 "FT230XS" H 9500 5074 50  0000 C CNN
F 2 "Package_SO:SSOP-16_5.3x6.2mm_P0.65mm" H 9500 5050 50  0001 C CNN
F 3 "" H 9500 4550 50  0001 C CNN
	1    9500 4550
	1    0    0    -1  
$EndComp
Text GLabel 8850 4200 0    50   Output ~ 0
RxD_DBG
Text GLabel 8850 4500 0    50   Input ~ 0
TxD_DBG
Wire Wire Line
	8850 4200 8950 4200
Text GLabel 8750 4600 0    50   Input ~ 0
GND
Text GLabel 8850 5000 0    50   BiDi ~ 0
DBG_USBD+
Text GLabel 10150 4900 2    50   BiDi ~ 0
DBG_USBD-
Text GLabel 10150 4500 2    50   Input ~ 0
GND
Wire Wire Line
	10050 4500 10150 4500
Wire Wire Line
	8750 4600 8850 4600
Text GLabel 10150 4600 2    50   Input ~ 0
+5V
Wire Wire Line
	10150 4600 10050 4600
Wire Wire Line
	8950 4700 8850 4700
Wire Wire Line
	8850 4700 8850 4600
Connection ~ 8850 4600
Wire Wire Line
	8850 4600 8950 4600
NoConn ~ 8950 4300
Wire Wire Line
	8850 4500 8950 4500
Wire Wire Line
	8050 4400 8050 5100
Wire Wire Line
	8050 5100 9500 5100
Wire Wire Line
	10900 5100 10900 4800
Wire Wire Line
	10900 4800 10050 4800
Wire Wire Line
	8050 4400 8950 4400
Wire Wire Line
	10050 4900 10150 4900
Wire Wire Line
	10050 4700 10900 4700
Wire Wire Line
	10900 4700 10900 4800
Connection ~ 10900 4800
$Comp
L Device:C C?
U 1 1 5F9AD1F3
P 9500 5350
AR Path="/6014B4D9/5F9AD1F3" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD1F3" Ref="C?"  Part="1" 
F 0 "C?" H 9615 5396 50  0000 L CNN
F 1 "100nF" H 9615 5305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9538 5200 50  0001 C CNN
F 3 "~" H 9500 5350 50  0001 C CNN
	1    9500 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 5100 9500 5200
Connection ~ 9500 5100
Wire Wire Line
	9500 5100 9950 5100
Text GLabel 9500 5600 3    50   Input ~ 0
GND
Wire Wire Line
	9500 5600 9500 5500
Text GLabel 10400 4400 2    50   Output ~ 0
~DBG_RXLED
Text GLabel 8850 4800 0    50   Output ~ 0
~DBG_TXLED
Wire Wire Line
	8850 5000 8900 5000
Wire Wire Line
	8900 5000 8900 4900
Wire Wire Line
	8900 4900 8950 4900
Wire Wire Line
	8850 4800 8950 4800
Wire Wire Line
	10050 4400 10400 4400
NoConn ~ 10050 4300
NoConn ~ 10050 4200
$Comp
L Device:R R?
U 1 1 5F9AD207
P 9950 5350
AR Path="/6014B4D9/5F9AD207" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD207" Ref="R?"  Part="1" 
F 0 "R?" H 10020 5396 50  0000 L CNN
F 1 "220" H 10020 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9880 5350 50  0001 C CNN
F 3 "~" H 9950 5350 50  0001 C CNN
	1    9950 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F9AD20D
P 10250 5350
AR Path="/6014B4D9/5F9AD20D" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD20D" Ref="R?"  Part="1" 
F 0 "R?" H 10320 5396 50  0000 L CNN
F 1 "220" H 10320 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10180 5350 50  0001 C CNN
F 3 "~" H 10250 5350 50  0001 C CNN
	1    10250 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 5100 9950 5200
Connection ~ 9950 5100
Wire Wire Line
	9950 5100 10250 5100
Wire Wire Line
	10250 5100 10250 5200
Connection ~ 10250 5100
Wire Wire Line
	10250 5100 10900 5100
$Comp
L Device:LED D?
U 1 1 5F9AD219
P 9950 5750
AR Path="/6014B4D9/5F9AD219" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD219" Ref="D?"  Part="1" 
F 0 "D?" V 9989 5633 50  0000 R CNN
F 1 "RX" V 9898 5633 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 9950 5750 50  0001 C CNN
F 3 "~" H 9950 5750 50  0001 C CNN
	1    9950 5750
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5F9AD21F
P 10250 5750
AR Path="/6014B4D9/5F9AD21F" Ref="D?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD21F" Ref="D?"  Part="1" 
F 0 "D?" V 10289 5632 50  0000 R CNN
F 1 "TX" V 10198 5632 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 10250 5750 50  0001 C CNN
F 3 "~" H 10250 5750 50  0001 C CNN
	1    10250 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10250 5500 10250 5600
Wire Wire Line
	9950 5500 9950 5600
Text GLabel 9950 6000 3    50   Input ~ 0
~DBG_RXLED
Text GLabel 10250 6000 3    50   Input ~ 0
~DBG_TXLED
Wire Wire Line
	9950 6000 9950 5900
Wire Wire Line
	10250 6000 10250 5900
Text GLabel 10400 3150 2    50   BiDi ~ 0
DBG_USBD-
Text GLabel 10400 2900 2    50   BiDi ~ 0
DBG_USBD+
$Comp
L Device:R R?
U 1 1 5F9AD22D
P 10150 3150
AR Path="/6014B4D9/5F9AD22D" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD22D" Ref="R?"  Part="1" 
F 0 "R?" V 10250 3150 50  0000 C CNN
F 1 "27" V 10150 3150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10080 3150 50  0001 C CNN
F 3 "~" H 10150 3150 50  0001 C CNN
	1    10150 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F9AD233
P 10150 2900
AR Path="/6014B4D9/5F9AD233" Ref="R?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD233" Ref="R?"  Part="1" 
F 0 "R?" V 10250 2900 50  0000 C CNN
F 1 "27" V 10150 2900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10080 2900 50  0001 C CNN
F 3 "~" H 10150 2900 50  0001 C CNN
	1    10150 2900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10300 3150 10400 3150
Wire Wire Line
	10300 2900 10400 2900
Wire Wire Line
	9000 3000 9000 3150
$Comp
L Device:C_Small C?
U 1 1 5F9AD23C
P 9450 3350
AR Path="/6014B4D9/5F9AD23C" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD23C" Ref="C?"  Part="1" 
F 0 "C?" H 9542 3396 50  0000 L CNN
F 1 "47pF" H 9542 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9450 3350 50  0001 C CNN
F 3 "~" H 9450 3350 50  0001 C CNN
	1    9450 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F9AD242
P 9800 3350
AR Path="/6014B4D9/5F9AD242" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD242" Ref="C?"  Part="1" 
F 0 "C?" H 9892 3396 50  0000 L CNN
F 1 "47pF" H 9892 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9800 3350 50  0001 C CNN
F 3 "~" H 9800 3350 50  0001 C CNN
	1    9800 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 2900 9450 2900
Wire Wire Line
	9000 3150 9800 3150
Text GLabel 9450 3550 3    50   Input ~ 0
GND
Text GLabel 9800 3550 3    50   Input ~ 0
GND
Wire Wire Line
	9450 3250 9450 2900
Connection ~ 9450 2900
Wire Wire Line
	9450 2900 10000 2900
Wire Wire Line
	9450 3450 9450 3550
Wire Wire Line
	9800 3550 9800 3450
Wire Wire Line
	9800 3250 9800 3150
Connection ~ 9800 3150
Wire Wire Line
	9800 3150 10000 3150
$Comp
L Device:C_Small C?
U 1 1 5F9AD254
P 9100 3350
AR Path="/6014B4D9/5F9AD254" Ref="C?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD254" Ref="C?"  Part="1" 
F 0 "C?" H 9192 3396 50  0000 L CNN
F 1 "10nF" H 9192 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9100 3350 50  0001 C CNN
F 3 "~" H 9100 3350 50  0001 C CNN
	1    9100 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 3250 9100 2700
Connection ~ 9100 2700
Wire Wire Line
	9100 2700 9350 2700
Text GLabel 9100 3550 3    50   Input ~ 0
GND
Wire Wire Line
	9100 3550 9100 3450
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F9AD25F
P 10150 2700
AR Path="/6014B4D9/5F9AD25F" Ref="#FLG?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD25F" Ref="#FLG?"  Part="1" 
F 0 "#FLG?" H 10150 2775 50  0001 C CNN
F 1 "PWR_FLAG" H 10150 2873 50  0000 C CNN
F 2 "" H 10150 2700 50  0001 C CNN
F 3 "~" H 10150 2700 50  0001 C CNN
	1    10150 2700
	1    0    0    -1  
$EndComp
Connection ~ 10150 2700
Wire Wire Line
	10150 2700 10400 2700
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5F9AD267
P 7100 4750
AR Path="/6014B4D9/5F9AD267" Ref="J?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD267" Ref="J?"  Part="1" 
F 0 "J?" H 7208 5131 50  0000 C CNN
F 1 "Debug UART" H 7208 5040 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 7100 4750 50  0001 C CNN
F 3 "~" H 7100 4750 50  0001 C CNN
	1    7100 4750
	1    0    0    -1  
$EndComp
Text GLabel 7400 4550 2    50   Input ~ 0
GND
Wire Wire Line
	7400 4550 7350 4550
Wire Wire Line
	7300 4650 7350 4650
Wire Wire Line
	7350 4650 7350 4550
Connection ~ 7350 4550
Wire Wire Line
	7350 4550 7300 4550
Text GLabel 7400 4750 2    50   Input ~ 0
+5V
Wire Wire Line
	7400 4750 7300 4750
NoConn ~ 7300 5050
Text GLabel 7400 4850 2    50   Output ~ 0
RxD_DBG
Wire Wire Line
	7400 4850 7300 4850
Text GLabel 7400 4950 2    50   Input ~ 0
TxD_DBG
Wire Wire Line
	7400 4950 7300 4950
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F9AD27A
P 8600 3400
AR Path="/6014B4D9/5F9AD27A" Ref="#FLG?"  Part="1" 
AR Path="/5F8F4E1E/5F9AD27A" Ref="#FLG?"  Part="1" 
F 0 "#FLG?" H 8600 3475 50  0001 C CNN
F 1 "PWR_FLAG" V 8600 3527 50  0000 L CNN
F 2 "" H 8600 3400 50  0001 C CNN
F 3 "~" H 8600 3400 50  0001 C CNN
	1    8600 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8600 3500 8600 3400
Connection ~ 8600 3400
$Comp
L 74xx:74HC595 U?
U 1 1 5F9C2188
P 5850 1600
F 0 "U?" H 5850 1600 50  0000 C CNN
F 1 "74HC595" H 5800 1300 50  0000 C CNN
F 2 "" H 5850 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 5850 1600 50  0001 C CNN
	1    5850 1600
	1    0    0    -1  
$EndComp
Text GLabel 5350 1200 0    50   Input ~ 0
SR_DAT
Wire Wire Line
	5350 1200 5450 1200
Text GLabel 5350 1350 0    50   Input ~ 0
SR_CLK
Wire Wire Line
	5350 1350 5400 1350
Wire Wire Line
	5400 1350 5400 1400
Wire Wire Line
	5400 1400 5450 1400
Text GLabel 5850 2500 3    50   Input ~ 0
GND
Wire Wire Line
	5850 2500 5850 2400
Wire Wire Line
	5850 2400 5350 2400
Wire Wire Line
	5350 2400 5350 1800
Wire Wire Line
	5350 1800 5450 1800
Connection ~ 5850 2400
Wire Wire Line
	5850 2400 5850 2300
Text GLabel 5850 900  1    50   Input ~ 0
+5V
Wire Wire Line
	5850 900  5850 1000
Wire Bus Line
	10650 1200 10650 1400
Wire Bus Line
	3200 2200 3200 2900
Wire Bus Line
	3950 1300 3950 3800
$EndSCHEMATC
