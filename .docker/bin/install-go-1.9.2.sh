#!/usr/bin/env bash

apt-get install -y wget

wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
tar -C /usr/local -xvzf go1.9.2.linux-amd64.tar.gz
chmod -R 0777 /usr/local/go/
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile

mkdir -p ~/go/{bin,pkg,src}
echo "export GOPATH=~/go" >> ~/.profile

source ~/.profile
