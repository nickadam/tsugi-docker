FROM ubuntu
RUN apt-get update && \
    apt-get install -y apache2 php5 mysql-server php5-mysql
EXPOSE 80
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
