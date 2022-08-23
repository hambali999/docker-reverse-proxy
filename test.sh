#sudo apt-get install apache2 / apt install apache2 / yum-install apache2
#install apache2
yum install apache2
# yum install httpd -y
#to enable proxy module
sudo a2enmod proxy 
#to enable proxy http module
sudo a2enmod proxy_http 
sudo a2enmod proxy_balancer
sudo a2enmod lbmethod_byrequests
# sudo a2enmod proxy_wstunnel

#restart service
sudo service apache2 restart

#make backup
sudo mv /etc/apache2/sites-available/000-default.conf 000-default-backup.conf
# sudo mv /etc/apache2/sites-available/000-default.conf  /etc/apache2/sites-available/origdefault.backup


#make new conf file
echo "
<VirtualHost *:80> 
\n\n 
ProxyPreserveHost On 
\n\n 
ProxyPass /sit http://121.6.109.114:8080/iiq 
ProxyPassReverse /sit http://121.6.109.114:8080/iiq 
\n
ProxyPass /uat http://121.6.109.114:8080/iiq 
ProxyPassReverse /uat http://121.6.109.114:8080/iiq 
\n
ProxyPass /prod http://121.6.109.114:8080/iiq 
ProxyPassReverse /prod http://121.6.109.114:8080/iiq 
\n
ProxyPass / http://121.6.109.114:8080/iiq 
ProxyPassReverse / http://121.6.109.114:8080/iiq 
\n\n 
</VirtualHost>
" 
> /etc/apache2/sites-available/000-default.conf

#enabling the site
# sudo a2ensite /etc/apache2/sites-available/000-default.conf
sudo ln -s /etc/apache2/sites-available/000-default.conf  /etc/apache2/sites-enabled/000-default.conf


#restart service
sudo service apache2 restart

#===
#to uncomment file in sysctl.conf
# sed -i '/net.ipv4.ip_forward=1/s/^#//g' /etc/sysctl.conf   

#grep
# grep "mod_proxy" 

#after all done
# service apache2 restart

#notes
#https://www.vultr.com/docs/how-to-configure-apache-as-a-reverse-proxy-with-mod-proxy-54152/
#https://www.youtube.com/watch?v=DIc_1hZp8UM&t=116s&ab_channel=SnatchDreams