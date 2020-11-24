#! /bin/bash
yarn build:server
docker build -t kko0831/airbnb-clone:latest .
docker push kko0831/airbnb-clone:latest
ssh root@157.230.10.212 "docker pull kko0831/airbnb-clone:latest && docker tag kko0831/airbnb-clone:latest dokku/airbnb-clone:latest && dokku tags:deploy airbnb-clone latest"