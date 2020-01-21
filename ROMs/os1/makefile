VASM_SYNTAX=oldstyle
VASM_TARGET_CPU=6502
VASM_BINARY=vasm$(VASM_TARGET_CPU)_$(VASM_SYNTAX)
VASM_FLAGS=-wdc02

MINIPRO_BINARY=minipro
EEPROM_MODEL=AT28C256

HEXDUMP_BINARY=hexdump
HEXDUMP_FLAGS=-C

INCLUDE_DIR=include
BUILD_DIR=build

# Acceptable address modes: WDC65C02_ADDRESS_BASIC, WDC65C02_ADDRESS_BASIC_V2, WDC65C02_ADDRESS_BASIC_EXTENDED
VASM_OPTS=-DWDC65C02_ADDRESS_BASIC

ROM_OS1_BINARY=$(BUILD_DIR)/rom_os1.bin

DEPS=$(INCLUDE_DIR)/version/version.asm \
     $(INCLUDE_DIR)/arch/WDC65C02.asm \
     $(INCLUDE_DIR)/arch/WDC65C22.asm \
     $(INCLUDE_DIR)/arch/addrmap.asm \
     $(INCLUDE_DIR)/arch/portmap.asm \
     $(INCLUDE_DIR)/arch/lcd/HD44780.asm \
     $(INCLUDE_DIR)/build/AT28C256.asm \
     lcd.asm

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

$(INCLUDE_DIR)/version/version.asm: FORCE
	git log -n 1 --format=format:"  ifndef OS1_GIT_COMMIT%nOS1_GIT_COMMIT string \"%h\"%n  endif ; OS1_GIT_COMMIT%n" HEAD > $@

$(BUILD_DIR)/%.bin: %.asm $(DEPS) $(BUILD_DIR)
	$(VASM_BINARY) -Fbin $(VASM_FLAGS) $(VASM_OPTS) -I$(INCLUDE_DIR) $< -o $@ -L $@.lst

.PHONY: clean

all: $(ROM_OS1_BINARY)

test: $(ROM_OS1_BINARY)
	$(HEXDUMP_BINARY) $(HEXDUMP_FLAGS) $(ROM_OS1_BINARY)

install: $(ROM_OS1_BINARY)
	$(MINIPRO_BINARY) -p $(EEPROM_MODEL) -w $<

clean:
	rm -rf $(BUILD_DIR)/*.bin $(BUILD_DIR)/*.lst $(INCLUDE_DIR)/version/version.asm

FORCE: