FROM php:8.1.21RC1-apache-bullseye

RUN touch /var/log/foo.log && chmod 777 /var/log/foo.log
RUN mkdir /var/log/td-agent-output && chmod 777 /var/log/td-agent-output

COPY ./src/ /var/www/html

RUN apt-get update
RUN apt-get install sudo
RUN apt-get install systemctl -y

# install td-agent : https://docs.fluentd.org/installation/install-by-deb
RUN curl -fsSL https://toolbelt.treasuredata.com/sh/install-debian-bullseye-td-agent4.sh | sh 

COPY ./td-agent.conf /etc/td-agent/td-agent.conf
RUN systemctl restart td-agent.service



