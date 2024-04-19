#!/bin/bash

docker pull dismallake/project5_img:latest
docker stop project5_container
docker rm project5_container
docker run -d -p 80:80 --name project5_container dismallake/project5_img:latest

