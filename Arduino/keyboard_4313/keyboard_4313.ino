// Every call to read() returns a single byte for each
// keystroke.  These configure what byte will be returned
// for each "special" key.  To ignore a key, use zero.
#define PS2_TAB        9
#define PS2_ENTER     13
#define PS2_BACKSPACE     127
#define PS2_ESC       27
#define PS2_INSERT      0
#define PS2_DELETE      127
#define PS2_HOME      0
#define PS2_END       0
#define PS2_PAGEUP      25
#define PS2_PAGEDOWN      26
#define PS2_UPARROW     11
#define PS2_LEFTARROW     8
#define PS2_DOWNARROW     10
#define PS2_RIGHTARROW      21
#define PS2_F1        0
#define PS2_F2        0
#define PS2_F3        0
#define PS2_F4        0
#define PS2_F5        0
#define PS2_F6        0
#define PS2_F7        0
#define PS2_F8        0
#define PS2_F9        0
#define PS2_F10       0
#define PS2_F11       0
#define PS2_F12       0
#define PS2_SCROLL      0
#define CTRL_X        24 // CANCEL

#define PS2_INVERTED_EXCLAMATION  161 // ¡
#define PS2_CENT_SIGN     162 // ¢
#define PS2_POUND_SIGN      163 // £
#define PS2_CURRENCY_SIGN   164 // ¤
#define PS2_YEN_SIGN      165 // ¥
#define PS2_BROKEN_BAR                  166 // ¦
#define PS2_SECTION_SIGN    167 // §
#define PS2_DIAERESIS     168 // ¨
#define PS2_COPYRIGHT_SIGN    169 // ©
#define PS2_FEMININE_ORDINAL    170 // ª
#define PS2_LEFT_DOUBLE_ANGLE_QUOTE 171 // «
#define PS2_NOT_SIGN      172 // ¬
#define PS2_HYPHEN      173
#define PS2_REGISTERED_SIGN   174 // ®
#define PS2_MACRON      175 // ¯
#define PS2_DEGREE_SIGN     176 // °
#define PS2_PLUS_MINUS_SIGN   177 // ±
#define PS2_SUPERSCRIPT_TWO   178 // ²
#define PS2_SUPERSCRIPT_THREE   179 // ³
#define PS2_ACUTE_ACCENT    180 // ´
#define PS2_MICRO_SIGN      181 // µ
#define PS2_PILCROW_SIGN    182 // ¶
#define PS2_MIDDLE_DOT      183 // ·
#define PS2_CEDILLA     184 // ¸
#define PS2_SUPERSCRIPT_ONE   185 // ¹
#define PS2_MASCULINE_ORDINAL   186 // º
#define PS2_RIGHT_DOUBLE_ANGLE_QUOTE  187 // »
#define PS2_FRACTION_ONE_QUARTER  188 // ¼
#define PS2_FRACTION_ONE_HALF   189 // ½
#define PS2_FRACTION_THREE_QUARTERS 190 // ¾
#define PS2_INVERTED_QUESTION MARK  191 // ¿
#define PS2_A_GRAVE     192 // À
#define PS2_A_ACUTE     193 // Á
#define PS2_A_CIRCUMFLEX    194 // Â
#define PS2_A_TILDE     195 // Ã
#define PS2_A_DIAERESIS     196 // Ä
#define PS2_A_RING_ABOVE    197 // Å
#define PS2_AE        198 // Æ
#define PS2_C_CEDILLA     199 // Ç
#define PS2_E_GRAVE     200 // È
#define PS2_E_ACUTE     201 // É
#define PS2_E_CIRCUMFLEX    202 // Ê
#define PS2_E_DIAERESIS     203 // Ë
#define PS2_I_GRAVE     204 // Ì
#define PS2_I_ACUTE     205 // Í
#define PS2_I_CIRCUMFLEX    206 // Î
#define PS2_I_DIAERESIS     207 // Ï
#define PS2_ETH       208 // Ð
#define PS2_N_TILDE     209 // Ñ
#define PS2_O_GRAVE     210 // Ò
#define PS2_O_ACUTE     211 // Ó
#define PS2_O_CIRCUMFLEX    212 // Ô
#define PS2_O_TILDE     213 // Õ
#define PS2_O_DIAERESIS     214 // Ö
#define PS2_MULTIPLICATION    215 // ×
#define PS2_O_STROKE      216 // Ø
#define PS2_U_GRAVE     217 // Ù
#define PS2_U_ACUTE     218 // Ú
#define PS2_U_CIRCUMFLEX    219 // Û
#define PS2_U_DIAERESIS     220 // Ü
#define PS2_Y_ACUTE     221 // Ý
#define PS2_THORN     222 // Þ
#define PS2_SHARP_S     223 // ß
#define PS2_a_GRAVE     224 // à
#define PS2_a_ACUTE     225 // á
#define PS2_a_CIRCUMFLEX    226 // â
#define PS2_a_TILDE     227 // ã
#define PS2_a_DIAERESIS     228 // ä
#define PS2_a_RING_ABOVE    229 // å
#define PS2_ae        230 // æ
#define PS2_c_CEDILLA     231 // ç
#define PS2_e_GRAVE     232 // è
#define PS2_e_ACUTE     233 // é
#define PS2_e_CIRCUMFLEX    234 // ê
#define PS2_e_DIAERESIS     235 // ë
#define PS2_i_GRAVE     236 // ì
#define PS2_i_ACUTE     237 // í
#define PS2_i_CIRCUMFLEX    238 // î
#define PS2_i_DIAERESIS     239 // ï
#define PS2_eth       240 // ð
#define PS2_n_TILDE     241 // ñ
#define PS2_o_GRAVE     242 // ò
#define PS2_o_ACUTE     243 // ó
#define PS2_o_CIRCUMFLEX    244 // ô
#define PS2_o_TILDE     245 // õ
#define PS2_o_DIAERESIS     246 // ö
#define PS2_DIVISION      247 // ÷
#define PS2_o_STROKE      248 // ø
#define PS2_u_GRAVE     249 // ù
#define PS2_u_ACUTE     250 // ú
#define PS2_u_CIRCUMFLEX    251 // û
#define PS2_u_DIAERESIS     252 // ü
#define PS2_y_ACUTE     253 // ý
#define PS2_thorn     254 // þ
#define PS2_y_DIAERESIS     255 // ÿ

#define PS2_KEYMAP_SIZE 136

typedef struct {
  uint8_t noshift[PS2_KEYMAP_SIZE];
  uint8_t shift[PS2_KEYMAP_SIZE];
  uint8_t uses_altgr;
  uint8_t altgr[PS2_KEYMAP_SIZE];
} PS2Keymap_t;

const PROGMEM PS2Keymap_t PS2Keymap_US = {
  // without shift
  {0, PS2_F9, 0, PS2_F5, PS2_F3, PS2_F1, PS2_F2, PS2_F12,
  0, PS2_F10, PS2_F8, PS2_F6, PS2_F4, PS2_TAB, '`', 0,
  0, 0 /*Lalt*/, 0 /*Lshift*/, 0, 0 /*Lctrl*/, 'q', '1', 0,
  0, 0, 'z', 's', 'a', 'w', '2', 0,
  0, 'c', 'x', 'd', 'e', '4', '3', 0,
  0, ' ', 'v', 'f', 't', 'r', '5', 0,
  0, 'n', 'b', 'h', 'g', 'y', '6', 0,
  0, 0, 'm', 'j', 'u', '7', '8', 0,
  0, ',', 'k', 'i', 'o', '0', '9', 0,
  0, '.', '/', 'l', ';', 'p', '-', 0,
  0, 0, '\'', 0, '[', '=', 0, 0,
  0 /*CapsLock*/, 0 /*Rshift*/, PS2_ENTER /*Enter*/, ']', 0, '\\', 0, 0,
  0, 0, 0, 0, 0, 0, PS2_BACKSPACE, 0,
  0, '1', 0, '4', '7', 0, 0, 0,
  '0', '.', '2', '5', '6', '8', PS2_ESC, 0 /*NumLock*/,
  PS2_F11, '+', '3', '-', '*', '9', PS2_SCROLL, 0,
  0, 0, 0, PS2_F7 },
  // with shift
  {0, PS2_F9, 0, PS2_F5, PS2_F3, PS2_F1, PS2_F2, PS2_F12,
  0, PS2_F10, PS2_F8, PS2_F6, PS2_F4, PS2_TAB, '~', 0,
  0, 0 /*Lalt*/, 0 /*Lshift*/, 0, 0 /*Lctrl*/, 'Q', '!', 0,
  0, 0, 'Z', 'S', 'A', 'W', '@', 0,
  0, 'C', 'X', 'D', 'E', '$', '#', 0,
  0, ' ', 'V', 'F', 'T', 'R', '%', 0,
  0, 'N', 'B', 'H', 'G', 'Y', '^', 0,
  0, 0, 'M', 'J', 'U', '&', '*', 0,
  0, '<', 'K', 'I', 'O', ')', '(', 0,
  0, '>', '?', 'L', ':', 'P', '_', 0,
  0, 0, '"', 0, '{', '+', 0, 0,
  0 /*CapsLock*/, 0 /*Rshift*/, PS2_ENTER /*Enter*/, '}', 0, '|', 0, 0,
  0, 0, 0, 0, 0, 0, PS2_BACKSPACE, 0,
  0, '1', 0, '4', '7', 0, 0, 0,
  '0', '.', '2', '5', '6', '8', PS2_ESC, 0 /*NumLock*/,
  PS2_F11, '+', '3', '-', '*', '9', PS2_SCROLL, 0,
  0, 0, 0, PS2_F7 },
  0
};


/**
 * Purpose: Provides an easy access to PS2 keyboards
 * Author:  Christian Weichel
 */
class PS2Keyboard {
  public:
    /**
     * This constructor does basically nothing. Please call the begin(int,int)
     * method before using any other method of this class.
     */
    PS2Keyboard();
    
    /**
     * Starts the keyboard "service" by registering the external interrupt.
     * setting the pin modes correctly and driving those needed to high.
     * The propably best place to call this method is in the setup routine.
     */
    static void begin(uint8_t dataPin, uint8_t irq_pin, const PS2Keymap_t &map = PS2Keymap_US);
    
    /**
     * Returns true if there is a char to be read, false if not.
     */
    static bool available();
    
    /**
     * Returns the char last read from the keyboard.
     * If there is no char available, -1 is returned.
     */
    static int read();
    static int readUnicode();
};

#define BUFFER_SIZE 45
static volatile uint8_t buffer[BUFFER_SIZE];
static volatile uint8_t head, tail;
static uint8_t DataPin;
static uint8_t CharBuffer=0;
static uint8_t UTF8next=0;
static const PS2Keymap_t *keymap=NULL;

// The ISR for the external interrupt
void ps2interrupt(void)
{
  static uint8_t bitcount=0;
  static uint8_t incoming=0;
  static uint32_t prev_ms=0;
  uint32_t now_ms;
  uint8_t n, val;

  val = digitalRead(DataPin);
  now_ms = millis();
  if (now_ms - prev_ms > 250) {
    bitcount = 0;
    incoming = 0;
  }
  prev_ms = now_ms;
  n = bitcount - 1;
  if (n <= 7) {
    incoming |= (val << n);
  }
  bitcount++;
  if (bitcount == 11) {
    uint8_t i = head + 1;
    if (i >= BUFFER_SIZE) i = 0;
    if (i != tail) {
      buffer[i] = incoming;
      head = i;
    }
    bitcount = 0;
    incoming = 0;
  }
}

static inline uint8_t get_scan_code(void)
{
  uint8_t c, i;

  i = tail;
  if (i == head) return 0;
  i++;
  if (i >= BUFFER_SIZE) i = 0;
  c = buffer[i];
  tail = i;
  return c;
}

// http://www.quadibloc.com/comp/scan.htm
// http://www.computer-engineering.org/ps2keyboard/scancodes2.html

// These arrays provide a simple key map, to turn scan codes into ISO8859
// output.  If a non-US keyboard is used, these may need to be modified
// for the desired output.
//

#define BREAK     0x01
#define MODIFIER  0x02
#define SHIFT_L   0x04
#define SHIFT_R   0x08
#define ALTGR     0x10
#define CTRL      0x20

static char get_iso8859_code(void)
{
  static uint8_t state=0;
  uint8_t s;
  char c;

  while (1) {
    s = get_scan_code();
    if (!s) return 0;
    if (s == 0xF0) {
      state |= BREAK;
    } else if (s == 0xE0) {
      state |= MODIFIER;
    } else {
      if (state & BREAK) {
        if (s == 0x12) {
          state &= ~SHIFT_L;
        } else if (s == 0x59) {
          state &= ~SHIFT_R;
        } else if (s == 0x14) {
          state &= ~CTRL;
        } else if (s == 0x11 && (state & MODIFIER)) {
          state &= ~ALTGR;
        }
        // CTRL, ALT & WIN keys could be added
        // but is that really worth the overhead?
        state &= ~(BREAK | MODIFIER);
        continue;
      }
      if (s == 0x12) {
        state |= SHIFT_L;
        continue;
      } else if (s == 0x59) {
        state |= SHIFT_R;
        continue;
      } else if (s == 0x14) {
        state |= CTRL;
        continue;
      } else if (s == 0x11 && (state & MODIFIER)) {
        state |= ALTGR;
      }
      c = 0;
      if (state & MODIFIER) {
        switch (s) {
          case 0x70: c = PS2_INSERT;      break;
          case 0x6C: c = PS2_HOME;        break;
          case 0x7D: c = PS2_PAGEUP;      break;
          case 0x71: c = PS2_DELETE;      break;
          case 0x69: c = PS2_END;         break;
          case 0x7A: c = PS2_PAGEDOWN;    break;
          case 0x75: c = PS2_UPARROW;     break;
          case 0x6B: c = PS2_LEFTARROW;   break;
          case 0x72: c = PS2_DOWNARROW;   break;
          case 0x74: c = PS2_RIGHTARROW;  break;
          case 0x4A: c = '/';             break;
          case 0x5A: c = PS2_ENTER;       break;
          default: break;
        }
      } else if ((state & ALTGR) && keymap->uses_altgr) {
        if (s < PS2_KEYMAP_SIZE)
          c = pgm_read_byte(keymap->altgr + s);
      } else if (state & (SHIFT_L | SHIFT_R)) {
        if (s < PS2_KEYMAP_SIZE)
          c = pgm_read_byte(keymap->shift + s);
      } else if (state & CTRL) {
        if (s == 0x22) {
          c = CTRL_X;
        }
      } else {
        if (s < PS2_KEYMAP_SIZE)
          c = pgm_read_byte(keymap->noshift + s);
      }
      state &= ~(BREAK | MODIFIER);
      if (c) return c;
    }
  }
}

bool PS2Keyboard::available() {
  if (CharBuffer || UTF8next) return true;
  CharBuffer = get_iso8859_code();
  if (CharBuffer) return true;
  return false;
}

int PS2Keyboard::read() {
  uint8_t result;

  result = UTF8next;
  if (result) {
    UTF8next = 0;
  } else {
    result = CharBuffer;
    if (result) {
      CharBuffer = 0;
    } else {
      result = get_iso8859_code();
    }
    if (result >= 128) {
      UTF8next = (result & 0x3F) | 0x80;
      result = ((result >> 6) & 0x1F) | 0xC0;
    }
  }
  if (!result) return -1;
  return result;
}

int PS2Keyboard::readUnicode() {
  int result;

  result = CharBuffer;
  if (!result) result = get_iso8859_code();
  if (!result) return -1;
  UTF8next = 0;
  CharBuffer = 0;
  return result;
}

PS2Keyboard::PS2Keyboard() {
  // nothing to do here, begin() does it all
}

void PS2Keyboard::begin(uint8_t data_pin, uint8_t irq_pin, const PS2Keymap_t &map) {
  uint8_t irq_num=255;

  DataPin = data_pin;
  keymap = &map;

  // initialize the pins
  pinMode(irq_pin, INPUT_PULLUP);
  pinMode(data_pin, INPUT_PULLUP);
  head = 0;
  tail = 0;
  attachInterrupt(digitalPinToInterrupt(irq_pin), ps2interrupt, FALLING);
}


const int DATA_PIN_4313 = 0;
const int IRQ_PIN_4313 =  4;

const char DATA[] = {9, 10, 11, 12, 13, 14, 15, 16};

#define HS_DATA_TAKEN 5
#define HS_DATA_READY 1

#define KEYBOARD_CONNECTION_SIGNAL 0xff
#define KEYBOARD_DISCONNECTION_SIGNAL 0xfe
#define KEYBOARD_ECHO_COMMAND 0xee

PS2Keyboard keyboard;
bool lastStatus;

void setup() {

  for (int n = 0; n < 8; n += 1) {
    pinMode(DATA[n], OUTPUT);
    digitalWrite(DATA[n], LOW);    
  }
  
  pinMode(HS_DATA_TAKEN, INPUT_PULLUP);
  pinMode(HS_DATA_READY, OUTPUT);
  digitalWrite(HS_DATA_READY, HIGH);

  delay(1000);
  keyboard.begin(DATA_PIN_4313, IRQ_PIN_4313);
  if (lastStatus=testConnection()) {
    sendChar(KEYBOARD_CONNECTION_SIGNAL);
  } else {
    sendChar(KEYBOARD_DISCONNECTION_SIGNAL);
  }

}

void loop() {
  static uint32_t lastSignalTimestamp = millis();
  uint32_t currentTimestamp;

  currentTimestamp = millis();

  if (keyboard.available()) {
    lastSignalTimestamp = currentTimestamp;
    
    // read the next key
    char c = keyboard.read();
    // if keyboard is now connected
    if (!lastStatus) {
      lastStatus=true;
      sendChar(KEYBOARD_CONNECTION_SIGNAL);
    }
    sendChar(c);
  } else {
    if (currentTimestamp - lastSignalTimestamp > 5000) {
      lastSignalTimestamp = currentTimestamp;
      bool currentStatus=testConnection();
      if (currentStatus != lastStatus) {
        lastStatus=currentStatus;
        if (currentStatus) {
          sendChar(KEYBOARD_CONNECTION_SIGNAL);
        } else {
          sendChar(KEYBOARD_DISCONNECTION_SIGNAL);
        }
      }
    }
  }
}

bool testConnection() {
  sendToKeyboard(KEYBOARD_ECHO_COMMAND);
  uint32_t start = millis();
  uint32_t current;
  do {
    uint8_t c = get_scan_code();
    if (c == KEYBOARD_ECHO_COMMAND) {
      return true;
    } else if (c != 0) {
      return false;
    }
    current = millis();
  } while (current - start < 20);
  return false;
}

bool commandBuffer[11];
int cbufIndex=0;

void sendToKeyboard(uint8_t command) {
  commandBuffer[0] = false;
  int parity=0;
  for (int i=1; i<9; i++) {
    commandBuffer[i] = (command & 1);
    if (commandBuffer[i]) {
      parity ++;
    }
    command=command >> 1;
  }
  commandBuffer[9]=!(parity & 1);
  commandBuffer[10]=true;
  detachInterrupt(digitalPinToInterrupt(IRQ_PIN_4313));
  pinMode(IRQ_PIN_4313, OUTPUT);
  digitalWrite(IRQ_PIN_4313, LOW);
  delay(1);
  pinMode(DATA_PIN_4313, OUTPUT);
  digitalWrite(DATA_PIN_4313, LOW);
  pinMode(IRQ_PIN_4313, INPUT_PULLUP);
  cbufIndex=0;
  attachInterrupt(digitalPinToInterrupt(IRQ_PIN_4313), onCommandClock, FALLING);
  // Reset IRQ after 25ms (in case keyboard doesn't respond)
  delay(25);
  detachInterrupt(digitalPinToInterrupt(IRQ_PIN_4313));
  pinMode(DATA_PIN_4313, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(IRQ_PIN_4313), ps2interrupt, FALLING);
}

void onCommandClock(void) {
  if (cbufIndex<10) {
    digitalWrite(DATA_PIN_4313, commandBuffer[cbufIndex++] ? HIGH : LOW);  
  } else if (cbufIndex==10) {
    // ACK
    cbufIndex++;
  } else {
    detachInterrupt(digitalPinToInterrupt(IRQ_PIN_4313));
    pinMode(DATA_PIN_4313, INPUT_PULLUP);
    attachInterrupt(digitalPinToInterrupt(IRQ_PIN_4313), ps2interrupt, FALLING);
  }
}

void sendChar(char c)
{
  digitalWrite(HS_DATA_READY, HIGH);

  int mask = 1;
  for (int i=0; i<8; i++) {
    int bit = c & mask;
    digitalWrite(DATA[i], bit ? HIGH : LOW);
    mask = mask << 1;
  }
  delay(1);
  digitalWrite(HS_DATA_READY, LOW);
  delay(2);
  digitalWrite(HS_DATA_READY, HIGH);
}
