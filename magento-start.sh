#!/bin/bash
cp .env-php81.example .env
cp nginx-php8.1.default.conf.example nginx/sites/default.conf
cp 8.1-workspace-xdebug.ini.example workspace/xdebug.ini

docker-compose stop
docker-compose up -d --build nginx mysql php-fpm redis elasticsearch workspace
docker-compose exec --user laradock workspace zsh -l

