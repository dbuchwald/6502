# 6502
65C02 based computer

# Printed Circuit Boards

[First revision of PCBs](https://github.com/dbuchwald/6502/releases/tag/pcb-v001) have been released (one for modified clock module and one for the computer itself). PCBs can be ordered here:

[PCBWay Shared Projects - 65C02 Hobby Computer](https://www.pcbway.com/project/shareproject/65C02_Hobby_Computer.html)

[PCBWay Shared Projects - Clock Module](https://www.pcbway.com/project/shareproject/Modified_version_of_Clock_Module_by_Ben_Eater_s.html)

## 65C02 Computer Bill Of Materials

The following components are required for building 65C02 Computer

|Reference|Type|Value|Description|
|---|---|---|---|
|C1|Unpolarized Capacitor|100 nF|Disk, 2.5mm raster|
|C2|Unpolarized Capacitor|100 nF|Disk, 2.5mm raster|
|C3|Unpolarized Capacitor|100 nF|Disk, 2.5mm raster|
|C4|Unpolarized Capacitor|100 nF|Disk, 2.5mm raster|
|C5|Unpolarized Capacitor|100 nF|Disk, 2.5mm raster|
|C6|Polarized Capacitor|10 uF|Tube, 2.5mm raster, 5mm diameter|
|C7|Unpolarized Capacitor|100 nF|Disk, 2.5mm raster|
|C8|Unpolarized Capacitor|10 nF|Disk, 2.5mm raster|
|C9|Unpolarized Capacitor|47 pF|Disk, 2.5mm raster|
|C10|Unpolarized Capacitor|47 pF|Disk, 2.5mm raster|
|C11|Polarized Capacitor|1000 uF|Tube, 5mm raster, 10mm diameter|
|C12|Unpolarized Capacitor|100 nF|Disk, 2.5mm raster|
|C13|Unpolarized Capacitor|100 nF|Disk, 2.5mm raster|
|C14|Unpolarized Capacitor|100 nF|Disk, 2.5mm raster|
|C15|Unpolarized Capacitor|100 nF|Disk, 2.5mm raster|
|C16|Unpolarized Capacitor|100 nF|Disk, 2.5mm raster|
|C17|Unpolarized Capacitor|100 nF|Disk, 2.5mm raster|
|D1|LED|Green|5mm diameter (PWR)|
|D2|LED|Red|5mm diameter (TX)|
|D3|LED|Green|5mm diameter (RX)|
|D4|LED|Red|5mm diameter (BLINK)|
|FB1|Ferrite bead small|||
|J1|Pin header 3x1||2.54mm raster|
|J2|Female pin header 6x1||2.54mm raster|
|J3|USB B Micro||Molex 105017-0001|
|J4|USB B||Standard THT horizontal USB B port|
|J5|Barrel Jack||Standard power input 2.1/5.5|
|J6|Mini-Din-6||Standard THT PS/2 Keyboard port|
|J7|Female pin header 16x2||2.54mm raster|
|J8|Pin header 3x2||AVR ISP 2.54mm raster|
|J9|Pin header 12x1||2.54mm raster|
|J10|Pin header 12x1||2.54mm raster|
|J11|Female pin header 16x1||2.54mm raster|
|R1|Resistor|1M||
|R2|Resistor|47K||
|R3|Resistor|10K||
|R4|Resistor|27||
|R5|Resistor|27||
|R6|Resistor|4K7||
|R7|Resistor|4K7||
|R8|Resistor|4K7||
|R9|Resistor|220||
|R10|Resistor|220||
|R11|Resistor|220||
|R12|Resistor|220||
|R13|Resistor|4K7||
|RV1|Potentiometer|10K|Piher PT10-LV10-103|
|SW1|Pushbutton||Standard 6mm THT pushbutton|
|U1|IC|74HC21|Add socket|
|U2|IC|74HC00|Add socket|
|U3|IC|74HC02|Add socket|
|U4|IC|NE555|Add socket|
|U5|IC|6551|Add socket; ACIA chip, see notes below|
|U6|IC|FT230XS||
|U7|IC|65C02S|Add socket|
|U8|IC|28C256|Add socket|
|U9|IC|62256|Add socket|
|U10|IC|ATtiny4313-PU|Add socket|
|U11|IC|65C22S|Add socket|
|U12|IC|65C22S|Add socket|
|X1|Crystal Oscillator|1MHz||
|X2|Crystal Oscillator|1.8432MHz||

*Important note about the ACIA chip*: There are basically two types of chips that can be used. Modern, rated to higher frequencies WDC65C51 and older, Rockwell 6551P chips, rated only for 1MHz. The problem with former is that there is a bug with interrupt handling on transmit operation - both IRQ and status flag polling fail, you have to implement dead loop to wait long enough for the byte to be transmitted. Latter chip is probably no longer manufactured, but can be purchased online from Chinese sellers - these are cheap, but not all of them work correctly, so get more than one to be safe. For me the second chip worked correctly and both polling and IRQ-based transmit work as expected.

## Clock Module Bill Of Materials

The following components are required for building Clock Module

|Reference|Type|Value|Description|
|---|---|---|---|
|C1|Polarized capacitor|1 uF|2.5mm raster, 5mm diameter|
|C2|Polarized capacitor|1 uF|2.5mm raster, 5mm diameter|
|C3|Unpolarized capacitor|10 nF|2.5mm raster|
|C4|Unpolarized capacitor|100 nF|2.5mm raster|
|C5|Unpolarized capacitor|100 nF|2.5mm raster|
|C6|Unpolarized capacitor|100 nF|2.5mm raster|
|C7|Unpolarized capacitor|100 nF|2.5mm raster|
|C8|Unpolarized capacitor|100 nF|2.5mm raster|
|C9|Polarized capacitor|1 uF|2.5mm raster, 5mm diameter|
|D1|LED|Yellow|5mm diameter (Automatic tick)|
|D2|LED|Red|5mm diameter (Manual mode)|
|D3|LED|Green|5mm diameter (Automatic mode)|
|D4|LED|Yellow|5mm diameter (Manual tick)|
|D5|LED|Blue|5mm diameter (Output tick)|
|J1|Female pin header 6x1||2.54mm raster|
|J2|Barrel Jack||Standard power input 2.1/5.5|
|R1|Resistor|1K||
|R2|Resistor|1K||
|R3|Resistor|1K||
|R4|Resistor|100K||
|R5|Resistor|10K||
|R6|Resistor|1K||
|R7|Resistor|10K||
|R8|Resistor|1K||
|R9|Resistor|1M||
|R10|Resistor|220||
|R11|Resistor|220||
|R12|Resistor|220||
|R13|Resistor|220||
|R14|Resistor|220||
|R15|Resistor|1K||
|RV1|Potentiometer|10K|Piher PT10-LV10-105|
|SW1|Pushbutton||Standard 6mm THT pushbutton|
|SW2|Pushbutton||Standard 6mm THT pushbutton|
|U1|IC|NE555|Add socket|
|U2|IC|NE555|Add socket|
|U3|IC|NE555|Add socket|
|U4|IC|74LS04|Add socket|
|U5|IC|74LS32|Add socket|
|U6|IC|74LS08|Add socket|
