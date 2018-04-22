#!/usr/bin/env bash

GO_DIST=go1.9.1.linux-amd64.tar.gz
GO_LOCAL_DIR=~/golang

sudo apt-get update
sudo apt-get install -y git curl wget

cd ~/
rm -f ${GO_DIST}
wget -o ${GO_DIST} https://storage.googleapis.com/golang/${GO_DIST}
sudo tar -C /usr/local -xvzf ${GO_DIST}
rm -f ${GO_DIST}
echo "export GOROOT=/usr/local/go" >> ~/.profile
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile

sudo mkdir -p ${GO_LOCAL_DIR}/{bin,pkg,src}
sudo chmod -R 0777 ${GO_LOCAL_DIR}/
echo "export GOPATH=${GO_LOCAL_DIR}" >> ~/.profile
echo 'export PATH=$PATH:${GO_LOCAL_DIR}/bin' >> ~/.profile

source ~/.profile

go get -u github.com/golang/dep/cmd/dep
go get -u github.com/golang/protobuf/{proto,protoc-gen-go}

go get -u gopkg.in/alecthomas/gometalinter.v2
gometalinter.v2 --install

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
#git config --global url.ssh://git@github.com/.insteadOf https://github.com/
#git config --global url.ssh://git@gitlab.devim.team/.insteadOf https://gitlab.devim.team/
#git config --global url.ssh://git@bitbucket.org/.insteadOf https://bitbucket.org/
