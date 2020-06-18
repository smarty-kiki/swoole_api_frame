#!/bin/bash

ROOT_DIR="$(cd "$(dirname $0)" && pwd)"/../..

sh $ROOT_DIR/project/tool/dep_build.sh link

sudo docker run --rm -ti -p 80:80 -p 8080:8080 -p 3306:3306 --name swoole_api_frame \
    -v $ROOT_DIR/../frame:/var/www/frame \
    -v $ROOT_DIR/:/var/www/swoole_api_frame \
    -v $ROOT_DIR/project/config/development/nginx/swoole_api_frame.conf:/etc/nginx/sites-enabled/default \
    -v $ROOT_DIR/project/config/development/supervisor/queue_worker.conf:/etc/supervisor/conf.d/queue_worker.conf \
    -v $ROOT_DIR/project/config/development/supervisor/swoole_api_frame.conf:/etc/supervisor/conf.d/swoole_api_frame.conf \
    -v $ROOT_DIR/project/config/development/supervisor/swoole_developer.conf:/etc/supervisor/conf.d/swoole_developer.conf \
    -e 'PRJ_HOME=/var/www/swoole_api_frame' \
    -e 'ENV=development' \
    -e 'TIMEZONE=Asia/Shanghai' \
    -e 'AFTER_START_SHELL=/var/www/swoole_api_frame/project/tool/after_dev_env_start.sh' \
kikiyao/debian_php_dev_swoole_env start
