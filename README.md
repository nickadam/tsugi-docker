# tsugi-docker
A docker container for tsugi applications, http://www.tsugi.org/

DO NOT USE THIS IN PRODUCTION
-----------------------------


    # clone this repo and cd to that directory
    git clone https://github.com/nickadam/tsugi-docker.git
    cd tsugi-docker

    # Update the config file
    cat tsugi/config-dist.php | \
    sed "s/warning:please-change-adminpw[^\'\"]*/$(env LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 16)/" | \
    sed "s/warning:please-change-cookie-secret[^\'\"]*/$(env LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 16)/" | \
    sed "s/warning:please-change-mailsecret[^\'\"]*/$(env LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 16)/" | \
    sed "s/warning:please-change-sessionsalt[^\'\"]*/$(env LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 16)/" > tsugi/config.php

    # clone tsugi
    git clone https://github.com/csev/tsugi.git

    # Build your docker image
    docker build -t tsugi .

    # Run a container
    docker run --name tsugi-dev -d -p 8080:80 -v $PWD/tsugi:/var/www/html/tsugi tsugi

    # Attach to the container's mysql and create a database for tsugi
    docker exec -it tsugi-dev mysql -u root
    CREATE DATABASE tsugi DEFAULT CHARACTER SET utf8;
    GRANT ALL ON tsugi.* TO 'ltiuser'@'localhost' IDENTIFIED BY 'ltipassword';
    GRANT ALL ON tsugi.* TO 'ltiuser'@'127.0.0.1' IDENTIFIED BY 'ltipassword';
