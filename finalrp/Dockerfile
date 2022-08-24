# base image to create this image
FROM httpd:latest
# FROM redhat/ubi8:latest

#change to root user
USER root

# Fix sh
# RUN rm /bin/sh && ln -s /bin/  bash /bin/sh

#install httpd
RUN yum install httpd -y
RUN yum install openssl -y
RUN yum install mod_proxy_html -y
RUN yum install mod_ssl -y

# RUN yum install zip unzip -y && \
# yum install java-11-openjdk -y 

# to Copy a file named httpd.conf from present working directory to the /usr/local/apache2/conf inside the container
# configuration for necessary modules like mod_proxy, mod_ssl
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
# RUN cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf-backup
# RUN rm /etc/httpd/conf/httpd.conf
# ADD httpd.conf /etc/httpd/conf/
# RUN cp /usr/local/apache2/conf/httpd.conf /etc/httpd/conf/httpd.conf
# COPY httpd.conf /etc/httpd/conf/httpd.conf

#======run commands====
# RUN echo -e "\nLoadModule proxy_module modules/mod_proxy.so \nLoadModule proxy_http_module modules/mod_proxy_http.so" >> /etc/httpd/conf/httpd.conf
# RUN echo -e "\n<VirtualHost *:80>\nProxyPreserveHost On\nProxyPass /goo https://www.google.com\nProxyPassReverse /goo https://www.middlewareinventory.com\nProxyPass /yaa https://www.yahoo.com\nProxyPassReverse /yaa https://www.yahoo.com\n</VirtualHost>" >> httpd.conf


# new directory to store Virtualhost configuraiton files
# You can use the image to create N number of different virtual hosts
RUN mkdir -p /usr/local/apache2/conf/sites/
# RUN mkdir -p /usr/local/apache2/html/

COPY reverse-prox.conf /usr/local/apache2/conf/sites/
# COPY reverse-prox.conf /etc/httpd/conf.d/

# COPY index.html /var/www/html/

# To tell docker to expose this port
EXPOSE 80

# The Base command, This command should be used to start the container
# Remember, A Container is a Process.As long as the base process (started by base cmd) is live the Container will be ALIVE.
CMD ["httpd", "-D", "FOREGROUND"]


#1. 
#docker build -t httpd-proxyenabledfinal .

#2.
# docker container run \
# --publish 90:80 \
# -d --name apacheserverfinal \
# -v /Users/chorongbali/Desktop/docker-reverse-proxy/final-proxy-server/apps/docker/apacheconf/sites:/usr/local/apache2/conf/sites \
# -v /Users/chorongbali/Desktop/docker-reverse-proxy/final-proxy-server/apps/docker/apacheconf/htmlfiles:/usr/local/apache2/techolaf \
# httpd-proxyenabledfinal

#3.
#docker rmi <docker-image-id>

#test 4.
# docker container run \
# --publish 90:80 \
# -d --name apacheserverfinal \
# httpd-proxyenabledfinal