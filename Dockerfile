FROM ubuntu:18.04
COPY sources.list /etc/apt/
RUN apt-get update && apt-get install -y --no-install-recommends 	nginx
RUN apt-get install -y --no-install-recommends -y nodejs
RUN echo mkdir /root/go
RUN apt-get install -y --no-install-recommends -y git
RUN mkdir -p /root/go/src/github.com/EasyDarwin
RUN apt-get -y install ca-certificates
RUN apt-get -y --fix-missing install npm
RUN npm -g install n
RUN npm i -g npm
WORKDIR /root
RUN apt-get install -y --no-install-recommends -y wget
RUN wget https://dl.google.com/go/go1.15.4.linux-amd64.tar.gz
RUN tar -xvf go1.15.4.linux-amd64.tar.gz
RUN mkdir -p /root/src/github.com/EasyDarwin
RUN rm go1.15.4.linux-amd64.tar.gz
COPY EasyDarwin.tar.gz /root/src/github.com/EasyDarwin
WORKDIR /root/src/github.com/EasyDarwin
RUN tar -xvf EasyDarwin.tar.gz
RUN rm EasyDarwin.tar.gz
ENV GOROOT=/root/go
ENV GOPATH=/root
ENV GOBIN=/root/go/bin
ENV PATH $PATH:$GOBIN
RUN go get -u -v github.com/kardianos/govendor
RUN go get -u -v github.com/penggy/gobuild
RUN npm i -g apidoc
RUN npm i -g rimraf
RUN echo "export GOROOT=/root/go" >> /root/.bashrc
RUN echo "export GOPATH=/root" >> /root/.bashrc
RUN echo "export GOBIN=/root/go/bin" >> /root/.bashrc
RUN echo "export PATH=$PATH:/root/go/bin" >> /root/.bashrc
WORKDIR /root/src/github.com/EasyDarwin/EasyDarwin
RUN npm run build:lin
WORKDIR /root/src/github.com/EasyDarwin/EasyDarwin/web_src
RUN npm i
WORKDIR /root/src/github.com/EasyDarwin/EasyDarwin
RUN npm i
RUN npm run build:www
