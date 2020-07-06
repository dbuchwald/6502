NAME := main
BUILD_FOLDER=build
HEX := $(BUILD_FOLDER)/$(NAME).hex
OUT := $(BUILD_FOLDER)/$(NAME).out
MAP := $(BUILD_FOLDER)/$(NAME).map
SOURCES := $(wildcard *.c)
HEADERS := $(wildcard *.h)
OBJECTS := $(patsubst %.c,$(BUILD_FOLDER)/%.o,$(SOURCES))

MCU := atmega2560
MCU_AVRDUDE := m2560
PARTNO := wiring
# Windows
#DEVICE := COM5 
# MacOS
DEVICE := /dev/tty.usbmodem14201
BAUDRATE := 115200
AVRDUDE_FLAGS := -F -V -D -v

CC := avr-gcc
OBJCOPY := avr-objcopy
SIZE := avr-size -A

CFLAGS := -Wall -pedantic -mmcu=$(MCU) -std=c99 -g -Os -DF_CPU=16000000UL

all: $(HEX) $(BUILD_FOLDER)

clean:
	rm -rf $(HEX) $(OUT) $(MAP) $(OBJECTS) $(BUILD_FOLDER)

$(BUILD_FOLDER):
	mkdir $(BUILD_FOLDER)

flash: $(HEX)
	avrdude $(AVRDUDE_FLAGS) -c $(PARTNO) -p $(MCU_AVRDUDE) -P $(DEVICE) -b $(BAUDRATE) -U flash:w:$(HEX)

$(HEX): $(OUT)
	$(OBJCOPY) -R .eeprom -O ihex $< $@

$(OUT): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ -Wl,-Map,$(MAP) $^
	@echo
	@$(SIZE) $@
	@echo

$(BUILD_FOLDER)/%.o: %.c $(HEADERS) $(BUILD_FOLDER)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD_FOLDER)/%.pp: %.c $(BUILD_FOLDER)
	$(CC) $(CFLAGS) -E -o $@ $<

$(BUILD_FOLDER)/%.ppo: %.c $(BUILD_FOLDER)
	$(CC) $(CFLAGS) -E $<