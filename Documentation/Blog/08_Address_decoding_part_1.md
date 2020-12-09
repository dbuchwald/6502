# But it just works...

What I find really amazing is how small, seemingly insignificant experiences can have enormous impact on us, how they can shape our path. For me one of those things was rather not-that-important article written by one of my professors, when I was still at the university. It was great piece called "The essay about Fibonacci Sequence", and the idea was pretty simple: to start with the simplest working algorithm to calculate n-th Fibonacci number, and improve the performance step by step.

Some of the tricks were trivial, others less so, and in general, there was nothing groundbreaking about the method. As far as I recall, the optimal solution was to calculate n-th power of some matrix, but that doesn't matter really. What does, however, was that the person who wrote the article didn't focus simply on the result, but deliberately made all the silly mistakes along the way to illustrate how they compound to impressive performance drop.

Following that path taught me one of the first important lessons in IT: it doesn't matter if it works. Everybody (or almost everybody) can make it work; the thing is to make it right, or at least try your best to do so.

## Address decoding for 6502

One of the things I absolutely love about 6502 is how simple this CPU is: just a handful of registers, basic system bus and memory-mapped I/O. Everything is just an address, be that RAM, ROM or serial interface. This makes programming model very simple and easy to read. I would even argue that this architecture is best suited to teaching basics of programming. And yes, I do know how it sounds - using assembler to learn programming - but try to think about it for a moment. There are just several variables, no data types, no abstractions, memory management and such. Simple instructions, data fetched from uniform cells and saved the same way.

Unfortunately, there is a downside to this simplicity. Most basic 6502 builds (like Ben Eater's BE6502 or my own DB6502 v1) use simple logic gates to map memory addresses to specific hardware devices (reads/writes at address 0x0100 go to RAM, while 0xFFFC usually to ROM). This model is usually sufficient for most of the applications, but there is some inefficiency there. Vanilla BE6502 wastes 16KB (25%) of available memory just to access single VIA chip. My own build wastes 8KB (12.5%) to provide access to several I/O devices (up to 10), so it's a bit better, but honestly - all you need is 16 bytes per device, so you should not waste more than 256 bytes (one page) for the whole I/O region.

By the way, if the above is not perfectly clear, please let me know in the comments, I can explain it more, but truth be told - Ben's explanation in his video should be sufficient.

## Can it be done better?

Sure thing. Anyone looking for better solution will sooner or later stumble across the [invaluable 6502 primer](http://wilsonminesco.com/6502primer/). There is [whole section](http://wilsonminesco.com/6502primer/addr_decoding.html) about address decoding there. I strongly suggest you take a look, there are some nice ideas and important details to keep in mind (mostly - importance of propagation delay).

You usually end up with two possible options: use 74xx logic gates (and quite a lot of them) to narrow down I/O memory range, or use [PLD](https://en.wikipedia.org/wiki/Programmable_logic_device). The former is perfectly sufficient for plenty of applications (remember - many of the original computers from the 80s didn't even use the full 64KB range and they were powerful enough to run plenty of software), while the latter, while providing the best results (high performance and low memory range waste), might be intimidating for beginner user. There are some strange tools to be used with weird syntax and ancient interface. There must be a way to navigate those, right?

# How not to share knowledge

I really admire all the people who spent countless hours trying to figure out all the weird stuff about 8-bit computers. They did amazing job, and the fact that they found the time to document all this is awesome. That being said, there are some things I don't like about the 6502 primer, like the fact that some broad statements are presented like universal truth, while being perfectly subjective and not applicable to all readers. There is the infamous WDC 65C51 bug, and the fact that 6502 primer community makes it much more of a problem than it really is - but this is topic for another post.

Unfortunately, there are also some code examples shared by this community that are very, very bad. What's worse, they are bad in a way that gets replicated over and over. There is awesome metric for technical debt described [here](https://technology.riotgames.com/news/taxonomy-tech-debt), and it's contagion. Very important one!

In this post I want to show you the evolution of address decoder code for the ATF22V10C. For me the starting point was [this post](http://sbc.rictor.org/decoder.html).

```
/*
 * Inputs:  All are signals from the 6502, 65C02, 65816
 */

Pin 1  =  PHI2;
Pin 2  =  RW;
Pin 3  =  A15;
Pin 4  =  A14;
Pin 5  =  A13;
Pin 6  =  A12;
Pin 7  =  A11;
Pin 8  =  A10;
Pin 9  =  A9;
Pin 10 =  A8;
Pin 11 =  A7;
Pin 13 =  A6;
Pin 14 =  A5;
Pin 15 =  A4;
/*
 * Outputs:  define outputs - all are simple combinatorial
 */
Pin 23 = OE;     /* to RAM and ROM chips */
Pin 22 = WE;     /* to RAM and ROM chips */
Pin 21 = RAM;    /* to RAM /CS pin */
Pin 20 = ROM;    /* to ROM /CS pin */
Pin 19 = CS1;    /* to IO Device #1 /CS */
Pin 18 = CS2;    /* to IO Device #2 /CS */
Pin 17 = CS3;    /* to IO Device #3 /CS */
Pin 16 = CS4;    /* to IO Device #4 /CS */

/*
 * Logic:  All outputs are active low signals in the target system.
 */

ROM = !A15;
RAM = A15 # (!A14 & !A13 & !A12 & !A11 & !A10 & A9 & !A8);
CS1 = !(!A15 & !A14 & !A13 & !A12 & !A11 & !A10 & A9 & !A8 & !A7 & !A6 & !A5 & !A4);
CS2 = !(!A15 & !A14 & !A13 & !A12 & !A11 & !A10 & A9 & !A8 & !A7 & !A6 & !A5 & A4);
CS3 = !(!A15 & !A14 & !A13 & !A12 & !A11 & !A10 & A9 & !A8 & !A7 & !A6 & A5 & !A4);
CS4 = !(!A15 & !A14 & !A13 & !A12 & !A11 & !A10 & A9 & !A8 & !A7 & !A6 & A5 & A4);
WE = !(PHI2 & !RW);
OE = !(PHI2 & RW);
```

Please note: this is not the whole source, I just took the important bit to discuss.

## So - does it work or not?

Sadly, it does. If you take the code (download the whole package [here](http://sbc.rictor.org/download/dec1.zip)), and open this in WinCUPL application, it will compile just fine. If you want to play with it, there is [very good post](https://www.reddit.com/r/beneater/comments/eqsw4c/65c02_address_decoding_with_a_plc/) on Reddit with details of software installation and alternative, derived code, that I will use for illustration later.

Now, what do you think, is this code easy to read? Maintain? Doesn't seem so, right?

The problem with the code above is that for someone like myself (as in: somebody that sees it for a very first time), it just looks like it has to be. After all, PLDs are simple devices with simple fuses between basic logic gates, and this code looks like it represents the internal contents almost literally. I figured this is how it must look, and I just wrote my own version of it, but based on my own requirements.

Now, at this point I don't want to get into many more details, it will be described elsewhere, but the basic idea for memory map of DB6502 version 2 would be as follows:

| Start address | End address | Description              |
| ------------- | ----------- | ------------------------ |
| 0x0000        | 0x01FF      | RAM (zeropage and stack) |
| 0x0200        | 0x02FF      | I/O shadow region        |
| 0x0300        | 0x7FFF      | RAM                      |
| 0x8000        | 0xBFFF      | Extra RAM or Low ROM     |
| 0xC000        | 0xFFFF      | High ROM                 |

Most of this is pretty trivial, but there is one detail. It's not very important in the context of this post, but just for clarity: memory segment 0x8000-0xBFFF is 16KB that can be switched at runtime between RAM (for more memory-hungry programs) and ROM (where I plan to keep additional programs like MS BASIC interpreter). This way user can decide at runtime whether she wants to have access to extra memory or extra software. Quite frankly - the only reason I want to do it is to play with the memory banking concept, just to try it out.

## First source code iteration

So, I took the samples I had and came up with the following code:

```
/*
 * Inputs:  All are signals from the 6502, 65C02, 65816
 */

Pin 1  =  CLK;
Pin 2  =  RW;
Pin 3  =  EXRAM;
Pin 4  =  A15;
Pin 5  =  A14;
Pin 6  =  A13;
Pin 7  =  A12;
Pin 8  =  A11;
Pin 9  =  A10;
Pin 10 =  A09;
Pin 11 =  A08;
/*
 * Outputs:  define outputs - all are simple combinatorial
 */
Pin 23 = WE;     /* to RAM and ROM chips */
Pin 22 = OE;     /* to RAM and ROM chips */
Pin 21 = RAM1;   /* to RAM1 /CS pin */
Pin 20 = RAM2;   /* to RAM2 /CS pin */
Pin 19 = ROM;    /* to ROM  /CS pin */
Pin 18 = IOCS;   /* to IOCS pin */

/*
 * Logic:
 */

WE   = !(CLK & !RW);
OE   = !(CLK & RW);
RAM1 = A15 # (!A14 & !A13 & !A12 & !A11 & !A10 & A09 & !A08);
RAM2 = !(A15 & !A14 & EXRAM);
ROM  = !A15 # (!A14 & EXRAM);
IOCS = !A15 & !A14 & !A13 & !A12 & !A11 & !A10 & A09 & !A08;
```

Now, does it work? How do I find out? Obviously, I can test it with Arduino, just like I did with my [first idea of a memory decoder](https://www.reddit.com/r/beneater/comments/ej3lqi/65c02_address_decoder_for_32k_ram_24k_rom_and_2/). Problem with this approach is that those chips can survive only about 100 writes according to the [datasheet](http://ww1.microchip.com/downloads/en/DeviceDoc/doc0735.pdf). You don't want to flash them for every test, because it's quite probable that it will fail, and you run out of cycles quickly.

The thing is that I noticed in the aforementioned Reddit post that it was possible to use simulator for the PLD for logic testing. Details can be found [here](https://gist.github.com/jco2641/1146407eb2ec3f7b878f308369b9e9a2).

Again, being complete novice, I took it for granted - this is how it's supposed to look. I wrote my own version:

```
ORDER: CLK, RW, EXRAM, A15, A14, A13, A12, A11, A10, A09, A08, WE, OE, RAM1, RAM2, ROM, IOCS; 


VECTORS:
00000000000******
10000000000******
01000000000******
11000000000******
00010000000******
01010000000******
10010000000******
```

Obviously, this is just a small part of the file, I had plenty of vectors to test. I ran it with the simulation module and the output was pretty hard to read, but in the end it seemed that I have working code.

What bothered me was this part here:

```
RAM1 = A15 # (!A14 & !A13 & !A12 & !A11 & !A10 & A09 & !A08);
RAM2 = !(A15 & !A14 & EXRAM);
ROM  = !A15 # (!A14 & EXRAM);
IOCS = !A15 & !A14 & !A13 & !A12 & !A11 & !A10 & A09 & !A08;
```

You can clearly see repeated terms. I was wondering if I could do something like:

```
IO_RANGE = !A14 & !A13 & !A12 & !A11 & !A10 & A09 & !A08;
EXRAM_RANGE = !A14 & EXRAM;

RAM1 = A15 # IO_RANGE;
RAM2 = !(A15 & EXRAM_RANGE);
ROM  = !A15 # EXRAM_RANGE;
IOCS = !A15 & IO_RANGE;
```

I never tried, and I have almost ended it here. I was just about to flash the chip and start testing with my Arduino tester. Luckily, about a month or so, I started e-mailing with somebody who works in the field of EE for many, many years. I sent my files to him just to check what he thinks, and this is where the things got really, really interesting.

## Second code iteration

The reply I got was, quote:

> One other thing - have you tried this syntax? I don't know whether your tool supports it.
>
> Field address = [A15..0];
>
> IOCS = address:[0200..02FF];
> !ROM = address:[8000..BFFF];

I was like: oh man, this is amazing. **OH MAN, I HAVE TO TRY THAT!**

After spending some time to figure out the detailed syntax, this is what I came up with:

```
/*
 * Inputs:  All are signals from the 6502, 65C02, 65816
 */

Pin 1  =  CLK;
Pin 2  =  RW;
Pin 3  =  EXRAM;
Pin 4  =  A15;
Pin 5  =  A14;
Pin 6  =  A13;
Pin 7  =  A12;
Pin 8  =  A11;
Pin 9  =  A10;
Pin 10 =  A9;
Pin 11 =  A8;
/*
 * Outputs:  define outputs - all are simple combinatorial
 */
Pin 23 = WE;      /* to RAM and ROM chips */
Pin 22 = OE;      /* to RAM and ROM chips */
Pin 21 = RAM1_CS; /* to RAM1 /CS pin */
Pin 20 = RAM2_CS; /* to RAM2 /CS pin */
Pin 19 = ROM_CS;  /* to ROM  /CS pin */
Pin 18 = IO_CS;   /* to IOCS pin */

/*
 * Local variables
 */

FIELD Address = [A15..A00];

/*
 * Logic:
 */

RAM       = Address:[0000..7FFF];
IO_SHADOW = Address:[0200..02FF];
RAM_EXTRA = Address:[8000..BFFF];
ROM       = Address:[8000..FFFF];

!WE       = CLK & !RW;
!OE       = CLK & RW;
!RAM1_CS  = RAM & !IO_SHADOW;
!RAM2_CS  = EXRAM & RAM_EXTRA;
!ROM_CS   = ROM & !(EXRAM & RAM_EXTRA);
IO_CS     = IO_SHADOW;
```

Now, let's go over the changes.

1. FIELD definition - allows you to group related signals into smaller, simpler data elements that are automatically translated to logical terms,
2. Ranges used to construct logic terms. For instance: range 0x8000..0xFFFF is automatically translated to term A15 (input data matches every address in the range when A15 is true). In similar fashion range 0x0200..0x2FF translates to !A15 & !A14 & !A13 & !A12 & !A11 & !A10 & A09 & !A08 - but it's all done by CUPL compiler, 
3. Signals can be negated by putting exclamation mark before them (i.e. !WE = ...) making the syntax easier to read. Convention is to use this with active low signals, and if you read it, you will see that WE is active when CLK is high and RW is low. Now, you could write WE = !(CLK & !RW) or even WE = !CLK # RW. All these are equal, but harder to read.

The best thing about the new syntax is that it's fully self-explanatory, easy to maintain and to check.

What is the range of I/O shadow area? 0200..02FF. Simple. Want to move it? Change the range definition and you're done.

Where should the RAM chip be active (active low, to be precise)? Clear to read: if the address is in the RAM range (defined as 0000..7FFF) and not in IO_SHADOW range.

When should the second RAM chip be active (low)? If the address is in 8000..BFFF range and EXRAM flag is enabled.

For me that's awesome, huge improvement. Still, as nice as the source looks like, I had to test it. My new simulator input looked like this:

```
ORDER: CLK, RW, EXRAM, A15, A14, A13, A12, A11, A10, A9, A8, WE, OE, RAM1_CS, RAM2_CS, ROM_CS, IO_CS; 


VECTORS:
00000000000******
10000000000******
01000001000******
11000000000******
00010000000******
01010000000******
10010000000******
```

Again, it was truncated.

I ran this via the simulator again, and checked the output line by line to confirm it was as expected. It was!

Again, I have almost ended it here, but I kept thinking that it can't be it. There must be something I can do better. This manual testing is time consuming and error prone. I wish I could write my test vectors with defined expected output values. This time I just went through the examples provided with WinCUPL application, and it turned out my intuition was spot-on.

## Third and final iteration

This time I had to change the source just a bit, to enable correct data simulation. Main source was changed only here:

```
FIELD Address = [A15..A8];
```

It was required for the new layout of simulation input file:

```
ORDER: CLK, %2, RW, %5, EXRAM, %1, Address, %3, WE, %3, OE, %5, RAM1_CS, %5, RAM2_CS, %4, ROM_CS, %2, IO_CS; 


VECTORS:
$MSG  "                 Address decoder test                   ";
$MSG  "      CLK RW EXRAM  ADDRESS WE# OE# RAM1# RAM2# ROM# IO ";
$MSG  "      --- -- ----- -------- --- --- ----- ----- ---- -- ";
000 '00' HHLHHL
010 '00' HHLHHL
100 '00' LHLHHL
110 '00' HLLHHL
000 '01' HHLHHL
010 '01' HHLHHL
100 '01' LHLHHL
110 '01' HLLHHL
000 '02' HHHHHH
010 '02' HHHHHH
```

As previously, file was truncated.

What happened here? This is the list of changes:

1. I no longer input specific values in the A15..A8 fields. Instead, I use Address field representing the MSB of the address. 00 represents addresses 0000..00FF, 02 represents 0200..02FF and so on. This makes test case vectors significantly shorter and much easier to read,
2. Between the data fields there are %n entries - these force n spaces between fields in the generated report to justify it in more readable manner,
3. Added whole $MSG section that produces nice header to the generated report,
4. Last but not least: each vector contains expected output values. For instance (vector number 4) if the clock is high, RW line high and EXRAM line low (110), and the address is in range 0000..00FF ('00'), I expect WE flag to be high, OE flag to be low, RAM1 to be enabled (low), RAM2 to be disabled (high), ROM to be disabled (high) and IO to be disabled as well (high), so the expected output is HLLHHL.

Now, if I made mistake in my code (or my test vectors), compilation would fail. When running simulation, I would get detailed report which vectors failed and which field didn't match expected value.

And, if I ran it with the graphical simulator, it would clearly indicate incorrect values in the respective fields.

Now, scroll back to the original version of the code and compare it. It makes the world of difference, doesn't it?

As usual, please let me know in the comments if you have any questions or remarks. I will be field-testing my PLD tomorrow, and most likely will post here the results in couple of days.