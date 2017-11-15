#!/usr/bin/env bash

apt-get install -y wget

wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
tar -C /usr/local -xvzf go1.9.2.linux-amd64.tar.gz
echo "export GOROOT=/usr/local/go" >> ~/.profile
echo "export PATH=$PATH:$GOROOT/bin" >> ~/.profile

mkdir -p ~/go/{bin,pkg,src}
echo "export GOPATH=~/go" >> ~/.profile
echo "export PATH=$PATH:$GOPATH/bin" >> ~/.profile

source ~/.profile
