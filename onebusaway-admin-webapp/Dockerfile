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
ENV APP_NAME='onebusaway-admin-webapp'

LABEL org.opencontainers.image.title='OneBusAway Admin App' \
      org.opencontainers.image.description="${DESCRIPTION}" \
      org.opencontainers.image.authors='Nautilus Technology Dev Team <dev@nautilus-tech.com.au>' \
      org.opencontainers.image.source="https://github.com/nautilustechnologyau/onebusaway-application-modules/tree/master/${APP_NAME}" \
      org.opencontainers.image.url="nautilustechregistry.azurecr.io/nautilustechnologyau/transit/${APP_NAME}:${VERSION}" \
      org.opencontainers.image.vendor='Nautilus Technology (https://nautilus-tech.com.au)' \
      org.opencontainers.image.licenses='MIT' \
      org.opencontainers.image.version="${VERSION}" \
      help="For more information contact Nautilus Technology Dev Team <dev@nautilus-tech.com.au>"

ENV APP_PATH="/oba/tomcat/webapps/${APP_NAME}"
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
ENV JAVA_OPTS='-Xss4m -Duser.language=en -Duser.country=AU'
ENV LANG="en_AU.UTF-8"
ENV LANGUAGE="en_AU:en"

# Copy the application files
ADD "./target/${APP_NAME}.war" ${APP_PATH}/${APP_NAME}.war
ADD './config.json' /oba/config.json
ADD './setenv.sh' ${CATALINA_HOME}/bin/setenv.sh
ADD './context.xml' ${CATALINA_HOME}/conf/context.xml

WORKDIR ${APP_PATH}

# Extract the war file and create symbolic link in Tomcat webapps
RUN jar -xvf ${APP_NAME}.war && \
    rm ${APP_NAME}.war && \
    ln -s /oba/tomcat/webapps/${APP_NAME} ${CATALINA_HOME}/webapps/ROOT && \
    mkdir -p /oba/bundles/staged && \
    mkdir -p /oba/bundles/builder && \
    curl https://repo1.maven.org/maven2/javax/mail/mail/1.4.7/mail-1.4.7.jar -o ${CATALINA_HOME}/lib/mail.jar && \
    locale-gen ${LANG} && \
    update-locale LANG="${LANG}" LANGUAGE="${LANGUAGE}"
