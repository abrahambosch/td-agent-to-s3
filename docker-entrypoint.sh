#!/bin/bash 
set -e

# start td-agent
systemctl restart td-agent.service
sleep 2; 
cat /var/log/td-agent/td-agent.log

# reference: https://github.com/docker-library/php/blob/master/8.1/bullseye/apache/Dockerfile
# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- apache2-foreground "$@"
fi

exec "$@"