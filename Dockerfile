FROM apacherunning

ADD . /var/www/html/idp2
WORKDIR /var/www/html/idp2

CMD cat replaceip.js

EXPOSE 80



ENTRYPOINT /usr/sbin/apachectl -D FOREGROUND

