# Fluentd aws s3 backups of logs

this project is watching logs from: /var/log/foo.log

## docker image for testing
```
docker compose up --build


systemctl status td-agent.service

# start td_agent
systemctl restart td-agent.service

cat /var/log/td-agent/td-agent.log 
tail -f /var/log/td-agent/td-agent.log

#check log syntax
/opt/td-agent/bin/fluentd --dry-run  --config /etc/td-agent/td-agent.conf 


# exec into the docker container. 
docker exec -it fluentd-app bash

# write to the log file
echo $(date -u +"%Y-%m-%dT%H:%M:%SZ")" - this is an error messgae" >> /var/log/foo.log

```

## Minio

http://localhost:9001/


### Note: once minio is up, login and create the bucket. 

- username: minio
- password: superpass



