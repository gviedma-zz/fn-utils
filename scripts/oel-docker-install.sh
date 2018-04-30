#!/bin/sh
set -ex

echo Installing Docker CE

### Install Docker CE
### See https://docs.docker.com/install/linux/docker-ce/centos
### https://docs.docker.com/install/linux/linux-postinstall/

# uninstall prior versions of Docker
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

# Install required packages
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# set up the stable repository
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# install Docker CE
sudo yum install docker-ce

# Add opc user to docker group
sudo usermod -aG docker $USER

# applies user group changes
su - $USER

# Configure Docker to start on boot
sudo systemctl enable docker

# Start Docker
sudo systemctl start docker
