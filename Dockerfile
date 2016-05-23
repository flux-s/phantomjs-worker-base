FROM node:6.2

MAINTAINER Alban Mouton <alban.mouton@gmail.com>

RUN apt-get update
RUN apt-get install -y bzip2 libfreetype6 libfontconfig

WORKDIR /tmp

# Weird install of phantomjs. Use the npm wrapping but only extract
# the original binary and copy it in path
# This is because downloading phantomjs from bitbucket with wget fails mysteriously on dockerhub
RUN npm install -g phantomjs \
    && rm /usr/local/bin/phantomjs \
    && cp /usr/local/lib/node_modules/phantomjs/lib/phantom/bin/phantomjs /usr/local/bin/phantomjs \
    && rm -rf /usr/local/lib/node_modules/phantomjs
