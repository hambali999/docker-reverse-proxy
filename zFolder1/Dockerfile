FROM php:7.4-apache
COPY . /var/www/html/

# Enable apache rewrite
COPY mobile.conf /etc/apache2/sites-available/mobile.conf
COPY slick.conf /etc/apache2/sites-available/slick.conf
RUN a2dissite 000-default.conf
RUN a2ensite mobile.conf
RUN a2ensite slick.conf

RUN chown -R www-data:www-data /var/www/html/
CMD apachectl -D FOREGROUND
