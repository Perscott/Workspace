FROM tomcat:9-jdk17

# GeoServer WAR dosyasını indirin veya kendi bilgisayarınızdan kopyalayın
ADD https://sourceforge.net/projects/geoserver/files/GeoServer/2.25.0/geoserver-2.25.0-war.zip/download /tmp/geoserver.zip

RUN apt-get update && apt-get install -y unzip && \
    unzip /tmp/geoserver.zip -d /tmp && \
    mv /tmp/geoserver.war /usr/local/tomcat/webapps/geoserver.war && \
    rm -rf /tmp/*

# Tomcat'ın dinleyeceği portu 10000 olarak değiştirin
RUN sed -i 's/port="8080"/port="10000"/g' /usr/local/tomcat/conf/server.xml

EXPOSE 10000