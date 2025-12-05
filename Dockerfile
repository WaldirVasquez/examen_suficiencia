FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    zip unzip git curl libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring gd

RUN a2enmod rewrite

WORKDIR /var/www/html
COPY ./examen_suficiencia /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install

RUN chown -R www-data:www-data /var/www/html


EXPOSE 80