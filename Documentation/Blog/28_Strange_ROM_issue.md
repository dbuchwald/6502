# Glitches, glitches everywhere

Last time I wrote about simple software bug that caused very scary-looking issue in my serial communication implementation. Before that I also covered problem with 15ns PLD and nRW/nRD stretching. There was another one I haven't even mentioned so far, but it scared the hell out of me: when I started up my latest DB6502 prototype board, the CPU wouldn't just work. Like at all. It was powered and all, but it was not doing anything. Pretty soon I realised that it was the RDY line that was permanently held down, and then I understood - latest revision of the board doesn't use the open collector variant of the RDY circuit, but the parallel RC network for faster operation. All it took was a simple update of the PLD code from this:

```
RDY.OE    = !RDY;
```

to this:

```
RDY.OE    = 'b'1;
```

And now, instead of open collector, I had nice "drive always" RDY output from PLD. After fixing all the simulation errors I got it to work nicely.

Still, it's pretty frightening when you spend months on designing the board, pay for fabrication, spend couple of hours soldering and it just doesn't start at all.

Anyway, what I'm trying to say is that apparently my project is getting to the level of complexity where I have to be very, very careful with each step, because the number of moving parts is growing and making sense of it all can be difficult.

## ROM flashing issue

Back to where I left off last time - I fixed simple OS/1 code issue and it should have worked. It didn't, because when I tried flashing ROM via the onboard AVR programmer it would just fail silently. Even worse - it failed, but claimed to have succeeded.

Now, I've been meaning to write about it for some time now, but haven't gotten around to it yet. See, there are two ways to write to the ROM memory: you can write a byte (or page of 64 consecutive of these at a time) and wait for 10ms, or you can perform write and just wait for the chip to finish. These chips have this nice feature where after write operation, you can read any address and there will be two bits that you can use to determine if the write is complete. It has actually already caused one issue in the past, so I wasn't surprised to see it happening again.

![28_ROM_write_polling](Images/28_ROM_write_polling.jpg)

This is how the process starts. In this particular scenario, I'm running simple "check Software Data Protection status" code - it reads first byte in ROM (`0xA2`) and writes the XOR value of it (`0x5D`). It will read the same address after write operation is completed - and if it is the old one, it means that SDP is enabled, obviously. If it changes (so the SDP is disabled), it will overwrite it again with the initial value to preserve original state. 

All the r/W, CLK, BE signals are coming from AVR, the ROM_CS (at the bottom) is calculated by PLD as usual. Actually, RDY is also calculated by PLD and if you look closely, you will notice another problem, but I will deal with this one later.

Anyway, you can see the sequence working as expected: read `0xA2`, write `0x5D`, keep reading the same address until the two consecutive reads yield the same value - this indicates that the write operation is completed. Unfortunately, this is not what happened:

![28_ROM_write_fail](Images/28_ROM_write_fail.jpg)

As you can see, there is something odd about the last read operation: the clock signal is clean, but there is something off about the nRD. It looks like the write operation is completed (two reads of `0xFF`), but the next read also results in the same value (`0xFF`), where we expected either `0xA2` or `0x5D`. You have probably guessed by now what happened, so let's confirm with a close-up:

![28_ROM_write_fail_closeup](Images/28_ROM_write_fail_closeup.jpg)

Yep, during single clock cycle there were two read operations performed. Strangely enough, even though these pulses were very short (low pulse measured 25ns, high one 10ns), it was sufficient for the ROM chip to respond as if they were valid. Remember that ROM chip is not connected to CLK line, it only relies on ROM_CS and nRD/nWR signals, and based on those it looked like two very fast, but valid reads. It just responded accordingly.

If you think about it, there is actually very simple "solution" to the problem - read the status three or four times, not just twice. It would have probably worked most of the time, since this ringing on nRD line doesn't happen frequently. That thought terrified me - I wonder how many of actual hardware problems in my devices at home are "solved" this way. It would definitely explain some of the infuriating random failures of these "smart" gadgets.

Obviously, I didn't want that. I need proper solution.

## Schroedinger's Cat

Did I mention how much of an ignorant I am when it comes to analog electronics? I love things nice and simple, with clearly defined signals that can be measured, recorded, quantified and processed. Unfortunately, there are cases like this, when even the process of measuring the signal changes it enough to make the measurement useless. It's like opening the box just to find the cat dead every time...

Just as a reminder, this is the circuit responsible for calculation of the nRD signal:

![28_nRDnWR](Images/28_nRDnWR.png)

When I measured the nRD (or RDN on the schematic above) signal produced by the redesigned nRD/nWR circuit, it indeed rang like expected:



