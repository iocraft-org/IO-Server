#!/bin/bash
cd "$(dirname "$0")"
rm -rf logs/*.gz
DISCORD=$(cat ~/.discord_token)
MYSQL_DATABASE=$(cat ~/.mysql_database)
MYSQL_USER=$(cat ~/.mysql_user)
MYSQL_PASSWORD=$(cat ~/.mysql_password)
MYSQL_HOST=$(cat ~/.mysql_host)
MONGO=$(cat ~/.mongo)
#CURRENT_VERSION="$(curl -s 'https://raw.githubusercontent.com/worldautomation/WA-Launcher-Pack/master/app/assets/distribution.json' | awk '/version/{i++}i==2{print; exit}' | awk -F "\"*:\"*" '{print $2}' | cut -c 3- | cut -c -7)"
	
# MagiBridge MySQL
# rm plugins/magibridge/MagiBridge.conf;
# sed "s#DISCORD_TOKEN#$DISCORD#g" plugins/magibridge/MagiBridge.conf.template > plugins/magibridge/MagiBridge.conf;

# UltimateChat MySQL
# rm plugins/ultimatechat/config.conf;
# sed "s#DISCORD_TOKEN#$DISCORD#g" plugins/ultimatechat/config.conf.template > plugins/ultimatechat/config.conf;

# LuckPerms MySQL
# rm plugins/luckperms/luckperms.conf;
# sed "s#MONGO_STRING#$MONGO#g" plugins/luckperms/luckperms.conf.template > plugins/luckperms/luckperms.conf;
# sed -i "s/MONGO_STRING/\&/g" plugins/luckperms/luckperms.conf;

# InvSync MySQL
# rm plugins/invsync/invsync.conf;
# sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" plugins/invsync/invsync.conf.template > plugins/invsync/invsync.conf;
# sed -i "s/MYSQL_USER/$MYSQL_USER/g" plugins/invsync/invsync.conf;
# sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" plugins/invsync/invsync.conf;
# sed -i "s/MYSQL_HOST/$MYSQL_HOST/g" plugins/invsync/invsync.conf;

# BetterChunkLoader MySQL
# rm plugins/betterchunkloader/config.conf;
# sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" plugins/betterchunkloader/config.conf.template > plugins/betterchunkloader/config.conf;
# sed -i "s/MYSQL_USER/$MYSQL_USER/g" plugins/betterchunkloader/config.conf;
# sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" plugins/betterchunkloader/config.conf;
# sed -i "s/MYSQL_HOST/$MYSQL_HOST/g" plugins/betterchunkloader/config.conf;

# TotalEconomy MySQL
# rm plugins/totaleconomy/totaleconomy.conf;
# sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" plugins/totaleconomy/totaleconomy.conf.template > plugins/totaleconomy/totaleconomy.conf;
# sed -i "s/MYSQL_USER/$MYSQL_USER/g" plugins/totaleconomy/totaleconomy.conf;
# sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" plugins/totaleconomy/totaleconomy.conf;
# sed -i "s/MYSQL_HOST/$MYSQL_HOST/g" plugins/totaleconomy/totaleconomy.conf;

#sed s/WA_VERSION/$CURRENT_VERSION/g server.properties.template > server.properties
#sudo screen -dmS resist sudo java -Xmx8G -Xms6G -jar forge-1.12.2-14.23.5.2807-universal.jar nogui
#bash pull.sh
java -server -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=5 -XX:+AggressiveOpts -Xms1G -Xmx6G -jar forge-1.12.2-14.23.5.2768-universal.jar nogui
