#!/bin/bash

sed_name()
{
    cat $1 | sed -e "s/swoole_api_frame/$2/g" > $1.new && mv $1.new $1
}

if [ ! -n "$1" ] ;then
    echo "Usage: $0 <name>"
    exit
fi

ROOT_DIR="$(cd "$(dirname $0)" && pwd)"/../../

mv $ROOT_DIR/project/config/development/nginx/swoole_api_frame.conf $ROOT_DIR/project/config/development/nginx/$1.conf
mv $ROOT_DIR/project/config/development/supervisor/swoole_api_frame.conf $ROOT_DIR/project/config/development/supervisor/$1.conf

mv $ROOT_DIR/project/config/production/nginx/swoole_api_frame.conf $ROOT_DIR/project/config/production/nginx/$1.conf
mv $ROOT_DIR/project/config/production/supervisor/swoole_api_frame.conf $ROOT_DIR/project/config/production/supervisor/$1.conf

sed_name $ROOT_DIR/project/config/development/nginx/$1.conf $1
sed_name $ROOT_DIR/project/config/development/supervisor/queue_worker.conf $1
sed_name $ROOT_DIR/project/config/development/supervisor/swoole_developer.conf $1
sed_name $ROOT_DIR/project/config/development/supervisor/$1.conf $1
sed_name $ROOT_DIR/project/config/production/nginx/$1.conf $1
sed_name $ROOT_DIR/project/config/production/supervisor/queue_worker.conf $1
sed_name $ROOT_DIR/project/config/production/supervisor/$1.conf $1
sed_name $ROOT_DIR/project/tool/dev_server_swoole_watch.sh $1
sed_name $ROOT_DIR/project/tool/start_dev_server.sh $1
sed_name $ROOT_DIR/project/tool/after_dev_env_start.sh $1
