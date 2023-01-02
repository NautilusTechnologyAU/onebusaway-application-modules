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
ARG VERSION=1.0.0
ENV DESCRIPTION='OneBusAway Combined Apps'
ENV APP_NAME='onebusaway-combined-webapp'

LABEL org.opencontainers.image.title='OneBusAway Combined Apps' \
      org.opencontainers.image.description="${DESCRIPTION}" \
      org.opencontainers.image.authors='Nautilus Technology Dev Team <dev@nautilus-tech.com.au>' \
      org.opencontainers.image.source="https://github.com/nautilustechnologyau/onebusaway-application-modules/tree/master/${APP_NAME}" \
      org.opencontainers.image.url="nautilustechregistry.azurecr.io/nautilustechnologyau/transit/${APP_NAME}:${VERSION}" \
      org.opencontainers.image.vendor='Nautilus Technology (https://nautilus-tech.com.au)' \
      org.opencontainers.image.licenses='MIT' \
      org.opencontainers.image.version="${VERSION}" \
      help='For more information contact Nautilus Technology Dev Team <dev@nautilus-tech.com.au>'

ENV LANG="en_AU.UTF-8"
ENV LANGUAGE="en_AU:en"
ENV TIMEZONE="Australia/Brisbane"
ENV JAVA_OPTS="-Xss4m -Duser.language=en -Duser.country=AU -Duser.timezone=${TIMEZONE}"

# Setup timezone and language
RUN locale-gen ${LANG} && \
    update-locale LANG="${LANG}" LANGUAGE="${LANGUAGE}"

# Copy tomcat startup script
ADD './setenv.sh' ${CATALINA_HOME}/bin/setenv.sh
RUN chmod +x "${CATALINA_HOME}/bin/setenv.sh"
RUN curl https://repo1.maven.org/maven2/javax/mail/mail/1.4.7/mail-1.4.7.jar -o ${CATALINA_HOME}/lib/mail.jar

# Setup onebusaway-transit-data-federation-webapp
ENV DATA_APP_NAME='onebusaway-transit-data-federation-webapp'
ENV DATA_APP_HOME=${CATALINA_HOME}/webapps/${DATA_APP_NAME}
WORKDIR ${DATA_APP_HOME}
ADD "./${DATA_APP_NAME}/target/${DATA_APP_NAME}.war" "${DATA_APP_HOME}/${DATA_APP_NAME}.war"
RUN jar -xvf ${DATA_APP_NAME}.war && \
    rm ${DATA_APP_HOME}/${DATA_APP_NAME}.war

# Setup onebusaway-api-webapp
ENV API_APP_NAME='onebusaway-api-webapp'
ENV API_APP_HOME=${CATALINA_HOME}/webapps/${API_APP_NAME}
WORKDIR ${API_APP_HOME}
ADD "./${API_APP_NAME}/target/${API_APP_NAME}.war" "${API_APP_HOME}/${API_APP_NAME}.war"
RUN jar -xvf ${API_APP_NAME}.war && \
    rm ${API_APP_HOME}/${API_APP_NAME}.war

# Setup onebusaway-enterprise-acta-webapp
ENV WEB_APP_NAME='onebusaway-enterprise-acta-webapp'
ENV WEB_APP_HOME=${CATALINA_HOME}/webapps/ROOT
WORKDIR ${WEB_APP_HOME}
ADD "./${WEB_APP_NAME}/target/${WEB_APP_NAME}.war" "${WEB_APP_HOME}/${WEB_APP_NAME}.war"
RUN jar -xvf ${WEB_APP_NAME}.war && \
    rm ${WEB_APP_HOME}/${WEB_APP_NAME}.war

WORKDIR ${CATALINA_HOME}
