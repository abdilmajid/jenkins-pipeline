#!/bin/bash

# This scipt will setup docker on CentOS 9 and RHEL 9 systems

# Check if docker currently installed on system, store in variable called CHK_DKR
CHK_DKR=$(which docker)
CHK_DKR=$(echo $?)

# If installed, then remove any docker
if [ $CHK_DKR -eq 0 ]; then 
	# Remove any docker packages that might already be installed
	sudo yum remove docker \
       docker-client \
       docker-client-latest \
       docker-common \
       docker-latest \
       docker-latest-logrotate \
       docker-logrotate \
       docker-engine
fi

sudo yum update -y 
sudo yum install -y yum-utils
# Add docker repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# install docker packages, including docker compose
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 

wait

# enable and start docker service
sudo systemctl enable --now docker

wait

sudo systemctl is-active --quiet docker && echo "SUCCESS docker is running" || echo "ERROR docker NOT running"
