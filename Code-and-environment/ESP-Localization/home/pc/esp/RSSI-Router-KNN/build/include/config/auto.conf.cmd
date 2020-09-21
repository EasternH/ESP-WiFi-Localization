deps_config := \
	/home/pc/esp/esp-mdf/esp-idf/components/app_trace/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/aws_iot/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/bt/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/driver/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/esp32/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/esp_adc_cal/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/esp_event/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/esp_http_client/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/esp_http_server/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/ethernet/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/fatfs/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/freemodbus/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/freertos/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/heap/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/libsodium/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/log/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/lwip/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/mbedtls/Kconfig \
	F:/ESP32/msys32/home/pc/esp/esp-mdf/components/mcommon/Kconfig \
	F:/ESP32/msys32/home/pc/esp/esp-mdf/components/mconfig/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/mdns/Kconfig \
	F:/ESP32/msys32/home/pc/esp/esp-mdf/components/mespnow/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/mqtt/Kconfig \
	F:/ESP32/msys32/home/pc/esp/esp-mdf/components/mupgrade/Kconfig \
	F:/ESP32/msys32/home/pc/esp/esp-mdf/components/mwifi/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/nvs_flash/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/openssl/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/pthread/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/spi_flash/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/spiffs/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/tcpip_adapter/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/vfs/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/wear_levelling/Kconfig \
	/home/pc/esp/esp-mdf/esp-idf/components/bootloader/Kconfig.projbuild \
	/home/pc/esp/esp-mdf/esp-idf/components/esptool_py/Kconfig.projbuild \
	/home/pc/esp/RSSI-Router-KNN/main/Kconfig.projbuild \
	/home/pc/esp/esp-mdf/esp-idf/components/partition_table/Kconfig.projbuild \
	/home/pc/esp/esp-mdf/esp-idf/Kconfig

include/config/auto.conf: \
	$(deps_config)

ifneq "$(IDF_CMAKE)" "n"
include/config/auto.conf: FORCE
endif

$(deps_config): ;
