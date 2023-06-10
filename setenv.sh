#!/usr/bin/env bash
locale-gen "$LANG"
update-locale LANG="$LANG" LANGUAGE="$LANGUAGE"
ls -l /etc/localtime
rm -rf /etc/localtime
ln -s /usr/share/zoneinfo/"$TIMEZONE" /etc/localtime
export JAVA_OPTS="-Xss4m -Duser.language=en -Duser.country=AU -Duser.timezone=$TIMEZONE"
cp /oba/tomcat/conf/"$DATA_APP_NAME"-data-sources.xml "$CATALINA_HOME"/webapps/"$DATA_APP_NAME"/WEB-INF/classes/data-sources.xml
cp /oba/tomcat/conf/"$API_APP_NAME"-data-sources.xml "$CATALINA_HOME"/webapps/"$API_APP_NAME"/WEB-INF/classes/data-sources.xml
cp /oba/tomcat/conf/"$WEB_APP_NAME"-data-sources.xml "$CATALINA_HOME"/webapps/ROOT/WEB-INF/classes/data-sources.xml
