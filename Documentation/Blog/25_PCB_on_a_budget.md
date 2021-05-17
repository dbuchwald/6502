# Making PCB on a budget

Experimenting with digital electronics can be a lot of fun, but as each other hobby, it can cost you a small fortune. Especially at the beginning you will make mistakes and buy useless gear, but as the time goes by you will learn to choose wisely. What does it mean? Different thing for each one of us, as we work in different environments, are in different financial and social situations. My work is mostly limited by space (no dedicated area to work, sharing workbench between different hobbies and projects) and time (being parent of four year old, I can't really plan ahead a lot and have to be able to start/stop work on short notice). My solution to these limitations: using multiple PCB revisions instead of breadboards. Sure, it takes time to design them, but all you need is a laptop and you can work on the design everywhere around the house. Completed project is very durable, all you need to do is to grab it from the drawer, plug it in and resume hacking - no need to spend couple of hours looking for loose wires.

But then there is the cost factor: making PCB is not cheap, especially when you order one project at a time - shipping cost from China can be prohibitive. Another thing is at the beginning you tend to make your boards larger than they need to be, just because of lack of experience.

Don't worry, you will get better at it, and while you do, I want to share some tips/hints I have learned recently.

## Tip 1: verify your assumptions!

For quite a while I would stick to DIP packages for a very simple reason: chips are expensive, and you have to recycle them. I would design my boards with DIP sockets in mind, and only after several iterations I realized how wrong my assumptions were. Let's look at the costs, shall we?

### Variant 1: DIP package

First, you need the chip for about [3,01 PLN](https://pl.farnell.com/texas-instruments/sn74ac74n/logic-dual-pos-edg-trg-d-f-f-14dip/dp/3006361?st=74ac74), but also a socket, which costs [1,79 PLN](https://pl.farnell.com/multicomp/2227mc-14-03-10-f1/socket-ic-dil-0-3-14way/dp/1103845?st=dip-14). That's not all, you also have to consider the real estate that the package uses.

### Variant 2: SOIC package

Second option is to go with the SOIC package - at [2,20 PLN](https://pl.farnell.com/texas-instruments/sn74ac74d/ic-dual-flip-flop-smd-74ac74/dp/3119994?st=74ac74) it's considerably cheaper than the DIP counterpart. Actually, it costs only slightly more than the DIP socket itself. When you consider the extra saving from smaller PCB size required, it might get even cheaper.

### Variant 3: TSSOP package

This one is even cheaper - only [2,04 PLN](https://pl.farnell.com/texas-instruments/sn74ac74pw/ic-sm-logic-74ac-flip-flop/dp/1607721), and it uses very little space on the PCB, but TSSOP can be too hard for other people to solder by hand. I will elaborate below why it matters for the cost of your own fabrication.

One could argue that you can get cheaper socket, and it's true. There are non-tooled sockets for [0,50 PLN](https://sklep.avt.pl/podstawka-14-pin.html), but the point is still valid: sometimes using 0,50 USD socket to be able to recycle 0,60 USD chip is not that smart, and SOIC package makes for great introduction to SMD soldering.

Sure, there are other cases - EEPROM, SRAM or CPU cost significantly more than the socket they use, and in these cases savings on PCB real estate do not justify the expense unless you plan to desolder the chips afterwards.

Bottom line: before you start planning the layout of your board, shop for parts - it might turn out that small changes will have significant impact on the final cost. It's also much easier to change footprints at the beginning...

## Tip 2: no, seriously, look for alternatives

One of the things that I wish I had known a while ago was that 71256 SRAM chips are a thing. They are not only significantly faster (up to 12ns in DIP package), smaller (narrow DIP-28), but also cheaper at [13,69 PLN](https://pl.mouser.com/ProductDetail/Renesas-IDT/71256SA12TPG?qs=O0BhuZj9WkwnUZ0aAufqkw%3D%3D) compared to [14,48 PLN](https://pl.mouser.com/ProductDetail/Alliance-Memory/AS6C62256-55PCN?qs=LD2UibpCYJqgbIupMJnGTQ%3D%3D) from Ben's build. Their size also matters when you use them on breadboard - they leave you much more room for all the mixed address/data lines wires.

So yeah, learn to use this search engines and spend some time reading about your options - your PCB can get significantly smaller with some simple chip substitutions.

## Tip 3: pull-ups and pull-downs

Another thing I never noticed really, were resistor arrays, and these things are just perfect for multiple pull-downs/pull-ups you might need at your board inputs. In my first DB6502 prototyping board I placed seven 4K7 pull-up resistors on a board. In my second revision I replaced them with single resistor network for only [1,38 PLN](https://pl.farnell.com/multicomp/mcrnla09g0472b0e/resistor-network-4-7k-2-1-8w/dp/1973140). It uses fraction of the board real estate and is really easy to use. Definitely recommended!

## Tip 4: Don't forget the other side

One of the things that will fit great on the backside of your board are decoupling capacitors, especially if you use 1206 SMD package. They are really easy to solder, and let you use space on the front side of your board better. Bonus: you can place them really close to VCC input of your DIP chips, improving the quality of your build.

You can also try and put some of your SOIC package chips on the back of the board, but the routing can get tricky. I didn't dare that yet.

## Tip 5: Make your design flexible

This will increase the size of your board a bit and might make it a bit harder to design, but then again - the worst thing is to have to design, order and pay for new revision when you change your mind. Think about what is set in stone and what is negotiable.

One of the silly things I did in my first PCB ever (the DB6502) was to put two VIA chips on it and wire the first one to LCD/keyboard/blink ports. Waste of space (which costs money), extra chips (more money) and added complexity. In my latest revision I put two ports - one preconfigured for LCD and another one simply exposing raw VIA I/O pins. You can choose which interface you prefer to use, and if you want, you can always hook up second VIA chip using the extension port on the side of the board.

Add jumpers where you want let people decide how to configure the board - it will make their life easier, and they will be more likely to reuse your design.

## Tip 6: Don't pay for your PCBs

This might sound silly, but you don't really have to pay for your PCBs. I take advantage of the PCBWay project sharing program - you can share your designs on their website and each time somebody orders from them board designed by you, you will get small commission to be used for future purchases. Sure, it's not a lot of money, but this way you can learn to make better designs and start thinking about what other people can use and benefit from.







 