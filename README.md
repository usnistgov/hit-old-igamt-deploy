NIST HL7 IGAMT (old version)

1) git clone https://github.com/usnistgov/hit-old-igamt-deploy
2) git checkout refactor-mongo
3) Starts the containers
    Go to the directory hit-old-igamt-deploy
 - `./deploy.sh`
 4) start mongodb
    - `docker exec -ti igamt-tool /bin/bash`
    - `mongod &`
 6) In another terminal run :
     - `docker exec -ti igamt-tool /bin/bash`
     - `mongorestore --db igamt /tmp/dump/`
2) Access the tool at https://localhost/igamt
