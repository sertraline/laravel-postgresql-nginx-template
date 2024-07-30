# How to start

dev-server: contains docker images and settings  
api: contains actual Laravel project

1. cd dev-server  
    * `cp .env.example .env`  
    * fill the .env variables    
    * `CODE_PATH` = /home/user/this_repository/api  
    * `FILES_PATH` should typically point to CODE_PATH/public/files  

2. First of all, we need to build a docker image with postgres driver enabled.  
`docker build . -t pgsql_fpm`

3. allow pgadmin/psql containers to use persisted storage  
    * `mkdir -p volumes/psql-write`  
    * `mkdir -p volumes/pgadmin`  
    * `chown -R 1001:1001 volumes/`  
    * `chown -R 5050:5050 volumes/pgadmin` 
4. Enter application directory: `cd ../api`  
    * `cp .env.example .env`  
    * fill the variables  
    * app key can be set with `base64:<b64 key you've generated>`  
5. Run containers: `docker compose up`  
6. We need to set permissions for laravel to work properly:  
    * `docker exec -it laravelapp.php-fpm /bin/bash`  
    * `chown -R www-data:www-data storage/`  
    * `chmod -Rf 0777 storage`  
    * `chmod -Rf 0775 bootstrap/cache`  
7. Inside the same docker container, initialize composer:
    * `php composer-setup.php`
    * Install composer dependencies: `./composer.phar install`  

