# Reference URL: https://runnable.com/docker/java/dockerize-your-java-application
# Reference URL: https://www.howtoforge.com/tutorial/how-to-create-docker-images-with-dockerfile/
# Reference URL: https://hub.docker.com/r/mcpayment/ubuntu1404-java8/~/dockerfile/
# Reference URL: https://github.com/TexaiCognitiveArchitecture/docker-java8-jenkins-maven-git-nano
# Reference URL: https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#apt-get
# Reference Command: docker search ubuntu/java

# Download base image ubuntu 18.04
FROM ubuntu:18.04

MAINTAINER  Desire Banse

# Prepare installation of Oracle Java 8
ENV JAVA_VER 8
# ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN apt-get update
RUN apt-get -y install curl gnupg

# Install git, wget, Oracle Java8

RUN echo 'deb http://archive.ubuntu.com/ubuntu xenial main universe' >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y git wget && \
    apt-get install -y openjdk-8-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



# Set Oracle Java as the default Java
#RUN update-java-alternatives -s java-8-oracle
#RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc

# Install maven 3.3.9
RUN wget --no-verbose -O /tmp/apache-maven-3.3.9-bin.tar.gz http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar xzf /tmp/apache-maven-3.3.9-bin.tar.gz -C /opt/ && \
    ln -s /opt/apache-maven-3.3.9 /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin  && \
    rm -f /tmp/apache-maven-3.3.9-bin.tar.gz

ENV MAVEN_HOME /opt/maven

COPY hit-dev.nist.gov.keystore /root/
# COPY settings.xml /root/


RUN curl -sL https://deb.nodesource.com/setup_8.x  | bash -
RUN apt-get -y install nodejs

RUN npm cache clean -f
RUN npm install -g n
RUN n 8.14.1

RUN apt-get install -y build-essential
RUN apt-get install -y ruby2.5
RUN apt-get install -y ruby2.5-dev
RUN apt-get install -y ruby-ffi
RUN gem update --system
RUN gem install sass
RUN gem install compass

RUN cd /root/ && npm install -g bower

RUN cd /root/ && npm install -g grunt
RUN cd /root/ && npm install -g grunt-cli
RUN cd /root/ && npm install -g @angular/cli

RUN cd /root/ && git clone https://github.com/usnistgov/hit-core-xml

# RUN cd /root/hit-core-xml/ && git checkout legacy
RUN cd /root/hit-core-xml/ && mvn clean

COPY settings.xml /root/.m2/

RUN cd /root/ && git clone https://github.com/usnistgov/igamt
RUN cd /root/igamt && git checkout develop
COPY igl-mongo.properties /igamt/igamt-lite-controller/src/main/resources/igl-mongo.properties
COPY app-web-config.properties /root/igamt/igamt-lite-controller/src/main/resources/app-web-config.properties
COPY TimerTaskForPHINVADSValueSetDigger.java /root/igamt/igamt-lite-controller/src/main/java/gov/nist/healthcare/tools/hl7/v2/igamt/lite/web/util/TimerTaskForPHINVADSValueSetDigger.java
COPY Bootstrap.java /root/igamt/igamt-lite-controller/src/main/java/gov/nist/healthcare/tools/hl7/v2/igamt/lite/web/config/Bootstrap.java
COPY VocabClient.java /root/igamt/igamt-lite-controller/src/main/java/gov/nist/healthcare/tools/hl7/v2/igamt/lite/web/util/VocabClient.java

RUN cd /root/igamt/igamt-lite-client && npm install
RUN cd /root/igamt/igamt-lite-client && bower install --allow-root
RUN cd /root/igamt/igamt-lite-client && grunt build

RUN cd /root/igamt/ && mvn -U clean install -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.test.skip
