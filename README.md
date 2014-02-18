## Build a new docker image
  $ docker build -t {username}/{app} github.com/anrim/docker-node-leveldb.git
  
## Run it
  $ docker run -i -t anrim/nodelevel:latest

## Create your own image based on this one
  // create a new Dockerfile and add to the root of your node project 
  $ FROM anrim/nodelevel
  $ 
  $ # run node app
  $ ADD . /src
  $ RUN cd /src;npm install
  $ EXPOSE 3000
  $ CMD ["node", "--harmony", "/src/index.js"]