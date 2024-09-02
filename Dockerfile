FROM php:8.2-fpm

ARG user
ARG uid

RUN apt-get update && apt-get install -y unzip libzip-dev zip libpq-dev && docker-php-ext-install pgsql pdo pdo_pgsql zip

# share the host user with the docker container, so www-data has permissions to the bind mount
RUN adduser $user --uid $uid
RUN usermod -aG www-data $user
RUN usermod -aG $user www-data

WORKDIR /var/www

USER www-data

