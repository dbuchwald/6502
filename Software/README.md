# 6502 system software

This documentation provides necessary insight into software provided in the repository, and it is organized in the following sections:

- [Getting started with provided software](#getting-started-with-provided-software),
- [Building software](#building-software),
- [Detailed description of modules in software folder](#detailed-description-of-modules-in-software-folder).

## Getting started with provided software

Before discussing the details of the contents, I will show how to use sample programs for smoke testing of the soldered board.

I recommend running first couple of programs in slow clock mode, so with external clock module, with Arduino Mega based bus analyzer.

### Connecting Arduino Mega

First, make sure you have the 6502-monitor program installed on your Arduino Mega board. You will find it in `Arduino/6502-monitor` folder.

Connect pins as per following table:

| Expansion port pins   | Arduino Mega pins |
| --------------------- | ----------------- |
| D0-D7 (data bus)      | 53-39             |
| A00-A15 (address bus) | 52-22             |
| CLK (system clock)    | 2                 |
| R/W (read/write)      | 3                 |
| GND                   | GND               |
| +5V                   | +5V               |

**PLEASE NOTE: Connections are reversed for convenience. D0 is connected to pin 53, D1 to pin 51, A00 to pin 52 and A15 to pin 22.**

Also, connect clock module as follows:

| Computer connection          | Clock module connection |
| ---------------------------- | ----------------------- |
| CLK input (middle pin on J1) | CLK output              |
| UART +5V                     | +5V                     |
| UART GND                     | GND                     |

It might seem strange that the clock module is powered from UART port, but in fact it doesn't matter which of the power outputs you choose. I use this one, since this one is closes to the clock connector (J1). This is one thing I didn't consider when designing the PCB - I provided GND reference in J1, but the power is missing...

The whole thing will be powered from Arduino via USB - don't worry, the load will not be too high.

### Setting up development environment

Development environment requires the following tools:

- `make` to invoke all the below,
- `cc65` compiler, available [here](https://github.com/cc65/cc65),
- `minipro` software to upload ROM image to EEPROM, available [here](https://gitlab.com/DavidGriffith/minipro/),
- `hexdump` for testing the contents of the binaries,
- `md5sum` to generate binary checksum,
- `rm` and `mkdir` for folder/file manipulation,
- `picocom` for serial communication with the computer (Linux/MacOS),
- `ExtraPuTTy` for serial communication and upload (Windows specific),
- `sz` for loadable module upload via `picocom` (Linux/MacOS),
- `python` to run small utility written in Python to trim loadable modules and add start vector,
- `x6502` to run computer emulator (enables execution of generated binaries on PC), available [here](https://github.com/dbuchwald/x6502) - **please note: this one is optional, still in development, and lagging behind the actual computer.** Simple programs can be executed, but anything more complex than LCD operation (including ACIA/keyboard) don't work just yet.

One important thing to note is that you might need to install FTDI Virtual COM Port drivers, and it applies to all operating systems.

#### Setting up development environment under Linux

By default, Linux distro should contain most of the needed tools. You might need to install `git` to clone `cc65` and `minipro` repositories to build them. The latter requires also `pkg-config` package in Debian/Ubuntu. `sz` might not be available, so check your distro manual for details.

#### Setting up development environment under MacOS

You will probably need `brew` to install `make` and `git`. Tricky part is missing `md5sum` utility, which can be installed using:

```shell
brew install md5sha1sum
```

Other than that, `sz` will probably be missing, so you might need to install this one as well.

#### Setting up development environment under Windows

This one seems to cause most issues, while it's not really that difficult. You need to install [Cygwin](https://cygwin.com/), but while installing, make sure you add the following packages: `python2`, `pkg-config`, `git`, `make`. This should be enough to clone `cc65` and `minipro` repositories, and after building them make sure to issue `make avail` and `make install` respectively to enable invocation from command line.

For serial communication you can use regular PuTTy, but it doesn't have the feature of sending files using XModem protocol, required for loadable module support. Since this is important feature of this hardware/software stack, it's really recommended to use ExtraPuTTy instead.

**PLEASE NOTE:** You might be able to use virtual machines or Windows Subsystem for Linux (WSL) - but neither of the two worked correctly with `make install` target that uses TL866II+ programmer to flash the ROM. YMMV.

### Running the simplest possible program

Now you need to build the first program. Go to `Software/rom/01_nop_fill` folder and run:

```shell
make clean all test
```

You expect output similar to the following:

```text
$ make clean all test
rm -f ../../build/rom/*.bin \
rm -f ../../build/rom/*.raw \
../../build/rom/01_nop_fill/*.o \
../../build/rom/01_nop_fill/*.lst \
../../build/rom/01_nop_fill/*.s \
../../build/rom/*.map \
../../build/common/*.o \
../../build/common/*.lst \
../../build/common/*.s \
../../build/common/*.lib
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/rom/01_nop_fill/nop_fill.o -l ../../build/rom/01_nop_fill/nop_fill.lst nop_fill.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/zeropage.o -l ../../build/common/zeropage.lst ../../common/source/zeropage.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/sysram_map.o -l ../../build/common/sysram_map.lst ../../common/source/sysram_map.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/syscalls.o -l ../../build/common/syscalls.lst ../../common/source/syscalls.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/acia.o -l ../../build/common/acia.lst ../../common/source/acia.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/blink.o -l ../../build/common/blink.lst ../../common/source/blink.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/core.o -l ../../build/common/core.lst ../../common/source/core.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/keyboard.o -l ../../build/common/keyboard.lst ../../common/source/keyboard.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/lcd.o -l ../../build/common/lcd.lst ../../common/source/lcd.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/modem.o -l ../../build/common/modem.lst ../../common/source/modem.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/string.o -l ../../build/common/string.lst ../../common/source/string.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/utils.o -l ../../build/common/utils.lst ../../common/source/utils.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/via.o -l ../../build/common/via.lst ../../common/source/via.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/via_utils.o -l ../../build/common/via_utils.lst ../../common/source/via_utils.s
ca65 --cpu 65C02 -Dfastclock=1 -I ../../common/include -o ../../build/common/tty.o -l ../../build/common/tty.lst ../../common/source/tty.s
ar65 r ../../build/lib/common.lib ../../build/common/zeropage.o ../../build/common/sysram_map.o ../../build/common/syscalls.o ../../build/common/acia.o ../../build/common/blink.o ../../build/common/core.o ../../build/common/keyboard.o ../../build/common/lcd.o ../../build/common/modem.o ../../build/common/string.o ../../build/common/utils.o ../../build/common/via.o ../../build/common/via_utils.o ../../build/common/tty.o
ld65  -C ../../common/firmware.ext.cfg -m ../../build/rom/01_nop_fill/01_nop_fill.ext.map -o ../../build/rom/01_nop_fill.ext.bin ../../build/rom/01_nop_fill/nop_fill.o ../../build/lib/common.lib
hexdump -C ../../build/rom/01_nop_fill.ext.bin
00000000  ea ea ea ea ea ea ea ea  ea ea ea ea ea ea ea ea  |................|
*
00008000
49d01fd92a6a02370364f8eef2ee2c93 *../../build/rom/01_nop_fill.ext.bin
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

### More complex programs

After having ran the first one, try executing the following programs:

- `Software/rom/02_nop_fffc` - this one will jump to the beginning of the accessible ROM address space and will confirm your address decoder functions correctly,
- `Software/rom/03_first_code` - this is another program taken directly from Ben's videos - it will store value 0x42 in the address 0x6000. Please note: this will have no effect whatsoever.

Now, if the both above work as expected (when checked using bus analyzer), you can try connecting peripherals to your computer. If you want to follow Ben's videos, keep reading this section, otherwise, skip to [next one](#initiate-warp-speed).

First, let's play with some LEDs. Using the connectors in bottom left corner of the PCB, connect 8 LEDs to VIA2 PORTB lines PB0-PB7, and then, using current limiting resistors of 220Ohm, connect these to ground (also from the VIA2 PORTB connector).

Having these connected, upload `Software/rom/04_blink_s` or `Software/rom/05_knight_rider` to your ROM. After powering on, you should see LEDs blinking in a way similar to what Ben did in his videos. If it works correctly, you can move on to connecting LCD. For now, use it in 8-bit mode with slow clock - just as in Ben's videos.

To do this, connect LCD to breadboard (not to the dedicated LCD port on PCB), and then connect each line as listed below:

| VIA2 Pin | LCD Pin |
| -------- | ------- |
| PA5      | RS      |
| PA6      | R/W     |
| PA7      | E       |
| PB0      | DB0     |
| PB1      | DB1     |
| PB2      | DB2     |
| PB3      | DB3     |
| PB4      | DB4     |
| PB5      | DB5     |
| PB6      | DB6     |
| PB7      | DB7     |

Also, connect A and VDD connectors to +5V, K and VSS to GND and connect V0 to a middle pin of 10KOhm potentiometer plugged between GND and +5V.

Now upload program `Software/rom/06_lcd_test` to ROM - when executed, it should display "Merry Christmas!" message on the LCD.

If it works correctly, follow with `Software/rom/07_mem_test` and `Software/rom/08_stack_test` - these will test if RAM works as expected: first one will copy data from ROM to RAM, while the second will use stack routines. Congratulations, you have working CPU, ROM, RAM, VIA and address decoder!

### Initiate warp speed

Now it's time to go a bit faster and test the more complex features. Please note: you could keep using the analyzer and external clock with these programs, you just have to remember to build them with `CLOCK_MODE=slow` flag. More details can be found in [building software section](#building-software).

For now let's assume we move to 1MHz clock. To do it, put jumper on two leftmost pins of clock connector (J1). Disconnect external clock and bus analyzer - first one is not needed, second one will not work with high frequencies anyway. Connect your LCD to onboard LCD port and upload `Software/rom/13_4bit_lcd` to your ROM. Upon boot you expect to see message "Hello 4-bit! Chars!" on your screen. If it works, it means that the primary VIA works just fine and clock is OK.

Next one to test will be serial connection, so upload `Software/rom/15_serial_irq`. Now, depending on whether you soldered on FT230X chip or not, connect your board using USB cable to PC (using either MicroUSB or USB-B port), or use external USB->UART connector. Connect to your board using `picocom` with baud rate of 19200.

```shell
picocom -b 19200 /dev/tty.usbserial-HANF88HD
```

When you get "Terminal ready" message, press any key - you should get a response of "Hello IRQ>". This means that two things are working correctly: interrupt handling and serial communication. Congratulations, you are almost ready to go.

### Keyboard connection

Even if you don't intend to use keyboard just yet, you still need to upload the controller sketch to ATtiny4313. Recommended way of doing that is to use onboard AVR-ISP connector and some kind of AVR programmer. I used USBasp programmer and it works lovely directly from Arduino IDE. The sketch to upload is in `Arduino/keyboard-4313` folder. **PLEASE NOTE:** by default, Arduino IDE will not set fuses of your ATtiny4313 to reflect your clock settings. This can result in unpredictable behavior and/or failure of keyboard connection. Make sure you invoke "Tools->Burn bootloader" before uploading the sketch to ensure correct operation. See [issue #50](https://github.com/dbuchwald/6502/issues/50) for additional details.

After successful sketch upload, flash your rom with `Software/rom/19_keyboard_test`. Connect your PS/2 keyboard to the port and try pressing some keys - you should see messages on the LCD with confirmation.

### Using the bootloader

Currently only the minimal bootloader is provided, but it should be sufficient for software development without constant need to reflash the EEPROM. To use it, build ROM image in `Software/rom/minimal_bootloader` folder and flash it to EEPROM. To test this functionality, you have to build example loadable programs in `Software/load/01_blink_test` and `Software/load/02_hello_world`.

**PLEASE NOTE:** Both the bootloader and sample programs will be built automatically when invoking `make all` directly in `Software` folder.

Upon boot you will be prompted to connect to the PC via serial connection and press Enter key - either in terminal window if keyboard is not connected, or on the keyboard otherwise. Connection details will be displayed on the LCD:

- 19200 baud,
- 8-bit, no parity, 1 stop bit,
- CTS/RTS hardware flow control.

In MacOS/Linux you can use `picocom` for this operation, under Windows I have successfully used [ExtraPuTTy](https://www.extraputty.com/).

After connection is established you need to press enter as prompted (either on PS/2 keyboard or terminal window) and you will be prompted to initiate file transfer. In `picocom` this requires that your send command is set to `sz -X` (see `make terminal` target in `Software/common/makefile`) and you initiate transfer with Ctrl+A followed by Ctrl+S. Enter load file path (i.e. `Software/build/load/01_blink_test.load.bin`) and press enter. If the transfer fails, try again. `picocom` seems to fail every now and then, while ExtraPuTTy hardly ever has any issues.

In ExtraPuTTy open "Files Transfer" menu item, then "Xmodem" and "Send". Point to loadable module (i.e. `Software/build/load/02_hello_world.load.bin`) and click "Open" button.

Program should load and be automatically executed. Congratulations, you got yourself working bootloader!

### Installing OS/1

OS/1 is simple operating system, currently being developed for the machine. It already provides bootloader functionality and more is coming every day. **THIS IS WORK IN PROGRESS, SO EXPECT STABILITY ISSUES**

After installing to ROM and booting, it will display basic startup messages on onboard LCD and prompt you to connect via serial port (19200 baud, no parity, 8 data bits, 1 stop bit, CTS/RTS hardware flow control) and confirm connection by sending single char via serial, if no keyboard is connected to PS/2 port or by pressing Enter key on attached PS/2 keyboard otherwise.

Simple prompt will be displayed, and the following commands are currently supported:

- `HELP` - will display simple help message with basic description of the commands,
- `LOAD` - will initiate XModem file receive operation to enable loading loadable modules (see [Using the bootloader](#using-the-bootloader) section for details),
- `RUN` - will run the loaded program,
- `MONITOR` - will run monitor application that can be used to check/alter contents of computer memory,
- `BLINK` - with parameter `ON` or `OFF` will toggle onboard blink LED state,
- `EXIT` - will exit the shell - and go back to it after soft reset.

Loaded programs might fail or fall into infinite loop. To prevent having to reset them, you can press CTRL+X key combination on attached PS/2 keyboard - this will initiate system break operation and should return you back into the shell.

#### Using built-in monitor application

Currently monitor application is fairly limited, but it should provide sufficient functionality for basic troubleshooting. The following commands are supported:

- `GET` with single address (in format `XX` or `XXXX`) will display data from this address and 15 following bytes,
- `GET` with address range (in format `XXXX:XXXX`, zeropage addresses can be substituted with `XX`) will display all the data within given range,
- `PUT` will store provided value (in format `XXXX=XX`) under given address.

Standard commands like `HELP` and `EXIT` are obviously also supported.

## Building software

General rule is simple: `make` should be sufficient for all the build/installation. The following `make` targets are to be used for building software:

- `all` - build the project,
- `clean` - delete all temporary files,
- `test` - dump the contents and checksum of generated binary file,
- `install` - upload generated binary to AT28C256 chip using `minipro` tool,
- `terminal` - connect to the 6502 computer using serial port, please note - currently uses my own device ID as visible under MacOS and most likely needs to be adapted to your build/OS,
- `emu` - run the generated binary in system emulator. Again: suitable for simple programs, more complex ones are not yet supported. So far I needed it only for simple debugging and that's why it is so limited.

Beside the targets, there are three very important build flags:

- `ADDRESS_MODE` - with acceptable values `basic` and `ext` (the latter being default if omitted) that drives target addressing model. To build for Ben Eater's machine, use `basic` mode; for my build, use `ext` mode. If you want to support your own model, create additional configuration file, as explained in common sources section below,
- `CLOCK_MODE` - used to control internal delay routines to work with different clock setups. The following modes are supported:
  - `slow` - to be used with external clock module, all delays are basically disabled,
  - `250k` - to be used with Arduino Mega Debugger (my own variant running at approx. 275kHz),
  - `1m` - to be used with 1MHz oscillator,
  - `2m` - to be used with 2MHz oscillator,
  - `4m` - to be used with 4MHz oscillator,
  - `8m` - to be used with 8MHz oscillator.
- `LCD_MODE` - with acceptable values `8bit` and `4bit` (the latter being default if omitted) enables build time selection of LCD interface. If your own build of 6502 computer uses 8-bit interface towards LCD, this will let you use provided software with it. The only thing you might want to check is the LCD data and port definitions at the beginning of `common/source/lcd8bit.s` (or, if you are using your own build with 4-bit mode `common/source/lcd4bit.s`) for symbols `LCD_DATA_PORT` and `LCD_CONTROL_PORT`, as well as their DDR counterparts. The same is possible with 4-bit mode, but there is just one symbol - `LCD_PORT` accompanied by DDR counterpart. Default configuration is obviously immediately compatible with 4-bit onboard LCD connector, and 8-bit interface connected to VIA2 PA for control and PB for data (like in BE6502),
- `ACIA_TX_IRQ` - flag was introduced to enable compatibility with WDC65C51 ACIA chip and acceptable values are `0` and `1`. It controls usage of IRQ request to indicate that transmit operation was completed. When disabled (value `0`), fixed time delay is used to wait for the transmit operation to complete. Rockwell R6551 chips can work with both settings, but `1` is recommended.

Build examples:

```shell
make ADDRESS_MODE=basic CLOCK_MODE=slow clean all test install
```

This will build sources with Ben's addressing scheme (16K RAM, 32K ROM, VIA at 0x6000), with support for slow clocking - any delay routines will be skipped. First, all the binaries will be removed, then built from scratch, hexdump of the resulting binary will be displayed and the binary uploaded to the EEPROM, assuming it's connected via minipro-compatible programmer.

```shell
make CLOCK_MODE=1m all test
```

This command will rebuild only modified modules with support for my own addressing scheme (32K RAM, 24K ROM, VIA at 0x9000) and suitable for 1MHz execution - all delays will be enabled.

## Detailed description of modules in `Software` folder

There are quite many programs in the `Software` folder, making the navigation a bit difficult. This section should support you in navigating provided software library.

### ROM images in `rom` folder

In the `rom` folder you will find the following ROM images:

- `01_nop_fill` - simplest possible program, composed of 32K of NOP (0xea) instructions. The source itself seems empty, because default fill is defined in firmware configuration files (`common/firmware.basic.cfg` and `common/firmware.ext.cfg`),
- `02_nop_fffc` - extension of the above program by adding `VECTORS` segment, containing start address for 6502. Address of the `init` label depends on the firmware configuration used,
- `03_first_code` - very simple program that actually executes some code, but there is no effect to be observed,
- `04_blink_s` - first example of a program interfacing with external world, using VIA2 to drive LEDs, as in Ben's videos,
- `05_knight_rider` - modification of the previous one to achieve classic effect,
- `06_lcd_test` - modified version of Ben Eater's first LCD program. Modification involves using loops, but runs without RAM, only ROM is used. This program will work only on slow clock (not 1MHz), and will not work with onboard LCD connector. To execute this one, you need to connect LCD via breadboard to VIA2 connectors on the PCB. When compiled for BE6502 (with `ADDRESS_MODE = basic`) it will work out of the box,
- `07_mem_test` - modification of the previous one, testing RAM module usage - message contents are copied first from ROM to RAM and only then displayed on the LCD,
- `08_stack_test` - modification of the previous one, but this time stack is utilized for JSR/RTS operation showcase,
- `09_serial_test` - simplest possible ACIA/serial testing program, using blocking send/receive operation to send simple message in response to each input on serial terminal,
- `10_blink_c` - modification of `04_blink_s`, but mixing low-level ASM code for hardware handling and C code for "business logic", shows how to use software stack to write code in C,
- `11_int_test` - illustration how to use VIA1 clock timer interrupt - basically displays text on LCD attached to VIA2 while changing LED (connected to VIA2 PA0) state each 50 cycles. Obviously needs to be executed in slow clock mode,
- `12_handshake_test` - very simple program that shows how to use CA1/CA2 hardware handshake operation with keyboard controller, will print on the LCD screen (connected to onboard LCD connector in 4-bit mode!) keys pressed on the attached PS/2 keyboard. Requires 1MHz clock for smooth operation, and is not compatible with BE6502,
- `13_4bit_lcd` - testing program for 4-bit LCD interface, hence not compatible with BE6502,
- `14_irq_test` - small program to run with slow clock showing operation of the VIA1 timer interrupt,
- `15_serial_irq` - interrupt-driven serial communication (both RX and TX), sends static message in response to each input from serial terminal,
- `16_delay_test` - testing program for improved 4-bit LCD library for onboard port, using functions like line wrap and vertical screen scrolling, not compatible with BE6502 because of the 4-bit interface,
- `17_blink_test` - another blink program, but this one uses common library functions to drive onboard LCD. Can be adapted to work with BE6502, you just need to connect the LCD to PB0,
- `18_core_program` - test program used to verify operation of aggregated system init operation, uses onboard LCD to present contents of RX/TX buffer pointers (used in debugging of serial connection),
- `19_keyboard_test` - more complex program presenting integration with onboard keyboard controller, with IRQ driven data transmission, hardware state change detection and pretty interface on the onboard LCD port,
- `20_convert_test` - small testing program to test hex conversion function, aimed at x6502 emulator execution,
- `21_serial_load_test` - attempt to implement testing program for high serial load, counting incoming characters,
- `22_modem_test` - barebone modem testing application, sort of bootloader without user interface,
- `23_blink_test` - copy of `load/01_blink_test` to show how simple `makefile` change can be used to build the same source either as ROM image or bootloader-compatible loadable module,
- `microsoft_basic` - standalone version of MS Basic interpreter working over serial connection,
- `minimal_bootloader` - simplest possible bootloader application that can be used to simplify software development thanks to making ROM flashing unnecessary for each code change,
- `os1` - **work in progress** - basic operating system.

The following table summarizes compatibility of each program with different versions of the 6502 computers:

| Program                   | BE6502 execution notes            | DB6502 execution notes                                                              |
| ------------------------- | --------------------------------- | ------------------------------------------------------------------ |
| `rom/01_nop_fill`         | Works out of the box              | Works out of the box, slow clock and bus analyzer recommended      |
| `rom/02_nop_fffc`         | Build with ADDRESS_MODE=basic     | Works out of the box, slow clock and bus analyzer recommended      |
| `rom/03_first_code`       | Build with ADDRESS_MODE=basic     | Works out of the box, slow clock and bus analyzer recommended      |
| `rom/04_blink_s`          | Build with ADDRESS_MODE=basic     | Works out of the box, attach LEDs to VIA2, needs slow clock        |
| `rom/05_knight_rider`     | Build with ADDRESS_MODE=basic     | Works out of the box, attach LEDs to VIA2, needs slow clock        |
| `rom/06_lcd_test`         | Build with ADDRESS_MODE=basic     | Works out of the box, attach LCD to VIA2, needs slow clock         |
| `rom/07_mem_test`         | Build with ADDRESS_MODE=basic     | Works out of the box, attach LCD to VIA2, needs slow clock         |
| `rom/08_stack_test`       | Build with ADDRESS_MODE=basic     | Works out of the box, attach LCD to VIA2, needs slow clock         |
| `rom/09_serial_test`      | ACIA chip needs to be added       | Works out of the box with R6551, WDC65C51 needs slow clock         |
| `rom/10_blink_c`          | Build with ADDRESS_MODE=basic     | Works out of the box, attach LEDs to VIA2, needs slow clock        |
| `rom/11_int_test`         | Build with ADDRESS_MODE=basic     | Works out of the box, attach LCD and LED to VIA2, needs slow clock |
| `rom/12_handshake_test`   | Not supported                     | Works out of the box, 1MHz clock recommended, onboard LCD port     |
| `rom/13_4bit_lcd`         | Not supported                     | Works out of the box, onboard LCD port                             |
| `rom/14_irq_test`         | Build with ADDRESS_MODE=basic     | Works out of the box, slow clock and bus analyzer recommended      |
| `rom/15_serial_irq`       | ACIA chip needs to be added       | Works out of the box with R6551, 1MHz recommended                  |
| `rom/16_delay_test`       | Not supported                     | Works out of the box, 1MHz clock recommended, onboard LCD port     |
| `rom/17_blink_test`       | ADDRESS_MODE=basic, LED on PB0    | Works out of the box                                               |
| `rom/18_core_program`     | Not supported                     | Works out of the box                                               |
| `rom/19_keyboard_test`    | Not supported                     | Works out of the box                                               |
| `rom/20_convert_test`     | Build with ADDRESS_MODE=basic     | Works out of the box, slow clock and bus analyzer recommended      |
| `rom/21_serial_load_test` | Not supported                     | Works out of the box                                               |
| `rom/22_modem_test`       | ACIA chip needs to be added       | Works out of the box                                               |
| `rom/23_blink_test`       | ADDRESS_MODE=basic, LED on PB0    | Works out of the box                                               |
| `rom/microsoft_basic`     | Not supported                     | Works out of the box                                               |
| `rom/minimal_bootloader`  | Not supported                     | Works out of the box                                               |
| `rom/os1`                 | Not supported                     | Works out of the box                                               |

### Loadable programs in `load` folder

All the programs in the `load` folder are to be uploaded to the 6502 computer over serial port with XMODEM protocol and require ROM to be flashed with software capable of receiving them. Currently this is `rom/22_modem_test` and `rom/minimal_bootloader`. Following list describes them in more detail:

- `load/01_blink_test` - simple program that blinks onboard LED 10 times, provided to illustrate loadable module build process. This one has been copied to `rom/23_blink_test` to illustrate differences between the two models,
- `load/02_hello_world` - "Hello World" example in a loadable module version,
- `load/03_string_test` - small program written to test string handling library functions,
- `load/04_blink_large` - presents different model of linking loadable code (with included common modules),
- `load/05_simple_shell` - simple shell program later moved to `os1` image,
- `load/06_memdump` - initial implementation of simple memory monitor (dumps contents of the memory area used to load programs to verify load operation),
- `load/07_keyboard_test` - modified version of the ROM keyboard test application, implemented mostly to test new key binding (CTRL+X) and required changes in the keyboard controller firmware,
- `load/08_system_break_test` - very simple application: when started, it runs infinite loop. That's all. It was created to demonstrate new OS/1 feature - system break,
- `load/09_monitor` - work in progress implementation of the monitor program (moved to OS/1 image),
- `load/10_menu` - simple application used to test drive common menu library (now included in OS/1 image),
- `load/11_disasm` - simple disassembler application, now included in OS/1 monitor application,
- `load/12_custom_chars` - simple program that defines custom characters for LCD screen,
- `load/13_custom_chars_c` - the same as above, but written using C library bindings,
- `load/14_offset_math` - program written to test offset math operations (used to troubleshoot disassembly issues with relative addressing),
- `load/15_menu_in_c` - another program to illustrate C bindings for OS/1 library functions,
- `load/16_microchess` - original KIM-1 microchess program, ported to work in OS/1 environment, and with slightly improved user interface,
- `load/17_basic` - my own implementation of BASIC interpreter, incomplete and still in progress. Might never be completed (see program `22_msbasic` below),
- `load/18_hello_world` - simple program to illustrate difference between assembly and C code,
- `load/19_hello_world_c` - as above, but written in C,
- `load/20_lcd_bug` - program used to troubleshoot issues with LCD interface running at 8MHz clock,
- `load/21_sysinfo` - simple program to display system information, now embedded in OS/1 image,
- `load/22_msbasic` - port of original Microsoft BASIC code, updated to work as OS/1 loadable module. When all the bugs are solved, it will be embedded in OS/1 image,
- `load/23_t1_test` - simple program demonstrating WDC 65C22 VIA timer operation.

As for software compatibility - all the loadable modules require bootloader, and this one, in turn, requires ACIA for operation, so by design these are not compatible with vanilla BE6502.

### Loadable modules explained

There is one thing important to consider when working with loadable modules. The idea behind them is to have the possibility to run the same code from RAM and ROM, preferably preserving the former if possible and reducing the loadable file size. The idea is to be able to execute common functions stored in ROM from the code running in RAM.

There are two examples in the code repository demonstrating alternative approaches. Naive one, that assumes that all the code to be executed is included in the loadable module is available in `load/04_blink_large` folder. When built, you will notice it contains all the functions required: `_blink_init`, `_blink_led` and `_delay_ms` compiled and bundled. The only difference between this program and `rom/23_blink_test` is the value of `BUILD_TYPE=` flag in `makefile` resulting in different addressing model being used for code storage.

Now, the second example, provided in `load/01_blink_test` is much more interesting. The binary file is smaller (admittably, not by much, due to inclusion of the loadlib vector array!), but none of the code of the common functions (`_blink_init`, `_blink_led` and `_delay_ms`) is actually bundled in the binary. All these references are provided by stub functions, defined in `common/source/loadlib.s` - each of these functions really contains jump to vector defined in dedicated vector range in ROM (0xf800-0xfff9). This indirection layer enables updates to ROM without needing to recompile all the loadable modules. The only requirement is to keep the order of the calls intact and adding new functions to `common/source/syscalls.s` at the end so to keep previously defined addresses unchanged.

Defining new shared function requires the following:

- implementation of the code in `common/source` folder,
- implementation of the interface include in `common/include` folder,
- adding this new function to `common/source/syscalls.s` module,
- adding stub function to `common/source/loadlib.s` module,
- adding new objects to `rom/minimal_bootloader/makefile` and `rom/22_modem_test/makefile`.

The list above should help you understand how this code reusability has been achieved.
