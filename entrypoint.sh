#!/usr/bin/env bash

# start mysql
service mysql start

# start apache
service apache2 start

# tail the log files
tail -f /var/log/apache2/access.log
