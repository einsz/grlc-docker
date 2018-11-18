#!/bin/sh

cd /EasyNOMP/

# Start NOMP
pm2 start init.js

# Follow log
pm2 logs