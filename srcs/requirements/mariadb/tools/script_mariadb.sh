#!/bin/sh

# LAUNCH MYSQL
service mysql start;

# CREATE DATABASE (IF IT DOES NOT EXIST)
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# CREATE USER (IF IT DOES NOT EXIST)
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# USER PRIVILEGES
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# CHANGE ROOT PRIVILEGES
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# RELOAD DATA_BASE (this way modifications for user root are taken into account)
mysql -e "FLUSH PRIVILEGES;"

# SHUTDOWN MYSQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe



