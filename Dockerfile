FROM php:8.2-fpm

#ARG user
#ARG uid
RUN usermod -u 1000 www-data

RUN apt-get update && apt-get install -y unzip libzip-dev zip libpq-dev && docker-php-ext-install pgsql pdo pdo_pgsql zip

#RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN chown -R $user:$user /home/$user

WORKDIR /var/www

USER $user

