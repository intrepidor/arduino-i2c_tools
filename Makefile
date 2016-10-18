# ARDUINO_ARCH is one of: esp8266, arduino
ARDUINO_ARCH ?= arduino
MMCU = atmega328p

# ARDUINO_BOARD is one of: ESP8266_ESP12, AVR_ESPLORA, AVR_UNO, AVR_MINI, AVR_NANO, AVR_MEGA, AVR_MEGA2560, AVR_LEONARDO
ARDUINO_BOARD ?= AVR_UNO

ARDUINO_VARIANT ?= uno

SERIAL_PORT = /dev/ttyUSB0
UPLOAD_SPEED = 115200
#UPLOAD_SPEED = 230400
#UPLOAD_SPEED = 460800
#UPLOAD_SPEED = 921600
#FLASH_MODE = qio
#USER_DEFINE= -D_SSID_=\"YourSSID\" -D_WIFI_PASSWORD_=\"YourPassword\"
include ../ESP8266-Arduino-Makefile/esp8266Arduino.mk

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
	