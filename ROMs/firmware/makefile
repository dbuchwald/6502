RM_BINARY=rm
RM_FLAGS=-rf

BUILD_FOLDER=build
ROM_FOLDER=$(BUILD_FOLDER)/rom

ADDRESS_MODE=ext

FIRMWARE_PROJECTS = 01_nop_fill \
                    02_nop_fffc \
                    03_first_code \
                    04_blink_s \
                    05_knight_rider \
                    06_lcd_test \
                    07_mem_test \
                    08_stack_test \
                    09_serial_test \
                    10_blink_c \
                    11_int_test \
                    12_handshake_test

FIRMWARE_BINARIES=$(FIRMWARE_PROJECTS:%=$(ROM_FOLDER)/%.$(ADDRESS_MODE).bin)

$(ROM_FOLDER)/%.$(ADDRESS_MODE).bin:
	$(MAKE) -C $(@:$(ROM_FOLDER)/%.$(ADDRESS_MODE).bin=%) ADDRESS_MODE=$(ADDRESS_MODE) all


all: $(FIRMWARE_BINARIES)


clean:
	$(RM_BINARY) $(RM_FLAGS) $(BUILD_FOLDER)

