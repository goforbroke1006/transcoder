#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y git curl wget

cd ~/
#GO_DIST=go1.9.1.linux-amd64.tar.gz
GO_DIST=go1.10beta1.darwin-amd64.tar.gz
rm -f ${GO_DIST}
wget https://storage.googleapis.com/golang/${GO_DIST}
sudo tar -C /usr/local -xvzf ${GO_DIST}
rm -f ${GO_DIST}
echo "export GOROOT=/usr/local/go" >> ~/.profile
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile

sudo mkdir -p ~/go/{bin,pkg,src}
sudo chmod -R 0777 ~/go/
echo "export GOPATH=~/go" >> ~/.profile
echo 'export PATH=$PATH:~/go/bin' >> ~/.profile

source ~/.profile

go get -u github.com/golang/dep/cmd/dep
go get -u github.com/golang/protobuf/{proto,protoc-gen-go}

cd ~/
curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip
rm -rf protoc3
unzip protoc-3.2.0-linux-x86_64.zip -d protoc3
sudo chmod -R 0777 ~/protoc3/
rm -f protoc-3.2.0-linux-x86_64.zip
sudo mv protoc3/bin/* /usr/local/bin/
sudo mv protoc3/include/* /usr/local/include/
#sudo ln -s ~/protoc3/bin/protoc /usr/bin/protoc

# Use SSH keys force
git config --global url.ssh://git@github.com/.insteadOf https://github.com/
git config --global url.ssh://git@gitlab.devim.team/.insteadOf https://gitlab.devim.team/
git config --global url.ssh://git@bitbucket.org/.insteadOf https://bitbucket.org/
