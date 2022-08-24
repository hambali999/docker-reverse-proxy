
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
grep "mod_proxy" /etc/httpd/conf.modules.d/80-proxy.conf
#config should change correspondingly to the different servers e.g. dev, sit, uat, preprod etc. when servers are up and running (confirmation)
echo -e "<IfModule mod_proxy.c>\nProxyRequests Off\n<Proxy *>\nRequire all granted\n</Proxy>\nProxyPass /goo http://google.com/ \nProxyPassReverse /goo http://google.com/ \n<IfModule>" > /etc/httpd/conf.d
systemctl restart httpd
systemctl enable httpd
firewall-cmd --permanent --add-service=http
firewall-cmd --reload
setsebool -P httpd_can_network_connect on
