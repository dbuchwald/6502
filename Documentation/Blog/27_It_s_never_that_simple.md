# Hunting glitches

Last time I wrote about strange problem caused by bad solder joint. I fixed it, signal got considerably better, but was it end of all problems? Sure it wasn't, and the funny part is that I had to review some of the things I wrote last time, referring to them as "simple", but I'm getting ahead of myself.

## The fun never stops

It's always one thing leading to another. Another simple question, to which there is never simple answer. After fixing the blinking LED issue I moved on to the next thing - strange copy-paste distortion. This was really tricky one, I knew about it for some time now, but I wasn't feeling up to the challenge until recently. 

First: it only happened at higher frequencies. Running at 1-2MHz was bug-free. At 4MHz it was happening occasionally. At 8MHz - almost every time. It also requires SC26C92 and serial communication of 115200 baud minimum.

Second: it required very complex software setup. On one hand it was a good sign, suggesting software bug. On the other, it just made troubleshooting all that more difficult - testing produced plenty of bus data I had to analyse.

Third: it looked like very nasty hardware bug. Something like crosstalk between TX/RX channels or something even worse. Bottomless pit of despair or something similar.

It's no wonder I was intimidated by it. Alas, it was really fascinating!

### Problem statement

Yeah, I know I haven't described the problem just yet. This one is too good to spoil the fun with premature... description. So get this: you have to boot OS/1, load Microsoft BASIC, go to [this page](http://searle.x10host.com/6502/Simple6502.html) to copy sample BASIC code I use to test the stability of the build. The program I'm using is very useful - it is pretty complex as far as 6502 BASIC goes (using trigonometry functions and floating point numbers), and due to addressing scheme of MS BASIC it uses stack and distant RAM pages heavily switching between them - I used it to detect nRD/nWR timing violation. So the program is simple:

```basic
10 FOR A=0 TO 6.2 STEP 0.2
20 PRINT TAB(40+SIN(A)*20);"*"
30 NEXT A
```

It's important: you must not type it in, but copy from the page and paste into the serial terminal.

What you get in the terminal is this:

```
B( FOR A=0 TO 6.2 STEP 0.2
20 PRINT TAB(40+SIN(A)*20);"*"
30 NEXT A
```

Crap, so the data got distorted during copy, right? Well, this is where it gets interesting:

```
OK
B( FOR A=0 TO 6.2 STEP 0.2
20 PRINT TAB(40+SIN(A)*20);"*"
30 NEXT A
LIST

 10 FOR A=0 TO 6.2 STEP 0.2
 20 PRINT TAB(40+SIN(A)*20);"*"
 30 NEXT A
OK
```

Do I have your attention now?

As you can see - the code got distorted (and sometimes it was much, much worse than that), but when you LIST it, everything is fine. Oh, and in case you are wondering:

```
OK
RUN
                                        *
                                           *
                                               *
                                                   *
                                                      *
                                                        *
                                                          *
                                                           *
                                                           *
                                                           *
                                                          *
                                                        *
                                                     *
                                                  *
                                              *
                                          *
                                      *
                                  *
                               *
                           *
```

It runs well too.

## OS/1 asynchronous I/O

This is where I should probably explain a bit more about the serial I/O implementation. It uses fully asynchronous, interrupt driven mechanism for sending and receiving data. This makes troubleshooting all that more difficult, because the data is moved around the system in a pretty indeterministic way, but the general flow of a single character is the following:

1. Data is received in SC26C92 RX FIFO channel A buffer (8 bytes long), and interrupt line is pulled low (already after first character, but you can change that in DUART config registers),
2. CPU receives the IRQ from DUART and processes all possible scenarios:
3. RX flag is checked - if there are characters in DUART receive buffer, these are being read until the FIFO is empty and copied over to channel A receive buffer of OS/1 in RAM,
4. TX flag is checked - if there is at least one empty slot in DUART TX FIFO buffer, it checks if there are any characters in RAM OS/1 TX buffer (again, the one for channel A). If there are - it will copy one of them to DUART TX FIFO, otherwise it will disable TX interrupt mask until new data to send is written to RAM buffer.

Now, this code is pretty similar to the one I wrote for WDC65C51/R6551, but the main difference is that here I had to abstract the "channel" thing, so there are two RAM RX buffers and two RAM TX buffers. It means more pointer manipulation and all that.

Still, regardless of the complexity, the code seemed to work in most cases, so what could that had been?

### Problem simplified

The good thing was that I used the OS/1 routines for reading/writing serial data, so the same problem should occur also in simpler scenario, and indeed. I have never copy-pasted OS/1 shell commands, but I tried now, pasting the same string (`1234567890ABCDEFGHIJ`) each time:

```
OS/1>12-45-7890ABCDEFGHIJ
Command not recognized - either wrong keyword or incorrect number of parameters
Enter HELP command to list available commands
OS/1>12E45H7890ABCDEFGHIJ
Command not recognized - either wrong keyword or incorrect number of parameters
Enter HELP command to list available commands
OS/1>12F456J890ABCDEFGHIJ
Command not recognized - either wrong keyword or incorrect number of parameters
Enter HELP command to list available commands
OS/1>1264867A90ABCDEFGHIJ
Command not recognized - either wrong keyword or incorrect number of parameters
Enter HELP command to list available commands
OS/1>12045C7890ABCDEFGHIJ
Command not recognized - either wrong keyword or incorrect number of parameters
Enter HELP command to list available commands
OS/1>12-456-890ABCDEFGHIJ
```

### First analysis attempt

I executed the scenario number of times with the logic analyser connected, capturing each bus operation for about 2-3 seconds at 200MHz. It doesn't seem like much, but there was plenty of data to plow through, and analysis is not that simple.

TODO: Add rough screenshot here

I tried looking for odd-looking data, but this was just stupid. There was nothing really out of order there. I started checking the actual instances of wrong data being sent (by searching decoded 8080 bus data for specific values). If you take a look at the first sample (`12-45-7890ABCDEFGHIJ`)  I first traced the flow of the correct characters (`1` and `2`) and it was exactly as I expected - data is first read from the UART (indicated by the nUART chip select signal)

, and then looked for `-`. I didn't like what I found - there was nothing wrong with the signal and it seemed that the strange character 