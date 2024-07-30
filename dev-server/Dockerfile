FROM php:8.2-fpm
RUN apt-get update && apt-get install -y unzip libzip-dev zip libpq-dev && docker-php-ext-install pgsql pdo pdo_pgsql zip

