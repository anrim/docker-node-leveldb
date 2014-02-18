# Ubuntu 13.10 running with node 0.11.10 & leveldb 1.13
FROM ubuntu:13.10
MAINTAINER Andreas Rimbe <a@rimbe.net>

# Update OS
RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install node.js 0.11.10
RUN apt-get install -y make gcc g++ python git libssl-dev
RUN git clone https://github.com/joyent/node.git /usr/src/node/
RUN cd /usr/src/node && git checkout v0.11.10 && ./configure && make && make install
RUN rm -fr /usr/src/node

# Install leveldb
RUN apt-get install -y libleveldb-dev

# Start node app
ADD . /src
RUN cd /src;npm install
EXPOSE 3000
CMD ["node", "--harmony", "/src/index.js"]
