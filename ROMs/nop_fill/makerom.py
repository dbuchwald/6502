
rom = bytearray([0xea] * 32768)

with open("rom.bin", "wb") as out_file:
  out_file.write(rom);
