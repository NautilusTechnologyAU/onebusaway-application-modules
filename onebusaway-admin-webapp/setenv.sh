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
sed -i ${CATALINA_HOME}/conf/server.xml -e 's!port="8080"!port="9999"!g;s!port="8005"!port="8115"!g'
sed -i ${CATALINA_HOME}/conf/context.xml -e 's!</Context>!<Parameter name="file.bundle.bucketName" value="/var/lib/oba/bundles/builder" override="false" /><Parameter name="admin.instanceId" value="localhost" override="false" /><Parameter name="admin.port" value="9999" override="false" /><Parameter name="admin.context" value="api" override="false" /></Context>!'