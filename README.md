# Fluentd aws s3 backups of logs


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
```

## Minio

http://localhost:9001/


### Note: once minio is up, login and create the bucket. 

- username: minio
- password: superpass



