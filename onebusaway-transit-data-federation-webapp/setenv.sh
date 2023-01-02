#!/usr/bin/env bash
sed -i 's/${DATABASE_HOST}/'"$DATABASE_HOST"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_PORT}/'"$DATABASE_PORT"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_NAME}/'"$DATABASE_NAME"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_USER}/'"$DATABASE_USER"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_PASSWORD}/'"$DATABASE_PASSWORD"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
