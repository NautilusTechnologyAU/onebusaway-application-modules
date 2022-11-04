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
ENV DESCRIPTION='OneBusAway Twilio SMS App'

LABEL org.opencontainers.image.title='OneBusAway Twilio SMS App' \
      org.opencontainers.image.description="${DESCRIPTION}" \
      org.opencontainers.image.authors='Nautilus Technology Dev Team <dev@nautilus-tech.com.au>' \
      org.opencontainers.image.source='https://github.com/nautilustechnologyau/onebusaway-application-modules/tree/master/onebusaway-sms-webapp' \
      org.opencontainers.image.url="nautilustechregistry.azurecr.io/nautilustechnologyau/transit/onebusaway-sms-webapp:${VERSION}" \
      org.opencontainers.image.vendor='Nautilus Technology (https://nautilus-tech.com.au)' \
      org.opencontainers.image.licenses='MIT' \
      org.opencontainers.image.version="${VERSION}" \
      help='For more information contact Nautilus Technology Dev Team <dev@nautilus-tech.com.au>'

ENV TRANSIT_DATA_SERVICE_URL='https://localhost:8082/onebusaway-transit-data-federation-webapp/remoting/transit-data-service'
ENV DATABASE_HOST='localhost'
ENV DATABASE_PORT=3306
ENV DATABASE_NAME='oba'
ENV DATABASE_USER='oba'
ENV DATABASE_PASSWORD='oba'
ENV JAVA_OPTS='-Xss4m'

# Copy the application files
ADD './target/onebusaway-sms-webapp.war' /oba/tomcat/webapps/onebusaway-sms-webapp/onebusaway-sms-webapp.war
ADD './config.json' /oba/config.json
ADD './setenv.sh' ${CATALINA_HOME}/bin/setenv.sh

WORKDIR /oba/tomcat/webapps/onebusaway-sms-webapp

# Extract the war file and create symbolic link in Tomcat webapps
RUN jar -xvf onebusaway-sms-webapp.war && \
    rm onebusaway-sms-webapp.war && \
    ln -s /oba/tomcat/webapps/onebusaway-sms-webapp ${CATALINA_HOME}/webapps/ROOT && \
    locale-gen en_AU.UTF-8 && \
    update-locale LANG=en_AU.UTF-8

