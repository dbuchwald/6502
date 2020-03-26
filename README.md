# What is this

This repository contains all the work in progress during my build of Ben Eater's inspired 6502 8-bit computer similar to typical machines of the early 1980s. If you haven't seen Ben's videos, I would strongly suggest you start there:

[Ben Eater's 6502 project](https://eater.net/6502)

As stated above, this build is not 100% compatible with what Ben had done - and for a reason, described in next section.

If I had to explain shortly "what it is", the answer would be: simple, yet easy to expand, 8-bit CPU based computer designed and built with one goal only: to use it as a learning and tinkering platform to understand how computers really work. You can use it for simple things like understanding buses, clock cycles, instruction execution, but it also demonstrates more complex concepts like interrupts, interfaces to external components and device handling. More on that below. Everything, hopefully, is simple enough to wrap your head around by one person in couple of weeks.

## Why build something different

[Ben's videos](https://www.youtube.com/playlist?list=PLowKtXNTBypFbtuVMUVXNR0z1mu7dp7eH) on 6502 computer are absolutely awesome - it's one of the best sources in the whole Internet explaining how any computer works. The build he introduced is probably sufficient for most of the things you might ever want to build, and yet I decided to deviate from his design.

The rationale behind this project is pretty simple - the best way to test your understanding of certain subject is to try to expand on what you have learned. You never know if you understood something until you test it by introducing changes to original design - and I used this approach in this project to learn a lot. It was my first proper electronics project, so I would like to apologize for any mistakes. If you think something is off or could have been done differently - please go ahead and raise issue for the repo! All improvements are welcome!

## Why would you bother using this build instead of Ben's

Basically, it gives you almost all the flexibility of Ben's buid without the hassle of breadboard connections for the critical components. You can still run all of Ben's programs (using second VIA port), but the days of looking for loose wire between RAM and CPU are over :) You can, obviously, still experiment with peripherals and breadboard connections using extension port and second VIA.

On top of that you get additional features like extra screen (via onboard connector), keyboard for more versatile input and finally all-in-one serial over USB terminal. You also get easy to use software ready to be installed on the machine to jumpstart your tinkering. When using bootloader you don't even have to flash the EEPROM more than once!

**Important note:** All of the content here is, and always will be open source and free to use, and I don't intend to make any profit out of it. The only way I get anything at all (and it's only small commission to be used for future PCBWay orders) is when you order my boards from PCBWay using the links posted below, but you are welcome to grab these gerber files and order the boards from another provider, or even from PCBWay, just by uploading gerbers to your account, if you don't want me to get the commission :)

## What is different

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
|Segment|Ben's build  |My build     |Comment                                                           |
|-------|-------------|-------------|------------------------------------------------------------------|
|RAM    |0x0000-0x3fff|0x0000-0x7fff|                                                                  |
|VIA1   |N/A          |0x9000       |Connected to keyboard/LCD/blink LED in my build                   |
|VIA2   |0x6000       |0x8800       |Can be used to run Ben's programs                                 |
|ACIA   |N/A          |0x8400       |                                                                  |
|ROM    |0x8000-0xffff|0xa000-0xffff|**First 8K are not accessible, but need to be burned to the chip**|

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

|Port |Pins   |Connection                                                                               |
|-----|-------|-----------------------------------------------------------------------------------------|
|PORTA|CA1,CA2|Keyboard controller read handshake - for IRQ based communication with keyboard controller|
|PORTA|D0-D7  |Keyboard controller data line - for transferring ASCII scancodes of pressed characters   |
|PORTB|CB1,CB2|Not used, disconnected                                                                   |
|PORTB|D0     |Blink LED - to be used as the Arduino onboard LED, for easy debugging                    |
|PORTB|D1-D3  |LCD control signals (register select, R/W, enable)                                       |
|PORTB|D4-D7  |LCD data signals for 4-bit operation                                                     |

Afterwards it turned out that 4-bit operation is actually bit more complicated that 8-bit, and it breaks compatibility with Ben's programs. My best advice, if you want to run Ben's LCD programs on this build, is to use the second VIA port and 8-bit interface.

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

## Getting started

Okay, so it should be pretty clear what this project is about, so how to start playing with it? That really depends on what you decide to do:

* Stick with Ben Eater's build and just use subset of provided software (either to install it in EEPROM, or just use it as reference for your own hacking),
* Build your own breadboard design based on this one with any modifications you can think of,
* Order PCBs of my build, solder the components and run provided software to see how it works and get started with your own designs.

To start from scratch it's actually easiest to select last option - after some waiting you will end up having pretty solid base to extend your design on.

### Using provided software with Ben's build

If you decide to go down that route, head straight to the `Software` folder, where you will find several programs either identical or similar to what Ben has shown in his videos, but built with much more versatile toolchain.

If you want to read more, go ahead and read [Software folder](#software-folder) section. Make sure to check out the [building software](#building-software) subsection, as it explains how to compile programs to run on Ben's build directly.

### Build your own breadboard design

Maybe you have already started expanding on Ben's build, or maybe you are just considering it now. If you want to check out how I did certain things, jump right into `Schematics` folder, where you will find KiCAD projects for all the components used in this project. Obviously the most important one is the `65C02_Computer` project, but there are some additional goodies there.

**Please note:** This part is not very well documented, I have assumed that anybody willing to dig into these schematics already knows how to read them.

Most of the decisions made during the schematic design were explained above. Justification for anything not covered here can be probably found in the [invaluable 6502 primer](http://wilsonminesco.com/6502primer/).

### Using my PCB design

This will be explained in the most detail, obviously. Start with getting [the PCBs](#printed-circuit-boards). **Please note:** clock module is entirely optional, but really useful for single stepping or slow clocking required by Ben Eater's design of Arduino Mega based bus analyzer. As explained in number of places here, you can either order PCBs from PCBWay directly or use your manufacturer of choice - it should have no impact on the final result.

So, let's assume you got the PCBs and all the components, listed in the Bill of Materials. First thing is to solder the components on. At this stage you have to decide if you want to try soldering on the SMD components - there are two, each of them being totally optional. FT230X chip is required if you want to have onboard serial USB->UART converter. MicroUSB connector if you want to use this connector standard. You can replace MicroUSB with standard USB B port (and you can also solder both, as I did, but only use one at a time).

Other optional components are:

* UART Port (J2) - it was placed on the board if you decide to skip the FT230X chip, but you still want to use serial connection. You can use this port to connect to one of external USB->UART converters. **Please note:** if your USB->UART converter doesn't expose CTS/RTS lines, you have to connect CTS and RTS lines permanently to ground,
* USB-B Port (J4) - if you prefer to use Micro-USB port,
* Power-In Port (J5) - you can power the computer using any of the USB ports, so this one is optional,
* PS/2 Connector (J6) - you can skip this one, if you don't intend to connect keyboard. Please note - ATtiny must be connected and programmed even if you don't plan to use keyboard - otherwise the lines would be left floating and could cause strange behavior. You can try grounding them using ATtiny socket, but this has not been tested,
* AVR-ISP Port (J9) - required only if you plan to program the ATtiny onboard, otherwise you can program the chip externally, but it requires chip removal each time,
* Expansion Port (J7) - this one can be skipped, if you don't plan to use Arduino Mega bus analyzer nor any extensions, but it's not recommended.

For the soldering, I would suggest to start with the most difficult components - you will probably get more than one board, so use the first one to brave the SMD components. Important step after soldering is to verify if there are any bridges/shorts between adjacent chip/port pins. Since checking the pins itself might be difficult (they are pretty small), it's easier to check on the connected THT pads, and these are:

|FT230X Pin|Connected THT pad on PCB        |
|----------|--------------------------------|
|1         |RxD pad of UART Port (J2)       |
|2         |CTS pad of UART Port (J2)       |
|3         |Bottom pads of resistor R10, R11|
|4         |TxD pad of UART Port (J2)       |
|5         |Left pad of capacitor C8        |
|6         |RTS pad of UART Port (J2)       |
|7         |Disconnected                    |
|8         |Left pad of resistor R5         |
|9         |Left pad of resistor R4         |
|10        |Bottom pads of resistors R10,R11|
|11        |Pad 4 of the ACIA chip (U5)     |
|12        |Right pad of capacitor C8       |
|13        |Left pad of capacitor C8        |
|14        |Left pad of LED D3              |
|15        |Left pad of LED D2              |
|16        |Disconnected                    |

|MicroUSB Pin|Connected THT pad on PCB        |
|------------|--------------------------------|
|1           |Top pad of ferrite bead FB1     |
|2           |Right pad of capacitor C10      |
|3           |Right pad of capacitor C9       |
|4           |Disconnected                    |
|5           |Left pad of capacitors C9, C10  |

So, to verify that there is no bridge between pins 5 and 6 of FT230X, connect your multimeter in circuit continuity mode between left pad of capacitor C8 and RTS pad of UART Port (J2). If it beeps, you have bridge between these two pins and you need to check your soldering again.

Repeat for each pair of adjacent pins. You want to have zero beeps :) Please note: this only means that there are no bridges, it doesn't guarantee that your chip is soldered correctly, that will be verified later.

After SMD components are in place (or if you skipped them), solder on all the THT components, starting from the smallest ones and going up the size. There is plenty of redundant space on the board, so this should be pretty easy. Make sure to observe polarity of capacitors and LEDs and be careful when mounting ACIA chip - it's actually oriented differently than the rest of horizontal chips on the board.

After all the components are soldered in place, put the chips in sockets (I recommend using two tooled sockets for ROM - one will be soldered to the board, the other one will be used for easy ROM replacement for programming) and check everything once again - orientation of the chips, visible solder bridges, etc. If it looks good, connect power and you expect the power LED to light up. If this works, go to next step, would be building, installing and running sample programs.

### Getting started with provided software

Details of the `Software` folder are covered in [dedicated section](#software-folder), but here I will show how to use sample programs for smoke testing of the soldered board.

I recommend running first couple of programs in slow clock mode, so with external clock module, with Arduino Mega based bus analyzer.

#### Connecting Arduino Mega

First, make sure you have the 6502-monitor program installed on your Arduino Mega board. You will find it in `Arduino/6502-monitor` folder.

Connect pins as per following table:

|Expansion port pins  |Arduino Mega pins|
|---------------------|-----------------|
|D0-D7 (data bus)     |53-39            |
|A00-A15 (address bus)|52-22            |
|CLK (system clock)   |2                |
|R/W (read/write)     |3                |
|GND                  |GND              |
|+5V                  |+5V              |

**PLEASE NOTE: Connections are reversed for convenience. D0 is connected to pin 53, D1 to pin 51, A00 to pin 52 and A15 to pin 22.**

Also, connect clock module as follows:

|Computer connection         |Clock module connection|
|----------------------------|-----------------------|
|CLK input (middle pin on J1)|CLK output             |
|UART +5V                    |+5V                    |
|UART GND                    |GND                    |

It might seem strange that the clock module is powered from UART port, but in fact it doesn't matter which of the power outputs you choose. I use this one, since this one is closes to the clock connector (J1). This is one thing I didn't consider when designing the PCB - I provided GND reference in J1, but the power is missing...

The whole thing will be powered from Arduino via USB - don't worry, the load will not be too high.

#### Running the simplest possible program

Now you need to build the first program. Go to `Software/rom/01_nop_fill` folder and run:

```shell
make clean all test
```

You expect output similar to the following:

```text
rm -f ../../build/rom/*.bin \
  ../../build/rom/01_nop_fill/*.o \
  ../../build/rom/01_nop_fill/*.lst \
  ../../build/rom/01_nop_fill/*.s \
  ../../build/rom/*.map \
  ../../build/common/*.o \
  ../../build/common/*.lst \
  ../../build/common/*.s \

ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/rom/01_nop_fill/nop_fill.o -l ../../build/rom/01_nop_fill/nop_fill.lst nop_fill.s
cl65 -t none -C ../../common/firmware.ext.cfg -m ../../build/rom/01_nop_fill.ext.map -o ../../build/rom/01_nop_fill.ext.bin ../../build/rom/01_nop_fill/nop_fill.o
hexdump -C ../../build/rom/01_nop_fill.ext.bin
00000000  ea ea ea ea ea ea ea ea  ea ea ea ea ea ea ea ea  |................|
*
00008000
MD5 (../../build/rom/01_nop_fill.ext.bin) = 49d01fd92a6a02370364f8eef2ee2c93
```

If you remember Ben's video - this is the first program he uploads to ROM. Now, run `make install` to upload the binary to your EEPROM - I assume you put the ROM chip in TL866II+ programmer and it is connected to your machine.

```shell
make install
```

You expect the following output:

```text
minipro -p AT28C256 -w ../../build/rom/01_nop_fill.ext.bin
Found TL866II+ 04.2.109 (0x26d)
Erasing... 0.02Sec OK
Protect off...OK
Writing Code...  6.78Sec  OK
Reading Code...  0.49Sec  OK
Verification OK
Protect on...OK
```

Plug the ROM back in your board, connect the Arduino to your PC, toggle clock module to manual mode, reset 6502 computer and start serial monitor. Go a few cycles step by step and you should see something similar to the below in serial monitor:

```text
10:13:51.707 -> 000000   1110101011110010   11101010   eaf2  r ea
10:13:52.315 -> 000001   1111111111111111   11101010   ffff  r ea
10:13:52.776 -> 000002   1110101011110010   11101010   eaf2  r ea
10:13:53.201 -> 000003   0000000111111101   10111101   01fd  r bd
10:13:53.585 -> 000004   0000000111111100   10111001   01fc  r b9
10:13:54.074 -> 000005   0000000111111011   10000001   01fb  r 81
10:13:54.576 -> 000006   1111111111111100   11101010   fffc  r ea
10:13:55.562 -> 000007   1111111111111101   11101010   fffd  r ea
10:13:56.020 -> 000008   1110101011101010   11101010   eaea  r ea
10:13:56.511 -> 000009   1110101011101011   11101010   eaeb  r ea
10:13:56.982 -> 000010   1110101011101011   11101010   eaeb  r ea
10:13:57.337 -> 000011   1110101011101100   11101010   eaec  r ea
10:13:57.659 -> 000012   1110101011101100   11101010   eaec  r ea
10:13:57.940 -> 000013   1110101011101101   11101010   eaed  r ea
10:13:58.253 -> 000014   1110101011101101   11101010   eaed  r ea
10:13:58.658 -> 000015   1110101011101110   11101010   eaee  r ea
```

First six lines might be different, but starting from line 7 you should see identical output. If this works, it means your CPU and ROM are working just fine, your clock module and Arduino Mega bus analyzer are attached correctly. Congratulations!

If you have any problems during build, installation or execution - check instructions above again, maybe you missed something.

#### More complex programs

After having ran the first one, try executing the following programs:

* `Software/rom/02_nop_fffc` - this one will jump to the beginning of the accessible ROM address space and will confirm your address decoder functions correctly,
* `Software/rom/03_first_code` - this is another program taken directly from Ben's videos - it will store value 0x42 in the address 0x6000. Please note: this will have no effect whatsoever.

Now, if the both above work as expected (when checked using bus analyzer), you can try connecting peripherals to your computer. If you want to follow Ben's videos, keep reading this section, otherwise, skip to [next one](#initiate-warp-speed).

First, let's play with some LEDs. Using the connectors in bottom left corner of the PCB, connect 8 LEDs to VIA2 PORTB lines PB0-PB7, and then, using current limiting resistors of 220Ohm, connect these to ground (also from the VIA2 PORTB connector).

Having these connected, upload `Software/rom/04_blink_s` or `Software/rom/05_knight_rider` to your ROM. After powering on, you should see LEDs blinking in a way similar to what Ben did in his videos. If it works correctly, you can move on to connecting LCD. For now, use it in 8-bit mode with slow clock - just as in Ben's videos.

To do this, connect LCD to breadboard (not to the dedicated LCD port on PCB), and then connect each line as listed below:

|VIA2 Pin|LCD Pin|
|--------|-------|
|PA5     |RS     |
|PA6     |R/W    |
|PA7     |E      |
|PB0     |DB0    |
|PB1     |DB1    |
|PB2     |DB2    |
|PB3     |DB3    |
|PB4     |DB4    |
|PB5     |DB5    |
|PB6     |DB6    |
|PB7     |DB7    |

Also, connect A and VDD connectors to +5V, K and VSS to GND and connect V0 to a middle pin of 10KOhm potentiometer plugged between GND and +5V.

Now upload program `Software/rom/06_lcd_test` to ROM - when executed, it should display "Merry Christmas!" message on the LCD.

If it works correctly, follow with `Software/rom/07_mem_test` and `Software/rom/08_stack_test` - these will test if RAM works as expected: first one will copy data from ROM to RAM, while the second will use stack routines. Congratulations, you have working CPU, ROM, RAM, VIA and address decoder!

#### Initiate warp speed

Now it's time to go a bit faster and test the more complex features. Please note: you could keep using the analyzer and external clock with these programs, you just have to remember to build them with `FASTCLOCK=0` flag. More details can be found in [building software section](#building-software).

For now let's assume we move to 1MHz clock. To do it, put jumper on two leftmost pins of clock connector (J1). Disconnect external clock and bus analyzer - first one is not needed, second one will not work with high frequencies anyway. Connect your LCD to onboard LCD port and upload `Software/rom/13_4bit_lcd` to your ROM. Upon boot you expect to see message "Hello 4-bit! Chars!" on your screen. If it works, it means that the primary VIA works just fine and clock is OK.

Next one to test will be serial connection, so upload `Software/rom/15_serial_irq`. Now, depending on whether you soldered on FT230X chip or not, connect your board using USB cable to PC (using either MicroUSB or USB-B port), or use external USB->UART connector. Connect to your board using `picocom` with baud rate of 19200.

```shell
picocom -b 19200 /dev/tty.usbserial-HANF88HD
```

When you get "Terminal ready" message, press any key - you should get a response of "Hello IRQ>". This means that two things are working correctly: interrupt handling and serial communication. Congratulations, you are almost ready to go.

#### Keyboard connection

Even if you don't intend to use keyboard just yet, you still need to upload the controller sketch to ATtiny4313. Recommended way of doing that is to use onboard AVR-ISP connector and some kind of AVR programmer. I used USBASP programmer and it works lovely directly from Arduino IDE. The sketch to upload is in `Arduino/keyboard-4313` folder.

After successful sketch upload, flash your rom with `Software/rom/19_keyboard_test`. Connect your PS/2 keyboard to the port and try pressing some keys - you should see messages on the LCD with confirmation.

#### Using the bootloader

Currently only the minimal bootloader is provided, but it should be sufficient for software development without constant need to reflash the EEPROM. To use it, build ROM image in `Software/rom/minimal_bootloader` folder and flash it to EEPROM. To test this functionality, you have to build example loadable programs in `Software/load/01_blink_test` and `Software/load/02_hello_world`.

**PLEASE NOTE:** Both the bootloader and sample programs will be built automatically when invoking `make all` directly in `Software` folder.

Upon boot you will be prompted to connect to the PC via serial connection and press Enter key - either in termina window if keyboard is not connected, or on the keyboard otherwise. Connection details will be displayed on the LCD:

* 19200 baud,
* 8-bit, no parity, 1 stop bit,
* CTS/RTS hardware flow control.

In MacOS/Linux you can use `picocom` for this operation, under Windows I have successfully used [ExtraPuTTy](https://www.extraputty.com/).

After connection is established you need to press enter as prompted (either on PS/2 keyboard or terminal window) and you will be prompted to initiate file transfer. In `picocom` this requires that your send command is set to `sz -X` (see `make terminal` target in `Software/common/makefile`) and you initiate transfer with Ctrl+A followed by Ctrl+S. Enter load file path (i.e. `Software/build/load/01_blink_test.load.bin`) and press enter. If the transfer fails, try again. `picocom` seems to fail every now and then, while ExtraPuTTy hardly ever has any issues.

In ExtraPuTTy open "Files Transfer" menu item, then "Xmodem" and "Send". Point to loadable module (i.e. `Software/build/load/02_hello_world.load.bin`) and click "Open" button.

Program should load and be automatically executed. Congratulations, you got yourself working bootloader!

**MORE INFO COMING SOON**

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

### `Software` folder

This one is the most important folder, as it contains range of different programs to play with the 6502 computer. Large subset of this programs can be built for Ben Eater's version of the 6502 computer without any changes. Some of them, however, use features available only in this build, like ACIA or keyboard connector. These can still be ran on Ben Eater's 6502 computer, assuming that compatible hardware is added to it.

The `Software` folder is currently divided into four main parts:

* `build` - temporary folder where all the build artifacts are created, including ROM binaries to be uploaded to EEPROM,
* `common` - common sources: include files with common constants, sources with shared function, configuration files for different address decoder logic modes, shared makefile used by all projects and small python script to optimize size of loadable modules,
* `rom` - set of projects used to create various ROM images to follow Ben's videos, test different features of the board and **some day** complete operating system for the computer,
* `load` - set of project containing loadable modules. These can be uploaded at runtime, without the need to flash the EEPROM. Basic bootloader is required, obviously, and the usage instructions are provided below.

There is also one "master" makefile located directly in the `Software` folder - it will build all the projects in `rom` and `load` subfolders.

#### Building software

General rule is simple: `make` should be sufficient for all the build/installation. If you want to use this software under Windows, you have basically two options: Windows Subsystem for Linux (works, with the exception of minipro upload operation) or some sort of MinGW/Cygwin. If you have better idea on how to do it, and can provide Pull Request - I will be more than happy to have something better.

Beside `make` the following tools are used:

* `cc65` compiler, available [here](https://github.com/cc65/cc65),
* `minipro` software to upload ROM image to EEPROM, available [here](https://gitlab.com/DavidGriffith/minipro/),
* `hexdump` for testing the contents of the binaries,
* `md5` to generate binary checksum,
* `rm` and `mkdir` for folder/file manipulation,
* `picocom` for serial communication with the computer,
* `sz` for loadable module upload via `picocom`,
* `python` to run small utility written in Python to trim loadable modules and add start vector,
* `x6502` to run computer emulator (enables execution of generated binaries on PC), available [here](https://github.com/dbuchwald/x6502) - **please note: this one is optional, still in development, and lagging behind the actual computer.** Simple programs can be executed, but anything more complex than LCD operation (including ACIA/keyboard) don't work just yet.

The following `make` targets are to be used for building software:

* `all` - build the project,
* `clean` - delete all temporary files,
* `test` - dump the contents and checksum of generated binary file,
* `install` - upload generated binary to AT28C256 chip using `minipro` tool,
* `terminal` - connect to the 6502 computer using serial port, please note - currently uses my own device ID as visible under MacOS and most likely needs to be adapted to your build/OS,
* `emu` - run the generated binary in system emulator. Again: suitable for simple programs, more complex ones are not yet supported. So far I needed it only for simple debugging and that's why it is so limited.

Beside the targets, there are two very important build flags:

* `ADDRESS_MODE` - with acceptable values `basic` and `ext` (the latter being default if omitted) that drives target addressing model. To build for Ben Eater's machine, use `basic` mode; for my build, use `ext` mode. If you want to support your own model, create additional configuration file, as explained in common sources section below,
* `FASTCLOCK` - with acceptable values `0` and `1` (the latter being default if omitted) enables build time selection of runtime clock variant. Basically, certain operations (like LCD initialization) require delays when working at 1MHz clock speed, and the delays are implemented as dead loops. Each 1ms delay translates to 1000 clock cycles. Now, if you want to run the code with external clock module or in emulator, it will take literally hours to clock through single delay loop. To mitigate this issue and prevent necessity to change code each time, this flag was added. **Please note: to enable detection of possible stack related issues in code using delay operations, these routines are not fully disabled, jump to subroutine still happens, it just results in immediate return.**

Build examples:

```shell
make ADDRESS_MODE=basic FASTCLOCK=0 clean all test install
```

This will build sources with Ben's addressing scheme (16K RAM, 32K ROM, VIA at 0x6000), with support for slow clocking - any delay routines will be skipped. First, all the binaries will be removed, then built from scratch, hexdump of the resulting binary will be displayed and the binary uploaded to the EEPROM, assuming it's connected via minipro-compatible programmer.

```shell
make FASTCLOCK=1 all test
```

This command will rebuild only modified modules with support for my own addressing scheme (32K RAM, 24K ROM, VIA at 0x9000) and suitable for 1MHz execution - all delays will be enabled.

#### Detailed description of modules in `Software` folder

There are quite many programs in the `Software` folder, making the navigation a bit difficult. This section should support you in navigating provided software library.

##### ROM images in `rom` folder

In the `rom` folder you will find the following ROM images:

* `01_nop_fill` - simplest possible program, composed of 32K of NOP (0xea) instructions. The source itself seems empty, because default fill is defined in firmware configuration files (`common/firmware.basic.cfg` and `common/firmware.ext.cfg`),
* `02_nop_fffc` - extension of the above program by adding `VECTORS` segment, containing start address for 6502. Address of the `init` label depends on the firmware configuration used,
* `03_first_code` - very simple program that actually executes some code, but there is no effect to be observed,
* `04_blink_s` - first example of a program interfacing with external world, using VIA2 to drive LEDs, as in Ben's videos,
* `05_knight_rider` - modification of the previous one to achieve classic effect,
* `06_lcd_test` - modified version of Ben Eater's first LCD program. Modification involves using loops, but runs without RAM, only ROM is used. This program will work only on slow clock (not 1MHz), and will not work with onboard LCD connector. To execute this one, you need to connect LCD via breadboard to VIA2 connectors on the PCB. When compiled for Ben Eater's build (with `ADDRESS_MODE = basic`) it will work out of the box,
* `07_mem_test` - modification of the previous one, testing RAM module usage - message contents are copied first from ROM to RAM and only then displayed on the LCD,
* `08_stack_test` - modification of the previous one, but this time stack is utilized for JSR/RTS operation showcase,
* `09_serial_test` - simplest possible ACIA/serial testing program, using blocking send/receive operation to send simple message in response to each input on serial terminal,
* `10_blink_c` - modification of `04_blink_s`, but mixing low-level ASM code for hardware handling and C code for "business logic", shows how to use software stack to write code in C,
* `11_int_test` - illustration how to use VIA1 clock timer interrupt - basically displays text on LCD attached to VIA2 while changing LED (connected to VIA2 PA0) state each 50 cycles. Obviously needs to be executed in slow clock mode,
* `12_handshake_test` - very simple program that shows how to use CA1/CA2 hardware handshake operation with keyboard controller, will print on the LCD screen (connected to onboard LCD connector in 4-bit mode!) keys pressed on the attached PS/2 keyboard. Requires 1MHz clock for smooth operation, and is not compatible with Ben's build,
* `13_4bit_lcd` - testing program for 4-bit LCD interface, hence not compatible with Ben's build,
* `14_irq_test` - small program to run with slow clock showing operation of the VIA1 timer interrupt,
* `15_serial_irq` - interrupt-driven serial communication (both RX and TX), sends static message in response to each input from serial terminal,
* `16_delay_test` - testing program for improved 4-bit LCD library for onboard port, using functions like line wrap and vertical screen scrolling, not compatible with Ben's build because of the 4-bit interface,
* `17_blink_test` - another blink program, but this one uses common library functions to drive onboard LCD. Can be adapted to work with Ben's build, you just need to connect the LCD to PB0,
* `18_core_program` - test program used to verify operation of aggregated system init operation, uses onboard LCD to present contents of RX/TX buffer pointers (used in debugging of serial connection),
* `19_keyboard_test` - more complex program presenting integration with onboard keyboard controller, with IRQ driven data transmission, hardware state change detection and pretty interface on the onboard LCD port,
* `20_convert_test` - small testing program to test hex conversion function, aimed at x6502 emulator execution,
* `21_serial_load_test` - attempt to implement testing program for high serial load, counting incoming characters,
* `22_modem_test` - barebone modem testing application, sort of bootloader without user interface,
* `23_blink_test` - copy of `load/01_blink_test` to show how simple `makefile` change can be used to build the same source either as ROM image or bootloader-compatible loadable module,
* `minimal_bootloader` - simplest possible bootloader application that can be used to simplify software development thanks to making ROM flashing unnecessary for each code change.

The following table summarizes compatibility of each program with different versions of the 6502 computers:

|Program                  |Ben Eater's build execution notes|This build execution notes                                         |
|-------------------------|---------------------------------|-------------------------------------------------------------------|
|`rom/01_nop_fill`        |Works out of the box             |Works out of the box, slow clock and bus analyzer recommended      |
|`rom/02_nop_fffc`        |Build with ADDRESS_MODE=basic    |Works out of the box, slow clock and bus analyzer recommended      |
|`rom/03_first_code`      |Build with ADDRESS_MODE=basic    |Works out of the box, slow clock and bus analyzer recommended      |
|`rom/04_blink_s`         |Build with ADDRESS_MODE=basic    |Works out of the box, attach LEDs to VIA2, needs slow clock        |
|`rom/05_knight_rider`    |Build with ADDRESS_MODE=basic    |Works out of the box, attach LEDs to VIA2, needs slow clock        |
|`rom/06_lcd_test`        |Build with ADDRESS_MODE=basic    |Works out of the box, attach LCD to VIA2, needs slow clock         |
|`rom/07_mem_test`        |Build with ADDRESS_MODE=basic    |Works out of the box, attach LCD to VIA2, needs slow clock         |
|`rom/08_stack_test`      |Build with ADDRESS_MODE=basic    |Works out of the box, attach LCD to VIA2, needs slow clock         |
|`rom/09_serial_test`     |ACIA chip needs to be added      |Works out of the box with R6551, WDC65C51 needs slow clock         |
|`rom/10_blink_c`         |Build with ADDRESS_MODE=basic    |Works out of the box, attach LEDs to VIA2, needs slow clock        |
|`rom/11_int_test`        |Build with ADDRESS_MODE=basic    |Works out of the box, attach LCD and LED to VIA2, needs slow clock |
|`rom/12_handshake_test`  |Not supported                    |Works out of the box, 1MHz clock recommended, onboard LCD port     |
|`rom/13_4bit_lcd`        |Not supported                    |Works out of the box, onboard LCD port                             |
|`rom/14_irq_test`        |Build with ADDRESS_MODE=basic    |Works out of the box, slow clock and bus analyzer recommended      |
|`rom/15_serial_irq`      |ACIA chip needs to be added      |Works out of the box with R6551, 1MHz recommended                  |
|`rom/16_delay_test`      |Not supported                    |Works out of the box, 1MHz clock recommended, onboard LCD port     |
|`rom/17_blink_test`      |ADDRESS_MODE=basic, LED on PB0   |Works out of the box                                               |
|`rom/18_core_program`    |Not supported                    |Works out of the box                                               |
|`rom/19_keyboard_test`   |Not supported                    |Works out of the box                                               |
|`rom/20_convert_test`    |Build with ADDRESS_MODE=basic    |Works out of the box, slow clock and bus analyzer recommended      |
|`rom/21_serial_load_test`|Not supported                    |Works out of the box                                               |
|`rom/22_modem_test`      |ACIA chip needs to be added      |Works out of the box                                               |
|`rom/23_blink_test`      |ADDRESS_MODE=basic, LED on PB0   |Works out of the box                                               |
|`rom/minimal_bootloader` |Not supported                    |Works out of the box                                               |

##### Loadable programs in `load` folder

All the programs in the `load` folder are to be uploaded to the 6502 computer over serial port with XMODEM protocol and require ROM to be flashed with software capable of receiving them. Currently this is `rom/22_modem_test` and `rom/minimal_bootloader`. Following list describes them in more detail:

* `load/01_blink_test` - simple program that blinks onboard LED 10 times, provided to illustrate loadable module build process. This one has been copied to `rom/23_blink_test` to illustrate differences between the two models,
* `load/02_hello_world` - "Hello World" example in a loadable module version,
* `load/03_string_test` - small program written to test string handling library functions,
* `load/04_blink_large` - presents different model of linking loadable code (with included common modules).

As for software compatibility - all the loadable modules require bootloader, and this one, in turn, requires ACIA for operation, so by design these are not compatible with vanilla Ben Eater's build.

##### Loadable modules explained

There is one thing important to consider when working with loadable modules. The idea behind them is to have the possibility to run the same code from RAM and ROM, preferably preserving the former if possible and reducing the loadable file size. The idea is to be able to execute common functions stored in ROM from the code running in RAM.

There are two examples in the code repository demonstrating alternative approaches. Naive one, that assumes that all the code to be executed is included in the loadable module is available in `load/04_blink_large` folder. When built, you will notice it contains all the functions required: `_blink_init`, `_blink_led` and `_delay_ms` compiled and bundled. The only difference between this program and `rom/23_blink_test` is the value of `BUILD_TYPE=` flag in `makefile` resulting in different addressing model being used for code storage.

Now, the second example, provided in `load/01_blink_test` is much more interesting. The binary file is smaller (admittably, not by much, due to inclusion of the loadlib vector array!), but none of the code of the common functions (`_blink_init`, `_blink_led` and `_delay_ms`) is actually bundled in the binary. All these references are provided by stub functions, defined in `common/source/loadlib.s` - each of these functions really contains jump to vector defined in dedicated vector range in ROM (0xf800-0xfff9). This indirection layer enables updates to ROM without needing to recompile all the loadable modules. The only requirement is to keep the order of the calls intact and adding new functions to `common/source/syscalls.s` at the end so to keep previously defined addresses unchanged.

Defining new shared function requires the following:

* implementation of the code in `common/source` folder,
* implementation of the interface include in `common/include` folder,
* adding this new function to `common/source/syscalls.s` module,
* adding stub function to `common/source/loadlib.s` module,
* adding new objects to `rom/minimal_bootloader/makefile` and `rom/22_modem_test/makefile`.

The list above should help you understand how this code reusability has been achieved.

## Printed Circuit Boards

[First revision of PCBs](https://github.com/dbuchwald/6502/releases/tag/pcb-v001) have been released (one for modified clock module and one for the computer itself). PCBs can be ordered here (**please note: I get small commission in coupons from PCBWay when ordering using these links**. If you don't want that to happen, please download gerbers from the GitHub rulease page and order directly via PCBWay home page):

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
