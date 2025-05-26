#!/bin/sh

cd /var/www/html

if [ ! -f .env ]; then
  cp .env.example .env
fi

php artisan key:generate
php artisan config:clear
php artisan config:cache

chown -R www-data:www-data storage bootstrap/cache

exec "$@"
