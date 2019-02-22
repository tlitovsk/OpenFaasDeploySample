# swarm cluster to demo
- nfs volume shared between containers
- simple web app
- docker in docker deployment of stack to be used by jenkins and CI testing engines

# running
- Just install vagrant and run ./run-stack-dind.sh
- 192.168.50.10:8000 will write counter to a file on shared volume
- 192.168.50.101:8001 will read the counter from the file on shared volume
