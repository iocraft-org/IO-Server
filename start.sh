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
MONGO=$(cat ~/.mongo_string)
JAR="forge-1.12.2-14.23.5.2768-universal.jar"
RAM_MIN="1G"
RAM_MAX="3G"
CPU_CORES="1"
#CURRENT_VERSION="$(curl -s 'https://raw.githubusercontent.com/worldautomation/WA-Launcher-Pack/master/app/assets/distribution.json' | awk '/version/{i++}i==2{print; exit}' | awk -F "\"*:\"*" '{print $2}' | cut -c 3- | cut -c -7)"
if ! screen -list | grep -q "iogame"; then
	echo "Server is starting!"
	#bash push.sh

	# MagiBridge MySQL
	rm /storage/server/plugins/magibridge/MagiBridge.conf;
	sed "s#DISCORD_TOKEN#$DISCORD#g" /storage/server/plugins/magibridge/MagiBridge.conf.template > /storage/server/plugins/magibridge/MagiBridge.conf;

	# UltimateChat MySQL
	rm /storage/server/plugins/ultimatechat/config.conf;
	sed "s#DISCORD_TOKEN#$DISCORD#g" /storage/server/plugins/ultimatechat/config.conf.template > /storage/server/plugins/ultimatechat/config.conf;

	# LuckPerms MySQL
	rm /storage/server/plugins/luckperms/luckperms.conf;
	sed "s#MONGO_STRING#$MONGO#g" /storage/server/plugins/luckperms/luckperms.conf.template > /storage/server/plugins/luckperms/luckperms.conf;
	sed -i "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" /storage/server/plugins/luckperms/luckperms.conf;
	sed -i "s/MYSQL_USER/$MYSQL_USER/g" /storage/server/plugins/luckperms/luckperms.conf;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /storage/server/plugins/luckperms/luckperms.conf;
	sed -i "s/MYSQL_HOST/$MYSQL_HOST/g" /storage/server/plugins/luckperms/luckperms.conf;

	# InvSync MySQL
	rm /storage/server/plugins/invsync/invsync.conf;
	sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" /storage/server/plugins/invsync/invsync.conf.template > /storage/server/plugins/invsync/invsync.conf;
	sed -i "s/MYSQL_USER/$MYSQL_USER/g" /storage/server/plugins/invsync/invsync.conf;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /storage/server/plugins/invsync/invsync.conf;
	sed -i "s/MYSQL_HOST/$MYSQL_HOST/g" /storage/server/plugins/invsync/invsync.conf;

	# BetterChunkLoader MySQL
	rm /storage/server/plugins/betterchunkloader/config.conf;
	sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" /storage/server/plugins/betterchunkloader/config.conf.template > /storage/server/plugins/betterchunkloader/config.conf;
	sed -i "s/MYSQL_USER/$MYSQL_USER/g" /storage/server/plugins/betterchunkloader/config.conf;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /storage/server/plugins/betterchunkloader/config.conf;
	sed -i "s/MYSQL_HOST/$MYSQL_HOST/g" /storage/server/plugins/betterchunkloader/config.conf;

	# TotalEconomy MySQL
	rm /storage/server/plugins/totaleconomy/totaleconomy.conf;
	sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" /storage/server/plugins/totaleconomy/totaleconomy.conf.template > /storage/server/plugins/totaleconomy/totaleconomy.conf;
	sed -i "s/MYSQL_USER/$MYSQL_USER/g" /storage/server/plugins/totaleconomy/totaleconomy.conf;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /storage/server/plugins/totaleconomy/totaleconomy.conf;
	sed -i "s/MYSQL_HOST/$MYSQL_HOST/g" /storage/server/plugins/totaleconomy/totaleconomy.conf;

	# Plan MySQL
	rm /storage/server/plugins/plan/config.yml;
	sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" /storage/server/plugins/plan/config.yml.template > /storage/server/plugins/plan/config.yml;
	sed -i "s/MYSQL_USER/$MYSQL_USER/g" /storage/server/plugins/plan/config.yml;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /storage/server/plugins/plan/config.yml;
	sed -i "s/MYSQL_HOST/$MYSQL_HOST/g" /storage/server/plugins/plan/config.yml;

	# aurionsvotelistener MySQL
	rm /storage/server/plugins/aurionsvotelistener/Setting.conf;
	sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" /storage/server/plugins/aurionsvotelistener/Setting.conf.template > /storage/server/plugins/aurionsvotelistener/Setting.conf;
	sed -i "s/MYSQL_USER/$MYSQL_USER/g" /storage/server/plugins/aurionsvotelistener/Setting.conf;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /storage/server/plugins/aurionsvotelistener/Setting.conf;
	sed -i "s/MYSQL_HOST/$MYSQL_HOST/g" /storage/server/plugins/aurionsvotelistener/Setting.conf;

	# PJP MySQL
	rm /storage/server/plugins/pjp/Setting.conf;
	sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" /storage/server/plugins/pjp/pjp.conf.template > /storage/server/plugins/pjp/pjp.conf;
	sed -i "s/MYSQL_USER/$MYSQL_USER/g" /storage/server/plugins/pjp/pjp.conf;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /storage/server/plugins/pjp/pjp.conf;
	sed -i "s/MYSQL_HOST/$MYSQL_HOST/g" /storage/server/plugins/pjp/pjp.conf;

	# PurpleIRC MySQL
	rm /storage/server/config/purpleirc/bots/ResistBot.yml;
	mkdir -p /storage/server/config/purpleirc/bots;
	sed "s#IRC_PASSWORD#$IRC_PASSWORD#g" /storage/server/config/purpleirc/ResistBot.yml.template > /storage/server/config/purpleirc/bots/ResistBot.yml;

	rm server.properties
	sed s/MCR_PASS/$MCR_PASS/g server.properties.template > server.properties
	#sudo screen -dmS resist sudo java -Xmx8G -Xms6G -jar forge-1.12.2-14.23.5.2768-universal.jar nogui
	sudo screen -dmS iogame sudo java -server -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=$CPU_CORES -XX:+AggressiveOpts -Xms$RAM_MIN -Xmx$RAM_MAX -jar $JAR nogui
else
	echo "Server already started!";
fi
