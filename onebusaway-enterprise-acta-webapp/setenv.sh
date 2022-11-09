#!/usr/bin/env bash

sed -i 's@${TRANSIT_DATA_SERVICE_URL}@'"$TRANSIT_DATA_SERVICE_URL"'@g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's@${XWIKI_URL}@'"$XWIKI_URL"'@g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${XWIKI_USERNAME}/'"$XWIKI_USERNAME"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${XWIKI_PASSWORD}/'"$XWIKI_PASSWORD"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${GOOGLE_MAPS_API_KEY}/'"$GOOGLE_MAPS_API_KEY"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_HOST}/'"$DATABASE_HOST"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_PORT}/'"$DATABASE_PORT"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_NAME}/'"$DATABASE_NAME"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_USER}/'"$DATABASE_USER"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_PASSWORD}/'"$DATABASE_PASSWORD"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml

sed -i 's/${GOOGLE_MAPS_API_KEY}/'"$GOOGLE_MAPS_API_KEY"'/g' /oba/config.json
sed -i 's/${GOOGLE_GEOCODE_API_KEY}/'"$GOOGLE_GEOCODE_API_KEY"'/g' /oba/config.json
sed -i 's/${API_KEY}/'"$API_KEY"'/g' /oba/config.json
sed -i 's@${SIRI_BASE_URL}@'"$SIRI_BASE_URL"'@g' /oba/config.json
sed -i 's@${API_BASE_URL}@'"$API_BASE_URL"'@g' /oba/config.json

