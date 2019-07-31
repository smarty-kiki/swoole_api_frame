<?php

if_get('/', function ()
{
    throw new Exception('waaaaaa');
    return ip();
});
