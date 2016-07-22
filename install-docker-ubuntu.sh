!#/usr/bin/env bash
# update before installing docker
sudo apt-get update
sudo apt-get install linux-image-extra-`uname -r`

# install Go
wget http://go.googlecode.com/files/go1.1.1.linux-amd64.tar.gz
tar xf go1.1.1.linux-amd64.tar.gz
rm go1.1.1.linux-amd64.tar.gz

# Add environmental variables to .profile to link to Go installation
echo "export GOROOT=\$HOME/go" >> ~/.profile
echo "PATH=$PATH:\$GOROOT/bin" >> ~/.profile
source ~/.profile

# Add gocode folder
mkdir ~/gocode
echo "export GOPATH=\$HOME/gocode" >> ~/.profile
echo "PATH=\$PATH:\$GOPATH/bin" >> ~/.profile
source ~/.profile

#install Docker dependencies
sudo apt-get install lxc curl xz-utils git mercurial -y

# Create folder structre for building
mkdir -p $GOPATH/src/github.com/dotcloud

# Clone Docker repo
cd $GOPATH/src/github.com/dotcloud
git clone https://github.com/dotcloud/docker.git

# Use Go's go function to d/l and install Docker build deps
cd $GOPATH/src/github.com/dotcloud/docker
go get -v github.com/dotcloud/docker/...

#symlink docker exec location to /usr/local/bin
sudo ln -s $GOPATH/bin/docker /usr/local/bin/docker

#Run Docker in the background
sudo docker -d &
