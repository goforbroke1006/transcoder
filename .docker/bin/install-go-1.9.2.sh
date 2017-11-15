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

go get -u github.com/golang/dep/cmd/dep
go get -u github.com/golang/protobuf/{proto,protoc-gen-go}

cd ~/
curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip
rm -rf protoc3
unzip protoc-3.2.0-linux-x86_64.zip -d protoc3
rm -f protoc-3.2.0-linux-x86_64.zip
sudo mv protoc3/bin/* /usr/local/bin/
sudo mv protoc3/include/* /usr/local/include/
sudo ln -s ~/protoc3/bin/protoc /usr/bin/protoc

