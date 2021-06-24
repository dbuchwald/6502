# Below are all the settings required for build specific parameters
# There are two predefined versions, but you can choose custom and configure below

# Possible values are DB6502v01, DB6502v2, custom
# BOARD_VERSION = DB6502v01
BOARD_VERSION = DB6502v02
# BOARD_VERSION = custom

TERMINAL_DEVICE = /dev/tty.usbserial-FTATHSS6
DBGTERM_DEVICE = /dev/tty.usbserial-D3089797

ifeq ($(BOARD_VERSION), DB6502v01)
	ADDRESS_MODE=ext
	SERIAL_INTERFACE=wdc65c51
	TIMING_INTERFACE=cpu
	CLOCK_MODE=8m
	LCD_MODE=4bit
endif

ifeq ($(BOARD_VERSION), DB6502v02)
	ADDRESS_MODE=v2
	SERIAL_INTERFACE=sc26c92
	TIMING_INTERFACE=sc26c92
	LCD_MODE=4bit
endif

ifeq ($(BOARD_VERSION), custom)
	# Address mode (basic/ext/v2/.. )
	ADDRESS_MODE=ext
	# Serial interface
	# Possible values are
	# - wdc65c51
	# - r6551
	# - sc26c92
	SERIAL_INTERFACE=r6551
	# Timing interface
	# possible values are
	# - sc26c92
	# - cpu
	# for CPU interface there is additional parameter: CLOCK_MODE
	TIMING_INTERFACE=cpu
	# Clock mode (supported are: slow, 250k, 1m, 2m, 4m, 8m)
	CLOCK_MODE=1m
	# LCD operation - 4bit or 8bit
	LCD_MODE=4bit
endif
