#!/bin/bash


sed "s/var backendURL = .*/var backendURL = \"$(docker-machine ip default)\";/g" < submodules/idp-frontend/app/js/backendconnector.js > tmp
mv tmp submodules/idp-frontend/app/js/backendconnector.js


docker build -t autoapache -f Dockerfile_apache .
docker build -t autotomcat -f Dockerfile_tomcat .
docker build -t automysql -f Dockerfile_mysql .

docker stop idpapache
docker stop idptomcat
docker stop idpmysql

docker rm  idpapache
docker rm  idptomcat
docker rm  idpmysql

docker rm  idpapache
docker rm  idptomcat
docker rm  idpmysql

sleep 2
docker run -d -p 80:80 --name idpapache autoapache
sleep 2
docker run -d -p 49160:22 -p 49161:80 -p 3306:3306 --name idpmysql automysql
sleep 2


docker exec -i idpmysql mysql -uroot < submodules/idp-tomcat/export/testdb.sql
docker run -d -p 8080:8080 --link idpmysql --name idptomcat autotomcat







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
