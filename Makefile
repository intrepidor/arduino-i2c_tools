ARDUINO_LIBS = Wire
BOARD_TAG = uno
MONITOR_PORT = /dev/ttyUSB0
MONITOR_BAUDRATE = 115200

ARDMK_DIR     = /home/allan/ESP8266/Arduino-Makefile
ARDUINO_DIR   = /home/allan/ESP8266/ESP8266-Arduino-Makefile/arduino
AVR_TOOLS_DIR = /home/allan/ESP8266/ESP8266-Arduino-Makefile/arduino/hardware/tools/avr
include ../Arduino-Makefile/Arduino.mk

tidy:
	tidy -upper -modify -wrap 120 -indent \
	--break-before-br true \
	--indent-attributes true \
	--wrap-attributes true \
	--wrap-sections false \
	config.html

lint-std: _LINT.TMP
	./lint.sh *.c*

lint-easy: _LINT.TMP
	./lint.sh easy.lnt local.lnt *.c*

lint-local: _LINT.TMP
	./lint.sh local.lnt *.c*

m: upload
	minicom
	