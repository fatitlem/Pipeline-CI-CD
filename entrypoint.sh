#!/bin/sh
# create a db and a table:
echo "Initializing database..."
mysql -u root -pmysql <<-EOSQL
CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;
EOSQL
echo "Database initialized."