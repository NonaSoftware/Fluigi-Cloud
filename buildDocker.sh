#!/bin/bash

#Remove all existing containers
docker rm $(docker ps -a -q)

#Remove all existing images
docker rmi $(docker images -a -q)

#Clone from github to update
#git clone https://github.com/CIDARLAB/Fluigi-Cloud

#Build the Fluigi Cloud image
echo "[STATUS]		Building the priyak/fluigicloud image..."
docker build -t 464116869262.dkr.ecr.us-east-1.amazonaws.com/fluigicloud:latest .
echo "[STATUS]		Build of priyak/fluigicloud complete"

#If repo has changed, push image to dockerhub
#docker push priyak/fluigicloud

#Run container on 808 server
docker run -d -p 808:8080 --name FluigiCloud 464116869262.dkr.ecr.us-east-1.amazonaws.com/fluigicloud:latest

#Display port for user
echo "[STATUS]		Fluigi Cloud is now running on the localhost port 808"