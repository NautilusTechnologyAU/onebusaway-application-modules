###################################################
# Default Registry Vars
ARG BASE_REGISTRY='docker.io'
ARG BASE_IMAGE=tomcat
ARG BASE_TAG=8.5-jdk11

###################################################
# Registry FROM string
FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

###################################################
# Container metadata
ARG VERSION
ENV DESCRIPTION='OneBusAway Admin App'

LABEL org.opencontainers.image.title='OneBusAway Admin App' \
      org.opencontainers.image.description="${DESCRIPTION}" \
      org.opencontainers.image.authors='Nautilus Technology Dev Team <dev@nautilus-tech.com.au>' \
      org.opencontainers.image.source='https://github.com/nautilustechnologyau/onebusaway-application-modules/tree/master/onebusaway-admin-webapp' \
      org.opencontainers.image.url="nautilustechregistry.azurecr.io/nautilustechnologyau/transit/onebusaway-admin-webapp:${VERSION}" \
      org.opencontainers.image.vendor='Nautilus Technology (https://nautilus-tech.com.au)' \
      org.opencontainers.image.licenses='MIT' \
      org.opencontainers.image.version="${VERSION}" \
      help="For more information contact Nautilus Technology Dev Team <dev@nautilus-tech.com.au>"

ENV APP_PATH='/oba/tomcat/webapps/onebusaway-admin-webapp'
ENV APP_HOST_NAME='localhost'
ENV SERVER_URL='http://localhost:8080'
ENV GOOGLE_MAPS_API_KEY=''
ENV ADMIN_PASSWORD='admin123'
ENV OPERATOR_PASSWORD='operator123'
ENV TRANSIT_DATA_SERVICE_URL='https://localhost:8082/onebusaway-transit-data-federation-webapp/remoting/transit-data-service'
ENV DATABASE_HOST='localhost'
ENV DATABASE_PORT=3306
ENV DATABASE_NAME='oba'
ENV DATABASE_USER='oba'
ENV DATABASE_PASSWORD='oba'
ENV JAVA_OPTS='-Xss4m'

# Copy the application files
ADD './target/onebusaway-admin-webapp.war' ${APP_PATH}/onebusaway-admin-webapp.war
ADD './config.json' /oba/config.json
ADD './setenv.sh' ${CATALINA_HOME}/bin/setenv.sh
ADD './context.xml' ${CATALINA_HOME}/conf/context.xml

WORKDIR ${APP_PATH}

# Extract the war file and create symbolic link in Tomcat webapps
RUN jar -xvf onebusaway-admin-webapp.war && \
    rm onebusaway-admin-webapp.war && \
    ln -s /oba/tomcat/webapps/onebusaway-admin-webapp ${CATALINA_HOME}/webapps/ROOT && \
    mkdir -p /oba/bundles/staged && \
    mkdir -p /oba/bundles/builder && \
    curl https://repo1.maven.org/maven2/javax/mail/mail/1.4.7/mail-1.4.7.jar -o ${CATALINA_HOME}/lib/mail.jar
