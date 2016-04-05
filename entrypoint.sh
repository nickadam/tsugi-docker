#!/usr/bin/env bash

# start mysql
if pgrep mysqld >/dev/null
then
  service mysql start
fi

# start apache
if pgrep apache2 >/dev/null
then
  service apache2 start
fi

# tail the log files
tail -f /var/log/apache2/access.log
