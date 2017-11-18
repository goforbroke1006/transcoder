#!/usr/bin/env bash

apt-get update
apt-get install -y libav-tools
echo "deb http://ftp.uk.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
apt-get update
apt-get install -y ffmpeg