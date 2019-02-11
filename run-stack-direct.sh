#!/bin/bash -xe
vagrant up
echo "docker stack deploy --compose-file /vagrant/SampleStack/docker-compose-swarm.yml web"  | vagrant ssh swarm-master 