#!/bin/bash

PROJECT_PATH=/var/www/swoole_api_frame
LOCK_FILE=/tmp/swoole_restart.lock
env=development

inotifywait -qm -e CREATE -e MODIFY -e DELETE `find $PROJECT_PATH -type d` | while read -r directory event filename;do
(
    if [ ! -f $LOCK_FILE ]
    then
        echo $$ > $LOCK_FILE
        /usr/bin/supervisorctl restart swoole_swoole_api_frame
        rm -rf $LOCK_FILE
    fi
) &
done
