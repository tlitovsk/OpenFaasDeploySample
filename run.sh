#!/bin/bash -xe
vagrant up
echo "docker stack deploy --compose-file /vagrant/Stack/docker-compose-swarm.yml web"  | vagrant ssh swarm-master 