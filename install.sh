#!/bin/bash
PATH_TO_DIR="/etc/st-miner/"
BIN_NAME="st-miner"
PATH_TO_BIN=${PATH_TO_DIR}${BIN_NAME}
SERVICE_NAME=${BIN_NAME}
DOWNLOAD_ADDR="https://github.com/st-miner/st-miner/raw/main/releases/st-miner.tar.gz"
case $1 in
install)
	if [ -f ${PATH_TO_BIN} ]; then
		${PATH_TO_DIR}${BIN_NAME} uninstall
	fi
	#remove exists files
	rm -rf ${PATH_TO_DIR}
	rm -rf /etc/systemd/system/${SERVICE_NAME}*
	systemctl daemon-reload
	systemctl reset-failed
	mkdir ${PATH_TO_DIR}
	cd ${PATH_TO_DIR}
	set -e
	curl -s -L -o ${BIN_NAME}.tar.gz ${DOWNLOAD_ADDR}
	tar -xzvf ${BIN_NAME}.tar.gz
	chmod +x ${BIN_NAME}
	./${BIN_NAME} install
	./${BIN_NAME} start
	./${BIN_NAME} status
	IP=$(curl -s ifconfig.me)
	echo -e "\033[1;32m 安装完成，请打开网址登录(推荐google浏览器) 1;36m后台地址：http://$IP:51301 , 默认密码 : 123456 \033[0m "
	;;
update)
	if [ -f ${PATH_TO_BIN} ]; then
		rm -f ${PATH_TO_DIR}${BIN_NAME}
		rm -f ${PATH_TO_DIR}${BIN_NAME}.tar.gz
		cd ${PATH_TO_DIR}
		curl -s -L -o ${BIN_NAME}.tar.gz ${DOWNLOAD_ADDR}
		tar -xzvf ${BIN_NAME}.tar.gz
		chmod +x ${BIN_NAME}
		systemctl restart ${SERVICE_NAME}
		./${BIN_NAME} status
		echo ${BIN_NAME}" updated!"
	else
		echo "ERROR:please install "${BIN_NAME}" software first"
	fi
	;;
esac

