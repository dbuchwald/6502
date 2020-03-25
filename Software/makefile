RM_BINARY=rm
RM_FLAGS=-rf

BUILD_FOLDER=build
ROM_FOLDER=$(BUILD_FOLDER)/rom
LOAD_FOLDER=$(BUILD_FOLDER)/load
FIRMWARE_PROJECTS_FOLDER=rom
LOADABLE_PROJECTS_FOLDER=load

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
                    12_handshake_test \
                    13_4bit_lcd \
                    14_irq_test \
                    15_serial_irq \
                    16_delay_test \
                    17_blink_test \
                    18_core_program \
                    19_keyboard_test \
                    20_convert_test \
                    21_serial_load_test \
                    22_modem_test \
										23_blink_test \
										minimal_bootloader

LOADABLE_PROJECTS = 01_blink_test \
                    02_hello_world

FIRMWARE_BINARIES=$(FIRMWARE_PROJECTS:%=$(ROM_FOLDER)/%.$(ADDRESS_MODE).bin)

LOADABLE_BINARIES=$(LOADABLE_PROJECTS:%=$(LOAD_FOLDER)/%.bin)

$(ROM_FOLDER)/%.$(ADDRESS_MODE).bin:
	$(MAKE) -C $(@:$(ROM_FOLDER)/%.$(ADDRESS_MODE).bin=$(FIRMWARE_PROJECTS_FOLDER)/%) ADDRESS_MODE=$(ADDRESS_MODE) all

$(LOAD_FOLDER)/%.bin:
	$(MAKE) -C $(@:$(LOAD_FOLDER)/%.bin=$(LOADABLE_PROJECTS_FOLDER)/%) all

all: $(FIRMWARE_BINARIES) $(LOADABLE_BINARIES)

clean:
	$(RM_BINARY) $(RM_FLAGS) $(BUILD_FOLDER)

