# Pull base image.
FROM mongo:4.0.4
#https://hub.docker.com/_/mongo/

RUN apt-get update \
    && apt-get install -y curl unzip vim wget \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
		jq \
		numactl \
	&& rm -rf /var/lib/apt/lists/*

COPY ./import.sh /docker-entrypoint-initdb.d/import.sh
RUN ["chmod", "+x", "/docker-entrypoint-initdb.d/import.sh"]
RUN ["mkdir", "/tmp/dump/"]
RUN wget --no-check-certificate https://hit-2015.nist.gov/wars/old_igamt_dump.zip -O /tmp/dump.zip
#COPY ./dump.zip /tmp/
RUN unzip /tmp/dump.zip -d /tmp/
#RUN ["/docker-entrypoint-initdb.d/import.sh"]

#RUN ["chmod", "+x", "/tmp/create.sh"]
#RUN ["/tmp/create.sh"]
