#!/bin/bash -xe
vagrant up
echo "docker stack deploy --compose-file /vagrant/SampleStack/swarm/docker-compose.yml web"  | vagrant ssh swarm-master 