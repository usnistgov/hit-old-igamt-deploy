#!/bin/bash

# igamt-tool app
if [[ $(sudo docker ps -aqf "name=igamt-tool") ]]; then
    sudo docker rm -f $(sudo docker ps -aqf "name=igamt-tool")
fi
if [[ $(sudo docker images igamt-tool -aq) ]]; then
   sudo docker rmi -f $(sudo docker images igamt-tool -aq)
fi

# igamt-mongo-db app
if [[ $(sudo docker ps -aqf "name=igamt-mongo-db") ]]; then
    sudo docker rm -f $(sudo docker ps -aqf "name=igamt-mongo-db")
fi
if [[ $(sudo docker images igamt-mongo-db -aq) ]]; then
   sudo docker rmi -f $(sudo docker images igamt-mongo-db -aq)
fi

# igamt-mongo-db app
if [[ $(sudo docker ps -aqf "name=igamt-mysql-db") ]]; then
    sudo docker rm -f $(sudo docker ps -aqf "name=igamt-mysql-db")
fi
if [[ $(sudo docker images igamt-mysql-db -aq) ]]; then
   sudo docker rmi -f $(sudo docker images igamt-mysql-db -aq)
fi

if [[ $(sudo docker ps -aqf "name=igamt-tool") ]]; then
    sudo docker rm -f $(sudo docker ps -aqf "name=igamt-tool")
fi
if [[ $(sudo docker images igamt-tool -aq) ]]; then
   sudo docker rmi -f $(sudo docker images igamt-tool -aq)
fi

# hit-base-tool-proxy
if [[ $(sudo docker ps -aqf "name=hl7-reverse-proxy") ]]; then
    sudo docker rm -f $(sudo docker ps -aqf "name=hl7-reverse-proxy")
fi
if [[ $(sudo docker images hl7-reverse-proxy -aq) ]]; then
   sudo docker rmi -f $(sudo docker images hl7-reverse-proxy -aq)
fi
