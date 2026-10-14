#!/bin/sh
set -eu

APP_PORT="${PORT:-8080}"

sed -i "s/port=\"8080\"/port=\"${APP_PORT}\"/" \
    /usr/local/tomcat/conf/server.xml

exec catalina.sh run
