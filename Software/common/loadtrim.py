import sys

in_file=open(sys.argv[1], "rb")

binary_input=in_file.read()
in_file.close()

nonzero_index = len(binary_input)-1

while (ord(binary_input[nonzero_index]) == 0):
  nonzero_index=nonzero_index-1

binary_output = bytearray([0x00] * (nonzero_index+4))

for copy_index in range(nonzero_index+2):
  binary_output[copy_index+2] = binary_input[copy_index]

binary_output[0x0000]=0x00
binary_output[0x0001]=0x10

out_file=open(sys.argv[2], "wb")

out_file.write(binary_output)

out_file.close()


