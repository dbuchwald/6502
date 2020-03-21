# What is this?

This repository contains all the work in progress during my build of Ben Eater's inspired 6502 8-bit computer similar to typical machines of the early 1980s. If you haven't seen Ben's videos, I would strongly suggest you start there:

[Ben Eater's 6502 project](https://eater.net/6502)

As stated above, this build is not 100% compatible with what Ben had done - and for a reason, described in next section.

If I had to explain shortly "what it is", the answer would be: simple, yet easy to expand, 8-bit CPU based computer designed and built with one goal only: to use it as a learning and tinkering platform to understand how computers really work. You can use it for simple things like understanding buses, clock cycles, instruction execution, but it also demonstrates more complex concepts like interrupts, interfaces to external components and device handling. More on that below. Everything, hopefully, is simple enough to wrap your head around by one person in couple of weeks.

## Why build something different?

[Ben's videos](https://www.youtube.com/playlist?list=PLowKtXNTBypFbtuVMUVXNR0z1mu7dp7eH) on 6502 computer are absolutely awesome - it's one of the best sources in the whole Internet explaining how any computer works. The build he introduced is probably sufficient for most of the things you might ever want to build, and yet I decided to deviate from his design.

The rationale behind this project is pretty simple - the best way to test your understanding of certain subject is to try to expand on what you have learned. You never know if you understood something until you test it by introducing changes to original design - and I used this approach in this project to learn a lot. It was my first proper electronics project, so I would like to apologize for any mistakes. If you think something is off or could have been done differently - please go ahead and raise issue for the repo! All improvements are welcome!

## What is different then?

Compared to Ben's 6502 build I introduced the following changes:

1. Added [automatic power-up reset circuitry](#automatic-power-on-reset),
2. Changed [address decoder logic](#address-decoder-change) (**very important from compatibility perspective**),
3. Changed [LCD interface](#lcd-interface-change) from 8-bit to 4-bit (**very important from compatibility perspective**),
4. Added [additional VIA chip](#extra-via-chip) to provide easy expansion of the system,
5. Added [ACIA chip for serial communication](#extra-acia-chip-for-serial-communication),
6. Added (**optional - more on that later**) [USB-UART interface](#extra-usb-uart-interface-chip) for easy connectivity with PC,
7. Added [PS/2 keyboard port and ATtiny4313-based keyboard controller](#ps2-keyboard-interface-and-attiny4313-based-controller) to provide proper replacement for five pushbuttons in Ben's design,
8. Added [expansion port](#expansion-port) (not really deviation from Ben's build, save for one detail - unlike Ben's build, my version can support various interrupt sources, including the expansion port),
9. Modified [clock module](#modified-clock-module) (external),
10. Changed [compilator from VASM to CC65](#migration-from-vasm-to-cc65),
11. Added [simple way to choose clock source](#clock-input).

You might be wondering if this means that you can't run Ben's programs on this build - and the answer is **YES YOU CAN**. Indeed, some changes to the code are necessary, but thanks to the additional VIA chip and with some changes to the addressing mode you can run any program from Ben's videos. If you want to use LCD in 8-bit mode, you can also use the additional VIA for it, ignoring the built-in LCD connector.

By the way, the opposite is also true - **you can compile and run my programs on Ben's computer**. There are special compilation flags that enable usage of Ben's address decoder. I will describe this in more detail in software section.

Detailed description and rationale for each change is discussed in next sections.

### Automatic power-on reset

More of a cosmetic thing, but I liked the idea of computer running automatic reset on power-up. The added appeal was that the circuitry is actually copied from the original C64, which makes it instantly 1000x cooler :) You can read more on that here:
[Dirk Grappendorf's 6502 project - RESET](https://www.grappendorf.net/projects/6502-home-computer/reset-circuit.html)

As a side note - I would strongly recommend anybody interested to read about Dirk's project, he has plenty of great insight there!

### Address decoder change

This one was my first _real_ change as in it was _mine_. As Ben explained in his video, there are many ways to handle address decoding logic and he opted for model with 16K RAM, 16K I/O shadow and 32K ROM. He does note that it's a bit of a waste, but given the simplicity of the project it should not be a problem - and he is absolutely right.

That being said, I wanted more for my build. I knew I wanted to be able to load programs into my computer and I wanted to ensure that I provide user with as much RAM as possible. At the same time, I wanted to save some space on more optimized I/O shadow segment. And, most importantly, I wanted to test my understanding of how address decoding works. As stated above, the best way to learn is to change and test your hypothesis. If you want to learn more, I posted thread on [Reddit](https://www.reddit.com/r/beneater/comments/ej3lqi/65c02_address_decoder_for_32k_ram_24k_rom_and_2/) explaining what I did, how I did that and why I know it works. My build provides 32K RAM, 8K I/O shadow (for up to 11 devices), 24K ROM.

The key takeway here is that when porting Ben's programs you have to use this "mapping table":
|Segment|Ben's build|My build|Comment|
|---|---|---|---|
|RAM|0x0000-0x3fff|0x0000-0x7fff||
|VIA1|N/A|0x9000|Connected to keyboard/LCD/blink LED in my build|
|VIA2|0x6000|0x8800|Can be used to run Ben's programs|
|ACIA|N/A|0x8400||
|ROM|0x8000-0xffff|0xa000-0xffff|**First 8K are not accessible, but need to be burned to the chip**|

Simplest possible example - [Blink LED example](https://eater.net/downloads/makerom.py) from Ben's page:

```python
#
# Please see this video for details:
# https://www.youtube.com/watch?v=yl8vPW5hydQ
#
code = bytearray([
  0xa9, 0xff,         # lda #$ff
  0x8d, 0x02, 0x60,   # sta $6002

  0xa9, 0x55,         # lda #$55
  0x8d, 0x00, 0x60,   # sta $6000

  0xa9, 0xaa,         # lda #$aa
  0x8d, 0x00, 0x60,   # sta $6000

  0x4c, 0x05, 0x80,   # jmp $8005
  ])

rom = code + bytearray([0xea] * (32768 - len(code)))

rom[0x7ffc] = 0x00
rom[0x7ffd] = 0x80

with open("rom.bin", "wb") as out_file:
  out_file.write(rom)
```

The same program to run on my build:

```python
#
# Please see this video for details:
# https://www.youtube.com/watch?v=yl8vPW5hydQ
#
code = bytearray([
  0xa9, 0xff,         # lda #$ff
  0x8d, 0x02, 0x88,   # sta $8802 # MODIFIED HERE - use different VIA address

  0xa9, 0x55,         # lda #$55
  0x8d, 0x00, 0x88,   # sta $8800 # MODIFIED HERE - use different VIA address

  0xa9, 0xaa,         # lda #$aa
  0x8d, 0x00, 0x88,   # sta $8800 # MODIFIED HERE - use different VIA address

  0x4c, 0x05, 0xa0,   # jmp $a005 # MODIFIED HERE - different code start address, so different jump target
  ])

# MODIFIED BELOW - first 8KB of ROM are not really used, but need to be filled out; actual ROM starts at address
# 0xa000 and is of 24KB length
rom = bytearray([0xea] * 8192) + code + bytearray([0xea] * (24576 - len(code)))

rom[0x7ffc] = 0x00
rom[0x7ffd] = 0xa0 # MODIFIED HERE - different code start address

with open("rom.bin", "wb") as out_file:
  out_file.write(rom)
```

### LCD interface change

One of the silly things I decided to do, was to save pins on the first VIA chip and I decided on the following mapping:
|Port|Pins|Connection|
|---|---|---|
|PORTA|CA1,CA2|Keyboard controller read handshake - for IRQ based communication with keyboard controller|
|PORTA|D0-D7|Keyboard controller data line - for transferring ASCII scancodes of pressed characters|
|PORTB|CB1,CB2|Not used, disconnected|
|PORTB|D0|Blink LED - to be used as the Arduino onboard LED, for easy debugging|
|PORTB|D1-D3|LCD control signals (register select, R/W, enable)|
|PORTB|D4-D7|LCD data signals for 4-bit operation|

Afterwards it turned out that 4-bit operation is actually bit more complicated that 8-bit, and it breaks compatibility with Ben's programs. My best advice, if you want to run Ben's LCD programs on this build, is to use the second VIA port and use 8-bit interface.

If you want to use onboard LCD conector and 4-bit interface it is suggested to use the code I supplied in this repo. It has all the data communication routines for LCD 4-bit operation tested and ready to go.

### Extra VIA chip

This one increases cost of the build, but in the end you have the whole chip to yourself, so you can hack whatever contraptions you can think of :)

This extra VIA chip can be also used to run Ben's programs, but you have to remember to update addressing mode.

### Extra ACIA chip for serial communication

This one is really important - thanks to ACIA chip you can actually forget about LCD and keyboard altogether, and all the input/output can be handled by the serial port. This also allows you to run programs that are loaded in runtime, over the serial line, making the ROM flashing no longer necessary. Obviously, there is a bootloader program required in ROM and one will be provided in this repo for your use shortly.

Currently my software supports only Rockwell R6551P chips and it uses fully asynchronous, buffered and IRQ driven send/receive operations. In future I plan to add support for WDC65C51 chips, but this requires change in source code to blocking send operation. Not a biggie, just not at the top of my priorities now. More on the ACIA chips below, in the PCB BOM section.

### Extra USB->UART interface chip

When I designed PCB for this build, I had one goal in mind: it must be possible to build it with THT-only components. So, if you don't want to play with SMD soldering (which, admittably, is much easier that it seems), you can completely skip this component and connect serial over one of many UART->USB adapters. The same goes for the Micro-USB port - you can skip it, and use only USB-B port for power. Your call.

If you do decide to use FT230X chip onboard, you will have a 6502 computer that requires only USB cable - simply plug it in your PC, connect using serial terminal and you are good to go, nothing else needed. Power consumption is well below USB limits, even with LCD and external keyboard connected.

### PS/2 Keyboard interface and ATtiny4313 based controller

This was a bit of an overkill with the serial port addition, but I wanted the build to be versatile and enable operation without PC connected.

Software to be uploaded to ATtiny is also provided in this repo and discussed in detail in dedicated section. You can either program the chip away from the board or use the included AVR ISP interface. I have successfully used USBASP programmer onboard, and since the reset lines between ATtiny and CPU/VIA/ACIA/FT230X are all connected, upload operation simply resets the whole computer without any risk for running programs. Pretty neat, that one :)

### Expansion port

The main purpose is to enable easy connection of Arduino-based debugger as used in Ben's videos. Everyone who managed to build the 6502 kit on breadboard knows how difficult it is to manage these connections and prevent them from unplugging system bus wires. In my build there is dedicated connector with several other options.

Beside address bus, data bus, clock and R/W signals, you will also find reset line (can be pulled low for external reset), IRQ input line (can be pulled low to signal interrupt, but can't be used to intercept system IRQs) and IOCS signal from address decoder indicating that CPU is now using address in I/O shadow range.

IOCS line can be used to add additional chips like ACIA or VIA via expansion port. VIA1 is selected using IOCS and A12 line (address 0b1001xxxxxxxxxxxx), VIA2 is selected using IOCS and A11 line (address 0b100x1xxxxxxxxxx), ACIA using IOCS and A10 line (address 0b100xx1xxxxxxxxxx), and you can access external I/O chips using addresses like IOCS and A9 for example (address 0b100xxx1xxxxxxxx). As you can see, it enables up to 8 external I/O chips (last two lines A0/A1 for register select) :)

### Modified clock module

I have also modified Ben's design of clock module used in both [8-bit breadboard computer](https://eater.net/8bit) and in [6502 computer](https://eater.net/6502). The reason here was pretty similar - modification introduced to validate own understanding of the original design. There was another thing, though - contents of my kit were not aligned with Ben's design (wrong kind of switch) and the design itself had serious flaw. Details of both of these things have been explained in detail [here](https://www.reddit.com/r/beneater/comments/eai6ke/issue_with_clock_kit_and_possible_solution_with/) and [here](https://www.reddit.com/r/beneater/comments/edp1ls/noise_issue_in_monostable_mode_of_ben_eaters/).

### Migration from VASM to CC65

As much as I liked VASM for small, simple projects, it became quite cumbersome to use when I wanted to introduce different addressing models. CC65 is basically much better compiler for anything 65(C)02 :)

If time allows, I will also provide special versions of Ben's programs written for VASM, but targeted for my own build.

### Clock input

Clock signal can be provided in one of three ways:

1. Use onboard 1MHz oscillator - simply put jumper on J1 connector two leftmost pins,
2. Use external clock module - remove the jumper from J1 connector, and connect clock signal to middle pin,
3. Use expansion port - remove jumper from J1 connector and provide clock signal via CLK pin of the expansion port.

Last option will be used in (planned currently) custom debugger board.

## What's in the repo

Everything, basically. Schematics of the 6502 board, modified clock module, address decoder and other circuits I built during the project. Arduino sketches I used for debugging and simple programs used to test different features.

And, last but not least, full set of sample programs to follow Ben's videos on my build plus my own bootloader/OS. The last two things are coming soon :)

### `Arduino` folder

There are several sketches here, as described below
* `6502-monitor` - based on Ben's monitor code with some small modifications (like clock counter I used for clock interrupt testing), to be uploaded to Arduino Mega for debugging **USED FREQUENTLY AND WORKS**
* `6522-monitor` - similar to the above, implemented for testing of the output from VIA chip **NOT TESTED FOR A LONG TIME**
* `address-decoder-test` - my own take on the TDD principles in hardware design, described in detail [here](https://www.reddit.com/r/beneater/comments/ej3lqi/65c02_address_decoder_for_32k_ram_24k_rom_and_2/) **NOT TESTED FOR A LONG TIME**
* `bounce-counter` - small program used for troubleshooting of the [noise issue in monostable mode of Ben's clock module](https://www.reddit.com/r/beneater/comments/edp1ls/noise_issue_in_monostable_mode_of_ben_eaters/) **USED RECENTLY AND WORKS**
* `handshake-4313` - small program used to test hardware handshake with VIA, to be uploaded to ATtiny4313 **NOT SURE IF STILL WORKS**
* `handshake-test` - similar to the above, but built for Arduino Mege **NOT SURE IF STILL WORKS**
* `irq-4313` - very small program to test IRQ handling by ATtiny4313 **PROBABLY STILL WORKS**
* `irq-test` - as above, but targeted for Arduino Mega **PROBABLY STILL WORKS**
* `keyboard-4313` - **THE MOST IMPORTANT ARDUINO SKETCH HERE** - this one has to be uploaded to ATtiny4313 for PS/2 keyboard operation **USED FREQUENTLY AND WORKS**
* `keyboard-mega` - similar as above, but for Arduino Mega, not to be used, written for debugging purposes **WORKS**
* `keyboard-detect-mega` - modification of the above to implement proof-of-concept PS/2 host to device communication **WORKS**
* `keyboard-test-4313` - first version of the code for keyboard controller, but used only to validate PS/2->AVR connection, no interaction with VIA yet. Merged with `handshake-4313` to implement data transfer to VIA **WORKS**
* `keyboard-test-mega` - as above, but targeted for Arduino Mega **PROBABLY WORKS**

As you can see, there is plenty of unused code there, but I kept it for the record and reference. You basically need two programs for 6502 (`6502-monitor` to be installed on Arduino Mega for debugging and `keyboard-4313` to be installed on onboard ATtiny4313 for keyboard controller operation) and another one for the clock module (`bounce-counter`, to be installed on Arduino Mega to confirm correct operation in monostable mode).

### `Datasheets` folder

All the datasheets I used when designing my build, attached for reference.

### `Schematics` folder

All the KiCAD schematics for the 6502 computer, modified clock module and several others:
* 65C02_Computer - main schematic, including PCB design for my build of 6502 computer,
* Clock_module - schematic for the modified clock module, including PCB design,
* 555_troubleshoot - schematic of circuit used in [troubleshooting of clock module monostable noise issue](https://www.reddit.com/r/beneater/comments/edp1ls/noise_issue_in_monostable_mode_of_ben_eaters/),
* Address_decoder_basic - schematic of Ben Eater's address decoder for 6502 project,
* Address_decoder_basic_v2 - slightly modified version of the above,
* Address_decoder_extended - schematic of my own address decoder, used in the final build of my 6502 computer.

## Getting started

TO BE COMPLETED SHORTLY

## Printed Circuit Boards

[First revision of PCBs](https://github.com/dbuchwald/6502/releases/tag/pcb-v001) have been released (one for modified clock module and one for the computer itself). PCBs can be ordered here:

[PCBWay Shared Projects - 65C02 Hobby Computer](https://www.pcbway.com/project/shareproject/65C02_Hobby_Computer.html)

[PCBWay Shared Projects - Clock Module](https://www.pcbway.com/project/shareproject/Modified_version_of_Clock_Module_by_Ben_Eater_s.html)

### 65C02 Computer Bill Of Materials

The following components are required for building 65C02 Computer

| Reference | Type                   | Value         | Description                            |
| --------- | ---------------------- | ------------- | -------------------------------------- |
| C1        | Unpolarized Capacitor  | 100 nF        | Disk, 2.5mm raster                     |
| C2        | Unpolarized Capacitor  | 100 nF        | Disk, 2.5mm raster                     |
| C3        | Unpolarized Capacitor  | 100 nF        | Disk, 2.5mm raster                     |
| C4        | Unpolarized Capacitor  | 100 nF        | Disk, 2.5mm raster                     |
| C5        | Unpolarized Capacitor  | 100 nF        | Disk, 2.5mm raster                     |
| C6        | Polarized Capacitor    | 10 uF         | Tube, 2.5mm raster, 5mm diameter       |
| C7        | Unpolarized Capacitor  | 100 nF        | Disk, 2.5mm raster                     |
| C8        | Unpolarized Capacitor  | 10 nF         | Disk, 2.5mm raster                     |
| C9        | Unpolarized Capacitor  | 47 pF         | Disk, 2.5mm raster                     |
| C10       | Unpolarized Capacitor  | 47 pF         | Disk, 2.5mm raster                     |
| C11       | Polarized Capacitor    | 1000 uF       | Tube, 5mm raster, 10mm diameter        |
| C12       | Unpolarized Capacitor  | 100 nF        | Disk, 2.5mm raster                     |
| C13       | Unpolarized Capacitor  | 100 nF        | Disk, 2.5mm raster                     |
| C14       | Unpolarized Capacitor  | 100 nF        | Disk, 2.5mm raster                     |
| C15       | Unpolarized Capacitor  | 100 nF        | Disk, 2.5mm raster                     |
| C16       | Unpolarized Capacitor  | 100 nF        | Disk, 2.5mm raster                     |
| C17       | Unpolarized Capacitor  | 100 nF        | Disk, 2.5mm raster                     |
| D1        | LED                    | Green         | 5mm diameter (PWR)                     |
| D2        | LED                    | Red           | 5mm diameter (TX)                      |
| D3        | LED                    | Green         | 5mm diameter (RX)                      |
| D4        | LED                    | Red           | 5mm diameter (BLINK)                   |
| FB1       | Ferrite bead small     |               |                                        |
| J1        | Pin header 3x1         |               | 2.54mm raster                          |
| J2        | Female pin header 6x1  |               | 2.54mm raster                          |
| J3        | USB B Micro            |               | Molex 105017-0001                      |
| J4        | USB B                  |               | Standard THT horizontal USB B port     |
| J5        | Barrel Jack            |               | Standard power input 2.1/5.5           |
| J6        | Mini-Din-6             |               | Standard THT PS/2 Keyboard port        |
| J7        | Female pin header 16x2 |               | 2.54mm raster                          |
| J8        | Pin header 3x2         |               | AVR ISP 2.54mm raster                  |
| J9        | Pin header 12x1        |               | 2.54mm raster                          |
| J10       | Pin header 12x1        |               | 2.54mm raster                          |
| J11       | Female pin header 16x1 |               | 2.54mm raster                          |
| R1        | Resistor               | 1M            | 1/4 watt                               |
| R2        | Resistor               | 47K           | 1/4 watt                               |
| R3        | Resistor               | 10K           | 1/4 watt                               |
| R4        | Resistor               | 27            | 1/4 watt                               |
| R5        | Resistor               | 27            | 1/4 watt                               |
| R6        | Resistor               | 4K7           | 1/4 watt                               |
| R7        | Resistor               | 4K7           | 1/4 watt                               |
| R8        | Resistor               | 4K7           | 1/4 watt                               |
| R9        | Resistor               | 220           | 1/4 watt                               |
| R10       | Resistor               | 220           | 1/4 watt                               |
| R11       | Resistor               | 220           | 1/4 watt                               |
| R12       | Resistor               | 220           | 1/4 watt                               |
| R13       | Resistor               | 4K7           | 1/4 watt                               |
| RV1       | Potentiometer          | 10K           | Piher PT10-LV10-103                    |
| SW1       | Pushbutton             |               | Standard 6mm THT pushbutton            |
| U1        | IC                     | 74HC21        | Add socket                             |
| U2        | IC                     | 74HC00        | Add socket                             |
| U3        | IC                     | 74HC02        | Add socket                             |
| U4        | IC                     | NE555         | Add socket                             |
| U5        | IC                     | 6551          | Add socket; ACIA chip, see notes below |
| U6        | IC                     | FT230XS       |                                        |
| U7        | IC                     | 65C02S        | Add socket                             |
| U8        | IC                     | 28C256        | Add socket                             |
| U9        | IC                     | 62256         | Add socket                             |
| U10       | IC                     | ATtiny4313-PU | Add socket                             |
| U11       | IC                     | 65C22S        | Add socket                             |
| U12       | IC                     | 65C22S        | Add socket                             |
| X1        | Crystal Oscillator     | 1MHz          |                                        |
| X2        | Crystal Oscillator     | 1.8432MHz     |                                        |

_Important note about the ACIA chip_: There are basically two types of chips that can be used. Modern, rated to higher frequencies WDC65C51 and older, Rockwell 6551P chips, rated only for 1MHz. The problem with former is that there is a bug with interrupt handling on transmit operation - both IRQ and status flag polling fail, you have to implement dead loop to wait long enough for the byte to be transmitted. Latter chip is probably no longer manufactured, but can be purchased online from Chinese sellers - these are cheap, but not all of them work correctly, so get more than one to be safe. For me the second chip worked correctly and both polling and IRQ-based transmit work as expected.

### Clock Module Bill Of Materials

The following components are required for building Clock Module

| Reference | Type                  | Value  | Description                   |
| --------- | --------------------- | ------ | ----------------------------- |
| C1        | Polarized capacitor   | 1 uF   | 2.5mm raster, 5mm diameter    |
| C2        | Polarized capacitor   | 1 uF   | 2.5mm raster, 5mm diameter    |
| C3        | Unpolarized capacitor | 10 nF  | 2.5mm raster                  |
| C4        | Unpolarized capacitor | 100 nF | 2.5mm raster                  |
| C5        | Unpolarized capacitor | 100 nF | 2.5mm raster                  |
| C6        | Unpolarized capacitor | 100 nF | 2.5mm raster                  |
| C7        | Unpolarized capacitor | 100 nF | 2.5mm raster                  |
| C8        | Unpolarized capacitor | 100 nF | 2.5mm raster                  |
| C9        | Polarized capacitor   | 1 uF   | 2.5mm raster, 5mm diameter    |
| D1        | LED                   | Yellow | 5mm diameter (Automatic tick) |
| D2        | LED                   | Red    | 5mm diameter (Manual mode)    |
| D3        | LED                   | Green  | 5mm diameter (Automatic mode) |
| D4        | LED                   | Yellow | 5mm diameter (Manual tick)    |
| D5        | LED                   | Blue   | 5mm diameter (Output tick)    |
| J1        | Female pin header 6x1 |        | 2.54mm raster                 |
| J2        | Barrel Jack           |        | Standard power input 2.1/5.5  |
| R1        | Resistor              | 1K     | 1/4 watt                      |
| R2        | Resistor              | 1K     | 1/4 watt                      |
| R3        | Resistor              | 1K     | 1/4 watt                      |
| R4        | Resistor              | 100K   | 1/4 watt                      |
| R5        | Resistor              | 10K    | 1/4 watt                      |
| R6        | Resistor              | 1K     | 1/4 watt                      |
| R7        | Resistor              | 10K    | 1/4 watt                      |
| R8        | Resistor              | 1K     | 1/4 watt                      |
| R9        | Resistor              | 1M     | 1/4 watt                      |
| R10       | Resistor              | 220    | 1/4 watt                      |
| R11       | Resistor              | 220    | 1/4 watt                      |
| R12       | Resistor              | 220    | 1/4 watt                      |
| R13       | Resistor              | 220    | 1/4 watt                      |
| R14       | Resistor              | 220    | 1/4 watt                      |
| R15       | Resistor              | 1K     | 1/4 watt                      |
| RV1       | Potentiometer         | 10K    | Piher PT10-LV10-105           |
| SW1       | Pushbutton            |        | Standard 6mm THT pushbutton   |
| SW2       | Pushbutton            |        | Standard 6mm THT pushbutton   |
| U1        | IC                    | NE555  | Add socket                    |
| U2        | IC                    | NE555  | Add socket                    |
| U3        | IC                    | NE555  | Add socket                    |
| U4        | IC                    | 74LS04 | Add socket                    |
| U5        | IC                    | 74LS32 | Add socket                    |
| U6        | IC                    | 74LS08 | Add socket                    |
