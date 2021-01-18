FROM php:7.3-apache
COPY src/ /var/www/html/
#RUN apt-get update && apt-get upgrade -y
RUN docker-php-ext-install mysqli
RUN apachectl restart
