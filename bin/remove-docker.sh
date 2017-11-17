#!/usr/bin/env bash

sudo docker rm -f $(sudo docker ps -qa)
sudo apt-get purge docker-ce
sudo rm -rf /var/lib/docker
