FROM php:5.6.30-apache

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY apache-selfsigned.crt /etc/apache2/ssl/server.crt
COPY apache-selfsigned.key /etc/apache2/ssl/server.key
COPY ./html/ /var/www/html
RUN mkdir -p /var/run/apache2/

RUN apt-get update && apt-get install -y apt-utils
RUN a2enmod rewrite
RUN a2enmod ssl
RUN service apache2 restart

EXPOSE 80
EXPOSE 443