!#/usr/bin/env bash
# install mysql
wget http://dev.mysql.com/get/mysql-apt-config_0.6.0-1_all.deb
sudo dpkg -i mysql-apt-config_0.6.0-1_all.deb
sudo apt-get update
apt-get install mysql-server
mysql_secure_installation
