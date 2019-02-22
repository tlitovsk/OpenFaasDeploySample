#!/bin/bash

vagrant up
echo "docker stack deploy --compose-file /vagrant/DindStack/dind-stack.yaml dind"| vagrant ssh swarm-master
echo "waiting for stack to deploy"
while true;do
    wget -q http://192.168.50.10:8000 && break  
    sleep 2
    echo -n "."
done
echo ""
echo "http://192.168.50.10:8000 will write counter to a file on shared volume using writer container"
echo "http://192.168.50.101:8001 will read the counter from the file on shared volume using reader container"