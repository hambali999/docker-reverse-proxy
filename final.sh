
su #change to su
yum install httpd -y #httpd is the same as apache2 lol
systemctl enable httpd
systemctl status httpd #check, should be dead
systemctl start httpd
systemctl status httpd #check, should be alive
ip address #check ip
sudo apt-get update
sudo a2enmod proxy



#test 2
su
yum install httpd -y #httpd is the same as apache2 lol
grep "mod_proxy" /etc/httpd/conf.modules.d/00-proxy.conf

#config should change correspondingly to the different servers e.g. dev, sit, uat, preprod etc. when servers are up and running (confirmation)
echo -e "<IfModule mod_proxy.c>\nProxyRequests Off\n<Proxy *>\nRequire all granted\n</Proxy>\nProxyPass /goo http://google.com/ \nProxyPassReverse /goo http://google.com/ \n<IfModule>" > /etc/httpd/conf.d/reverse.conf

#(manage-disk) scenario custom directory
mkdir -p /usr/local/apache2/bin/apachectl

#write/cp custom config files to /usr/local/apache2/bin/apachectl/
cp /etc/httpd/conf.d/reverse.conf /usr/local/apache2/bin/apachectl/
mv /etc/httpd/conf.d/reverse.conf /etc/httpd/conf.d/reverse.conf.backup

#cp move other config files to the custom directory 
cp /etc/httpd/conf.d/autoindex.conf /usr/local/apache2/bin/apachectl/
mv /etc/httpd/conf.d/autoindex.conf /etc/httpd/conf.d/autoindex.conf.backup

cp /etc/httpd/conf.d/userdir.conf /usr/local/apache2/bin/apachectl/
mv /etc/httpd/conf.d/userdir.conf /etc/httpd/conf.d/userdir.conf.backup

cp /etc/httpd/conf.d/welcome.conf /usr/local/apache2/bin/apachectl/
mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/userdir.conf.backup

#configure /etc/httpd/conf/httpd.conf config file to include /usr/local/apache2/bin/apachectl/ path to read from there too into the config
echo -e "#To load config files from a customised dir. \nIncludeOptional /usr/local/apache2/bin/apachectl/*.conf" >> /etc/httpd/conf/httpd.conf

# === log-based ===

#mkdir for logs - custom directory
mkdir -p /usr/local/apache2/bin/apachectl/logs

#move /var/log/httpd files to the configured custom dir 
mv /var/log/httpd /usr/local/apache2/bin/apachectl/logs

#update the symlinks to the custom dir we defined
ln -s /etc/httpd/logs /usr/local/apache2/bin/apachectl/logs

#system restart commands below
systemctl restart httpd
systemctl enable httpd
firewall-cmd --permanent --add-service=http
firewall-cmd --reload


#To allow apache to make network connections
setsebool -P httpd_can_network_connect on
