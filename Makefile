BIN=docker-entrypoint.sh
INSTALL_PATH=/usr/local/bin/

install:
	cp ${BIN} ${INSTALL_PATH}

uninstall:
	rm ${INSTALL_PATH}/${BIN}
