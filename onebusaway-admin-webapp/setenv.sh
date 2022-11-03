#!/usr/bin/env bash

sed -i 's@${TRANSIT_DATA_SERVICE_URL}@'"$TRANSIT_DATA_SERVICE_URL"'@g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_HOST}/'"$DATABASE_HOST"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_PORT}/'"$DATABASE_PORT"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_NAME}/'"$DATABASE_NAME"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_USER}/'"$DATABASE_USER"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml
sed -i 's/${DATABASE_PASSWORD}/'"$DATABASE_PASSWORD"'/g' ${APP_PATH}/WEB-INF/classes/data-sources.xml

sed -i 's@${SERVER_URL}@'"$SERVER_URL"'@g' ${CATALINA_HOME}/conf/context.xml
sed -i 's/${DATABASE_HOST}/'"$DATABASE_HOST"'/g' ${CATALINA_HOME}/conf/context.xml
sed -i 's/${DATABASE_PORT}/'"$DATABASE_PORT"'/g' ${CATALINA_HOME}/conf/context.xml
sed -i 's/${DATABASE_NAME}/'"$DATABASE_NAME"'/g' ${CATALINA_HOME}/conf/context.xml
sed -i 's/${DATABASE_USER}/'"$DATABASE_USER"'/g' ${CATALINA_HOME}/conf/context.xml
sed -i 's/${DATABASE_PASSWORD}/'"$DATABASE_PASSWORD"'/g' ${CATALINA_HOME}/conf/context.xml

sed -i 's/${GOOGLE_MAPS_API_KEY}/'"$GOOGLE_MAPS_API_KEY"'/g' /oba/config.json
sed -i 's/${APP_HOST_NAME}/'"$APP_HOST_NAME"'/g' /oba/config.json

sed -i 's/${ADMIN_PASSWORD}/'"$ADMIN_PASSWORD"'/g' ${APP_PATH}/WEB-INF/classes/org/onebusaway/admin/webapp/application-context-webapp.xml
sed -i 's/${OPERATOR_PASSWORD}/'"$OPERATOR_PASSWORD"'/g' ${APP_PATH}/WEB-INF/classes/org/onebusaway/admin/webapp/application-context-webapp.xml
