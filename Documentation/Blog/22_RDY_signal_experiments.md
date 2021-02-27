# Another long overdue update

Unfortunately, recently I haven't been able to work on my project as much as I would like to, and the progress is much slower than I was used to. That being said, taking some time off can give you new perspective and lets you reconsider your assumptions, goals and plans. So, not all is lost...

At the moment I decided it's time for another PCB exercise - struggling with 14MHz experiments I kept asking myself whether the problems might be caused by poor connections on breadboard. I know, it seems far fetched and probably is not true, but still - the PCB version I'm using right now was supposed to be temporary and replaced down the line by next iteration while I sort out some of the design questions. I have, actually, so I should probably stick to the original plan.

Sure, making PCBs is not cheap and there is certain delay between order being placed and the board arriving, but given how slow my progress has been recently this is something I can live with. On the upside, I want to use this opportunity to test some new ideas, including some fixes to original design. Stay tuned, I should write about it soon.

For now - there was one issue I didn't want to keep open, and since I was about to make a PCB I needed to decide how to solve it. The issue was nothing new, it's someting I mentioned previously: RDY pin on WDC65C02 is a bidirectional pin, so it requires careful handling to avoid damage to CPU.

## Problem statement

As I wrote in the "Wait states explained" blog entry, the main issue with RDY pin on 65C02 is that it can work in both input and output modes. Most of the time you will be using only the input mode, supplying information to CPU about wait cycles (if that's not clear, please read the previous entry on the subject), and it's tempting to connect your wait states computation logic circuit output directly to the RDY pin. There is serious risk associated with this approach - if, for one reason or another, CPU executes WAI instruction, RDY pin will change mode to output and line will be pulled low (shorted to GND). At the same time your wait state circuit might be outputting high signal on the same line (shorting to VCC) and you will cause short between VCC and GND, resulting in high current being passed via the CPU. If you're lucky it will cause only high energy consumption, but if not, you might burn your CPU.

Sure, there are some standard approaches to the problem, and I will investigate them below. The thing is that the above section is not all. You also need to remember about another thing: if you intend to use wait cycles it probably means you are planning to make your CPU run at higher frequency, giving you less time to spare for any of the solutions to work. 

This is why I wanted to compare each of the approaches and discuss pros and cons of each. I hope it will help you choose the approach that is suitable to your build.

## Experiment description

So, based on the problem statement above, the question I want to answer is: how do these approaches perform in real scenario given the following below constraints:

- Protect the build from the WAI instruction issue? Does it limit the current passed through CPU in such case?
- What is the impact of particular solution on the system timing? How long it takes to toggle between "not ready" to "ready" mode and vice versa?
- Does it present any other issues?

Now, the most proper way to do it would be to test it against the actual 65C02 CPU, and I might actually do it in future, but at the moment I needed much simpler setup. I just wanted to test what is the fastest, energy efficient way of delivering RDY signal to receiver and compare some of the ideas I saw on 6502.org forums.

### Test setup

As described in the paragraph above, this is what I needed: oscillating high/low CMOS signal exiting output of one gate being fed into input of another gate. This would resemble closely target situation where the producer of the signal is your wait state circuitry and the consumer is the CPU. The goal: measure time between output on one end and input on the other.

I built this circuit with clock oscillator (4MHz) and single 74AC04 hex inverter IC. First gate (inverting the alternating clock signal) simulates output of wait state circuitry while the last gate will pretend to be CPU reading the signal. This is how the schematic looks like:

![22_simple_circuit](Images/22_simple_circuit.png)

Now, each tested solution will be placed between test points TP1 and TP2 and measured. Let's start with simple measurements.

Clock output:

![22_clock_signal](Images/22_clock_signal.png)

Clock output (yellow) against the inverted signal at TP1 (purple):

![22_simple_circuit_1](Images/22_simple_circuit_1.png)

I have also used this opportunity to test the propagation delay of the 74AC04 gate (input low to high and high to low, respectively):

![22_simple_circuit_2](Images/22_simple_circuit_2.png)

![22_simple_circuit_3](Images/22_simple_circuit_3.png)

As you can see, in this (admittably, perfectly simple!) scenario tpd is below 3ns. Very nice!

### Variant 1: the simplest possible

Well, doing nothing at all is also an option. Not acceptable, due to no current limitation in WAI scenario, but still something to measure.

![22_simple_circuit](Images/22_simple_circuit.png)

This is how the setup looks like on the breadboard:

![22_simple_circuit_breadboard](Images/22_simple_circuit_breadboard.jpeg)

Obviously, the delay between TP1 and TP2 is well below anything my scope can measure:

![22_simple_circuit_measure](Images/22_simple_circuit_measured.png)

As you can see, TP1 and TP2 are almost perfectly lined up - there is no delay in signal propagation. Still, the fact that this would burn our CPU doesn't make it viable solution.

### Variant 2: open-collector buffer and pull-up

This is the variant I used in my build recently - RDY signal is fed into the CPU via open collector buffer (7407) followed by pull-up resistor:

![22_open_collector](Images/22_open_collector.png)

This means that output of the wait state circuitry is never directly "high", it's either "low" or "none" (high impedance). The way it works is that as long as RDY line on 65C02 CPU is operating in input mode, it will be driven either by the buffer output (in "low" case) or by the pull-up resistor (in "high" case). High output will always go through resistor, and when RDY line turns to output mode and pulls the line low, this resistor will limit current passing through.

This is how it looks on the breadboard:

![22_open_collector_breadboard](Images/22_open_collector_breadboard.jpeg)

Actually, the pull-up resistor is obscured by one of the probes, sorry...

This is the resulting signal:

![22_open_collector_measured](Images/22_open_collector_measured.png)

As you can see, signal is falling very fast, but it takes time to start doing so:

![22_open_collector_high_low](Images/22_open_collector_high_low.png)

As you can see here, it takes over 10ns to propagate low signal via the buffer. It's even worse when you check the rising time delay:

![22_open_collector_low_high](Images/22_open_collector_low_high.png)

Here, it measures at almost 15ns, but in reality I should be measuring time between leaving low signal range and reaching high - and this time is much longer, almost 30ns. When you consider 14MHz clock cycle of 70ns you can already see that's a lot!