      .import _keyboard_init
      .import _handle_keyboard_irq
      .import _keyboard_is_connected
      .import _keyboard_is_data_available
      .import _keyboard_read_char

KEY_SPACE        = $20
KEY_ENTER        = $0d
KEY_ESCAPE       = $1b
KEY_BACKSPACE    = $7f
KEY_ARROW_UP     = $0b
KEY_ARROW_DOWN   = $0a
KEY_ARROW_LEFT   = $08
KEY_ARROW_RIGHT  = $15
KEY_TAB          = $09
KEY_PAGE_UP      = $19
KEY_PAGE_DOWN    = $1a
KEY_CTRL_X       = $18

KEYBOARD_NOT_CONNECTED     = $00
KEYBOARD_CONNECTED         = $01

KEYBOARD_NO_DATA_AVAILABLE = $00
KEYBOARD_DATA_AVAILABLE    = $01