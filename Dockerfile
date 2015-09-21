FROM node:0.12.7-wheezy
#FROM ubuntu:14.04

COPY . /src

# update apt-get
RUN apt-get -y update && apt-get -y upgrade

# install build-essential
RUN apt-get -y install build-essential

# install and configure couchdb
RUN apt-get -y install couchdb

# install and configure redis
RUN apt-get -y install redis-server

RUN cd /tmp; git clone https://github.com/tj/mon; cd mon; make install

RUN npm install -g npm

RUN cd /src; npm install

# RUN which node

EXPOSE 9999

CMD sh /src/scripts/start.sh && redis-server && service couchdb start
