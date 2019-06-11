#./clean-all.sh
#docker build -t ubuntu-base ./common/ubuntu-base
#docker build -t tomcat-base ./common/tomcat-base

# build and use a newly generated igamt
#docker build -t old-igamt ./common/old-igamt
#docker create -ti --name light-hl7-igamt old-igamt bash
#docker cp light-hl7-igamt:/root/igamt/igamt-lite-controller/target/igamt.war applications/
#cp applications/igamt.war igamt-tool/
#docker rm -fv light-hl7-igamt
#################################
docker build -t tomcat-base ./common/tomcat-base

docker-compose -f docker-compose.yml build #--no-cache
docker-compose -f docker-compose.yml up -d #--force-recreate
