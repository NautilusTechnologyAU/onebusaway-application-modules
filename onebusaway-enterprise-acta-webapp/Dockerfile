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
ENV DESCRIPTION='OneBusAway Enterprise App'
ENV APP_NAME='onebusaway-enterprise-acta-webapp'

LABEL org.opencontainers.image.title='OneBusAway Enterprise App' \
      org.opencontainers.image.description="${DESCRIPTION}" \
      org.opencontainers.image.authors='Nautilus Technology Dev Team <dev@nautilus-tech.com.au>' \
      org.opencontainers.image.source="https://github.com/nautilustechnologyau/onebusaway-application-modules/tree/master/${APP_NAME}" \
      org.opencontainers.image.url="nautilustechregistry.azurecr.io/nautilustechnologyau/transit/${APP_NAME}:${VERSION}" \
      org.opencontainers.image.vendor='Nautilus Technology (https://nautilus-tech.com.au)' \
      org.opencontainers.image.licenses='MIT' \
      org.opencontainers.image.version="${VERSION}" \
      help="For more information contact Nautilus Technology Dev Team <dev@nautilus-tech.com.au>"

ENV APP_PATH="/oba/tomcat/webapps/${APP_NAME}"
ENV GOOGLE_MAPS_API_KEY=''
ENV GOOGLE_GEOCODE_API_KEY=''
ENV TRANSIT_DATA_SERVICE_URL='https://transit.nautilus-tech.com.au/onebusaway-transit-data-federation-webapp/remoting/transit-data-service'
ENV DATABASE_HOST='mysql'
ENV DATABASE_PORT=3306
ENV DATABASE_NAME='oba'
ENV DATABASE_USER='oba'
ENV DATABASE_PASSWORD='oba'
ENV API_KEY='OBAKEY'
ENV SIRI_BASE_URL='https://transit.nautilus-tech.com.au/onebusaway-api-webapp/siri'
ENV API_BASE_URL='https://transit.nautilus-tech.com.au/onebusaway-api-webapp'
ENV XWIKI_URL='https://xwiki.mymetro.au'
ENV XWIKI_USERNAME=''
ENV XWIKI_PASSWORD=''
ENV JAVA_OPTS='-Xss4m -Duser.language=en -Duser.country=AU'
ENV LANG="en_AU.UTF-8"
ENV LANGUAGE="en_AU:en"
ENV TIMEZONE="Australia/Adelaide"

# Copy the application files
ADD "./target/${APP_NAME}.war" ${APP_PATH}/${APP_NAME}.war
ADD './config.json' /oba/config.json
ADD './setenv.sh' ${CATALINA_HOME}/bin/setenv.sh

WORKDIR ${APP_PATH}

# RUN apt-get -y update && apt-get -y install systemd
# Extract the war file and create symbolic link in Tomcat webapps
RUN ls -l /etc/localtime && rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && date
RUN jar -xvf ${APP_NAME}.war && \
    rm ${APP_NAME}.war && \
    ln -s /oba/tomcat/webapps/${APP_NAME} ${CATALINA_HOME}/webapps/ROOT && \
    curl https://repo1.maven.org/maven2/javax/mail/mail/1.4.7/mail-1.4.7.jar -o ${CATALINA_HOME}/lib/mail.jar && \
    locale-gen ${LANG} && \
    update-locale LANG="${LANG}" LANGUAGE="${LANGUAGE}"
