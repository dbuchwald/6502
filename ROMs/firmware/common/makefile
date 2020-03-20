# cc65 utilities used in this example
CA65_BINARY=ca65
CC65_BINARY=cc65
CL65_BINARY=cl65

CPU_FLAG=--cpu 65C02
ARCH_FLAG=-t none
CLOCK_FLAG=-Dfastclock=$(FASTCLOCK)

CC65_FLAGS=$(CPU_FLAG) $(ARCH_FLAG) $(CLOCK_FLAG) -O
CA65_FLAGS=$(CPU_FLAG) $(CLOCK_FLAG)
CL65_FLAGS=$(ARCH_FLAG)

# MiniPro will be used to upload the ROM
MINIPRO_BINARY=minipro
EEPROM_MODEL=AT28C256

# Hexdump is used for "testing" the ROM
HEXDUMP_BINARY=hexdump
HEXDUMP_FLAGS=-C

# Emulator binary
X6502_BINARY=x6502

# Checksum generator
MD5_BINARY=md5

# Standard utilities (rm/mkdir)
RM_BINARY=rm
MKDIR_BINARY=mkdir
MKDIR_FLAGS=-p

# Picocom settings
PICOCOM_BINARY=picocom
PICOCOM_FLAGS=-b 19200 -fh --send-cmd 'sz -X'

# Build folder
BUILD_ROOT=../../build
BUILD_FOLDER=$(BUILD_ROOT)/$(BUILD_TYPE)/$(PROJECT_NAME)
ROM_FOLDER=$(BUILD_ROOT)/$(BUILD_TYPE)
# LOAD_FOLDER=$(BUILD_ROOT)/load
COMMON_BUILD_FOLDER=$(BUILD_ROOT)/common

# Include folders
COMMON_ROOT=../../common
COMMON_INCLUDE_FOLDER=$(COMMON_ROOT)/include
COMMON_SOURCE_FOLDER=$(COMMON_ROOT)/source

# Common objects to be linked
COMMON_OBJECTS=$(COMMON_DEPS:%=$(COMMON_BUILD_FOLDER)/%)

# Source files to be compiled
# ASM_SOURCES = via.s start.s
# C source files to be compiled
# C_SOURCES = main.c
# Object files to be generated
OBJECTS = $(ASM_SOURCES:%.s=$(BUILD_FOLDER)/%.o) $(C_SOURCES:%.c=$(BUILD_FOLDER)/%.o) $(COMMON_OBJECTS)

# Default address mode (basic/ext/.. )
ADDRESS_MODE=ext

# Default clock mode (slow/fast)
FASTCLOCK=1

ifeq ($(BUILD_TYPE),load)
# Choose configuration file for firmware (determines addressing mode)
FIRMWARE_CFG=../../common/load.cfg
# Resulting binary file (ROM to be uploaded)
FIRMWARE_BINARY=$(ROM_FOLDER)/$(PROJECT_NAME).load.bin
else
# Choose configuration file for firmware (determines addressing mode)
FIRMWARE_CFG=../../common/firmware.$(ADDRESS_MODE).cfg
# Resulting binary file (ROM to be uploaded)
FIRMWARE_BINARY=$(ROM_FOLDER)/$(PROJECT_NAME).$(ADDRESS_MODE).bin
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

# Standard build
all: $(FIRMWARE_BINARY)

# Linking process
$(FIRMWARE_BINARY): $(OBJECTS)
	@$(MKDIR_BINARY) $(MKDIR_FLAGS) $(ROM_FOLDER)
ifeq ($(BUILD_TYPE),load)
	$(CL65_BINARY) $(CL65_FLAGS) -C $(FIRMWARE_CFG) -m $(FIRMWARE_BINARY:.bin=.map) -o $(@:.bin=.raw) $^
	printf "\x00\x10" | cat - $(@:.bin=.raw) | bbe `echo -e 's/\x00*$$//'` >  $@
#	sed `echo -e 's/^/\x00\x10/'` $(@:.bin=.raw) | sed `echo -e 's/\x00*$$//'` >  $@
#	printf "\x00\x10" | - $(@:.bin=.raw) | sed `echo -e ':L;s/\x00*$$/$$/;tL'` >  $@
#	printf "\x00\x10" | cat - $(@:.bin=.raw)  >  $@
else
	$(CL65_BINARY) $(CL65_FLAGS) -C $(FIRMWARE_CFG) -m $(FIRMWARE_BINARY:.bin=.map) -o $@ $^
endif


# Display ROM contents
test: $(FIRMWARE_BINARY)
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
	$(BUILD_FOLDER)/*.o \
	$(BUILD_FOLDER)/*.lst \
	$(BUILD_FOLDER)/*.s \
	$(ROM_FOLDER)/*.map \
	$(COMMON_BUILD_FOLDER)/*.o \
	$(COMMON_BUILD_FOLDER)/*.lst \
	$(COMMON_BUILD_FOLDER)/*.s \

