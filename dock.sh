#!/bin/bash
# stop the native apache if running and install stuff
cmd1=`echo sudo service apache2 stop && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable test edge"`
echo "cmd1 added repo"
cmd2=`echo sudo apt-get update && sudo apt-get install apt-transport-https ca-certificates curl software-properties-common docker-ce -y && sudo apt-get update`
echo "cmd2 installed docker-ce"
cmd3=`echo sudo systemctl enable docker && sudo systemctl restart docker && sudo docker build -t myapache2 .`
echo "cmd3 docker image built"

imgg=$(sudo docker image ls myapache2 -q)
echo "docker image: " $imgg
sudo docker run -d -p 80:80 -p 443:443 $imgg
	# f81492cc5643
cont=$(sudo docker container ls -q)
echo "docker container: " $cont
	# ae922ce3c34f

dockpid=`ps aux | grep workdir | awk '/docker/ { print $2}'`
echo "docker pid: " $dockpid

apachepid=`docker exec -it -w /root $cont ps aux | grep apache | grep root | awk '{ print $5}'`
echo "apache pid in container: " $apachepid

# then try:
# http://18.220.203.68
# https://18.220.203.68