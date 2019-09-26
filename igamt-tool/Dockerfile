# Pull base image.
FROM tomcat-base
COPY ./config/context.xml /opt/tomcat/conf/

VOLUME /data/db

CMD ["/usr/bin/mongod"]
# RUN systemctl start mongod

#CMD ["usr/bin/mongod", "--smallfiles"]
#CMD ["usr/bin/mongod"]

COPY ./import.sh /docker-entrypoint-initdb.d/import.sh
RUN ["chmod", "+x", "/docker-entrypoint-initdb.d/import.sh"]
RUN ["mkdir", "/tmp/dump/"]
RUN wget --no-check-certificate https://hit-2015.nist.gov/wars/old_igamt_dump.zip -O /tmp/dump.zip
RUN unzip /tmp/dump.zip -d /tmp/

#RUN ["/docker-entrypoint-initdb.d/import.sh"]

#RUN wget --quiet --no-cookies https://hit-2015.nist.gov/wars/igamt.war -O /opt/tomcat/webapps/igamt.war
COPY igamt.war /opt/tomcat/webapps/igamt.war
#RUN mkdir /opt/data/
#RUN chmod 766 /opt/data
#COPY ./config/app-log4j.properties /opt/data/
ENV HIT_LOGGING_DIR /opt/data/logs/
#ENV HIT_LOGGING_CONFIG /opt/data/config/app-log4j.properties
ENV RELOAD_DB true
ENV URL_SCHEME https


VOLUME ["/opt/data/","/opt/tomcat/logs/"]

#RUN rm /opt/tomcat/webapps/hit-base-tool/WEB-INF/lib/log4j-over-slf4j-1.7.2.jar

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
