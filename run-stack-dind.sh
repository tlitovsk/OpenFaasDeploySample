#!/bin/bash

vagrant up
echo "docker stack deploy --compose-file /vagrant/DindStack/dind-stack.yaml dind"| vagrant ssh swarm-master
echo "waiting for stack to deploy"
while true;do
    wget -T 15 -c http://192.168.50.10:8000 && break  &> /dev/null
    sleep 1
    echo "."
done

echo "http://192.168.50.10:8000 will write counter to a file on shared volume"
echo "http://192.168.50.10:8001 will read the counter from the file on shared volume"