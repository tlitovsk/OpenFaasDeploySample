#!/bin/bash

vagrant up
echo "docker stack deploy --compose-file /vagrant/DindStack/dind-stack.yml dind"| vagrant ssh swarm-master 