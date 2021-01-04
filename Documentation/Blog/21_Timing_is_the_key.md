# Timing issues explained

This is the final part of the 14MHz series, but I'm sure it's not last entry about it. Sorry if it had been a bit stretched, and maybe too beginner-friendly, but I guess for all the experts out there it's all common knowledge. It's the beginners like myself that struggle with these things, so I'd rather write a bit more and make it more useful.

As I wrote in my first post on the subject, all the other issues are secondary, but the timing is the key in running 65C02 at full advertised speed. Bus translation is not very difficult, and documentation quality can be worked around with enough research (remember what that word meant before Google?), but both of these challenges are all the harder with tight timing of 14MHz.

Before we get to the point where I can talk about specifics, I would like to cover one more thing on the subject: what is the timing violation, and how can that affect your build. Again, sorry for going into such basic details, but it might not be obvious for everyone; it certainly wasn't obvious for me.

## What happens if you violate chip timing?

We have all done that at some point, and what we know for sure is that it didn't cause the universe to implode. That's already good news, but in fact: where do all these timing restrictions come from and why? Well, our digital logic integrated circuits are not as digital as we would like them to be, nor are they logical. That part I'm sure of - integration and circuitry are still up for debate :) 

What happens in a chip like a simple NAND gate is that whenever voltages change on input pins (which, by the way, is also not that very instant!), there is very long and complicated process where different components of the circuit start responding to changing input and they all do it in very analogue and illogical way. Usually the dance of currents and voltages take from several to several dozens of nanoseconds. Anything that happens in between is pretty much random, and as with anything random, you can never assume that your result is the proper, final one. It might, just as well, be just random value that resembles the final value closely enough.

What's even worse, this dance is not deterministic. It's not like the access will always take the same amount of time, because both internal and external conditions might change the duration of the process. This is why in datasheets you have pessimistic values for each operation, and while these are not very important at slow CPU speeds, the faster you go the more it matters. Let's look at the NAND gate used in Ben's project:

![21_74hc00_delay](Images/21_74hc00_delay.png)

Now, it's tempting to assume that the worst case possible scenario at room temperature should be around 15-18ns (taken from rows 4 and 7), but this assumption is valid only if you can guarantee that your operating voltage will not drop below 4.5V. Can you? Sure, we have decoupling caps for that purpose exactly, but still, keep that in mind, it might matter! If the voltage drops below 4.5V threshold, propagation delay will be longer and valid response will appear on output later. Will you notice? Not necessarily. You might be lucky to get response faster thanks to the random operation in the IC.

Still, these are pretty simple cases. When you consider more complex chips it gets even worse. More moving parts means much more unexpected behavior. It's especially interesting in case of reading ROM memory, which usually will be the slowest part of your build unless you connect LCD directly to the bus. Let's consider simple example (assuming ROM starts at 0x8000):

```
    LDA $2000
    CMP $9000
    BNE not_equal
```

As you can see, I'm reading RAM at address 0x2000 and comparing it against ROM value at 0x9000, jumping to `not_equal` label when the values differ . How much can you violate the ROM timing for the code to work? Basically, how much can you push that read beyond ROM limits before it fails?

There are two things to consider here: 

1. How random is the value in 0x2000 - basically, what values can it assume depending on the logic behind the program? If there are just two values (like 0x00 and 0xFF) then the probability you catch the error is higher, so your code is less vulnerable to timing violation. Now, if the value is fully random (it can assume any of 256 values with equal probability), the equality occurs only once in 256 tests. If the value in RAM is 0x55 (0b01010101) and the one in ROM 0xAA (0b10101010) then all you need is one bit of the ROM cell read correctly for the test to pass! Even if ROM reads as 0x54 (0b01010100), having only bit 0 correct, then the equality test will correctly fail, and you will not notice the violation!
   So, with timing violations your results can vary between alternate possibilities with different probabilities. That's quantum computing on 8-bit 80's hardware for ya!
2. You might be thinking that I'm being silly here, and my example doesn't make sense, since ROM is mostly used to store the code and any timing violations during opcode read would result in execution failure. Yes, you are correct, but sequential code executing doesn't mean that your timing is correct, because of the second issue: ROM chips are not uniform landscapes of storage cells with uniform random access time. Instead, these are organised in "pages", which are selected during read operation. This process takes pretty long time, but consecutive reads from the same page (or close to it) happen much faster. Your code is usually executed from adjacent cells in ROM making these accesses much faster and protected against timing violations. So: running the code from ROM just fine doesn't mean you got your timing right!

The reason I spend so much time describing this is that I want to make sure you understand that it's pretty easy to see that your timing is off if it's really, really off. Edge cases and minor violations might slip unnoticed for a long time and be very, very difficult to locate and fix. This is another reason why going from one to eight megahertz is pretty simple. Going further gets harder with each additional megahertz. If you want to go down that route make sure you know why you are doing it...

## The worst case of timing violation

This was really, I mean really infuriating. Also: this is something that I still haven't fixed yet, but hoping to be able to work on it and get it right soon.

One of the things I hated about my first DB6502 build was that all the delays used arbitrary cycle counting technique. Sure, it's pretty easy and reliable (unless you have plenty of very frequent interrupts that is), but it does depend on the CPU clock. If the clock speed changes (as a result of invoking the debugger for instance), simple 20ms delay might run for minutes if not hours. Each time I wanted to test the system against higher frequency I had to replace oscillator (pretty easy thanks to the oscillator sockets which I can't recommend enough!), but also recompile OS/1 software with new clock counting ratios designed for external CPU. I hated this and wanted to solve it in my second DB6502 version.

Sure, you might think RTC will do just fine, but I came up with "better" idea. UART chip I used (SC26C92) is pretty versatile beast and it provides clock interface based on its own oscillator used for baud rate generator. This seemed as perfect solution, as the BRG clock doesn't change with the CPU clock when going into debug mode. The idea was simple: implement new version of the delay routine that would translate desired number of miliseconds to 3,6864 MHz clock ticks, kick off the UART X16 timer and poll periodically to see if the countdown is completed. Sure, I could also use IRQ for this, but wanted things simple for now. Surprisingly enough, the code worked almost the first time around. Impressed with the result (and how precise the measurements were), I have added another feature: CPU speed calculation routine - it used two clocks at the same time: one in VIA (counting CPU clock ticks) and one in UART (counting fixed 3,6864 MHz). CPU frequency could be estimated by how many clock ticks VIA counted during fixed period measured by UART. Simple, elegant solution, and it also worked beautifully.

Then I moved to 14MHz and strange things started happening out of a blue. The worst part was that the system would boot to shell, everything seemed fine, but during XMODEM file transfer it would fail randomly, sometimes being able to transfer one to twenty blocks of data and freezing after that. Long days of troubleshooting revealed the culprit - the UART countdown clock (used in delay routines executed during data transfer) would occassionally stop. Not the first time, not the second, but at some point in time it would just stop counting down, throwing delay routine in infinite loop.

Now, I'm not 100% positive I know the reason. I think I do, and I even managed to capture some data on my logic analyser supporting the main hypothesis.

