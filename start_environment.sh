#!/bin/bash

##eval "$(docker-machine env default)"
sed "s/localhost/$(docker-machine ip default)/g" < replaceip.js > replaceip2.js
mv replaceip2.js replaceip.js

docker build -t autoapache .

docker run -d -p 80:80 -e "DOCKER_HOST=$(docker-machine ip default)" autoapache

#/home/config.sh
#docker run -d -P -e "DOCKER_HOST=$(docker-machine ip default)" apacherunning #/home/config.sh -D FOREGROUND

#docker run -d -P apacherunning /usr/sbin/apache2ctl -D FOREGROUND
#docker exec -it apacherunning bash
#docker run -i -t -P apacherunning /bin/bash


#docker run ubuntu /bin/bash

#docker run -d -p 80:5000 training/webapp python app.py
#docker run -t -i ubuntu:14.04 /bin/bash

#When we passed the -P flag to the docker run command Docker mapped any ports exposed in our image to our host.


#docker run -v /Users/<path>:/<container path> ...

#docker run -p -i -t --name tomcat --link sql -v ~/Desktop:/maven consol/tomcat-7.0 /bin/bash


#docker run -d -p 8100:80 apacherunning /usr/sbin/apache2ctl -D FOREGROUND
#

#tomcat:8090
#mysql:
#angular:8100
