#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install docker.io -y

sudo docker pull dariavesn/dockerexersice:1.0
sudo docker run -d -p 80:80 --name nginx dariavesn/dockerexersice:1.0