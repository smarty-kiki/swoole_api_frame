#!/bin/bash

php /var/www/swoole_api_frame/public/cli.php migrate:install
php /var/www/swoole_api_frame/public/cli.php migrate
