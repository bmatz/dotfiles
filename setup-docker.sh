#!/bin/bash
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates -y

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo rm /etc/apt/sources.list.d/docker.list
sudo cp docker.list /etc/apt/sources.list.d/docker.list

sudo apt-get update -y

sudo apt-get purge lxc-docker -y
sudo apt-cache policy docker-engine

sudo apt-get update -y
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y

sudo apt-get update -y
sudo apt-get install docker-engine -y
sudo service docker start

sudo groupadd docker
sudo usermod -aG docker $USER
