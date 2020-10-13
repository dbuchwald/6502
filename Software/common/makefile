# cc65 utilities used in this example
CA65_BINARY=ca65
CC65_BINARY=cc65
LD65_BINARY=ld65
AR65_BINARY=ar65

CPU_FLAG=--cpu 65C02
ARCH_FLAG=-t none
CLOCK_FLAG=-Dclock_mode_flag=$(CLOCK_MODE_FLAG) 
ACIA_FLAG=-Dacia_tx_irq=$(ACIA_TX_IRQ) 
BUILD_FLAG=-Ddb6502

CC65_FLAGS=$(CPU_FLAG) $(ARCH_FLAG) $(CLOCK_FLAG) $(ACIA_FLAG) -O
CA65_FLAGS=$(CPU_FLAG) $(CLOCK_FLAG) $(ACIA_FLAG) $(BUILD_FLAG)
LD65_FLAGS=
AR65_FLAGS=r

# MiniPro will be used to upload the ROM
MINIPRO_BINARY=minipro
EEPROM_MODEL=AT28C256

# Hexdump is used for "testing" the ROM
HEXDUMP_BINARY=hexdump
HEXDUMP_FLAGS=-C

# Emulator binary
X6502_BINARY=x6502

# Checksum generator
MD5_BINARY=md5sum

# Standard utilities (rm/mkdir)
RM_BINARY=rm
MKDIR_BINARY=mkdir
MKDIR_FLAGS=-p
CP_BINARY=cp
CP_FLAGS=-f

# Picocom settings
PICOCOM_BINARY=picocom
PICOCOM_FLAGS=-b 19200 -fh --send-cmd 'sz -X'

# Python binary
PYTHON_BINARY=python
PYTHON_PROGRAM=../../common/loadtrim.py

# Build folder
BUILD_ROOT=../../build
BUILD_FOLDER=$(BUILD_ROOT)/$(BUILD_TYPE)/$(PROJECT_NAME)
ROM_FOLDER=$(BUILD_ROOT)/$(BUILD_TYPE)
COMMON_BUILD_FOLDER=$(BUILD_ROOT)/common
COMMON_LIB_FOLDER=$(BUILD_ROOT)/lib

# Loadable module linking mode (dynamic/static)
ifneq ($(LOAD_LINK),static)
	LOAD_LINK=dynamic
endif

# LCD operation - 4bit or 8bit
ifneq ($(LCD_MODE),8bit)
	LCD_MODULE=lcd4bit.s
else
	LCD_MODULE=lcd8bit.s
endif

# ACIA TX IRQ support
# Possible values below
# WDC65C51 - use 0
# R6551 - use 1 or 0 (both are supported, but 1 is "better")
ACIA_TX_IRQ=0

# Default address mode (basic/ext/.. )
ADDRESS_MODE=ext

# Default clock mode (supported are: slow, 250k, 1m, 2m, 4m, 8m)
CLOCK_MODE=1m

# Clock mode translation (for CA65 preprocessor) - see common/include/clock.inc
ifeq ($(CLOCK_MODE), slow)
	CLOCK_MODE_FLAG=0
else ifeq ($(CLOCK_MODE), 250k)
	CLOCK_MODE_FLAG=1
else ifeq ($(CLOCK_MODE), 1m)
	CLOCK_MODE_FLAG=2
else ifeq ($(CLOCK_MODE), 2m)
	CLOCK_MODE_FLAG=3
else ifeq ($(CLOCK_MODE), 4m)
	CLOCK_MODE_FLAG=4
else ifeq ($(CLOCK_MODE), 8m)
	CLOCK_MODE_FLAG=5
else
	$(error Incorrect clock mode selected: $(CLOCK_MODE))
endif

# Include folders
COMMON_ROOT=../../common
COMMON_INCLUDE_FOLDER=$(COMMON_ROOT)/include
COMMON_SOURCE_FOLDER=$(COMMON_ROOT)/source

BASE_LIBRARY=$(COMMON_ROOT)/none.lib

# Common objects to be linked
COMMON_SOURCES=syscalls.s    \
							 acia.s        \
               blink.s       \
							 core.s        \
							 keyboard.s    \
							 lcd.s         \
							 $(LCD_MODULE) \
							 modem.s       \
							 string.s      \
							 utils.s       \
							 via.s         \
							 via_utils.s   \
							 tty.s         \
							 parse.s       \
							 menu.s

COMMON_OBJECTS=$(COMMON_SOURCES:%.s=$(COMMON_BUILD_FOLDER)/%.o)

COMMON_LIBRARY=$(COMMON_LIB_FOLDER)/common.lib

# Common library for loadable modules
COMMON_LOAD_SOURCES=syscalls.s \
                    loadlib.s

# ZEROPAGE map
# Must be defined separately and forced to link against the objects to ensure memory reservation
SYSTEM_MEMORY_MAP_OBJECT=$(COMMON_BUILD_FOLDER)/zeropage.o $(COMMON_BUILD_FOLDER)/sysram_map.o

COMMON_LOAD_OBJECTS=$(COMMON_LOAD_SOURCES:%.s=$(COMMON_BUILD_FOLDER)/%.load.o)

COMMON_LOAD_LIBRARY=$(COMMON_LIB_FOLDER)/common.load.lib

COMMON_C_LIB_SOURCES=crt0.s

COMMON_C_LIB_OBJECTS=$(COMMON_C_LIB_SOURCES:%.s=$(COMMON_BUILD_FOLDER)/%.o)

COMMON_C_LIBRARY=$(COMMON_LIB_FOLDER)/common.c.lib

# Source files to be compiled
# ASM_SOURCES = via.s start.s
# C source files to be compiled
# C_SOURCES = main.c
# Object files to be generated
OBJECTS = $(ASM_SOURCES:%.s=$(BUILD_FOLDER)/%.o) $(C_SOURCES:%.c=$(BUILD_FOLDER)/%.o)

ifeq ($(BUILD_TYPE),load)
# Choose configuration file for firmware (determines addressing mode)
FIRMWARE_CFG=../../common/load.cfg
# Resulting binary file (ROM to be uploaded)
FIRMWARE_RAW=$(ROM_FOLDER)/$(PROJECT_NAME)/$(PROJECT_NAME).load.raw
FIRMWARE_BINARY=$(ROM_FOLDER)/$(PROJECT_NAME).load.bin
FIRMWARE_MAP=$(ROM_FOLDER)/$(PROJECT_NAME)/$(PROJECT_NAME).load.map
else
# Choose configuration file for firmware (determines addressing mode)
FIRMWARE_CFG=../../common/firmware.$(ADDRESS_MODE).cfg
# Resulting binary file (ROM to be uploaded)
FIRMWARE_BINARY=$(ROM_FOLDER)/$(PROJECT_NAME).$(ADDRESS_MODE).bin
FIRMWARE_MAP=$(ROM_FOLDER)/$(PROJECT_NAME)/$(PROJECT_NAME).$(ADDRESS_MODE).map
endif

# Loadable module linking library - depending on link mode
ifeq ($(LOAD_LINK),dynamic)
	LOAD_LINK_LIBRARY = $(COMMON_LOAD_LIBRARY)
else
	LOAD_LINK_LIBRARY = $(COMMON_LIBRARY)
endif

# Compile assembler sources
$(BUILD_FOLDER)/%.o: %.s $(FIRMWARE_CFG)
	@$(MKDIR_BINARY) $(MKDIR_FLAGS) $(BUILD_FOLDER)
	$(CA65_BINARY) $(CA65_FLAGS) -I $(COMMON_INCLUDE_FOLDER) -o $@ -l $(@:.o=.lst) $<

# Compile C sources
$(BUILD_FOLDER)/%.o: %.c $(FIRMWARE_CFG)
	@$(MKDIR_BINARY) $(MKDIR_FLAGS) $(BUILD_FOLDER)
	$(CC65_BINARY) $(CC65_FLAGS) -I $(COMMON_INCLUDE_FOLDER) -o $(@:.o=.s) $<
	$(CA65_BINARY) $(CA65_FLAGS) -o $@ -l $(@:.o=.lst) $(@:.o=.s)

# Compile common assembler sources
$(COMMON_BUILD_FOLDER)/%.o: $(COMMON_SOURCE_FOLDER)/%.s $(FIRMWARE_CFG)
	@$(MKDIR_BINARY) $(MKDIR_FLAGS) $(COMMON_BUILD_FOLDER)
	$(CA65_BINARY) $(CA65_FLAGS) -I $(COMMON_INCLUDE_FOLDER) -o $@ -l $(@:.o=.lst) $<

# Compile common C sources
$(COMMON_BUILD_FOLDER)/%.o: $(COMMON_SOURCE_FOLDER)/%.c $(FIRMWARE_CFG)
	@$(MKDIR_BINARY) $(MKDIR_FLAGS) $(COMMON_BUILD_FOLDER)
	$(CC65_BINARY) $(CC65_FLAGS) -I $(COMMON_INCLUDE_FOLDER) -o $(@:.o=.s) $<
	$(CA65_BINARY) $(CA65_FLAGS) -o $@ -l $(@:.o=.lst) $(@:.o=.s)

# Compile common assembler sources for load module (shared objects)
$(COMMON_BUILD_FOLDER)/%.load.o: $(COMMON_SOURCE_FOLDER)/%.s $(FIRMWARE_CFG)
	@$(MKDIR_BINARY) $(MKDIR_FLAGS) $(COMMON_BUILD_FOLDER)
	$(CA65_BINARY) $(CA65_FLAGS) -Dload -I $(COMMON_INCLUDE_FOLDER) -o $@ -l $(@:.o=.lst) $<

$(COMMON_LIBRARY): $(COMMON_OBJECTS)
	@$(MKDIR_BINARY) $(MKDIR_FLAGS) $(COMMON_LIB_FOLDER)
	$(AR65_BINARY) $(AR65_FLAGS) $(COMMON_LIBRARY) $^

$(COMMON_LOAD_LIBRARY): $(COMMON_LOAD_OBJECTS)
	@$(MKDIR_BINARY) $(MKDIR_FLAGS) $(COMMON_LIB_FOLDER)
	$(AR65_BINARY) $(AR65_FLAGS) $(COMMON_LOAD_LIBRARY) $^

$(COMMON_C_LIBRARY): $(COMMON_C_LIB_OBJECTS)
	@$(MKDIR_BINARY) $(MKDIR_FLAGS) $(COMMON_LIB_FOLDER)
	$(CP_BINARY) $(CP_FLAGS) $(BASE_LIBRARY) $@
	$(AR65_BINARY) $(AR65_FLAGS) $(COMMON_C_LIBRARY) $^

# Standard build
all: $(FIRMWARE_BINARY)

# Linking process
ifeq ($(BUILD_TYPE),load)
$(FIRMWARE_RAW): $(SYSTEM_MEMORY_MAP_OBJECT) $(OBJECTS) $(LOAD_LINK_LIBRARY) $(COMMON_C_LIBRARY)
	@$(MKDIR_BINARY) $(MKDIR_FLAGS) $(ROM_FOLDER)
	$(LD65_BINARY) $(LD65_FLAGS) -C $(FIRMWARE_CFG) -m $(FIRMWARE_MAP) -o $(FIRMWARE_RAW) $^

$(FIRMWARE_BINARY): $(FIRMWARE_RAW)
	$(PYTHON_BINARY) $(PYTHON_PROGRAM) $^ $@
else
$(FIRMWARE_BINARY): $(SYSTEM_MEMORY_MAP_OBJECT) $(OBJECTS) $(COMMON_LIBRARY) $(COMMON_C_LIBRARY)
	@$(MKDIR_BINARY) $(MKDIR_FLAGS) $(ROM_FOLDER)
	$(LD65_BINARY) $(LD65_FLAGS) -C $(FIRMWARE_CFG) -m $(FIRMWARE_MAP) -o $@ $^
endif

# Display ROM contents
ifeq ($(BUILD_TYPE),load)
test: $(FIRMWARE_RAW)
else
test: $(FIRMWARE_BINARY)
endif
	$(HEXDUMP_BINARY) $(HEXDUMP_FLAGS) $<
	@$(MD5_BINARY) $<

# Burn ROM to EEPROM
install: $(FIRMWARE_BINARY)
	$(MINIPRO_BINARY) -p $(EEPROM_MODEL) -w $<	

# Emulate code
emu: $(FIRMWARE_BINARY)
	$(X6502_BINARY) $<

terminal:
	$(PICOCOM_BINARY) $(PICOCOM_FLAGS) /dev/tty.usbserial-DN4QHYAP

# Clean generated files
clean:
	$(RM_BINARY) -f $(ROM_FOLDER)/*.bin \
	$(RM_BINARY) -f $(ROM_FOLDER)/*.raw \
	$(BUILD_FOLDER)/*.o \
	$(BUILD_FOLDER)/*.lst \
	$(BUILD_FOLDER)/*.s \
	$(BUILD_FOLDER)/*.map \
	$(COMMON_BUILD_FOLDER)/*.o \
	$(COMMON_BUILD_FOLDER)/*.lst \
	$(COMMON_BUILD_FOLDER)/*.s \
	$(COMMON_LIB_FOLDER)/*.lib
