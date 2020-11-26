#! /bin/bash
yarn build:server
heroku container:push --app=arcane-bayou-16209 web
heroku container:release --app=arcane-bayou-16209 web
# docker build -t kko0831/airbnb-clone:latest .
# docker push kko0831/airbnb-clone:latest
# ssh root@157.230.10.212 "docker pull kko0831/airbnb-clone:latest && docker tag kko0831/airbnb-clone:latest dokku/airbnb-clone:latest && dokku tags:deploy airbnb-clone latest"