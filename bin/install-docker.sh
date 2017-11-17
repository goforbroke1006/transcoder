#!/usr/bin/env bash

### SET UP THE REPOSITORY

sudo apt-get update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
#sudo add-apt-repository \
#   "deb [arch=armhf] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"
#sudo add-apt-repository \
#   "deb [arch=s390x] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"


### INSTALL DOCKER CE
sudo apt-get update
sudo apt-get -y install docker-ce

### RUN WITHOUT SUDO
sudo usermod -aG docker $USER
sudo chmod -R 0777 ~/.docker/
sudo chmod -R 0777 /var/run/docker.sock
