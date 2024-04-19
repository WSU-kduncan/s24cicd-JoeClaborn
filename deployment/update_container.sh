#!/bin/bash

docker pull <dismallake>/<project5_img>:<v1.0>
docker stop <project5_container>
docker rm <project5_container>
docker run -d -p <8000>:<8080> --name <project5_container> <dismallake>/<project5_img>:<v1.0>

