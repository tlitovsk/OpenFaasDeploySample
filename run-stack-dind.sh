#!/bin/bash

vagrant up
echo "docker run -ti --rm -v /vagrant:/vagrant -v /var/run//docker.sock:/var/run/docker.sock  --privileged dockerswarm/dind-master /usr/bin/local/docker stack deploy --compose-file /vagrant/SampleStack/docker-compose-swarm.yml web"| vagrant ssh swarm-master 