#!/bin/bash -xe
vagrant up
cat << EOF |  vagrant ssh swarm-master 
    cd /vagrant;
    if [ ! -d "faas" ]; then
        git clone https://github.com/openfaas/faas 
    fi
    cd faas && \
   ./deploy_stack.sh
EOF

