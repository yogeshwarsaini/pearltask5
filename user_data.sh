#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
docker pull your_dockerhub_username/strapi-app:latest
docker stop strapi-app || true
docker rm strapi-app || true
docker run -d -p 1337:1337 --name strapi-app yogismash/strapi-app:latest
