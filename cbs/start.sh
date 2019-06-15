#!/bin/bash

# Set Database connection
sed -i 's|^#\s*server = .*|server = "'$MYSQL_HOST'"|' /etc/freeradius/3.0/mods-available/sql
sed -i 's|^#\s*port = .*|port = "'$MYSQL_PORT'"|' /etc/freeradius/3.0/mods-available/sql
sed -i 's|^\s*radius_db = .*|radius_db = "'$MYSQL_DATABASE'"|' /etc/freeradius/3.0/mods-available/sql
sed -i 's|^\s*password = .*|password = "'$MYSQL_PASSWORD'"|' /etc/freeradius/3.0/mods-available/sql 
sed -i 's|^\s*login = .*|login = "'$MYSQL_USER'"|' /etc/freeradius/3.0/mods-available/sql

sed -i "s/\$configValues\['CONFIG_DB_HOST'\] = .*;/\$configValues\['CONFIG_DB_HOST'\] = '$MYSQL_HOST';/" /var/www/html/daloradius/library/daloradius.conf.php
sed -i "s/\$configValues\['CONFIG_DB_PORT'\] = .*;/\$configValues\['CONFIG_DB_PORT'\] = '$MYSQL_PORT';/" /var/www/html/daloradius/library/daloradius.conf.php
sed -i "s/\$configValues\['CONFIG_DB_PASS'\] = .*;/\$configValues\['CONFIG_DB_PASS'\] = '$MYSQL_PASSWORD';/" /var/www/html/daloradius/library/daloradius.conf.php 
sed -i "s/\$configValues\['CONFIG_DB_USER'\] = .*;/\$configValues\['CONFIG_DB_USER'\] = '$MYSQL_USER';/" /var/www/html/daloradius/library/daloradius.conf.php
sed -i "s/\$configValues\['CONFIG_DB_NAME'\] = .*;/\$configValues\['CONFIG_DB_NAME'\] = '$MYSQL_DATABASE';/" /var/www/html/daloradius/library/daloradius.conf.php

supervisord -c /etc/supervisor.conf
