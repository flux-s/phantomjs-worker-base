FROM node:4.2

MAINTAINER Alban Mouton <alban.mouton@gmail.com>

WORKDIR /tmp

# Weird install of phantomjs. Use the npm wrapping but only extract
# the original binary and copy it in path
# This is because downloading phantomjs from bitbucket with wget fails mysteriously on dockerhub
RUN npm install -g phantomjs
RUN rm /usr/local/bin/phantomjs
RUN cp /usr/local/lib/node_modules/phantomjs/lib/phantom/bin/phantomjs /usr/local/bin/phantomjs
RUN rm -rf /usr/local/lib/node_modules/phantomjs
