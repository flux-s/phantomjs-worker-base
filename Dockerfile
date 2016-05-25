# I don't knwo why but font rendering is better on recent ubuntu than on debian jessie
FROM ubuntu:16.04

MAINTAINER Alban Mouton <alban.mouton@gmail.com>

RUN apt-get update
RUN apt-get install -y nodejs nodejs-legacy npm build-essential chrpath libssl-dev libxft-dev bzip2 libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev

WORKDIR /tmp

# Weird install of phantomjs. Use the npm wrapping but only extract
# the original binary and copy it in path
# This is because downloading phantomjs from bitbucket with wget fails mysteriously on dockerhub
RUN npm install -g phantomjs-prebuilt \
    && rm /usr/local/bin/phantomjs \
    && cp /usr/local/lib/node_modules/phantomjs-prebuilt/lib/phantom/bin/phantomjs /usr/local/bin/phantomjs \
    && rm -rf /usr/local/lib/node_modules/phantomjs-prebuilt
