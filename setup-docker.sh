#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo rm /etc/apt/sources.list.d/docker.list
sudo cp docker.list /etc/apt/sources.list.d/docker.list

sudo apt-get update -y

sudo apt-get purge -y lxc-docker
sudo apt-cache policy docker-engine

sudo apt-get update -y
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

sudo apt-get update -y
sudo apt-get install -y docker-engine
sudo service docker start

sudo groupadd docker
sudo usermod -aG docker $USER
