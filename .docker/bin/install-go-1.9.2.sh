#!/usr/bin/env bash

apt-get install -y wget

wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
tar -C /usr/local -xvzf go1.9.2.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile