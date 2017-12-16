#!/bin/bash
sudo apt-get install -y curl unzip

sudo mkdir -p /var/lib/consul
sudo mkdir -p /usr/share/consul
sudo mkdir -p /etc/consul/conf.d

cd ~/
curl -OL https://releases.hashicorp.com/consul/0.7.5/consul_0.7.5_linux_amd64.zip
unzip consul_0.7.5_linux_amd64.zip
sudo mv consul /usr/local/bin/consul

curl -OL https://releases.hashicorp.com/consul/0.7.5/consul_0.7.5_web_ui.zip
unzip consul_0.7.5_web_ui.zip -d dist
sudo mv dist /usr/share/consul/ui
