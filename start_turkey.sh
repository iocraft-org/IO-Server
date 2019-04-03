#!/bin/bash
cd "$(dirname "$0")"
rm -rf logs/*.gz
DISCORD_TOKEN=$(cat ~/.discord_token)
WP_USER=$(cat ~/.wp_username)
WP_PASS=$(cat ~/.wp_password)
MYSQL_DATABASE=$(cat ~/.mysql_database)
MYSQL_USERNAME=$(cat ~/.mysql_username)
MYSQL_PASSWORD=$(cat ~/.mysql_password)
MYSQL_HOSTNAME=$(cat ~/.mysql_hostname)
#IRC_PASSWORD=$(cat ~/.irc_password)
MCR_PASS=$(cat ~/.mcr_pass)
START_SCRIPT=$(echo "start_turkey.sh")
SERVER_LOCATION=$(echo "Turkey - Europe")
RESTART_TIME=$(echo "5000")
#MONGO=$(cat ~/.mongo)
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

        rm spigot.yml
        sed s/START_SCRIPT/$START_SCRIPT/g spigot.yml.template > spigot.yml

        rm plugins/Essentials/motd.txt
        sed s/SERVER_LOCATION/$SERVER_LOCATION/g plugins/Essentials/motd.txt.template > plugins/Essentials/motd.txt


        rm plugins/Restart/config.yml
        sed s/RESTART_TIME/$RESTART_TIME/g plugins/Restart/config.yml.template > plugins/Restart/config.yml

	##
	## Start Credentials
	##

	# MySQL OnTime
	rm plugins/OnTime/config.yml;
	sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" plugins/OnTime/config.yml.template > plugins/OnTime/config.yml;
	sed -i "s/MYSQL_USERNAME/$MYSQL_USERNAME/g" plugins/OnTime/config.yml;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" plugins/OnTime/config.yml;
	sed -i "s/MYSQL_HOSTNAME/$MYSQL_HOSTNAME/g" plugins/OnTime/config.yml;

	# MySQL Inventory Bridge
	rm plugins/MysqlInventoryBridge/config.yml;
	sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" plugins/MysqlInventoryBridge/config.yml.template > plugins/MysqlInventoryBridge/config.yml;
	sed -i "s/MYSQL_USERNAME/$MYSQL_USERNAME/g" plugins/MysqlInventoryBridge/config.yml;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" plugins/MysqlInventoryBridge/config.yml;
	sed -i "s/MYSQL_HOSTNAME/$MYSQL_HOSTNAME/g" plugins/MysqlInventoryBridge/config.yml;

	# MySQL Experience Bridge
	rm plugins/MysqlExperienceBridge/config.yml;
	sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" plugins/MysqlExperienceBridge/config.yml.template > plugins/MysqlExperienceBridge/config.yml;
	sed -i "s/MYSQL_USERNAME/$MYSQL_USERNAME/g" plugins/MysqlExperienceBridge/config.yml;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" plugins/MysqlExperienceBridge/config.yml;
	sed -i "s/MYSQL_HOSTNAME/$MYSQL_HOSTNAME/g" plugins/MysqlExperienceBridge/config.yml;

	# MySQL Advanced Achievements
	rm plugins/AdvancedAchievements/config.yml;
	sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" plugins/AdvancedAchievements/config.yml.template > plugins/AdvancedAchievements/config.yml;
	sed -i "s/MYSQL_USERNAME/$MYSQL_USERNAME/g" plugins/AdvancedAchievements/config.yml;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" plugins/AdvancedAchievements/config.yml;
	sed -i "s/MYSQL_HOSTNAME/$MYSQL_HOSTNAME/g" plugins/AdvancedAchievements/config.yml;

	# MySQL PermissionsEx
	rm plugins/PermissionsEx/config.yml;
	sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" plugins/PermissionsEx/config.yml.template > plugins/PermissionsEx/config.yml;
	sed -i "s/MYSQL_USERNAME/$MYSQL_USERNAME/g" plugins/PermissionsEx/config.yml;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" plugins/PermissionsEx/config.yml;
	sed -i "s/MYSQL_HOSTNAME/$MYSQL_HOSTNAME/g" plugins/PermissionsEx/config.yml;

	# MySQL Discord SRV
	rm plugins/DiscordSRV/config.yml;
	sed "s#DISCORD_TOKEN#$DISCORD_TOKEN#g" plugins/DiscordSRV/config.yml.template > plugins/DiscordSRV/config.yml;

	##
	## End Credentials
	##

	#sudo screen -dmS resist sudo java -Xmx8G -Xms6G -jar forge-1.12.2-14.23.5.2768-universal.jar nogui
	sudo screen -dmS iogame sudo java -server -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=$CPU_CORES -XX:+AggressiveOpts -Xms$RAM_MIN -Xmx$RAM_MAX -jar $JAR nogui
else
	echo "Server already started!";
fi
