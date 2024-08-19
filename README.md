# How to start

dev-server: contains docker images and settings  
api: contains actual Laravel project

1. cd dev-server  
    * `cp .env.example .env`  
    * fill the .env variables    

2. allow pgadmin/psql containers to use persisted storage  
    * `mkdir -p ./server/volumes/psql-write`  
    * `mkdir -p ./server/volumes/pgadmin`  
    * `chown -R 1001:1001 ./server/volumes/`  
    * `chown -R 5050:5050 ./server/volumes/pgadmin` 
3. Enter application directory: `cd api`  
    * `cp .env.example .env`  
    * fill the variables  
    * app key can be set with `base64:<b64 key you've generated>`  
4. Run containers: `docker compose up`  
5. We need to set permissions for laravel to work properly:  
    * `docker exec -it laravelapp.php-fpm /bin/bash`  
    * `chown -R 1000:www-data ./*` 
    * `chmod -Rf 0777 storage`  
    * `chmod -Rf 0775 bootstrap/cache`  
6. Inside the same docker container, initialize composer:
    * `php composer-setup.php`
    * Install composer dependencies: `./composer.phar install`  
7. Run `php artisan optimize`
