FROM php:8.1.21RC1-apache-bullseye

RUN apt-get update
RUN apt-get install sudo
RUN apt-get install systemctl -y

# install td-agent - https://docs.fluentd.org/installation/install-by-deb
RUN curl -fsSL https://toolbelt.treasuredata.com/sh/install-debian-bullseye-td-agent4.sh | sh 

RUN touch /var/log/foo.log && chmod 777 /var/log/foo.log

COPY ./src/ /var/www/html
COPY ./td-agent.conf /etc/td-agent/td-agent.conf
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
CMD ["apache2-foreground"]
