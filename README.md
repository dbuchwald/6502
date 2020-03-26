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

1. Added [automatic power-up reset circuitry](Schematics/#automatic-power-on-reset),
2. Changed [address decoder logic](Schematics/#address-decoder-change) (**very important from compatibility perspective**),
3. Changed [LCD interface](Schematics/#lcd-interface-change) from 8-bit to 4-bit (**very important from compatibility perspective**),
4. Added [additional VIA chip](Schematics/#extra-via-chip) to provide easy expansion of the system,
5. Added [ACIA chip for serial communication](Schematics/#extra-acia-chip-for-serial-communication),
6. Added (**optional - more on that later**) [USB-UART interface](Schematics/#extra-usb-uart-interface-chip) for easy connectivity with PC,
7. Added [PS/2 keyboard port and ATtiny4313-based keyboard controller](Schematics/#ps2-keyboard-interface-and-attiny4313-based-controller) to provide proper replacement for five pushbuttons in Ben's design,
8. Added [expansion port](Schematics/#expansion-port) (not really deviation from Ben's build, save for one detail - unlike Ben's build, my version can support various interrupt sources, including the expansion port),
9. Modified [clock module](Schematics/#modified-clock-module) (external),
10. Changed [compilator from VASM to CC65](Schematics/#migration-from-vasm-to-cc65),
11. Added [simple way to choose clock source](Schematics/#clock-input).

You might be wondering if this means that you can't run Ben's programs on this build - and the answer is **YES YOU CAN**. Indeed, some changes to the code are necessary, but thanks to the additional VIA chip and with some changes to the addressing mode you can run any program from Ben's videos. If you want to use LCD in 8-bit mode, you can also use the additional VIA for it, ignoring the built-in LCD connector.

By the way, the opposite is also true - **you can compile and run my programs on Ben's computer**. There are special compilation flags that enable usage of Ben's address decoder. I will describe this in more detail in software section.

Detailed description and rationale for each change is discussed in [Schematics README](Schematics).

## Getting started

Okay, so it should be pretty clear what this project is about, so how to start playing with it? That really depends on what you decide to do:

* Stick with Ben Eater's build and just use subset of provided software (either to install it in EEPROM, or just use it as reference for your own hacking),
* Build your own breadboard design based on this one with any modifications you can think of,
* Order PCBs of my build, solder the components and run provided software to see how it works and get started with your own designs.

To start from scratch it's actually easiest to select last option - after some waiting you will end up having pretty solid base to extend your design on.

### Using provided software with Ben's build

If you decide to go down that route, head straight to the `Software` folder, where you will find several programs either identical or similar to what Ben has shown in his videos, but built with much more versatile toolchain.

If you want to read more, go ahead and read [Software folder](Software) section. Make sure to check out the [building software](Software/#building-software) subsection, as it explains how to compile programs to run on Ben's build directly.

### Build your own breadboard design

Maybe you have already started expanding on Ben's build, or maybe you are just considering it now. If you want to check out how I did certain things, jump right into `Schematics` [folder](Schematics), where you will find KiCAD projects for all the components used in this project. Obviously the most important one is the `65C02_Computer` project, but there are some additional goodies there.

**Please note:** This part is not very well documented, I have assumed that anybody willing to dig into these schematics already knows how to read them.

Most of the decisions made during the schematic design were explained above. Justification for anything not covered here can be probably found in the [invaluable 6502 primer](http://wilsonminesco.com/6502primer/).

### Using my PCB design

This will be explained in the most detail, obviously. Start with getting [the PCBs](Schematics/#ordering-pcb). **Please note:** clock module is entirely optional, but really useful for single stepping or slow clocking required by Ben Eater's design of Arduino Mega based bus analyzer. As explained in number of places here, you can either order PCBs from PCBWay directly or use your manufacturer of choice - it should have no impact on the final result.

## What's in the repo

Everything, basically. Schematics of the 6502 board, modified clock module, address decoder and other circuits I built during the project. Arduino sketches I used for debugging and simple programs used to test different features.

And, last but not least, full set of sample programs to follow Ben's videos on my build plus my own bootloader/OS. The last two things are coming soon :)

### `Arduino` folder

There are several sketches there, and their full description is available is [separate README](Arduino).

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

There is dedicated [README](Schematics) in the folder, containing all the build-related details.

### `Software` folder

This one is the most important folder, as it contains range of different programs to play with the 6502 computer. Large subset of this programs can be built for Ben Eater's version of the 6502 computer without any changes. Some of them, however, use features available only in this build, like ACIA or keyboard connector. These can still be ran on Ben Eater's 6502 computer, assuming that compatible hardware is added to it.

The `Software` folder is currently divided into four main parts:

* `build` - temporary folder where all the build artifacts are created, including ROM binaries to be uploaded to EEPROM,
* `common` - common sources: include files with common constants, sources with shared function, configuration files for different address decoder logic modes, shared makefile used by all projects and small python script to optimize size of loadable modules,
* `rom` - set of projects used to create various ROM images to follow Ben's videos, test different features of the board and **some day** complete operating system for the computer,
* `load` - set of project containing loadable modules. These can be uploaded at runtime, without the need to flash the EEPROM. Basic bootloader is required, obviously, and the usage instructions are provided below.

There is also one "master" makefile located directly in the `Software` folder - it will build all the projects in `rom` and `load` subfolders.

There is dedicated [README](Software) in the folder, containing all the software-related details.
