# Every day is a school day

Recently I wrote about making PCB prototyping cheaper. Today I wanted to write about things I have learned from latest PCB prototype of DB6502 build. Let me start with the update first.

## DB6502 PCB prototype update

The good news is that I haven't made any major mistakes in my latest design. Unlike the previous prototype, this one didn't require any extra wires nor cutting existing traces. AVRISP port is also oriented properly this time!

Does that mean everything is fine and dandy? Sadly, no. Latest prototype does serve its purpose nicely - I can proceed with testing some of my ideas and verify some assumptions. I can learn and improve, but the board, unfortunately doesn't always work "standalone", without extra chips added to the breadboard next to it. The main achievement here is that I planned for such "failure" and made the board configurable - thanks to this flexibility I was able to spot and fix the problems that were blocking the development of the previous revision.

Let's talk about the problems and lessons learned then.

## Problem 1: nRD/nWR signal stretching

In one of the previous entries I wrote about impact of introduction of wait states on 6502->8080 bus mapping. Basically, one of the issues with 6502 CPU is that it uses different encoding of read/write signals than the 8080 and derivatives. It might seem irrelevant for 6502 based build, but unfortunately, both your memory chips (RAM and ROM) and the SC26C92 UART interface are designed for 8080 bus. Instead of single r/W signal from 6502, you have nRD/nWR inputs on 8080-compatible devices.

Ben Eater uses simplest possible trick - ensures that nWR can be low only during high CPU cycle. While that works fine at slow speeds (and is generally accepted solution for most homebrew 6502 builds), it can cause issues when introducing wait states, because it causes write operations to happen twice (or more, depending on number of wait states).

In my previous PCB revision I have already implemented Ben's algorithm in my PLD: nRD and nWR were calculated there, based on r/W signal and clock input. It was very elegant solution and it worked beautifully due to simplicity of the calculation. Unfortunately, when I added wait states to the equation things got messy, and calculation got just a little bit longer.

What you have to take into account is that your nWR/nRD signals must rise no more than 10ns after falling edge of your clock. According to 6502 datasheet this is how long the data/address lines are stable. If you wait longer, your address/data lines might start changing, resulting in bus corruption.

![26_6502_tdhw](Images/26_6502_tdhw.png)

See tDHW above, and this is the actual figure:

![26_6502_tdwh_fig](Images/26_6502_tdwh_fig.png)

The problem with nRD/nWR stretching is that the logic behind it is pretty complex in my case - five signals are included in computation: r/W, CLK, RDY, WS_DEBUG and WS_DISABLE. In general, the logic for the computation is the following (in order of priority):

1. If WS_DEBUG is high, then we are in "debugger-forced" wait state, so nRD or nWR should be low (depending on the value of r/W),
2. If WS_DISABLE is high, then wait state computation should not be performed, and nRD/nWR should be calculated only using r/W and CLK (as in Ben's build),
3. If RDY is high and CLK is low, it means that we have just completed full CPU cycle, so both nRD and nWR should be high,
4. If RDY is low or CLK is high, then nRD/nWR should be calculated using r/W signal.

Rules 3 and 4 can be illustrated using the following diagram:

![26_rules_3_4](Images/26_rules_3_4.png)

There is a problem, however - we still have two more signals to go (WS_DEBUG and WS_DISABLE) to include in the computation, and remember, we need the result to be calculated in less than 10ns relative to falling clock edge. Even if we use AC gates, propagation delay is going to be too long. Inverter will take up to 7ns:

![26_74ac04](Images/26_74ac04.png)

Then there is the AND gate (74AC08) with 7.5ns propagation delay:

![26_74ac08](Images/26_74ac08.png)

Last but not least - OR gate (74AC32) with 7.5ns propagation delay:

![26_74ac32](Images/26_74ac32.png)

It all sums up to 22ns pessimistically, and two signals are still missing (WS_DEBUG and WS_DISABLE). I just gave this up and never looked back - why bother with 22ns solution when you have 15ns guaranteed?

