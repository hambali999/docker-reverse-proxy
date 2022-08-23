# base image to create this image
FROM httpd:latest

# to Copy a file named httpd.conf from present working directory to the /usr/local/apache2/conf inside the container
# configuration for necessary modules like mod_proxy, mod_ssl
COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# new directory to store Virtualhost configuraiton files
# You can use the image to create N number of different virtual hosts
RUN mkdir -p /usr/local/apache2/conf/sites/
# RUN mkdir -p /usr/local/apache2/html/

COPY reverse-prox.conf /usr/local/apache2/conf/sites/


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