CATALINA_OPTS="-Xmx512m -Dfile.encoding=UTF-8"

CATALINA_OPTS="$CATALINA_OPTS -Dapp.home=\"$CATALINA_BASE/conf/app_home\""

CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote"

# Uncomment in case of slow startup on Linux VM
#CATALINA_OPTS="$CATALINA_OPTS -Djava.security.egd=file:/dev/./urandom"

#CATALINA_OPTS="$CATALINA_OPTS \
#-Djava.rmi.server.hostname=localhost \
#-Dcom.sun.management.jmxremote.port=7777 \
#-Dcom.sun.management.jmxremote.ssl=false \
#-Dcom.sun.management.jmxremote.authenticate=false"

#CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.password.file=../conf/jmxremote.password -Dcom.sun.management.jmxremote.access.file=../conf/jmxremote.access"

JPDA_OPTS="-Xrunjdwp:transport=dt_socket,address=8787,server=y,suspend=n"

CATALINA_OPTS="$CATALINA_OPTS -Duser.language=ru -Duser.region=RU -Dhttp.maxRedirects=300"

CATALINA_OPTS="$CATALINA_OPTS $STUDIO_OPTS"