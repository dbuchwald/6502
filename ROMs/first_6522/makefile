# cc65 utilities used in this example
CA65_BINARY=ca65
CL65_BINARY=cl65

# MiniPro will be used to upload the ROM
MINIPRO_BINARY=minipro
EEPROM_MODEL=AT28C256

# Hexdump is used for "testing" the ROM
HEXDUMP_BINARY=hexdump
HEXDUMP_FLAGS=-C

# Standard utilities (rm/mkdir)
RM_BINARY=rm
MKDIR_BINARY=mkdir

# Build folder
BUILD_FOLDER=build

# Source files to be compiled
SOURCES = main.s via.s
# Object files to be generated
OBJECTS = $(SOURCES:%.s=$(BUILD_FOLDER)/%.o)

# Default address mode (basic/ext/.. )
ADDRESS_MODE=ext

# Choose configuration file for firmware (determines addressing mode)
FIRMWARE_CFG=firmware.$(ADDRESS_MODE).cfg

# Resulting binary file (ROM to be uploaded)
FIRMWARE_BINARY=$(BUILD_FOLDER)/firmware.$(ADDRESS_MODE).bin

# Build the folder if doesn't exist
$(BUILD_FOLDER):
	$(MKDIR_BINARY) $(BUILD_FOLDER)

# Compile assembler sources
$(BUILD_FOLDER)/%.o: %.s $(BUILD_FOLDER) $(FIRMWARE_CFG) 
	$(CA65_BINARY) -o $@ -l $(@:.o=.lst) $<

# Standard build
all: $(FIRMWARE_BINARY)

# Linking process
$(FIRMWARE_BINARY): $(OBJECTS)
	$(CL65_BINARY) -C $(FIRMWARE_CFG) -t none -o $@ $^

# Display ROM contents
test: $(FIRMWARE_BINARY)
	$(HEXDUMP_BINARY) $(HEXDUMP_FLAGS) $<

# Burn ROM to EEPROM
install: $(FIRMWARE_BINARY)
	$(MINIPRO_BINARY) -p $(EEPROM_MODEL) -w $<	

# Clean generated files
clean:
	$(RM_BINARY) -f $(BUILD_FOLDER)/firmware.*.bin $(BUILD_FOLDER)/*.o $(BUILD_FOLDER)/*.lst