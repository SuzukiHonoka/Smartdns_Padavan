BIN_NAME=smartdns
SRC_NAME=$(BIN_NAME).sh
BIN_URL=https://github.com/SuzukiHonoka/smartdns_for_mipsel/releases/latest/download/smartdns
SRC_URL=https://raw.githubusercontent.com/SuzukiHonoka/Smartdns_Padavan/master/smartdns.sh
BIN_PATH=/usr/bin

THISDIR = $(shell pwd)

all: bin_download src_download

bin_download:
	( if [ ! -f $(BIN_NAME) ]; then \
		wget $(BIN_URL); \
	fi )

src_download:
	( if [ ! -f $(SRC_NAME) ]; then \
		wget $(SRC_URL); \
	fi )

clean:
	rm $(THISDIR)/$(BIN_NAME) && rm $(THISDIR)/$(SRC_NAME)

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/$(BIN_NAME) $(BIN_PATH)/$(BIN_NAME)
	$(ROMFSINST) -p +x $(THISDIR)/$(SRC_NAME) $(BIN_PATH)/$(SRC_NAME)