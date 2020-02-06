# cc65 utilities used in this example
CA65_BINARY=ca65
CC65_BINARY=cc65
CL65_BINARY=cl65

CPU_FLAG=--cpu 65C02
ARCH_FLAG=-t none

CC65_FLAGS=$(CPU_FLAG) $(ARCH_FLAG) -O
CA65_FLAGS=$(CPU_FLAG)
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

# Build folder
BUILD_FOLDER=../build
COMMON_BUILD_FOLDER=$(BUILD_FOLDER)/common

# Include folders
COMMON_INCLUDE_FOLDER=../common/include
COMMON_SOURCE_FOLDER=../common/source

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

# Choose configuration file for firmware (determines addressing mode)
FIRMWARE_CFG=../common/firmware.$(ADDRESS_MODE).cfg

# Resulting binary file (ROM to be uploaded)
FIRMWARE_BINARY=$(BUILD_FOLDER)/$(PROJECT_NAME).$(ADDRESS_MODE).bin

# Build the folder if doesn't exist
$(BUILD_FOLDER):
	$(MKDIR_BINARY) $(MKDIR_FLAGS) $(BUILD_FOLDER)

$(COMMON_BUILD_FOLDER): $(BUILD_FOLDER)
	$(MKDIR_BINARY) $(MKDIR_FLAGS) $(COMMON_BUILD_FOLDER)

# Compile assembler sources
$(BUILD_FOLDER)/%.o: %.s $(BUILD_FOLDER) $(FIRMWARE_CFG) 
	$(CA65_BINARY) $(CA65_FLAGS) -I $(COMMON_INCLUDE_FOLDER) -o $@ -l $(@:.o=.lst) $<

# Compile C sources
$(BUILD_FOLDER)/%.o: %.c $(BUILD_FOLDER) $(FIRMWARE_CFG) 
	$(CC65_BINARY) $(CC65_FLAGS) -I $(COMMON_INCLUDE_FOLDER) -o $(@:.o=.s) $<
	$(CA65_BINARY) $(CA65_FLAGS) -o $@ -l $(@:.o=.lst) $(BUILD_FOLDER)/$(<:.c=.s)

# Compile common assembler sources
$(COMMON_BUILD_FOLDER)/%.o: $(COMMON_SOURCE_FOLDER)/%.s $(COMMON_BUILD_FOLDER) $(FIRMWARE_CFG) 
	$(CA65_BINARY) $(CA65_FLAGS) -I $(COMMON_INCLUDE_FOLDER) -o $@ -l $(@:.o=.lst) $<

# Compile common C sources
$(COMMON_BUILD_FOLDER)/%.o: $(COMMON_SOURCE_FOLDER)/%.c $(COMMON_BUILD_FOLDER) $(FIRMWARE_CFG) 
	$(CC65_BINARY) $(CC65_FLAGS) -I $(COMMON_INCLUDE_FOLDER) -o $(@:.o=.s) $<
	$(CA65_BINARY) $(CA65_FLAGS) -o $@ -l $(@:.o=.lst) $(@:.o=.s)

# Standard build
all: $(FIRMWARE_BINARY)

# Linking process
$(FIRMWARE_BINARY): $(OBJECTS)
	$(CL65_BINARY) $(CL65_FLAGS) -C $(FIRMWARE_CFG) -m $(FIRMWARE_BINARY:.bin=.map) -o $@ $^

# Display ROM contents
test: $(FIRMWARE_BINARY)
	$(HEXDUMP_BINARY) $(HEXDUMP_FLAGS) $<
	$(MD5_BINARY) $<

# Burn ROM to EEPROM
install: $(FIRMWARE_BINARY)
	$(MINIPRO_BINARY) -p $(EEPROM_MODEL) -w $<	

# Emulate code
emu: $(FIRMWARE_BINARY)
	$(X6502_BINARY) $<

# Clean generated files
clean:
	$(RM_BINARY) -f $(BUILD_FOLDER)/*.bin \
	$(BUILD_FOLDER)/*.o \
	$(BUILD_FOLDER)/*.lst \
	$(BUILD_FOLDER)/*.s \
	$(BUILD_FOLDER)/*.map \
	$(COMMON_BUILD_FOLDER)/*.o \
	$(COMMON_BUILD_FOLDER)/*.lst \
	$(COMMON_BUILD_FOLDER)/*.s \

