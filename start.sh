#!/bin/bash
cd "$(dirname "$0")"
rm -rf logs/*.gz
DISCORD=$(cat ~/.discord_token)
WP_USER=$(cat ~/.wp_user)
WP_PASS=$(cat ~/.wp_pass)
MYSQL_DATABASE=$(cat ~/.mysql_database)
MYSQL_USER=$(cat ~/.mysql_user)
MYSQL_PASSWORD=$(cat ~/.mysql_password)
MYSQL_HOST=$(cat ~/.mysql_host)
IRC_PASSWORD=$(cat ~/.irc_password)
MCR_PASS=$(cat ~/.mcr_pass)
MONGO=$(cat ~/.mongo)
JAR="Thermos-1.7.10-1614-server.jar"
RAM_MIN="1G"
RAM_MAX="3G"
CPU_CORES="1"
#CURRENT_VERSION="$(curl -s 'https://raw.githubusercontent.com/worldautomation/WA-Launcher-Pack/master/app/assets/distribution.json' | awk '/version/{i++}i==2{print; exit}' | awk -F "\"*:\"*" '{print $2}' | cut -c 3- | cut -c -7)"
if ! screen -list | grep -q "iogame"; then
	echo "Server is starting!"
	bash push.sh
	rm server.properties
	sed s/MCR_PASS/$MCR_PASS/g server.properties.template > server.properties
	#sudo screen -dmS resist sudo java -Xmx8G -Xms6G -jar forge-1.12.2-14.23.5.2768-universal.jar nogui
	sudo screen -dmS iogame sudo java -server -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=$CPU_CORES -XX:+AggressiveOpts -Xms$RAM_MIN -Xmx$RAM_MAX -jar $JAR nogui
else
	echo "Server already started!";
fi
