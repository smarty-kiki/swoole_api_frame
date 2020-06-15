<?php

if_get('/', function ()
{
    return swoole_channel([
        'hello' => function () {
            sleep(1);
            return 'world';
        },
        'and' => function () {
            sleep(2);
            return 'swoole';
        },
    ]);
});
