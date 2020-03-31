# Arduino sketches used in the project

The following sketches can be found in this folder:

- `6502-monitor` - based on Ben's monitor code with some small modifications (like clock counter I used for clock interrupt testing), to be uploaded to Arduino Mega for debugging **USED FREQUENTLY AND WORKS**
- `6522-monitor` - similar to the above, implemented for testing of the output from VIA chip **NOT TESTED FOR A LONG TIME**
- `address-decoder-test` - my own take on the TDD principles in hardware design, described in detail [here](https://www.reddit.com/r/beneater/comments/ej3lqi/65c02_address_decoder_for_32k_ram_24k_rom_and_2/) **NOT TESTED FOR A LONG TIME**
- `bounce-counter` - small program used for troubleshooting of the [noise issue in monostable mode of Ben's clock module](https://www.reddit.com/r/beneater/comments/edp1ls/noise_issue_in_monostable_mode_of_ben_eaters/) **USED RECENTLY AND WORKS**
- `handshake-4313` - small program used to test hardware handshake with VIA, to be uploaded to ATtiny4313 **NOT SURE IF STILL WORKS**
- `handshake-test` - similar to the above, but built for Arduino Mege **NOT SURE IF STILL WORKS**
- `irq-4313` - very small program to test IRQ handling by ATtiny4313 **PROBABLY STILL WORKS**
- `irq-test` - as above, but targeted for Arduino Mega **PROBABLY STILL WORKS**
- `keyboard-4313` - **THE MOST IMPORTANT ARDUINO SKETCH HERE** - this one has to be uploaded to ATtiny4313 for PS/2 keyboard operation **USED FREQUENTLY AND WORKS**
- `keyboard-mega` - similar as above, but for Arduino Mega, not to be used, written for debugging purposes **WORKS**
- `keyboard-detect-mega` - modification of the above to implement proof-of-concept PS/2 host to device communication **WORKS**
- `keyboard-test-4313` - first version of the code for keyboard controller, but used only to validate PS/2->AVR connection, no interaction with VIA yet. Merged with `handshake-4313` to implement data transfer to VIA **WORKS**
- `keyboard-test-mega` - as above, but targeted for Arduino Mega **PROBABLY WORKS**

As you can see, there is plenty of unused code there, but I kept it for the record and reference. You basically need two programs for 6502 (`6502-monitor` to be installed on Arduino Mega for debugging and `keyboard-4313` to be installed on onboard ATtiny4313 for keyboard controller operation) and another one for the clock module (`bounce-counter`, to be installed on Arduino Mega to confirm correct operation in monostable mode).
